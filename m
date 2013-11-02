From: Stanislav Vasic <svlasic@gmail.com>
Date: Sat,  2 Nov 2013 22:37:16 +0100
Subject: [Buildroot] [PATCH 1/1] Option to copy Linaro gconv libs to target
Message-ID: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an option for external Linaro toolchains
which allows buildroot to copy gconv libs to target.

Also exports GCONV_PATH if folder exists on target.
That is needed because some programs (eg. XBMC) dont
see gconv libs if GCONV_PATH is not exported.

Signed-off-by: Stanislav Vasic <svlasic@gmail.com>
---
 system/skeleton/etc/profile                        |  6 ++++++
 toolchain/helpers.mk                               | 12 ++++++++++++
 toolchain/toolchain-external/Config.in             |  6 ++++++
 toolchain/toolchain-external/toolchain-external.mk |  4 ++++
 4 files changed, 28 insertions(+)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 31d3180..d7fef65 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -8,6 +8,12 @@ export PATH=\
 /usr/bin/X11:\
 /usr/local/bin
 
+# If gconv folder exists, export GCONV_PATH
+
+if [ -d /usr/lib/gconv ]; then
+    export GCONV_PATH = /usr/lib/gconv
+fi
+
 # If running interactively, then:
 if [ "$PS1" ]; then
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index a8944ce..a778cef 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -83,6 +83,18 @@ copy_toolchain_lib_root = \
  \
 	echo -n
 
+# Function for Linaro toolchains (EABIhf) that copies gconv libs to target
+# Expects 1 param:
+# $1: toolchain root
+copy_toolchain_gconv = \
+    BASE_DIR="$(strip $1)"; \
+    if [ -d $${BASE_DIR}usr/lib/arm-linux-gnueabihf/gconv ] ; then \
+	mkdir -p $(TARGET_DIR)/usr/lib/gconv ; \
+	cp -r $${BASE_DIR}usr/lib/arm-linux-gnueabihf/gconv/* $(TARGET_DIR)/usr/lib/gconv ; \
+    fi; \
+ \
+    echo -n
+
 #
 # Copy the full external toolchain sysroot directory to the staging
 # dir. The operation of this function is rendered a little bit
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 48b5865..fc328b1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -864,6 +864,12 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 	bool
 	select BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_GCONV
+	bool "Copy GCONV libraries to target"
+	depends on BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07 \
+	    || BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08 \
+	    || BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d41cc7c..c1a3dc7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -496,6 +496,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 			echo "Could not find gdbserver in external toolchain" ; \
 			exit 1 ; \
 		fi ; \
+	fi; \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_LINARO_GCONV)" = "y" ; then \
+		$(call MESSAGE,"Copying external toolchain gconv to target...") ; \
+		$(call copy_toolchain_gconv,$${SYSROOT_DIR}) ; \
 	fi
 endef
 
-- 
1.8.3.2
