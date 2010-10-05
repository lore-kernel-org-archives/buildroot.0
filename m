From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:22:35 -0700
Subject: [Buildroot] [PATCH 02/10] lsof: convert to gentargets and bump to
	4.84
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266963-23413-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An explanation is required for this package. The source for this package is an
archive inside an archive. The gentargets makefile only extracts the first
archive, but not the second. This causes the patch routine to fail. I hide the
patches from the gentargets patch routine, and then extract and patch the
second archive during the configure routine. Also, I've changed the patches to
no longer point to the sub-directory, which is version dependent.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/lsof/_lsof-4.84-makefile.patch             |   14 +++
 package/lsof/_lsof-4.84-noportmap.patch            |   18 ++++
 .../lsof/_lsof-4.84-remove-susvlegacy-funcs.patch  |   12 +++
 package/lsof/lsof-makefile.patch                   |   14 ---
 package/lsof/lsof-noportmap.patch                  |   18 ----
 package/lsof/lsof-remove-susvlegacy-funcs.patch    |   12 ---
 package/lsof/lsof-uclibc.patch                     |   12 ---
 package/lsof/lsof.mk                               |   86 ++++++++-----------
 8 files changed, 80 insertions(+), 106 deletions(-)
 create mode 100644 package/lsof/_lsof-4.84-makefile.patch
 create mode 100644 package/lsof/_lsof-4.84-noportmap.patch
 create mode 100644 package/lsof/_lsof-4.84-remove-susvlegacy-funcs.patch
 delete mode 100644 package/lsof/lsof-makefile.patch
 delete mode 100644 package/lsof/lsof-noportmap.patch
 delete mode 100644 package/lsof/lsof-remove-susvlegacy-funcs.patch
 delete mode 100644 package/lsof/lsof-uclibc.patch

diff --git a/package/lsof/_lsof-4.84-makefile.patch b/package/lsof/_lsof-4.84-makefile.patch
new file mode 100644
index 0000000..65b1b2e
--- /dev/null
+++ b/package/lsof/_lsof-4.84-makefile.patch
@@ -0,0 +1,14 @@
+diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
+--- a/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
++++ b/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
+@@ -21,8 +21,8 @@
+ all:	${LIB}
+ 
+ ${LIB}:	${OBJ}
+-	${AR}
+-	${RANLIB}
++	${AR} cr ${LIB} ${OBJ}
++	${RANLIB} ${LIB}
+ 
+ clean:	FRC
+ 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core
diff --git a/package/lsof/_lsof-4.84-noportmap.patch b/package/lsof/_lsof-4.84-noportmap.patch
new file mode 100644
index 0000000..984e0d8
--- /dev/null
+++ b/package/lsof/_lsof-4.84-noportmap.patch
@@ -0,0 +1,18 @@
+--- a/print.c	2006-08-23 13:37:43.000000000 -0600
++++ b/print.c	2006-08-23 13:38:29.000000000 -0600
+@@ -148,6 +148,7 @@
+ static void
+ fill_portmap()
+ {
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_RPC__)
+ 	char buf[128], *cp, *nm;
+ 	CLIENT *c;
+ 	int h, port, pr;
+@@ -266,6 +267,7 @@
+ 	    Pth[pr][h] = pt;
+ 	}
+ 	clnt_destroy(c);
++#endif
+ }
+ 
+ 
diff --git a/package/lsof/_lsof-4.84-remove-susvlegacy-funcs.patch b/package/lsof/_lsof-4.84-remove-susvlegacy-funcs.patch
new file mode 100644
index 0000000..fca66ae
--- /dev/null
+++ b/package/lsof/_lsof-4.84-remove-susvlegacy-funcs.patch
@@ -0,0 +1,12 @@
+diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
+--- a/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
++++ b/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
+@@ -616,6 +616,6 @@
+  * zeromem is a macro that uses bzero or memset.
+  */
+ 
+-#define	zeromem(a, l)	bzero(a, l)
++#define	zeromem(a, l)	memset(a, 0, l)
+ 
+ #endif	/* !defined(LSOF_MACHINE_H) */
+
diff --git a/package/lsof/lsof-makefile.patch b/package/lsof/lsof-makefile.patch
deleted file mode 100644
index 2d4e9d4..0000000
--- a/package/lsof/lsof-makefile.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
---- lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ lsof_4.81/lsof_4.81_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
-@@ -21,8 +21,8 @@
- all:	${LIB}
- 
- ${LIB}:	${OBJ}
--	${AR}
--	${RANLIB}
-+	${AR} cr ${LIB} ${OBJ}
-+	${RANLIB} ${LIB}
- 
- clean:	FRC
- 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core
diff --git a/package/lsof/lsof-noportmap.patch b/package/lsof/lsof-noportmap.patch
deleted file mode 100644
index 4a37db4..0000000
--- a/package/lsof/lsof-noportmap.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- lsof_4.81/lsof_4.81_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.81/lsof_4.81_src/print.c	2006-08-23 13:38:29.000000000 -0600
-@@ -148,6 +148,7 @@
- static void
- fill_portmap()
- {
-+#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_RPC__)
- 	char buf[128], *cp, *nm;
- 	CLIENT *c;
- 	int h, port, pr;
-@@ -266,6 +267,7 @@
- 	    Pth[pr][h] = pt;
- 	}
- 	clnt_destroy(c);
-+#endif
- }
- 
- 
diff --git a/package/lsof/lsof-remove-susvlegacy-funcs.patch b/package/lsof/lsof-remove-susvlegacy-funcs.patch
deleted file mode 100644
index d1d9371..0000000
--- a/package/lsof/lsof-remove-susvlegacy-funcs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ lsof_4.81/lsof_4.81_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
-@@ -616,6 +616,6 @@
-  * zeromem is a macro that uses bzero or memset.
-  */
- 
--#define	zeromem(a, l)	bzero(a, l)
-+#define	zeromem(a, l)	memset(a, 0, l)
- 
- #endif	/* !defined(LSOF_MACHINE_H) */
-
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
index 8deff15..665ea3d 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -3,68 +3,54 @@
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
+LSOF_INCLUDE = $(STAGING_DIR)/usr/include
 
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
-	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
-	touch $(LSOF_DIR)/.configured
-
-$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
 ifeq ($(BR2_USE_WCHAR),)
