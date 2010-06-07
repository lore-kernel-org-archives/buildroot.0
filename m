From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jun 2010 22:30:57 +0200
Subject: [Buildroot] [git commit master] gawk: bump version and migrate to
	autotargets
Message-ID: <20100607203309.774D58DA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8cd06967b9beb025ca37f695f18beb6dc45d6a85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1933

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    5 +-
 package/gawk/gawk-3.1.5-core.patch   |   31 -------------
 package/gawk/gawk-3.1.5-gcc4.patch   |   23 ----------
 package/gawk/gawk-no-versioned.patch |   49 ++++++++++++++++++++
 package/gawk/gawk.mk                 |   81 ++++++----------------------------
 5 files changed, 66 insertions(+), 123 deletions(-)
 delete mode 100644 package/gawk/gawk-3.1.5-core.patch
 delete mode 100644 package/gawk/gawk-3.1.5-gcc4.patch
 create mode 100644 package/gawk/gawk-no-versioned.patch

diff --git a/CHANGES b/CHANGES
index 529d845..ccc4393 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf, openssl, php,
-	qt, sqlite, tn5250, usbutils
+	Updated/fixed packages: cdrkit, gawk, libidn, netperf,
+	openssl, php, qt, sqlite, tn5250, usbutils
 
 	Removed packages: modutils
 
@@ -21,6 +21,7 @@
 	#1897: Bump libusb to 1.0.7
 	#1903: Bump tn5250 to 0.17.4 and migrate to autotargets
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
+	#1933: Bump gawk to 3.1.8 and migrate to autotargets
 	#1945: PHP: add sqlite3 dependency when using external lib
 	#1951: Bump openssl to 0.9.8o
 	#1957: Bump sqlite to 3.6.23.1
