From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:19:56 -0700
Subject: [Buildroot] [PATCH 1/4] ccache: bump to 3.1
Message-ID: <1285485599-29412-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 toolchain/ccache/ccache-3.1-cannot-find-ar.patch |   11 +++++++++++
 toolchain/ccache/ccache.mk                       |   17 +++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 toolchain/ccache/ccache-3.1-cannot-find-ar.patch

diff --git a/toolchain/ccache/ccache-3.1-cannot-find-ar.patch b/toolchain/ccache/ccache-3.1-cannot-find-ar.patch
new file mode 100644
index 0000000..a5b3b3f
--- /dev/null
+++ b/toolchain/ccache/ccache-3.1-cannot-find-ar.patch
@@ -0,0 +1,11 @@
+--- a/configure	2010-09-16 10:01:09.000000000 -0700
++++ b/configure	2010-09-23 20:14:34.000000000 -0700
+@@ -3347,7 +3347,7 @@ else
+   AR="$ac_cv_prog_AR"
+ fi
+ 
+-if test -z "$ac_ct_AR"; then
++if test -z "$AR"; then
+     as_fn_error "cannot find ar" "$LINENO" 5
+ fi
+ 
diff --git a/toolchain/ccache/ccache.mk b/toolchain/ccache/ccache.mk
index 01d18fb..1fe24fe 100644
--- a/toolchain/ccache/ccache.mk
+++ b/toolchain/ccache/ccache.mk
@@ -3,14 +3,14 @@
 # build ccache to make recompiles faster on the build system
 #
 #############################################################
-CCACHE_VER:=3.0.1
-CCACHE_SITE:=http://samba.org/ftp/ccache
-CCACHE_SOURCE:=ccache-$(CCACHE_VER).tar.gz
-CCACHE_DIR1:=$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)
-CCACHE_DIR2:=$(BUILD_DIR)/ccache-$(CCACHE_VER)
-CCACHE_CAT:=$(ZCAT)
-CCACHE_BINARY:=ccache
-CCACHE_TARGET_BINARY:=usr/bin/ccache
+CCACHE_VER = 3.1
+CCACHE_SITE = http://samba.org/ftp/ccache
+CCACHE_SOURCE = ccache-$(CCACHE_VER).tar.gz
+CCACHE_DIR1 = $(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)
+CCACHE_DIR2 = $(BUILD_DIR)/ccache-$(CCACHE_VER)
+CCACHE_CAT = $(ZCAT)
+CCACHE_BINARY = ccache
+CCACHE_TARGET_BINARY = usr/bin/ccache
 
 $(DL_DIR)/$(CCACHE_SOURCE):
 	$(call DOWNLOAD,$(CCACHE_SITE),$(CCACHE_SOURCE))
@@ -141,6 +141,7 @@ $(CCACHE_DIR2)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
 	touch $@
 
 $(CCACHE_DIR2)/.patched: $(CCACHE_DIR2)/.unpacked
+	toolchain/patch-kernel.sh $(CCACHE_DIR2) toolchain/ccache/ \*.patch
 	touch $@
 
 $(CCACHE_DIR2)/.configured: $(CCACHE_DIR2)/.patched
-- 
1.7.3
