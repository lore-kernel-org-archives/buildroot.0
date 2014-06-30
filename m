From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:23 +0200
Subject: [Buildroot] [PATCH 05/14] pkg-infra: move the cvs download helper
	to a script
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <9eb781417281d608c4a71700a48a7e1d7f5e2474.1404167061.git.yann.morin.1998@free.fr>
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
 package/pkg-download.mk | 11 ++++-------
 support/download/cvs    | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100755 support/download/cvs

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e823f68..9f3afac 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -10,7 +10,7 @@
 # Download method commands
 WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 export SVN := $(call qstrip,$(BR2_SVN))
-CVS := $(call qstrip,$(BR2_CVS))
+export CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 HG := $(call qstrip,$(BR2_HG)) $(QUIET)
@@ -114,12 +114,9 @@ endef
 
 define DOWNLOAD_CVS
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
-	$(CVS) -z3 -d:pserver:anonymous@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-		co -d $($(PKG)_BASE_NAME) -r :$($(PKG)_DL_VERSION) -P $($(PKG)_RAWNAME) && \
-	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(EXTRA_ENV) support/download/cvs $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
+					  $($(PKG)_DL_VERSION) $($(PKG)_RAWNAME) \
+					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 # Not all CVS servers support ls/rls, use login to see if we can connect
diff --git a/support/download/cvs b/support/download/cvs
new file mode 100755
index 0000000..06b8647
--- /dev/null
+++ b/support/download/cvs
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for cvs
+# Call it with:
+#   $1: cvs repo
+#   $2: cvs revision
+#   $3: package's name (eg. foobar)
+#   $4: package's basename (eg. foobar-1.2.3)
+#   $5: output file
+# And this environment:
+#   CVS       : the cvs command to call
+#   BR2_DL_DIR: path to Buildroot's download dir
+
+repo="${1}"
+rev="${2}"
+rawname="${3}"
+basename="${4}"
+output="${5}"
+
+cd "${BR2_DL_DIR}"
+${CVS} -z3 -d":pserver:anonymous@${repo}" \
+       co -d "${basename}" -r ":${rev}" -P "${rawname}"
+tar czf "${output}" "${basename}"
+rm -rf "${basename}"
-- 
1.9.1
