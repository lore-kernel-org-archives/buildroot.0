From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 21:50:41 +0100
Subject: [Buildroot] [PATCH 01/10] toolchain/crosstool-NG: add dependencies
	on host- tools
In-Reply-To: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1290891050-18122-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depends on:
- GNU awk       --> host-gawk
- GNU automake  --> host-automake

Remove dependency on 'cvs'. cvs is used to retrieve newlib,
which is not supported under Buildroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/001-no-cvs.patch |   15 +++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk  |   10 +++++++++-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-ng/001-no-cvs.patch

diff --git a/toolchain/toolchain-crosstool-ng/001-no-cvs.patch b/toolchain/toolchain-crosstool-ng/001-no-cvs.patch
new file mode 100644
index 0000000..fd805d3
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/001-no-cvs.patch
@@ -0,0 +1,15 @@
+Remove dependency on cvs.
+
+cvs is used to retrieve newlib, which is not supported
+under Buildroot, so cvs is not required.
+
+--- crosstool-ng-1.8.0/configure.orig	2010-11-27 15:43:52.000000000 +0000
++++ crosstool-ng-1.8.0/configure	2010-11-27 15:44:10.000000000 +0000
+@@ -359,7 +359,6 @@
+              err="'libtool' 1.5.26 or above was not found"
+ has_or_abort prog=stat
+ has_or_abort prog="aria2c curl wget"
+-has_or_abort prog=cvs
+ has_or_abort prog=patch
+ has_or_abort prog=tar
+ has_or_abort prog=gzip
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 0812216..9a9f272 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -267,8 +267,16 @@ $(CTNG_DIR)/.patched: $(CTNG_DIR)/.unpacked
 	                              \*.patch.$(ARCH)
 	$(Q)touch $@
 
+# Use order-only dependencies on host-* as they
+# are virtual targets with no rules, and so are
+# considered always remade. But we do not want
+# to reconfigure and rebuild ct-ng every time
+# we need to run it...
+$(CTNG_DIR)/.configured: | host-gawk        \
+                           host-automake
+
 $(CTNG_DIR)/.configured: $(CTNG_DIR)/.patched
-	$(Q)cd $(CTNG_DIR) && ./configure --local
+	$(Q)cd $(CTNG_DIR) && PATH=$(HOST_PATH) ./configure --local
 	$(Q)touch $@
 
 $(CTNG_DIR)/ct-ng: $(CTNG_DIR)/.configured
-- 
1.7.1
