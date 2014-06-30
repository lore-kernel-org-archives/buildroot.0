From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:26 +0200
Subject: [Buildroot] [PATCH 08/14] pkg-infra: move the bzr download helper
	to a script
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <7eb47398f146f3d4a0163a9fc02ee9e04297567a.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  4 ++--
 support/download/bzr    | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100755 support/download/bzr

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7554582..e420b05 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -11,7 +11,7 @@
 export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
-BZR := $(call qstrip,$(BR2_BZR))
+export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
@@ -101,7 +101,7 @@ endef
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
+	$(EXTRA_ENV) support/download/bzr $($(PKG)_SITE) $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 define SOURCE_CHECK_BZR
diff --git a/support/download/bzr b/support/download/bzr
new file mode 100755
index 0000000..68121f4
--- /dev/null
+++ b/support/download/bzr
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for bzr
+# Call it with:
+#   $1: bzr repo
+#   $2: bzr revision
+#   $3: output file
+# And this environment:
+#   BZR       : the bzr command to call
+#   BR2_DL_DIR: path to Buildroot's download dir
+
+repo="${1}"
+rev="${2}"
+output="${3}"
+
+${BZR} export "${output}" "${repo}" -r "${rev}"
-- 
1.9.1
