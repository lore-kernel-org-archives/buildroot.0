From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] lsof: convert to gentargets and
	bump to 4.84
Message-ID: <20101214003642.6DF258E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8db52c6e78c040d035522ca747acc7752d474cf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lsof is packaged as a tarball inside a .tar.bz2 package, so we have a
post-extract hook to extract the source code tarball, so that for the
next steps, lsof looks like a normal package.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +-
 ...sof-makefile.patch => lsof-4.84-makefile.patch} |    4 +-
 ...f-noportmap.patch => lsof-4.84-noportmap.patch} |    4 +-
 ...flags.patch => lsof-4.84-override-cflags.patch} |    4 +-
 ...tch => lsof-4.84-remove-susvlegacy-funcs.patch} |    4 +-
 package/lsof/lsof-uclibc.patch                     |   12 ---
 package/lsof/lsof.mk                               |   96 ++++++++++----------
 7 files changed, 58 insertions(+), 74 deletions(-)
 rename package/lsof/{lsof-makefile.patch => lsof-4.84-makefile.patch} (62%)
 rename package/lsof/{lsof-noportmap.patch => lsof-4.84-noportmap.patch} (64%)
 rename package/lsof/{lsof-override-cflags.patch => lsof-4.84-override-cflags.patch} (66%)
 rename package/lsof/{lsof-remove-susvlegacy-funcs.patch => lsof-4.84-remove-susvlegacy-funcs.patch} (62%)
 delete mode 100644 package/lsof/lsof-uclibc.patch

diff --git a/CHANGES b/CHANGES
index 5dbc27c..a021437 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,10 +5,10 @@
 
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
-	hostapd, i2c-tools, input-tools, libconfig, ltp-testsuite, m4,
-	mii-diag, mrouted, openssh, openssl, openvpn, pango, qt,
-	rsync, sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils,
-	xz, zlib
+	hostapd, i2c-tools, input-tools, libconfig, lsof,
+	ltp-testsuite, m4, mii-diag, mrouted, openssh, openssl,
+	openvpn, pango, qt, rsync, sdl_gfx, sdl_sound, sysklogd,
+	sysvinit, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
diff --git a/package/lsof/lsof-makefile.patch b/package/lsof/lsof-4.84-makefile.patch
similarity index 62%
rename from package/lsof/lsof-makefile.patch
rename to package/lsof/lsof-4.84-makefile.patch
index 2d4e9d4..65b1b2e 100644
--- a/package/lsof/lsof-makefile.patch
+++ b/package/lsof/lsof-4.84-makefile.patch
@@ -1,6 +1,6 @@
 diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
---- lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ lsof_4.81/lsof_4.81_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
+--- a/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
++++ b/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
 @@ -21,8 +21,8 @@
  all:	${LIB}
  
diff --git a/package/lsof/lsof-noportmap.patch b/package/lsof/lsof-4.84-noportmap.patch
similarity index 64%
rename from package/lsof/lsof-noportmap.patch
rename to package/lsof/lsof-4.84-noportmap.patch
index 4a37db4..984e0d8 100644
--- a/package/lsof/lsof-noportmap.patch
+++ b/package/lsof/lsof-4.84-noportmap.patch
@@ -1,5 +1,5 @@
---- lsof_4.81/lsof_4.81_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.81/lsof_4.81_src/print.c	2006-08-23 13:38:29.000000000 -0600
+--- a/print.c	2006-08-23 13:37:43.000000000 -0600
++++ b/print.c	2006-08-23 13:38:29.000000000 -0600
 @@ -148,6 +148,7 @@
  static void
  fill_portmap()
diff --git a/package/lsof/lsof-override-cflags.patch b/package/lsof/lsof-4.84-override-cflags.patch
similarity index 66%
rename from package/lsof/lsof-override-cflags.patch
rename to package/lsof/lsof-4.84-override-cflags.patch
index fcb9292..135e599 100644
--- a/package/lsof/lsof-override-cflags.patch
+++ b/package/lsof/lsof-4.84-override-cflags.patch
@@ -1,5 +1,5 @@
---- lsof_4.81/lsof_4.81_src/Configure	2008-10-21 18:21:45.000000000 +0200
-+++ lsof_4.81/lsof_4.81_src/Configure	2010-11-03 14:00:00.000000000 +0100
+--- lsof_4.84/Configure	2008-10-21 18:21:45.000000000 +0200
++++ lsof_4.84/Configure	2010-11-03 14:00:00.000000000 +0100
 @@ -5206,6 +5206,10 @@
    cp $LSOF_MKFC ${LSOF_LIB}/$LSOF_LIBMKF
  fi	# }
