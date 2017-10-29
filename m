From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 19:12:51 +0100
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer> <20171029101249.19a91e32@windsurf>
 <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
Message-ID: <20171029181251.GI2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2017-10-29 10:26 -0700, Florian Fainelli spake thusly:
> On 10/29/2017 02:12 AM, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Sun, 29 Oct 2017 08:26:49 +0100, Yann E. MORIN wrote:
> > 
> >> On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
> >>> Add the ability to specify a path to a custom directory where kernel sources
> >>> may be contained. This is useful when doing kernel development in an existing
> >>> git tree.  
> >>
> >> This case is covered by the override-sourcedir mechanism.
> >>
> >> Create a file (by default, local.mk) in your config directory (the one
> >> with the Buildroot .config file), and edit this file with:
> >>
> >>     LINUX_OVERRIDE_SRCDIR = /path/to/your/linux
> >>
> >> and Buildroot will use that as a rsync source, instead of downloading
> >> the kernel sources.
> >>
> >> See also e782cd5b1bc (Revert "Added local directory as source of kernel
> >> code") for more in-depth explanations. ;-)
> > 
> > Fully agreed with Yann here: there is no point in adding a
> > Linux-specific solution for this use case, as we already have a much
> > more general solution that works for all packages, including the
> > 'linux' package.
> 
> That seems fine in premise, but there are still a few angles that just
> don't feel right or I am most certainly just misusing this:
> 
> - we still need to specify a "custom" kernel version, and apparently it
> cannot be empty and just mean "does not matter", that's extremely
> impractical, if the workflow involves a bisection over several kernel
> versions, there is no way I am specifying the kernel version every time
> I run git bisect

Just leave trhe version at its default value; it is only ever used to
know what to download in the first place, and since you use an override,
it will download nothing.

> - how about kernel-headers? My local.mk now has this:
> 
> LINUX_OVERRIDE_SRCDIR = /home/florian/dev/linux
> LINUX_HEADERS_OVERRIDE_SRCDIR = /home/florian/dev/linux
> 
> but it still won't let me build with "Same as kernel being built", see
> below [1]

In that case, you have a bigger problem: you will have to rebuild the
toolchain every time, as the headers are changing. And thus, you will
have to rebuild everything else (all packages).

And if/when your bisect crosses kernel version boundaries, you'll have
to adjust the "Custom kernel headers series" as well too.

So I'd say that you would probably be more impacted by the build time
first, no?

So, for bisecting a kernel, I'd try to not have to rebuild the toolchain
every tine, so stick with a static headers version.

Unless you are explicitly trying to bisect a headers problem...

> - if someone is seeing any issues with Buildroot using this (or anything
> for that matter), it would a lot easier for you to just tell them to
> send their .config file, now you also need to ask them whether they are
> using local.mk, and send it too, that assumes people read "how to submit
> bugs" documentation anyway

Meh, you know what we say about documentation? No one reads it! ;-)

But yeah, we've had to deal with that a few times, and it soon becomes
apparent that the user is using override-srcdir, because the paths then
read something like 'linux-custom', which is easy to spot.

> [1]:
> package/linux-headers/linux-headers.mk:134: *** LINUX_HEADERS_SITE
> cannot be empty when LINUX_HEADERS_SOURCE is not.  Stop.
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2
> zsh: exit 2     make

Hmm... Even when you keep the kernel version to its default value?

and even then, I would not be too much concerned about this, because if
you change the headers, you will need to rebuild the toolchain (see
above for the rest of the story).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
