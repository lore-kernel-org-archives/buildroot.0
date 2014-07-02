From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 23:51:56 +0200
Subject: [Buildroot] [git commit] pkg-infra: move the svn download helper to
	a script
Message-ID: <20140702220913.DFCD59D091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daf034f881dbbb15188da16d17aa1c8085b6e9cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maintaining the download helpers in the Makefile has proved to be a bit
complex, so move it to a shell script.

[Peter: redirect pushd/popd output to /dev/null]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk |    9 +++------
 support/download/svn    |   25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c848f6a..e823f68 100644
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
-	$(SVN) export $($(PKG)_SITE)@$($(PKG)_DL_VERSION) $($(PKG)_DL_DIR) && \
-	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(EXTRA_ENV) support/download/svn $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
+					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 define SOURCE_CHECK_SVN
diff --git a/support/download/svn b/support/download/svn
new file mode 100755
index 0000000..142a8d8
--- /dev/null
+++ b/support/download/svn
@@ -0,0 +1,25 @@
+#!/bin/bash
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
+pushd "${BR2_DL_DIR}" >/dev/null
+${SVN} export "${repo}@${rev}" "${basename}"
+tar czf "${output}" "${basename}"
+rm -rf "${basename}"
+popd >/dev/null
