From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jul 2016 19:52:41 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
In-Reply-To: <20160716154736.19dd42fb@free-electrons.com>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <20160716154736.19dd42fb@free-electrons.com>
Message-ID: <20160718175241.GA3738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-16 15:47 +0200, Thomas Petazzoni spake thusly:
> On Tue, 12 Jul 2016 00:16:31 +0200, Yann E. MORIN wrote:
> > This series introduces the possibility to just build and install
> > libudev, without requiring that the /dev management be handled by
> > eudev or systemd.
> 
> Thanks. However, I am still not sure that the usefulness vs. complexity
> ratio of this patch series is big enough to have it merged.
> 
> I compared the installed size of a minimal uClibc system with just
> libudev, and a minimal uClibc system with eudev:
[--SNIP--]
> So, there is indeed a 1.2 MB difference, but:

That is *not* about size; I don't think I even ever made that point as a
reason to have only libudev.

[--SNIP--]
> So I'm not sure if it's really worth the effort. After all, installing
> only libudev without eudev is not really supported upstream (we have to
> trick by building only some subdirectories).
> 
> I'm not entirely decided yet, so I'm waiting for arguments. But I'm
> hesitating between merging this, or asking people who really care about
> this to simply remove the eudev daemon in a post-build script.

But then you would not have libudev if you use mdev or a static /dev.

Note that libudev is not about managing /dev. It is about providing an
abstraction to device descriptions (e.g. type and so on) as well as
events (like hotplug).

A udev daemon (be it from eudev or systemd) is about managing the
content of /dev. For that it uses libudev to get the device descriptions
and events, and matches that to a DB of rules to generate the entries
in /dev.

Bernd has a (imho, valid) use-case about using only libudev without a
udev daemon altogether; there *are* other similar cases.

For example, we now have support (and have pending patches) for some
"containerisation" stuff, like docker and lxc. You can also see that
Buildroot can be used to generate lightweight containers. Such
containers need not have a udev daemon of their own (the system has one,
and /dev is bind-mounted into the container); however, an application
inside that container will need to have access to the device "DB" and
events, thus needs libudev.

There are various other use-cases...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
