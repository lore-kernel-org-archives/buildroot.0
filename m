From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2018 19:55:14 +0100
Subject: [Buildroot] [PATCH 1/1] ccid: fix build with pkgconf 1.5.3
In-Reply-To: <d8aca54b-9283-d230-e3ba-7cbba7472ddd@mind.be>
References: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
 <d8aca54b-9283-d230-e3ba-7cbba7472ddd@mind.be>
Message-ID: <20181211185514.GM3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Fabrice,

On 2018-12-11 19:21 +0100, Arnout Vandecappelle spake thusly:
> On 11/12/2018 18:21, Fabrice Fontaine wrote:
> > Do not add DESTDIR before usbdropdir to install pcsc drivers in
> > src/Makefile.am.
> > 
> > Indeed, usbdropdir is retrieved from libpcsc.pc and can be prefixed by
> > sysroot, so it can can be set for example to:
> > usbdropdir='/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/pcsc/drivers'
> > 
> > If DESTDIR is added before usbdropdir, files will be installed in a
> > wrong directory and build will fail
> 
>  I have the feeling this is not the right fix. I think the problem really is
> that pkg-config should prefix usbdropdir with sysroot. To me it seems that the
> right thing to do is to add the sysroot to -L and -I flags, but not to add it to
> random variables...
> 
>  Maybe other people who have a better understanding of how pkg-config is
> supposed to work can shed some light?

Indeed, we must be careful with how we handle pkg-config.

For this specific case, I agree with Arnout: installing a file should
always be prefixed by DESTDIR. We should not change that part of a
package installation.

There are two conflicting needs: to know where the files are at build
time, and to know where they are at runtime.

With pkg-config, there is a mix of both concepts, and they are
absolutely not differentiated. That's probably because pkg-config was
initially made to be able to provide build-time-only files: headers and
libs. But packages (ab)used it to also store and share arbitrary
variables, and they expect those locations to be valid both at build
time and runtime, which is wrong, as we can see in a lot of cases, such
as this one...

Before we bumped pkg-config, we had a patch that would make it prefix
a set of carefully selected variables (instead of just -I and -L). But
that was probably goign to be an endless whack-a-mole game, and upstream
decided to now prefix all variables (again, instead of only -I and -L).

However, I have no good idea on how to solve this situation in a generic
way.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
