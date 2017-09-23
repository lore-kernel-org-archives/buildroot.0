From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: new package
Message-ID: <20170923171326.B1EC68103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05e306d8d333b56c30bc322983527d2bae771361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Asterisk: the flagship of telephony on Linux. These are the lines of
code whose continuous mission is to power small and large enterprises
telephony systems, to boldly provide IP PBX where no one has done so
before.

But it is a hell to get compiled... :-(

For starters, it needs a host tool, menuselect, to prepare its build
configuration. Unfortunately, the way it handles menuselect does not
apply very well for cross-compilation: the main ./configure calls out to
menuselect's own ./configure, and of course that runs with the same
environement, which is wrong for cross-compilation (because of variables
like CC, CFLAGS and the likes).

Furthermore, the paths to menuselect are imbricated about everywhere in
the main Makefile, so making it find menuselect in PATH is a lost cause.

Instead, we just patch-out the handling of menuselect, build it as the
host variant and copy it in place.

Now, asterisk wants to install a default set of sound files (for
answering machine stuff, I guess). They come come pre-bundled in the
official archive [0], but the buildsystem will want to download (at
install time) the sha1 files for each sound archive, to validate that
said archive is correct. However, the download is done via plain http,
so it still risks an MITM attack. And for Buildroot, it is not always
possible to download at install time, so we patch-out the sha1 check.

[0] http://downloads.asterisk.org/pub/telephony/asterisk/releases/

The official archive contains the sound archives plus a full set of
documentation. This makes it very big. Unfortunately, the hosting site
is rather slow, topping at about ~204kbps. So we get the archive from
the official mirror on Github. But that archive is missing the sound
archives, so we download them separately.

Some tests, like the crypt() one, are broken and could not have ever
possibly worked at all. Worse, the FFmpeg test is looking for headers
that FFmpeg removed more than 10 years ago and are virtually no longer
available in any distro. So, FFmpeg support is definitely not tested
by upstream and can't possibly work at all. Finally, trying to run
test-code does not work in cross-compilation.

As a final stroke of genius, asterisk checks for the re-entrant variant
of res_ninit(), and concludes that all such functions are available,
including res_nsearch(). Uclibc-ng has the former but not the latter, so
the build fails. Since there is no cache variable for that check, we
can't pre-feed that result to configure, and fixing it is a bigger
endeavour.  So we make asterisk depend on glibc for now, until someone
is brave enough to fix it.

Almost all features are disabled for now. Support for additional
features will be added in subsequent patches now that we have a working
base.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Arnout:
 - make libilbc a mandatory dependency instead of using the bundled one;
 - add license, license files, and license file hashes;
 - minor spelling corrections;
 - remove redundant trailing backslash reported by check-package;
 - rewrap help text to 72 columns instead of 68]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

fixup
---
 package/Config.in                                  |   1 +
 ...-configure-do-not-configure-in-menuselect.patch |  58 +++++++
 ...02-sounds-do-not-download-and-check-sha1s.patch |  52 ++++++
 .../0003-configure-fix-detection-of-libcrypt.patch |  43 +++++
 ...n-cross-complation-assimne-eventfd-are-av.patch |  37 +++++
 package/asterisk/Config.in                         |  26 +++
 package/asterisk/asterisk.hash                     |  15 ++
 package/asterisk/asterisk.mk                       | 183 +++++++++++++++++++++
 8 files changed, 415 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5797018..b3511f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1572,6 +1572,7 @@ menu "Networking applications"
 	source "package/argus/Config.in"
 	source "package/arp-scan/Config.in"
 	source "package/arptables/Config.in"
+	source "package/asterisk/Config.in"
 	source "package/atftp/Config.in"
 	source "package/autossh/Config.in"
 	source "package/avahi/Config.in"
