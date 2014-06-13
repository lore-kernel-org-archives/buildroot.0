From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:11:43 +0200
Subject: [Buildroot] [PATCH 09/14] pkg-infra: move the scp download helper
	to a script
In-Reply-To: <cover.1402700788.git.yann.morin.1998@free.fr>
References: <cover.1402700788.git.yann.morin.1998@free.fr>
Message-ID: <c78e7d5b05b0174225f8b36aaabe4f7212716f78.1402700788.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  5 +++--
 support/download/scp    | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100755 support/download/scp

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e0dda39..33cab27 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -14,7 +14,7 @@ export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
-SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
+export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
@@ -147,7 +147,8 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
+	$(EXTRA_ENV) support/download/scp '$(call stripurischeme,$(call qstrip,$(1)))' \
+					  $(DL_DIR)/$(2)
 endef
 
 define SOURCE_CHECK_SCP
diff --git a/support/download/scp b/support/download/scp
new file mode 100755
index 0000000..9f8a4f0
--- /dev/null
+++ b/support/download/scp
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for scp
+# Call it with:
+#   $1: URL
+#   $2: output file
+# And this environment:
+#   SCP       : the scp command to call
+
+url="${1}"
+output="${2}"
+
+${SCP} "${url}" "${output}"
-- 
1.8.3.2
