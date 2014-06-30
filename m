From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:25 +0200
Subject: [Buildroot] [PATCH 07/14] pkg-infra: move the wget download helper
	to a script
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <5b7f846b8d3e7f210a95a7a8e1bee0f625eef326.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-download.mk | 13 +++----------
 support/download/wget   | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 10 deletions(-)
 create mode 100755 support/download/wget

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 3290b6b..7554582 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,7 +8,7 @@
 ################################################################################
 
 # Download method commands
-WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
@@ -175,17 +175,10 @@ define SHOW_EXTERNAL_DEPS_HG
   echo $($(PKG)_SOURCE)
 endef
 
-# Download a file using wget. Only download the file if it doesn't
-# already exist in the download directory. If the download fails,
-# remove the file (because wget -O creates a 0-byte file even if the
-# download fails).  To handle an interrupted download as well, download
-# to a temporary file first.  The temporary file will be overwritten
-# the next time the download is tried.
+
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' && \
-	 mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
-	(rm -f $(DL_DIR)/$(2).tmp ; exit 1)
+	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2)
 endef
 
 define SOURCE_CHECK_WGET
diff --git a/support/download/wget b/support/download/wget
new file mode 100755
index 0000000..7865517
--- /dev/null
+++ b/support/download/wget
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for wget
+# Call it with:
+#   $1: URL
+#   $2: output file
+# And this environment:
+#   WGET      : the wget command to call
+
+url="${1}"
+output="${2}"
+
+if ${WGET} -O "${output}.tmp" "${url}"; then
+    mv "${output}.tmp" "${output}"
+else
+    rm -f "${output}.tmp"
+    exit 1
+fi
-- 
1.9.1