diff --git a/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
new file mode 100644
index 0000000..d6d02d2
--- /dev/null
+++ b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
@@ -0,0 +1,58 @@
+From cc5daff874779475742bdb89a9328bb4fc4c4e09 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 27 Dec 2016 11:20:19 +0100
+Subject: [PATCH] configure: do not configure in menuselect
+
+When cross-compiling, the arguments and environment for ./configure are
+different for the host and the target, and we want menuselect to be
+compiled for the build machine, not the target.
+
+Although we do not pass any option to ./configure for menuselect, the
+environment may still reference variables for the target, like CC or
+CFLAGS and so on... We can not build menuselect with those variables.
+
+Instead, just assume that menuselect will be pre-compiled.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure    | 16 ----------------
+ configure.ac | 16 ----------------
+ 2 files changed, 32 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 66c8971..121dd93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2662,12 +2662,6 @@ fi
+ 
+ AC_SUBST([PBX_SYSLOG])
+ 
+-if test -f makeopts; then
+-	${ac_cv_path_EGREP} 'CURSES|GTK2|OSARCH|NEWT' makeopts > makeopts.acbak
+-else
+-	touch makeopts.acbak
+-fi
+-
+ AC_CONFIG_FILES([build_tools/menuselect-deps makeopts])
+ AST_CHECK_MANDATORY
+ 
+@@ -2683,16 +2677,6 @@ fi
+ 
+ AC_OUTPUT
+ 
+-${ac_cv_path_EGREP} 'CURSES|GTK2|OSARCH|NEWT' makeopts > makeopts.acbak2
+-if test "x${ac_cv_path_CMP}" = "x:"; then
+-	( cd `pwd`/menuselect && ./configure )
+-else if ${ac_cv_path_CMP} -s makeopts.acbak makeopts.acbak2; then : ; else
+-	( cd `pwd`/menuselect && ./configure )
+-fi ; fi
+-
+-rm makeopts.acbak makeopts.acbak2
+-
+-
+ if test "x${silent}" != "xyes" ; then
+ echo
+ echo "               .\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$=..      "
+-- 
+2.7.4
+
diff --git a/package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch b/package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
new file mode 100644
index 0000000..8412843
--- /dev/null
+++ b/package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
@@ -0,0 +1,52 @@
+From 3e8a9e9a1c7eae515eb628778c3c8a04338b3bb3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 27 Dec 2016 11:21:09 +0100
+Subject: [PATCH] sounds: do not download and check sha1s
+
+To validate the sound archives, the corresponding sha1s are also
+downloaded from the same location, and that download is done at install
+time.
+
+However, that poses at least two problems:
+
+  - in Buildroot, we already have validated the downloads with the sha1s
+    anyway, and trying to download anything at install time is not
+    always possible (e.g. for off-line builds);
+
+  - since the download scheme is not secured (plain http), a
+    man-in-the-middle for the sounds will also be able to MITM the
+    download of the sha1s, so there is absolutely no additional safety
+    in doing so.
+
+So we just do without the sha1 download and checks.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ sounds/Makefile | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/sounds/Makefile b/sounds/Makefile
+index 84d0f45..7a80d56 100644
+--- a/sounds/Makefile
++++ b/sounds/Makefile
+@@ -100,17 +100,7 @@ ifneq ($(SOUNDS_CACHE_DIR),)
+ 	  if test ! -f "$$(SOUNDS_CACHE_DIR)/$$@"; then \
+ 	    (cd "$$(SOUNDS_CACHE_DIR)"; $$(DOWNLOAD) $$(SOUNDS_URL)/$$@); \
+ 	  fi; \
+-	  if test ! -f "$$(SOUNDS_CACHE_DIR)/$$@.sha1"; then \
+-	    (cd "$$(SOUNDS_CACHE_DIR)"; $$(DOWNLOAD) $$(SOUNDS_URL)/$$@.sha1); \
+-	  fi; \
+ 	  $$(LN) -sf "$$(SOUNDS_CACHE_DIR)/$$@" .; \
+-	  $$(LN) -sf "$$(SOUNDS_CACHE_DIR)/$$@.sha1" .; \
+-	  $$(SHA1SUM) -c --status $$@.sha1 || \
+-	    ( \
+-	      rm -f "$$(SOUNDS_CACHE_DIR)/$$@" "$$(SOUNDS_CACHE_DIR)/$$@.sha1" $$@ $$@.sha1; \
+-	      echo "Bad checksum: $$@" 1>&2; \
+-	      exit 1; \
+-	    ) || exit 1; \
+ 	fi
+ else
+ 	$(CMD_PREFIX) \
+-- 
+2.7.4
+
diff --git a/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch b/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
new file mode 100644
index 0000000..d82f508
--- /dev/null
+++ b/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
@@ -0,0 +1,43 @@
+From 8996503f6c55e55f326ab11c18278954ad7abaf3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 27 Dec 2016 11:21:57 +0100
+Subject: [PATCH] configure: fix detection of libcrypt
+
+The crypt() function is searched in two locations: -lcrypt and the
+standard C library.
+
+The result of the former is stored in the LIBCRYPT 'scheme' while that
+of the latter is stored in the 'SYSCRYPT' scheme.
+
+However, the check for mandatory modules looks at the CRYPT 'scheme',
+and thus concludes that crypt is missing when it was successfully found.
+
+Fix that by also storing the result of either check in the 'CRYPT'
+scheme.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure    | 2 ++
+ configure.ac | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 121dd93..d459ff5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2406,10 +2406,12 @@ AC_CHECK_FUNC([crypt], [SYSCRYPT=true], [SYSCRYPT=""])
+ if test "x$LIBCRYPT_LIB" != "x" ; then
+     CRYPT_LIB="$LIBCRYPT_LIB"
+     CRYPT_INCLUDE="$LIBCRYPT_INCLUDE"
++    PBX_CRYPT=1
+     AC_DEFINE([HAVE_CRYPT], [1], [Define to 1 if you have the 'crypt' function.])
+ elif test "x$SYSCRYPT" != "x" ; then
+     CRYPT_LIB=""
+     CRYPT_INCLUDE=""
++    PBX_CRYPT=1
+     AC_DEFINE([HAVE_CRYPT], [1], [Define to 1 if you have the 'crypt' function.])
+ fi
+ 
+-- 
+2.7.4
+
diff --git a/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch b/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
new file mode 100644
index 0000000..dae36d1
--- /dev/null
+++ b/package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
@@ -0,0 +1,37 @@
+From e7de812c979d219765fbf1292f0e150bfa087716 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 18 Jun 2017 21:54:16 +0200
+Subject: [PATCH] configure: in cross-complation, assume eventfd are available
+
+eventfd have been in the kernel since 2.6.22, and in glibc since 2.8,
+repectively released in July 2007 and April 2008, almost a decade ago
+now.
+
+Assume that no one building from now on for cross-compilation will be
+unlucky enough to get versions older than that...
+
+As such, in cross-compilation, assume eventfd are available.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1c20517864..474d17ae55 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1107,7 +1107,9 @@ AC_RUN_IFELSE(
+       [return eventfd(0, EFD_NONBLOCK | EFD_SEMAPHORE) == -1;])],
+   AC_MSG_RESULT(yes)
+   AC_DEFINE([HAVE_EVENTFD], 1, [Define to 1 if your system supports eventfd and the EFD_NONBLOCK and EFD_SEMAPHORE flags.]),
+-  AC_MSG_RESULT(no)
++  AC_MSG_RESULT(no),
++  AC_MSG_RESULT([cross-compile; assume yes])
++  AC_DEFINE([HAVE_EVENTFD], 1, [Define to 1 if your system supports eventfd and the EFD_NONBLOCK and EFD_SEMAPHORE flags.])
+ )
+ 
+ AST_GCC_ATTRIBUTE(pure)
+-- 
+2.11.0
+
diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
new file mode 100644
index 0000000..17ac22b
--- /dev/null
+++ b/package/asterisk/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_ASTERISK
+	bool "asterisk"
+	# Uses glibc resolver function res_nsearch()
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBILBC
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Asterisk is an open source framework for building
+	  communications applications. Asterisk turns an ordinary
+	  computer into a communications server. Asterisk powers IP PBX
+	  systems, VoIP gateways, conference servers and other custom
+	  solutions. It is used by small businesses, large businesses,
+	  call centers, carriers and government agencies, worldwide.
+	  Asterisk is free and open source.
+
+	  http://www.asterisk.org/
+
+comment "asterisk needs a glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
new file mode 100644
index 0000000..7ae35bc
--- /dev/null
+++ b/package/asterisk/asterisk.hash
@@ -0,0 +1,15 @@
+# Locally computed
+sha256  c122fbe88e089737fa2c80356762ceed38498aa26da1dfdd4da5506f9b135696  asterisk-14.5.0.tar.gz
+
+# sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
+# sha256 locally computed
+sha1    65ee068462c6645ed14a28d6b34eb0e9aa7a6c8d                          asterisk-core-sounds-en-gsm-1.5.tar.gz
+sha256  8d1118c6e0a0c614fafe297e3789f924ef5b04285cf6a8cffb8501dfcf5bbf07  asterisk-core-sounds-en-gsm-1.5.tar.gz
+sha1    f40fd6ea03dfe8d72ada2540b2288bfdc006381d                          asterisk-moh-opsound-wav-2.03.tar.gz
+sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asterisk-moh-opsound-wav-2.03.tar.gz
+
+# License files, locally computed
+sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
+sha256  ac5571f00e558e3b7c9b3f13f421b874cc12cf4250c4f70094c71544cf486312  main/sha1.c
+sha256  0fcdb946955d20c2819a51f3fe613d8f22da2ea793bd50acb30ce156499acc88  codecs/speex/speex_resampler.h
+sha256  e6e7b7204d34a3dcdf17389a9c8cf64721ec0d15a797fd51c8c1ed8517cc3038  utils/db1-ast/include/db.h
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
new file mode 100644
index 0000000..7016c9f
--- /dev/null
+++ b/package/asterisk/asterisk.mk
@@ -0,0 +1,183 @@
+################################################################################
+#
+# asterisk
+#
+################################################################################
+
+ASTERISK_VERSION = 14.5.0
+# Use the github mirror: it's an official mirror maintained by Digium, and
+# provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
+ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+
+ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
+ASTERISK_EXTRA_DOWNLOADS = \
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.5.tar.gz \
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
+
+ASTERISK_LICENSE = GPL-2.0, BSD-3c (SHA1, resample), BSD-4c (db1-ast)
+ASTERISK_LICENSE_FILES = \
+	COPYING \
+	main/sha1.c \
+	codecs/speex/speex_resampler.h \
+	utils/db1-ast/include/db.h
+
+# For patches 0001, 0003 and 0004
+ASTERISK_AUTORECONF = YES
+ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject
+
+ASTERISK_DEPENDENCIES = \
+	host-asterisk \
+	jansson \
+	libcurl \
+	libxml2 \
+	ncurses \
+	sqlite \
+	util-linux
+
+# Asterisk wants to run its menuselect tool (a highly tweaked derivative of
+# kconfig), but builds it using the target tools. So we build it in the host
+# variant (see below), and copy the full build tree of menuselect.
+define ASTERISK_COPY_MENUSELECT
+	rm -rf $(@D)/menuselect
+	cp -a $(HOST_ASTERISK_DIR)/menuselect $(@D)/menuselect
+endef
+ASTERISK_PRE_CONFIGURE_HOOKS += ASTERISK_COPY_MENUSELECT
+
+ASTERISK_CONF_OPTS = \
+	--disable-xmldoc \
+	--disable-internal-poll \
+	--disable-asteriskssl \
+	--disable-rpath \
+	--without-asound \
+	--without-bfd \
+	--without-execinfo \
+	--without-bluetooth \
+	--without-cap \
+	--without-cpg \
+	--without-curses \
+	--without-dahdi \
+	--without-gsm \
+	--without-gtk2 \
+	--without-gmime \
+	--without-h323 \
+	--without-hoard \
+	--without-ical \
+	--without-iconv \
+	--without-iksemel \
+	--without-imap \
+	--without-inotify \
+	--without-iodbc \
+	--without-isdnnet \
+	--without-jack \
+	--without-uriparser \
+	--without-kqueue \
+	--without-ldap \
+	--without-libedit \
+	--without-libxslt \
+	--without-ltdl \
+	--without-lua \
+	--without-misdn \
+	--without-mysqlclient \
+	--without-nbs \
+	--without-neon \
+	--without-neon29 \
+	--without-netsnmp \
+	--without-newt \
+	--without-ogg \
+	--without-openr2 \
+	--without-opus \
+	--without-osptk \
+	--without-oss \
+	--without-postgres \
+	--without-pjproject \
+	--without-popt \
+	--without-portaudio \
+	--without-pri \
+	--without-pwlib \
+	--without-radius \
+	--without-resample \
+	--without-sdl \
+	--without-SDL_image \
+	--without-spandsp \
+	--without-ss7 \
+	--without-speex \
+	--without-speexdsp \
+	--without-sqlite \
+	--without-srtp \
+	--without-ssl \
+	--without-suppserv \
+	--without-tds \
+	--without-termcap \
+	--without-timerfd \
+	--without-tinfo \
+	--without-tonezone \
+	--without-unbound \
+	--without-unixodbc \
+	--without-vorbis \
+	--without-vpb \
+	--without-x11 \
+	--without-z \
+	--with-crypt \
+	--with-jansson \
+	--with-libcurl \
+	--with-ilbc \
+	--with-libxml2 \
+	--with-ncurses="$(STAGING_DIR)/usr" \
+	--with-sqlite3="$(STAGING_DIR)/usr" \
+	--with-sounds-cache=$(BR2_DL_DIR)
+
+# avcodec are from ffmpeg. There is virtually zero chance this could
+# even work; asterisk is looking for ffmpeg/avcodec.h which has not
+# been installed in this location since early 2007 (~10 years ago at
+# the time of this writing).
+ASTERISK_CONF_OPTS += --without-avcodec
+
+ASTERISK_CONF_ENV = \
+	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
+
+ASTERISK_DIRS = \
+	ASTVARLIBDIR="/usr/lib/asterisk" \
+	ASTDATADIR="/usr/lib/asterisk" \
+	ASTKEYDIR="/usr/lib/asterisk" \
+	ASTDBDIR="/usr/lib/asterisk"
+
+ASTERISK_MAKE_OPTS = $(ASTERISK_DIRS)
+
+# We want to install sample configuration files, too.
+ASTERISK_INSTALL_TARGET_OPTS = \
+	$(ASTERISK_DIRS) \
+	DESTDIR=$(TARGET_DIR) \
+	LDCONFIG=true \
+	install samples
+
+$(eval $(autotools-package))
+
+#-------------------------------------------------------------------------------
+# This part deals with building the menuselect tool as a host package
+
+HOST_ASTERISK_DEPENDENCIES = host-pkgconf host-libxml2 host-ncurses
+HOST_ASTERISK_SUBDIR = menuselect
+
+HOST_ASTERISK_LICENSE = GPL-2.0
+HOST_ASTERISK_LICENSE_FILES = COPYING
+
+# No need to autoreconf for the host variant,
+# so do not inherit the target setup.
+HOST_ASTERISK_AUTORECONF = NO
+
+HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/usr/bin/xml2-config
+
+HOST_ASTERISK_CONF_OPTS = \
+	--without-newt \
+	--without-curses \
+	--with-ncurses=$(HOST_DIR)/usr
+
+# Even though menuselect is an autotools package, it is *not* installed,
+# as asterisk does expect it to be in a sub-directory of its source tree,
+# which do by copying the full menuselect build tree as a pre-configure
+# hook in the target variant.
+define HOST_ASTERISK_INSTALL_CMDS
+	@:
+endef
+
+$(eval $(host-autotools-package))
