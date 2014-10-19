From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 16:49:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-utils: Fix gettext related
	build error
Message-ID: <1413730150-19225-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ALSA_UTILS_GETTEXTIZE = YES

is also needed to fix

*** error: gettext infrastructure mismatch: using a Makefile.in.in from
gettext version 0.18 but the autoconf macros are from gettext version 0.19

To reproduce the build error make sure gettext is build before alsa-utils
by also applying this patch: http://patchwork.ozlabs.org/patch/400779/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - english error message (Baruch, Yann)
    - add comment why _AUTORECONF/_GETTEXTIZE are needed (Baruch, Yann)
    - point out that gettext has to be built before alsa-utils to reproduce the
      bug

 package/alsa-utils/alsa-utils-0001-libintl.patch |   23 ++++++++++++++++++++++
 package/alsa-utils/alsa-utils.mk                 |    5 +++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/alsa-utils/alsa-utils-0001-libintl.patch

diff --git a/package/alsa-utils/alsa-utils-0001-libintl.patch b/package/alsa-utils/alsa-utils-0001-libintl.patch
new file mode 100644
index 0000000..0562ce8
--- /dev/null
+++ b/package/alsa-utils/alsa-utils-0001-libintl.patch
@@ -0,0 +1,23 @@
+Link against libintl if needed
+
+When built against a C library that has locale support, but for which
+intl support is provided by an external libintl library, alsamixer
+forgets to link against this library, even though the configure script
+properly checks that.
+
+This patch therefore ensure that we link against libintl when needed,
+thanks to the @LIBINTL@ variable provided by the configure script.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+diff -uNr alsa-utils-1.0.28.org/alsamixer/Makefile.am alsa-utils-1.0.28/alsamixer/Makefile.am
+--- alsa-utils-1.0.28.org/alsamixer/Makefile.am	2014-06-13 19:21:05.000000000 +0200
++++ alsa-utils-1.0.28/alsamixer/Makefile.am	2014-10-19 13:13:09.333149017 +0200
+@@ -1,5 +1,5 @@
+ AM_CFLAGS = @CURSES_CFLAGS@ -DCURSESINC="@CURSESINC@"
+-LDADD = @CURSESLIB@
++LDADD = @CURSESLIB@ @LIBINTL@
+ 
+ bin_PROGRAMS = alsamixer
+ alsamixer_SOURCES = card_select.c card_select.h \
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index d42d06f..746e36a 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -10,6 +10,11 @@ ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
+
+# alsa-utils-0001-libintl.patch patches alsamixer/Makefile.am
+ALSA_UTILS_AUTORECONF = YES
+ALSA_UTILS_GETTEXTIZE = YES
+
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
-- 
1.7.10.4
