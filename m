From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:24 +0200
Subject: [Buildroot] [PATCH 06/14] pkg-infra: move the hg download helper to
	a script
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <a5aef17b7daaa8fd2aff97f646aa9b15094a5f97.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tested a particular scenario that used to fail, when the 'hg archive'
step is interrupted, now working fine]
---
 package/pkg-download.mk | 11 +++--------
 support/download/hg     | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 8 deletions(-)
 create mode 100755 support/download/hg

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9f3afac..3290b6b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -13,7 +13,7 @@ export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-HG := $(call qstrip,$(BR2_HG)) $(QUIET)
+export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
@@ -161,13 +161,8 @@ endef
 
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
-	rm -rf $($(PKG)_BASE_NAME) && \
-	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
-	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
-	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(EXTRA_ENV) support/download/hg $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
+					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/hg b/support/download/hg
new file mode 100755
index 0000000..70b49cf
--- /dev/null
+++ b/support/download/hg
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for hg
+# Call it with:
+#   $1: hg repo
+#   $2: hg cset
+#   $3: package's basename (eg. foobar-1.2.3)
+#   $4: output file
+# And this environment:
+#   HG        : the hg command to call
+#   BR2_DL_DIR: path to Buildroot's download dir
+
+repo="${1}"
+cset="${2}"
+basename="${3}"
+output="${4}"
+
+cd "${BR2_DL_DIR}"
+${HG} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
+${HG} archive --repository "${basename}" --type tgz --prefix "${basename}" \
+              --rev "${cset}" "${output}"
+rm -rf "${basename}"
-- 
1.9.1
