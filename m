From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:54:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix gettext dependency
 handling
In-Reply-To: <20170212124615.8875-1-bernd.kuhls@t-online.de>
References: <20170212124615.8875-1-bernd.kuhls@t-online.de>
Message-ID: <20170212155448.06ceac07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 13:46:15 +0100, Bernd Kuhls wrote:
> Currently avahi only adds -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is
> enabled. This is insufficent for defconfigs where BR2_PACKAGE_GETTEXT
> was selected by other packages without BR2_NEEDS_GETTEXT_IF_LOCALE
> being enabled at the same time. If gettext was built before avahi,
> and avahi uses optional dbus support, avahi configure detects libintl:
> 
> checking libintl.h usability... yes
> checking libintl.h presence... yes
> checking for libintl.h... yes
> checking for ngettext in libc... no
> checking for bindtextdomain in -lintl... yes
> checking for ngettext in -lintl... yes
> checking for dgettext in -lintl... yes
> 
> and breaks at linking stage:
> 
>   CCLD     avahi-publish
> /home/buildroot/br7_freeswitch/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/5.4.0/../../../../i586-buildroot-linux-uclibc/bin/ld: avahi_publish-avahi-publish.o: undefined reference to symbol 'libintl_dgettext'
> /home/buildroot/br7_freeswitch/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib32/libintl.so.8: error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status
> 
> To reproduce use this minimal defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_DBUS=y
> BR2_PACKAGE_AVAHI=y
> 
> and build gettext before avahi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I haven't looked at your patch yet, but there is another patch pending
in patchwork for what looks like the same issue, and some discussion
took place on it: http://patchwork.ozlabs.org/patch/683732/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
