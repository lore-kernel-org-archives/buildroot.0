From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:59:01 +0200
Subject: [Buildroot] [git commit] pkg-download: Allow packages to pass
	generic options to download methods
Message-ID: <20160902142938.E3C437FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b34e0abc99b7346f71bbc99283ff7ffac34799
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce a new package variable $(PKG)_DL_OPTS. When this variable
is defined, its value is passed to the downloader as options to
the underlying command. Packages can now retrieve archives from server
expecting logins and passwords, use referer url, proxy or specific
options for cloning a repository.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 315203f..3b6561b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -81,7 +81,8 @@ define DOWNLOAD_GIT
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
@@ -97,7 +98,8 @@ define DOWNLOAD_BZR
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_BZR
@@ -112,7 +114,8 @@ define DOWNLOAD_CVS
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_RAWNAME) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # Not all CVS servers support ls/rls, use login to see if we can connect
@@ -127,7 +130,8 @@ define DOWNLOAD_SVN
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_SVN
@@ -143,7 +147,8 @@ define DOWNLOAD_SCP
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call stripurischeme,$(call qstrip,$(1)))'
+		'$(call stripurischeme,$(call qstrip,$(1)))' \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_SCP
@@ -157,7 +162,8 @@ define DOWNLOAD_HG
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
@@ -172,7 +178,8 @@ define DOWNLOAD_WGET
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call qstrip,$(1))'
+		'$(call qstrip,$(1))' \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_WGET
@@ -185,7 +192,8 @@ define DOWNLOAD_LOCALFILES
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		$(call stripurischeme,$(call qstrip,$(1)))
+		$(call stripurischeme,$(call qstrip,$(1))) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_LOCALFILES
