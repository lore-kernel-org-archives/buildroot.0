From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 14:46:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: Link against libintl if
	needed
Message-ID: <1413722799-15992-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
alsamixer-cli.o: In function `main':
cli.c:(.text.startup+0x4d): undefined reference to `libintl_textdomain'
cli.c:(.text.startup+0xc1): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0xd5): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0xe9): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0x1fd): undefined reference to `libintl_gettext'
cli.c:(.text.startup+0x223): undefined reference to `libintl_gettext'
alsamixer-card_select.o:card_select.c:(.text+0xb8): more undefined references to `libintl_gettext' follow
collect2: Fehler: ld gab 1 als Ende-Status zur?ck
make[2]: *** [alsamixer] Fehler 1
make[2]: Leaving directory `/home/fli4l/br4/output/build/alsa-utils-1.0.28/alsamixer'

The build error occured using this minimal defconfig:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_AMIDI=y
BR2_PACKAGE_ALSA_UTILS_AMIXER=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_IECSET=y
BR2_PACKAGE_ALSA_UTILS_ACONNECT=y
BR2_PACKAGE_ALSA_UTILS_APLAYMIDI=y
BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI=y
BR2_PACKAGE_ALSA_UTILS_ASEQDUMP=y
BR2_PACKAGE_ALSA_UTILS_ASEQNET=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_NCURSES_WCHAR=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/alsa-utils-0001-libintl.patch |   23 ++++++++++++++++++++++
 package/alsa-utils/alsa-utils.mk                 |    2 ++
 2 files changed, 25 insertions(+)
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
index 7079361..b69433f 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -9,6 +9,8 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
+ALSA_UTILS_AUTORECONF = YES
+ALSA_UTILS_GETTEXTIZE = YES
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
-- 
1.7.10.4
