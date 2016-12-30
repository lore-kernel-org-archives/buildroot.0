From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:04 +0100
Subject: [Buildroot] [PATCH 03/52] package/asterisk: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <bd16c7aca1ba8c82c3c50977bfc207bd2cb7ca65.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asterisk: the flagship of telephony on Linux. These are the lines of
code whose continuous mission is to power small and large enterprises
telephony systems, to boldly provide IP PBX where no one has done so
before.

But it is a hell to get compiled... :-(

For starters, it needs a host tool, menuselect, to prepare its build
configuration. Unfortunately, the way it handles menuselect does not
paly very well for cross-compilation: the main ./configure calls out to
menuselect's own ./configure, and of course that runs with the same
environement, which is wrong for croos-compilation (because of variables
like CC, CFLAGS and the likes).

Furthermore, the paths to menuselect are imbricated about everywhere in
the main Makefile, so making it find menuselect in PATH is a lost cause.
So we can't make menuselect a host-package... :-(

Instead, we just patch-out the handling of menuselect and take care of
it manually:
  - we manually configure it before configuring asterisk itself
  - we manually build it before building asterisk itself

For those two, we duplicate the same code we have for host-autotools
packages, and stay as close to it as possible.

If that was not completely enough, asterisk requires libxml2, because
menuselect needs it. So we should pass it the path the the host libxml2,
not the target one. However, to add insult to injury, asterisk really
needs libxml2 for the target as well, so we really need to pass it the
target libxml2, which is now possible because we build menuselect
separately.

Some tests, like the crypt() one, are broken and could not have ever
possibly worked at all. Worse, the FFmpeg test is looking for headers
that FFmpeg removed more than 7 years ago and are virtually no longer
available in any distro. So, FFmpeg support is definitely not tested by
upstream and can't possibly work at all.

Now, asterisk wants to install a default set of sound files (for
answering machine stuff, I guess). They come come pre-bundled in the
official archive [0], but the buildsystem will want to download (at
install time) the sah1 files for each sound archive, to validate that
said archive is correct. However, the download is done via plain http,
so it still risks an MITM attack. And for Buildroot, it is not always
possible to download at install time, so we patch-out the sha1 check.

[0] http://downloads.asterisk.org/pub/telephony/asterisk/releases/

The official archive contains the sound archives plus a full set of
documentation. This makes it very big. Unfotunately, the hosting site is
rather slow, topping at about ~204kbps. So we get the archive from the
official mirror on Github. But that archive is missing the sound
archives, so we download them separately.

Finally, but not the least, asterisk does not autoreconf nicely at all,
even with the provided bootstrap script, so we just patch configure.ac
and configure since it is trivial enough to do so.

Almost all features are disabled for now. Support for additional
features will be added in subsequent patches now that we have a working
base.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |   1 +
 ...-configure-do-not-configure-in-menuselect.patch |  92 +++++++++++
 ...02-sounds-do-not-download-and-check-sha1s.patch |  52 ++++++
 .../0003-configure-fix-detection-of-libcrypt.patch |  62 +++++++
 package/asterisk/Config.in                         |  28 ++++
 package/asterisk/asterisk.hash                     |   9 +
 package/asterisk/asterisk.mk                       | 181 +++++++++++++++++++++
 7 files changed, 425 insertions(+)
 create mode 100644 package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
 create mode 100644 package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
 create mode 100644 package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
 create mode 100644 package/asterisk/Config.in
 create mode 100644 package/asterisk/asterisk.hash
 create mode 100644 package/asterisk/asterisk.mk

diff --git a/package/Config.in b/package/Config.in
index 18818fa..38da776 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1443,6 +1443,7 @@ menu "Networking applications"
 	source "package/apache/Config.in"
 	source "package/argus/Config.in"
 	source "package/arptables/Config.in"
+	source "package/asterisk/Config.in"
 	source "package/atftp/Config.in"
 	source "package/autossh/Config.in"
 	source "package/avahi/Config.in"
diff --git a/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
new file mode 100644
index 0000000..c4fd060
--- /dev/null
+++ b/package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
@@ -0,0 +1,92 @@
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
+environment may still reference variables for the taget, like CC or
+CFLAGS and so on... We can not build menuselect with those variables.
+
+Intead, just assume that menuselect will be pre-compiled.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure    | 16 ----------------
+ configure.ac | 16 ----------------
+ 2 files changed, 32 deletions(-)
+
+diff --git a/configure b/configure
+index 4ab32c9..b4aab11 100755
+--- a/configure
++++ b/configure
+@@ -35548,12 +35548,6 @@ fi
+ 
+ 
+ 
+-if test -f makeopts; then
+-	${ac_cv_path_EGREP} 'CURSES|GTK2|OSARCH|NEWT' makeopts > makeopts.acbak
+-else
+-	touch makeopts.acbak
+-fi
+-
+ ac_config_files="$ac_config_files build_tools/menuselect-deps makeopts"
+ 
+ 
+@@ -36874,16 +36868,6 @@ $as_echo "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2;}
+ fi
+ 
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
index 0000000..325ab49
--- /dev/null
+++ b/package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
@@ -0,0 +1,62 @@
+From 8996503f6c55e55f326ab11c18278954ad7abaf3 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 27 Dec 2016 11:21:57 +0100
+Subject: [PATCH] configure: fix detection of libcrypt
+
+The crypt() function is searched in two locations: -lcrypt and the
+standard C library.
+
+The result of the forner is stored in the LIBCRYPT 'scheme' while that
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
+diff --git a/configure b/configure
+index b4aab11..53648f1 100755
+--- a/configure
++++ b/configure
+@@ -31879,12 +31879,14 @@ fi
+ if test "x$LIBCRYPT_LIB" != "x" ; then
+     CRYPT_LIB="$LIBCRYPT_LIB"
+     CRYPT_INCLUDE="$LIBCRYPT_INCLUDE"
++    PBX_CRYPT=1
+ 
+ $as_echo "#define HAVE_CRYPT 1" >>confdefs.h
+ 
+ elif test "x$SYSCRYPT" != "x" ; then
+     CRYPT_LIB=""
+     CRYPT_INCLUDE=""
++    PBX_CRYPT=1
+ 
+ $as_echo "#define HAVE_CRYPT 1" >>confdefs.h
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
diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
new file mode 100644
index 0000000..5e7f04b
--- /dev/null
+++ b/package/asterisk/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_ASTERISK
+	bool "asterisk"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Asterisk is an open source framework for building
+	  communications applications. Asterisk turns an ordinary
+	  computer into a communications server. Asterisk powers
+	  IP PBX systems, VoIP gateways, conference servers and
+	  other custom solutions. It is used by small businesses,
+	  large businesses, call centers, carriers and government
+	  agencies, worldwide. Asterisk is free and open source.
+
+	  http://www.asterisk.org/
+
+comment "asterisk needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
new file mode 100644
index 0000000..4cc09ae
--- /dev/null
+++ b/package/asterisk/asterisk.hash
@@ -0,0 +1,9 @@
+# From http://downloads.asterisk.org/pub/telephony/asterisk
+sha256  0afce295676875bf422a028c586eff88146f068363aab35af09b1c56cfb9c138  asterisk-14.2.1.tar.gz
+
+# sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
+# sha256 locally computed
+sha1    65ee068462c6645ed14a28d6b34eb0e9aa7a6c8d                          asterisk-core-sounds-en-gsm-1.5.tar.gz
+sha256  8d1118c6e0a0c614fafe297e3789f924ef5b04285cf6a8cffb8501dfcf5bbf07  asterisk-core-sounds-en-gsm-1.5.tar.gz
+sha1    f40fd6ea03dfe8d72ada2540b2288bfdc006381d                          asterisk-moh-opsound-wav-2.03.tar.gz
+sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asterisk-moh-opsound-wav-2.03.tar.gz
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
new file mode 100644
index 0000000..239e457
--- /dev/null
+++ b/package/asterisk/asterisk.mk
@@ -0,0 +1,181 @@
+################################################################################
+#
+# asterisk
+#
+################################################################################
+
+ASTERISK_VERSION = 14.2.1
+# Use the github mirror: it's an official mirror maintained by Digium, and
+# provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
+ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+
+ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
+ASTERISK_EXTRA_DOWNLOADS = \
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.5.tar.gz \
+	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
+
+ASTERISK_DEPENDENCIES = jansson libxml2 ncurses sqlite util-linux
+
+# Those dependencies are to build the menuselect tool:
+ASTERISK_DEPENDENCIES += host-libxml2 host-ncurses
+
+# avcodec are from ffmpeg. There is virtually zero chance this could
+# even work; asterisk is looking for ffmpeg/avcodec.h which has not
+# been installed in this location since early 2007 (~9 years at the
+# time of this writing).
+ASTERISK_CONF_OPTS = --without-avcodec
+
+ASTERISK_CONF_OPTS += \
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
+	--without-ilbc \
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
+	--without-libcurl \
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
+	--with-libxml2 \
+	--with-ncurses="$(STAGING_DIR)/usr" \
+	--with-sqlite3="$(STAGING_DIR)/usr" \
+	--with-sounds-cache=$(BR2_DL_DIR)
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
+	install samples
+
+#-------------------------------------------------------------------------------
+# This part deals with building the menuselect tool.
+# Even though menuselect is an autotools package, it is *not* installed in
+# $(HOST_DIR) as asterisk does expect it to be in a sub-directory of its
+# source tree.
+
+ASTRISK_MENUSELECT_FLAGS = \
+	LDFLAGS="$(HOST_LDFLAGS) -lxml2" \
+	CFLAGS="$(HOST_CLFAGS) -I$(HOST_DIR)/usr/include/libxml2"
+
+ASTERISK_MENUSELECT_CONF_ENV = \
+	CONFIG_LIBXML2=$(HOST_DIR)/usr/bin/xml2-config
+
+ASTERISK_MENUSELECT_CONF_OPTS = \
+	--without-newt \
+	--without-curses \
+	--with-ncurses=$(HOST_DIR)/usr \
+	--with-libxml2=$(HOST_DIR)/usr \
+	$(ASTRISK_MENUSELECT_FLAGS)
+
+ASTERISK_MENUSELECT_MAKE_OPTS = \
+	$(ASTRISK_MENUSELECT_FLAGS)
+
+define ASTERISK_MENUSELECT_CONFIGURE_CMDS
+	cd $(@D)/menuselect && rm -rf config.cache; \
+	$(HOST_CONFIGURE_OPTS) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	$(ASTERISK_MENUSELECT_CONF_ENV) \
+	CONFIG_SITE=/dev/null \
+	./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--localstatedir="$(HOST_DIR)/var" \
+		--enable-shared --disable-static \
+		--disable-gtk-doc \
+		--disable-gtk-doc-html \
+		--disable-doc \
+		--disable-docs \
+		--disable-documentation \
+		--disable-debug \
+		--with-xmlto=no \
+		--with-fop=no \
+		--disable-dependency-tracking \
+		$(QUIET) $(ASTERISK_MENUSELECT_CONF_OPTS)
+endef
+ASTERISK_PRE_CONFIGURE_HOOKS += ASTERISK_MENUSELECT_CONFIGURE_CMDS
+
+define ASTERISK_MENUSELECT_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/menuselect $(ASTERISK_MENUSELECT_MAKE_OPTS)
+endef
+ASTERISK_PRE_BUILD_HOOKS += ASTERISK_MENUSELECT_BUILD_CMDS
+
+$(eval $(autotools-package))
-- 
2.7.4