diff --git a/package/gawk/gawk-3.1.5-core.patch b/package/gawk/gawk-3.1.5-core.patch
deleted file mode 100644
index 17cd188..0000000
--- a/package/gawk/gawk-3.1.5-core.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-fix an ugly core on a simple script
-
-http://lists.gnu.org/archive/html/bug-gnu-utils/2005-08/msg00040.html
-http://lists.gnu.org/archive/html/bug-gnu-utils/2005-08/msg00047.html
-
---- gawk/io.c
-+++ gawk/io.c
-@@ -2480,9 +2480,12 @@
- {
- 	struct stat sbuf;
- 	struct open_hook *oh;
-+	int iop_malloced = FALSE;
- 
--	if (iop == NULL)
-+	if (iop == NULL) {
- 		emalloc(iop, IOBUF *, sizeof(IOBUF), "iop_alloc");
-+		iop_malloced = TRUE;
-+	}
- 	memset(iop, '\0', sizeof(IOBUF));
- 	iop->flag = 0;
- 	iop->fd = fd;
-@@ -2495,7 +2498,8 @@
- 	}
- 
- 	if (iop->fd == INVALID_HANDLE) {
--		free(iop);
-+		if (iop_malloced)
-+			free(iop);
- 		return NULL;
- 	}
- 	if (isatty(iop->fd))
diff --git a/package/gawk/gawk-3.1.5-gcc4.patch b/package/gawk/gawk-3.1.5-gcc4.patch
deleted file mode 100644
index 3ebadcb..0000000
--- a/package/gawk/gawk-3.1.5-gcc4.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Sat Sep  3 16:03:25 EDT 2005  Kito Danya Dietrich  <kito@gentoo.org>
-
-	* hard-locale.h (hard_locale): Declare xmalloc in global scope rather than
-	function scope which gcc-4.x rejects.
-
---- gawk-3.1.5/hard-locale.h
-+++ gawk-3.1.5/hard-locale.h
-@@ -21,6 +21,7 @@
-    along with this program; if not, write to the Free Software Foundation,
-    Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
- 
-+static ptr_t xmalloc PARAMS ((size_t n));
- 
- /* Return nonzero if the current CATEGORY locale is hard, i.e. if you
-    can't get away with assuming traditional C or POSIX behavior.  */
-@@ -40,7 +41,6 @@
-       if (strcmp (p, "C") == 0 || strcmp (p, "POSIX") == 0)
- 	hard = 0;
- # else
--      static ptr_t xmalloc PARAMS ((size_t n));
- 
-       char *locale = xmalloc (strlen (p) + 1);
-       strcpy (locale, p);
diff --git a/package/gawk/gawk-no-versioned.patch b/package/gawk/gawk-no-versioned.patch
new file mode 100644
index 0000000..6f74f52
--- /dev/null
+++ b/package/gawk/gawk-no-versioned.patch
@@ -0,0 +1,49 @@
+From 9cb7ff17dd7f81589f0891413efa5d4aec1a1598 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 7 Jun 2010 11:33:50 -0300
+Subject: [PATCH] Disabled versioned installation to save space and use symlinks where it's appropiate
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.in     |    3 ++-
+ doc/Makefile.in |    2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index f946ee1..a3d467a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -392,7 +392,7 @@ CLEANFILES = core core.*
+ MAINTAINERCLEANFILES = version.c
+ 
+ # We want hard links for install-exec-hook, below
+-LN = ln
++LN = $(LN_S)
+ all: config.h
+ 	$(MAKE) $(AM_MAKEFLAGS) all-recursive
+ 
+@@ -993,6 +993,7 @@ uninstall-am: uninstall-binPROGRAMS
+ # (This is done universally, which may not always be right, but
+ # there's no easy way to distinguish GNU from non-GNU systems.)
+ install-exec-hook:
++foo:
+ 	(cd $(DESTDIR)$(bindir); \
+ 	$(LN) gawk$(EXEEXT) gawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
+ 	$(LN) pgawk$(EXEEXT) pgawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index b1533e7..8b91694 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -272,7 +272,7 @@ AWKCARD = awkcard.ps
+ # make pgawk.1 a link to gawk.1 in the installed man directory.
+ 
+ # We want hard links for install-data-hook, below
+-LN = ln
++LN = $(LN_S)
+ all: all-am
+ 
+ .SUFFIXES:
+-- 
+1.6.4.4
+
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 4dd1085..35c487c 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -3,75 +3,22 @@
 # gawk
 #
 #############################################################
-GAWK_VERSION:=3.1.5
-GAWK_SOURCE:=gawk-$(GAWK_VERSION).tar.bz2
-GAWK_SITE:=$(BR2_GNU_MIRROR)/gawk
-GAWK_CAT:=$(BZCAT)
-GAWK_DIR:=$(BUILD_DIR)/gawk-$(GAWK_VERSION)
-GAWK_BINARY:=gawk
-GAWK_TARGET_BINARY:=usr/bin/gawk
 
-$(DL_DIR)/$(GAWK_SOURCE):
-	 $(call DOWNLOAD,$(GAWK_SITE),$(GAWK_SOURCE))
+GAWK_VERSION = 3.1.8
+GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
+GAWK_TARGET_BINS = awk gawk igawk pgawk
 
-gawk-source: $(DL_DIR)/$(GAWK_SOURCE)
+$(eval $(call AUTOTARGETS,package,gawk))
 
-$(GAWK_DIR)/.unpacked: $(DL_DIR)/$(GAWK_SOURCE)
-	$(GAWK_CAT) $(DL_DIR)/$(GAWK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GAWK_DIR) package/gawk gawk\*.patch
-	$(CONFIG_UPDATE) $(GAWK_DIR)
+$(GAWK_HOOK_POST_INSTALL): $(GAWK_TARGET_INSTALL_TARGET)
+	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
 	touch $@
 
-$(GAWK_DIR)/.configured: $(GAWK_DIR)/.unpacked
-	(cd $(GAWK_DIR); rm -rf config.cache; autoconf; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_getpgrp_void=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(GAWK_DIR)/$(GAWK_BINARY): $(GAWK_DIR)/.configured
-	$(MAKE) -C $(GAWK_DIR)
-
-$(TARGET_DIR)/$(GAWK_TARGET_BINARY): $(GAWK_DIR)/$(GAWK_BINARY)
-	rm -f $(TARGET_DIR)/usr/bin/awk
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GAWK_DIR) install
-	rm -f $(TARGET_DIR)/usr/bin/gawk-*
-	(cd $(TARGET_DIR)/usr/bin; ln -snf gawk awk)
-	$(STRIPCMD) $(TARGET_DIR)/usr/lib/awk/* > /dev/null 2>&1
-	rm -rf $(TARGET_DIR)/share/locale
-
-gawk: $(TARGET_DIR)/$(GAWK_TARGET_BINARY)
-
-gawk-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GAWK_DIR) uninstall
-	-$(MAKE) -C $(GAWK_DIR) clean
-
-gawk-dirclean:
-	rm -rf $(GAWK_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GAWK),y)
-TARGETS+=gawk
-endif
+$(GAWK_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GAWK_TARGET_BINS))
+	rm -f $(TARGET_DIR)/usr/share/info/gawk*.info
+	rm -f $(TARGET_DIR)/usr/share/man/man*/*gawk.1
+	rm -rf $(TARGET_DIR)/usr/libexec/awk
+	rm -rf $(TARGET_DIR)/usr/share/awk
+	rm -f $(GAWK_TARGET_INSTALL_TARGET) $(GAWK_HOOK_POST_INSTALL)
-- 
1.6.3.3
