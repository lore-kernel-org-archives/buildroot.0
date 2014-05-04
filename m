From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 May 2014 14:01:43 +0200
Subject: [Buildroot] [PATCH 04/11] pkg-infra: move the svn download helper
	to a script
In-Reply-To: <cover.1399204808.git.yann.morin.1998@free.fr>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
Message-ID: <02d97f2ab0b1229a0c1377eaf71caa8f346cfc0c.1399204808.git.yann.morin.1998@free.fr>
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
 package/pkg-download.mk |  9 +++------
 support/download/svn    | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100755 support/download/svn

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9603ea8..86c7bfe 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -9,7 +9,7 @@
 
 # Download method commands
 WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN := $(call qstrip,$(BR2_SVN))
+export SVN := $(call qstrip,$(BR2_SVN))
 CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
@@ -133,11 +133,8 @@ endef
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
-	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
-	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(EXTRA_ENV) support/download/svn $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
+					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 define SOURCE_CHECK_SVN
diff --git a/support/download/svn b/support/download/svn
new file mode 100755
index 0000000..c3ab32c
--- /dev/null
+++ b/support/download/svn
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for svn
+# Call it with:
+#   $1: svn repo
+#   $2: svn revision
+#   $3: package's basename (eg. foobar-1.2.3)
+#   $4: output file
+# And this environment:
+#   SVN       : the svn command to call
+#   BR2_DL_DIR: path to Buildroot's download dir
+
+repo="${1}"
+rev="${2}"
+basename="${3}"
+output="${4}"
+
+pushd "${BR2_DL_DIR}"
+${SVN} export -r "${rev}" "${repo}" "${basename}"
+tar czf "${output}" "${basename}"
+rm -rf "${basename}"
+popd
-- 
1.8.3.2
