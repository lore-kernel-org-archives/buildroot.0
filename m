From: Michael Roth <mroth@nessie.de>
Date: Mon, 19 Apr 2010 14:45:08 +0200
Subject: [Buildroot] [PATCH 1/1] lsof: bump to 4.83
Message-ID: <1271681108-923-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumped lsof to version 4.83 and decreased the patches theirs
root directory by one level to make future version bumps easier
because lsof has an unconventional directory structure.

Reworked lsof.mk to remove some repeated typing.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/lsof/lsof-makefile.patch                |    4 +-
 package/lsof/lsof-noportmap.patch               |    4 +-
 package/lsof/lsof-norpc.patch                   |   13 +++++++
 package/lsof/lsof-remove-susvlegacy-funcs.patch |    4 +-
 package/lsof/lsof-uclibc.patch                  |   12 -------
 package/lsof/lsof.mk                            |   40 ++++++++++++----------
 6 files changed, 41 insertions(+), 36 deletions(-)
 create mode 100644 package/lsof/lsof-norpc.patch
 delete mode 100644 package/lsof/lsof-uclibc.patch

diff --git a/package/lsof/lsof-makefile.patch b/package/lsof/lsof-makefile.patch
index 2d4e9d4..9137557 100644
--- a/package/lsof/lsof-makefile.patch
+++ b/package/lsof/lsof-makefile.patch
@@ -1,6 +1,6 @@
 diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
---- lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ lsof_4.81/lsof_4.81_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
+--- lsof_4.81_src/lib/Makefile.orig.skel	2001-02-13 03:12:22.000000000 +0100
++++ lsof_4.81_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
 @@ -21,8 +21,8 @@
  all:	${LIB}
  
diff --git a/package/lsof/lsof-noportmap.patch b/package/lsof/lsof-noportmap.patch
index 4a37db4..2c70f9c 100644
--- a/package/lsof/lsof-noportmap.patch
+++ b/package/lsof/lsof-noportmap.patch
@@ -1,5 +1,5 @@
---- lsof_4.81/lsof_4.81_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.81/lsof_4.81_src/print.c	2006-08-23 13:38:29.000000000 -0600
+--- lsof_4.81_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
++++ lsof_4.81_src/print.c	2006-08-23 13:38:29.000000000 -0600
 @@ -148,6 +148,7 @@
  static void
  fill_portmap()
diff --git a/package/lsof/lsof-norpc.patch b/package/lsof/lsof-norpc.patch
new file mode 100644
index 0000000..ea425f5
--- /dev/null
+++ b/package/lsof/lsof-norpc.patch
@@ -0,0 +1,13 @@
+--- lsof_4.83_src/dialects/linux/dlsof.orig.h   2010-04-19 13:31:48.247395489 +0200
++++ lsof_4.83_src/dialects/linux/dlsof.h        2010-04-19 13:32:07.512099998 +0200
+@@ -56,8 +56,10 @@
+ #include <linux/tcp.h>
+ # endif	/* defined(GLIBCV) || defined(__UCLIBC__) */
+ 
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_RPC__)
+ #include <rpc/rpc.h>
+ #include <rpc/pmap_prot.h>
++#endif
+  
+ #if	defined(HASSELINUX)
+ #include <selinux/selinux.h>
diff --git a/package/lsof/lsof-remove-susvlegacy-funcs.patch b/package/lsof/lsof-remove-susvlegacy-funcs.patch
index d1d9371..bc3a65e 100644
--- a/package/lsof/lsof-remove-susvlegacy-funcs.patch
+++ b/package/lsof/lsof-remove-susvlegacy-funcs.patch
@@ -1,6 +1,6 @@
 diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ lsof_4.81/lsof_4.81_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
+--- lsof_4.81_src/dialects/linux/machine.orig.h	2007-04-24 18:20:58.000000000 +0200
++++ lsof_4.81_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
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
index 8deff15..6b25463 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -3,13 +3,14 @@
 # lsof
 #
 #############################################################
-LSOF_VERSION:=4.81
+LSOF_VERSION:=4.83
 LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 LSOF_CAT:=$(BZCAT)
 LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
-LSOF_BINARY:=lsof
-LSOF_TARGET_BINARY:=bin/lsof
+LSOF_SRC_DIR:=$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src
+LSOF_BINARY:=$(LSOF_SRC_DIR)/lsof
+LSOF_TARGET_BINARY:=$(TARGET_DIR)/bin/lsof
 LSOF_INCLUDE:=$(STAGING_DIR)/usr/include
 
 BR2_LSOF_CFLAGS:=
@@ -30,32 +31,35 @@ lsof-unpacked: $(LSOF_DIR)/.unpacked
 $(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
 	$(LSOF_CAT) $(DL_DIR)/$(LSOF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	(cd $(LSOF_DIR);tar xf lsof_$(LSOF_VERSION)_src.tar;rm -f lsof_$(LSOF_VERSION)_src.tar)
-	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ \*.patch
-	touch $(LSOF_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(LSOF_SRC_DIR) package/lsof/ \*.patch
+	touch $@
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
-	touch $(LSOF_DIR)/.configured
-
-$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
+	(cd $(LSOF_SRC_DIR);					\
+		$(TARGET_CONFIGURE_OPTS)			\
+		DEBUG="$(TARGET_CFLAGS)	$(BR2_LSOF_CFLAGS)"	\
+		LSOF_INCLUDE="$(LSOF_INCLUDE)"			\
+		./Configure -n linux)
 ifeq ($(BR2_USE_WCHAR),)
-	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
-	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_SRC_DIR)/machine.h
 endif
 ifeq ($(BR2_ENABLE_LOCALE),)
-	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_SRC_DIR)/machine.h
 endif
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src
+	touch $@
+
+$(LSOF_BINARY): $(LSOF_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_SRC_DIR)
 
-$(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY)
-	cp $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY) $@
+$(LSOF_TARGET_BINARY): $(LSOF_BINARY)
+	cp $(LSOF_BINARY) $@
 	$(STRIPCMD) $@
 
-lsof: $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
+lsof: $(LSOF_TARGET_BINARY)
 
 lsof-clean:
-	-rm -f $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
-	-$(MAKE) -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src clean
+	-rm -f $(LSOF_TARGET_BINARY)
+	-$(MAKE) -C $(LSOF_SRC_DIR) clean
 
 lsof-dirclean:
 	rm -rf $(LSOF_DIR)
-- 
1.6.4.4