-	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
-	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+define LSOF_CONFIGURE_WCHAR_FIXUPS
+	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' $(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+endef
 endif
+
 ifeq ($(BR2_ENABLE_LOCALE),)
-	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+define LSOF_CONFIGURE_LOCALE_FIXUPS
+	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(@D)/lsof_$(LSOF_VERSION)_src/machine.h
+endef
 endif
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src
 
-$(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY)
-	cp $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY) $@
-	$(STRIPCMD) $@
+define LSOF_CONFIGURE_CMDS
+	(cd $(@D);tar xf lsof_$(LSOF_VERSION)_src.tar;rm -f lsof_$(LSOF_VERSION)_src.tar)
+	toolchain/patch-kernel.sh $(@D)/lsof_$(LSOF_VERSION)_src package/lsof \*.patch
+	(cd $(@D)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
+	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
+	$(LSOF_CONFIGURE_LOCALE_FIXUPS)
+endef
 
-lsof: $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
+define LSOF_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(@D)/lsof_$(LSOF_VERSION)_src
+endef
 
-lsof-clean:
-	-rm -f $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
-	-$(MAKE) -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src clean
+define LSOF_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/lsof_$(LSOF_VERSION)_src/lsof $(TARGET_DIR)/bin/lsof
+endef
 
-lsof-dirclean:
-	rm -rf $(LSOF_DIR)
+define LSOF_UNINSTALL_TARGET_CMDS
+	-rm -f $(TARGET_DIR)/bin/lsof
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LSOF),y)
-TARGETS+=lsof
-endif
+define LSOF_CLEAN_CMDS
+	-$(MAKE) -C $(@D)/lsof_$(LSOF_VERSION)_src clean
+endef
+
+$(eval $(call GENTARGETS,package,lsof))
-- 
1.7.3.1
