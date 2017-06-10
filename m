From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 21:29:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix gettext dependency
	handling
Message-ID: <20170610192914.27823-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently avahi only adds -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is
enabled. This is insufficent for defconfigs where BR2_PACKAGE_GETTEXT
was selected by other packages without BR2_NEEDS_GETTEXT_IF_LOCALE
being enabled at the same time. If gettext was built before avahi,
and avahi uses optional dbus support, avahi configure detects libintl:

checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking for ngettext in libc... no
checking for bindtextdomain in -lintl... yes
checking for ngettext in -lintl... yes
checking for dgettext in -lintl... yes

and build breaks when linking avahi-utils, which depend on dbus, see
avahi-utils/Makefile.am, line 25:

  CCLD     avahi-publish
/home/buildroot/buildroot/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/5.4.0/../../../../i586-buildroot-linux-uclibc/bin/ld: avahi_publish-avahi-publish.o:
 undefined reference to symbol 'libintl_dgettext'
/home/buildroot/buildroot/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib32/libintl.so.8: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

To reproduce use this minimal defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_AVAHI=y

$ grep -i gettext .config
BR2_NEEDS_GETTEXT=y
BR2_PACKAGE_GETTEXT=y
  # BR2_PACKAGE_GETTEXT_TOOLS is not set
  # BR2_PACKAGE_GETTEXT_STATIC is not set

and build gettext before avahi.

This patch makes sure that -lintl is added when gettext is enabled and,
at the same time, BR2_NEEDS_GETTEXT is enabled. The later is only
enabled for uclibc-based toolchains, for them gettext also provides
libintl while glibc/musl provide it themselves.

Patch also tested with this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_AVAHI=y

$ grep -i gettext .config
BR2_PACKAGE_GETTEXT=y
  # BR2_PACKAGE_GETTEXT_TOOLS is not set
  # BR2_PACKAGE_GETTEXT_STATIC is not set

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch superseeds http://patchwork.ozlabs.org/patch/726955/ and
replaces http://patchwork.ozlabs.org/patch/683732/

 package/avahi/avahi.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 0ec38d390..57a35b476 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -89,9 +89,7 @@ AVAHI_CONF_OPTS = \
 	--with-autoipd-user=avahi \
 	--with-autoipd-group=avahi
 
-AVAHI_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
-	host-pkgconf host-gettext
+AVAHI_DEPENDENCIES = host-intltool host-pkgconf host-gettext
 
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
@@ -161,7 +159,10 @@ endif
 
 AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
 
-AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
+ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yy)
+AVAHI_DEPENDENCIES += gettext
+AVAHI_MAKE_OPTS += LIBS=-lintl
+endif
 
 define AVAHI_USERS
 	avahi -1 avahi -1 * - - -
-- 
2.11.0
