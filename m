From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:12:10 +0200
Subject: [Buildroot] [PATCH] linux: don't override HOSTCC for kconfig
In-Reply-To: <20180517123921.16086-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 17 May 2018 14:39:21 +0200")
References: <20180517123921.16086-1-arnout@mind.be>
Message-ID: <87in6pauz9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Kconfig uses either pkg-config or hard-coded /usr/include paths to find
 > the ncurses or ncursesw library. If ncursesw is found, it will include
 > <ncursesw.h>. Since Buildroot's host-ncurses doesn't install a .pc file,
 > and linux.mk anyway doesn't pass the pkg-config options to find the host
 > pkg-config files, Kconfig will always find the system's ncursesw.h.

 > However, since commit dde090c299 (linux: fix passing of host CFLAGS and
 > LDFLAGS) HOST_LDFLAGS is passed to the linux build system. Thus, if
 > host-ncurses was already built before 'make linux-menuconfig' is called,
 > the build will pick up libncurses from the host directory, which is NOT
 > widechar. Thus, two different ncurses configurations are mixed into the
 > final mconf program. This will result in serious breakage in the
 > rendering of the menus (lots of @ and question mark characters).

 > As a workaround (suggested by Yann), don't pass HOST_CFLAGS and
 > HOST_LDFLAGS when running kconfig commands. For kconfig, we should never
 > need host packages anyway. This way, the kconfig calls will always use
 > the system's ncurses and never our host-ncurses.

 > Note that the same problem could pop up for other kconfig packages as
 > well if we ever pass HOST_CFLAGS/HOST_LDFLAGS to them. We could force
 > HOSTCC=$(HOSTCC) directly in kconfig-package. However, for now there
 > are no other packages that exhibit this problem, so this can be
 > revisited when they do.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: David De Grave <david.degrave@essensium.com>
 > Cc: Scott Fan <fancp2007@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > v3: override LINUX_KCONFIG_OPTS instead of building host-ncurses with
 >     wchar

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
