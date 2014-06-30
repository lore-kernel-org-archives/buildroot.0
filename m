From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:21 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download helper
	to a script
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git download helper is getting a bit more complex. Fixing it in the
Makefile when it breaks (like the recent breakage with a non-existing
sha1-cset) proves to be challenging, to say the least.

Move it into a shell script in support/download/git, which will make
it much easier to read, maintain, fix and enhance in the future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 17 +++--------------
 support/download/git    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 14 deletions(-)
 create mode 100755 support/download/git

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e07fd1b..c848f6a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@ WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN := $(call qstrip,$(BR2_SVN))
 CVS := $(call qstrip,$(BR2_CVS))
 BZR := $(call qstrip,$(BR2_BZR))
-GIT := $(call qstrip,$(BR2_GIT))
+export GIT := $(call qstrip,$(BR2_GIT))
 HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
@@ -84,19 +84,8 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 # problems
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
-	 ((test "`git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION)`" && \
-	   echo "Doing shallow clone" && \
-	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
-	  (echo "Doing full clone" && \
-	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
-	pushd $($(PKG)_BASE_NAME) > /dev/null && \
-	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ -o $(DL_DIR)/.$($(PKG)_SOURCE).tmp $($(PKG)_DL_VERSION) && \
-	gzip -c $(DL_DIR)/.$($(PKG)_SOURCE).tmp > $(DL_DIR)/$($(PKG)_SOURCE) && \
-	rm -f $(DL_DIR)/.$($(PKG)_SOURCE).tmp && \
-	popd > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	$(EXTRA_ENV) support/download/git $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
+					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/git b/support/download/git
new file mode 100755
index 0000000..96db3a9
--- /dev/null
+++ b/support/download/git
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+# We want to catch any command failure, and exit immediately
+set -e
+
+# Download helper for git
+# Call it with:
+#   $1: git repo
+#   $2: git cset
+#   $3: package's basename (eg. foobar-1.2.3)
+#   $4: output file
+# And this environment:
+#   BR2_DL_DIR: path to Buildroot's download dir
+#   GIT       : the git command to call
+
+repo="${1}"
+cset="${2}"
+basename="${3}"
+output="${4}"
+
+repodir="${BR2_DL_DIR}/${basename}"
+
+if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
+    printf "Doing shallow clone\n"
+    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"
+else
+    printf "Doing full clone\n"
+    ${GIT} clone --bare "${repo}" "${repodir}"
+fi
+
+pushd "${repodir}"
+${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
+gzip -c "${output}.tmp" >"${output}"
+rm -f "${output}.tmp"
+popd
+
+rm -rf "${repodir}"
-- 
1.9.1
