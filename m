From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jun 2014 21:21:13 +0200
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <1401963933710-71653.post@n4.nabble.com>
References: <1401897756168-71600.post@n4.nabble.com>
 <20140604170914.GA3325@free.fr>
 <1401963933710-71653.post@n4.nabble.com>
Message-ID: <20140605192113.GE3553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-06-05 03:25 -0700, psnsilva spake thusly:
> I usually properly shutdown the rPi triggering "poweroff" or "reboot".
> However, the system I am build is to be installed at an uncontrolled
> environment, where power interruptions can occur.

Ah, then that makes sense.

> As you say, I would expect that in this case the "filesystem "driver" in the
> kernel" automatically check the file system at boot time, but it's not
> happening.

Check your dmesg for messages like "recovery required on readonly
filesystem".

These mean that recovery on the filesystem is indeed happening.

> I think I have all the necessary tools (e2fstools) and
> configurations on my systems, but I should be missing something here.

As I said, you can't really do an fscp pass on a mounted filesystem. You
may be able to do so on a filesystem mounted read-only, but then you'd
have to reboot after fixing the filesystem.

An alternate solution would be to boot into an initramfs, that would be
responsible for checking the root filesystem, and then pivotroot-ing
into it.

But that will need some additional work on your side, since that not the
standrrd boot process of Buildroot-generated systems.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
