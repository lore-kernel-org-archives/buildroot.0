From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:08:00 +0200
Subject: [Buildroot] [git commit] package infra: do not check hashes when
	downloading from a repository
Message-ID: <20150403120939.28D25819C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1286222597d960b31567d30acdc01932c1f37afe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When downloading from a repository, we have no way to ensure the
reproducibility of the generated archives, so we can't check the hashes.

Do not specifiy a hash file in those cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    6 ++++++
 package/pkg-download.mk                   |    5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1b34b41..01a1928 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -471,4 +471,10 @@ environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
 there is no hash for a downloaded file, Buildroot considers this an
 error, deletes the downloaded file, and aborts.
 
+Sources that are downloaded from a version control system (git, subversion,
+etc...) can not have a hash, because the version control system and tar
+may not create exactly the same file (dates, files ordering...), so the
+hash could be wrong even for a valid download. Therefore, the hash check
+is entirely skipped for such sources.
+
 If the +.hash+ file is missing, then no check is done at all.
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5e74519..e274712 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -87,7 +87,6 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -109,7 +108,6 @@ endef
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -128,7 +126,6 @@ endef
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
@@ -149,7 +146,6 @@ endef
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
@@ -189,7 +185,6 @@ endef
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
