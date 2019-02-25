From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 25 Feb 2019 03:02:32 +0200
Subject: [Buildroot] [POC,
 ppsh-v7-work] make: Redirect logs per-package if per-package build
 is enabled
Message-ID: <20190225010232.8476-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There might a messy logs In case of parellel per-package build, so each
package will mix together it's logs on stdout, therefor needs some
approach to log output of each package into separate file.

Implemented approach which overrides 'SHELL' variable in the main
Makefile with a path to the 'support/shell_proxy' which duplicates
output from executed commands to the 'output/per-package/$(pkg)/build.log'
file, this path is specified from Makefile only if there is $PKG
variable defined.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 Makefile            |  1 +
 support/shell_proxy | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100755 support/shell_proxy

diff --git a/Makefile b/Makefile
index 25bd0d40d9..ff92009785 100644
--- a/Makefile
+++ b/Makefile
@@ -444,6 +444,7 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+SHELL = $(CURDIR)/support/shell_proxy $(if $(PKG),--redir=$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/build.log)
 HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
 TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
 else
diff --git a/support/shell_proxy b/support/shell_proxy
new file mode 100755
index 0000000000..a5068a1d5f
--- /dev/null
+++ b/support/shell_proxy
@@ -0,0 +1,19 @@
+#! /bin/sh
+
+shell="/bin/sh"
+
+if [ -x "$BASH" ]; then
+	shell=$BASH
+elif [ -x /bin/bash ]; then
+	shell=/bin/bash
+fi
+
+echo "$1" | grep -q 'redir'
+if [ $? -eq 0 ] ; then
+	redir_out=`echo $1 | awk -F'=' '{ print $2 }'`
+	mkdir -p `dirname $redir_out`
+	touch $redir_out
+	shift
+fi
+
+$shell "$@" | tee -a $redir_out
-- 
2.14.1