diff --git a/package/lsof/lsof-remove-susvlegacy-funcs.patch b/package/lsof/lsof-4.84-remove-susvlegacy-funcs.patch
similarity index 62%
rename from package/lsof/lsof-remove-susvlegacy-funcs.patch
rename to package/lsof/lsof-4.84-remove-susvlegacy-funcs.patch
index d1d9371..fca66ae 100644
--- a/package/lsof/lsof-remove-susvlegacy-funcs.patch
+++ b/package/lsof/lsof-4.84-remove-susvlegacy-funcs.patch
@@ -1,6 +1,6 @@
 diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ lsof_4.81/lsof_4.81_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
+--- a/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
++++ b/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
 @@ -616,6 +616,6 @@
   * zeromem is a macro that uses bzero or memset.
   */
diff --git a/package/lsof/lsof-uclibc.patch b/package/lsof/lsof-uclibc.patch
deleted file mode 100644
index 797a0ce..0000000
--- a/package/lsof/lsof-uclibc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ru lsof_4.81.orig/lsof_4.81_src/dialects/linux/dlsof.h lsof_4.81/lsof_4.81_src/dialects/linux/dlsof.h
---- lsof_4.81.orig/lsof_4.81_src/dialects/linux/dlsof.h	2006-03-28 00:57:14.000000000 +0200
-+++ lsof_4.81/lsof_4.81_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
-@@ -49,7 +49,7 @@
- #include <unistd.h>
- #include <netinet/in.h>
- 
--# if	defined(GLIBCV)
-+# if	defined(GLIBCV) || defined __UCLIBC__
- #include <netinet/tcp.h>
- # else	/* !defined(GLIBCV) */
- #include <linux/tcp.h>
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 837a88c..05365da 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -3,68 +3,64 @@
 # lsof
 #
 #############################################################
-LSOF_VERSION:=4.81
-LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
-LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
-LSOF_CAT:=$(BZCAT)
-LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
-LSOF_BINARY:=lsof
-LSOF_TARGET_BINARY:=bin/lsof
-LSOF_INCLUDE:=$(STAGING_DIR)/usr/include
+LSOF_VERSION = 4.84
+LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
+LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 
-BR2_LSOF_CFLAGS:=
+BR2_LSOF_CFLAGS =
 ifeq ($(BR2_LARGEFILE),)
-BR2_LSOF_CFLAGS+=-U_FILE_OFFSET_BITS
+BR2_LSOF_CFLAGS += -U_FILE_OFFSET_BITS
 endif
 ifeq ($(BR2_INET_IPV6),)
-BR2_LSOF_CFLAGS+=-UHASIPv6
+BR2_LSOF_CFLAGS += -UHASIPv6
 endif
 
-$(DL_DIR)/$(LSOF_SOURCE):
-	 $(call DOWNLOAD,$(LSOF_SITE),$(LSOF_SOURCE))
-
-lsof-source: $(DL_DIR)/$(LSOF_SOURCE)
-
-lsof-unpacked: $(LSOF_DIR)/.unpacked
-
-$(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
-	$(LSOF_CAT) $(DL_DIR)/$(LSOF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	(cd $(LSOF_DIR);tar xf lsof_$(LSOF_VERSION)_src.tar;rm -f lsof_$(LSOF_VERSION)_src.tar)
-	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ \*.patch
-	touch $(LSOF_DIR)/.unpacked
-
-$(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
-	touch $(LSOF_DIR)/.configured
-
-$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
 ifeq ($(BR2_USE_WCHAR),)
-	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
-	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+define LSOF_CONFIGURE_WCHAR_FIXUPS
+	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
+		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' \
+		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+endef
 endif
+
 ifeq ($(BR2_ENABLE_LOCALE),)
-	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+define LSOF_CONFIGURE_LOCALE_FIXUPS
+	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' \
+		$(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+endef
 endif
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src
 
-$(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY)
-	cp $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY) $@
-	$(STRIPCMD) $@
+# The .tar.bz2 contains another .tar, which contains the source code.
+define LSOF_EXTRACT_TAR
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
+	rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
+endef
 
-lsof: $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
+LSOF_POST_EXTRACT_HOOKS += LSOF_EXTRACT_TAR
 
-lsof-clean:
-	-rm -f $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
-	-$(MAKE) -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src clean
+define LSOF_CONFIGURE_CMDS
+	(cd $(@D) ; \
+		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" \
+		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 ./Configure linux)
+	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
+	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
+endef
 
-lsof-dirclean:
-	rm -rf $(LSOF_DIR)
+define LSOF_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(@D)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LSOF),y)
-TARGETS+=lsof
-endif
+define LSOF_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
+endef
+
+define LSOF_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/bin/lsof
+endef
+
+define LSOF_CLEAN_CMDS
+	-$(MAKE) -C $(@D)/lsof_$(LSOF_VERSION)_src clean
+endef
+
+$(eval $(call GENTARGETS,package,lsof))
-- 
1.7.2.2
