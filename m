From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Mar 2014 22:47:12 +0100
Subject: [Buildroot] [PATCH 07/12] pkg-infra: move the wget download helper
	to a script
In-Reply-To: <cover.1394055621.git.yann.morin.1998@free.fr>
References: <cover.1394055621.git.yann.morin.1998@free.fr>
Message-ID: <f678d624825dfb97e50f75d3003afa527f65d3f3.1394055621.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-download.mk |  6 ++----
 support/download/wget   | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100755 support/download/wget

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 36dcfac..c94ecba 100644
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
@@ -183,9 +183,7 @@ endef
 # the next time the download is tried.
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
1.8.3.2
