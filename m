From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 00:15:02 +0200
Subject: [Buildroot] [PATCH 2/7 v4] package infra: do not check hashes when
	downloading from a repository
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <b172905fe4ddd1944cc14df21cc33d527c755a80.1427840060.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When downloading from a repository, we have no way to ensure the
reproducibility of the generated archives, so we can't check the hashes.

Do not specifiy a hash file in those cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v2 -> v3:
  - add blurb in the manual  (Arnout)
---
 docs/manual/adding-packages-directory.txt | 6 ++++++
 package/pkg-download.mk                   | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1ce9a3b..132c702 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -474,4 +474,10 @@ environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
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
-- 
1.9.1
