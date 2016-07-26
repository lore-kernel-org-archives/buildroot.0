From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 26 Jul 2016 10:21:26 +0200
Subject: [Buildroot] [PATCH v3 2/6] pkg-download: Allow packages to pass
	generic options to download methods
In-Reply-To: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1469521290-20446-3-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a new package variable $(PKG)_DL_OPTS. When this variable
is defined, its value is passed to the downloader as options to
the underlying command. Packages can now retrieve archives from server
expecting logins and passwords, use referer url, proxy or specific
options for cloning a repository.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---

Changes in v2:
 - Replaced $(PKG)_DL_REFERER by $(PKG)_DL_OPTS
 - Add support for this options to all downloaders

 package/pkg-download.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a0f694d..00fbe6c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -80,7 +80,8 @@ define DOWNLOAD_GIT
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
@@ -96,7 +97,8 @@ define DOWNLOAD_BZR
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_BZR
@@ -111,7 +113,8 @@ define DOWNLOAD_CVS
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_RAWNAME) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # Not all CVS servers support ls/rls, use login to see if we can connect
@@ -126,7 +129,8 @@ define DOWNLOAD_SVN
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_SVN
@@ -142,7 +146,8 @@ define DOWNLOAD_SCP
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call stripurischeme,$(call qstrip,$(1)))'
+		'$(call stripurischeme,$(call qstrip,$(1)))' \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_SCP
@@ -156,7 +161,8 @@ define DOWNLOAD_HG
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$($(PKG)_DL_OPTS)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
@@ -171,7 +177,8 @@ define DOWNLOAD_WGET
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call qstrip,$(1))'
+		'$(call qstrip,$(1))' \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_WGET
@@ -184,7 +191,8 @@ define DOWNLOAD_LOCALFILES
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		$(call stripurischeme,$(call qstrip,$(1)))
+		$(call stripurischeme,$(call qstrip,$(1))) \
+		$($(PKG)_DL_OPTS)
 endef
 
 define SOURCE_CHECK_LOCALFILES
-- 
2.8.1
