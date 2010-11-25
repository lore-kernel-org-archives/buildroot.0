From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 25 Nov 2010 11:36:34 +0100
Subject: [Buildroot] [PATCH] package/Makefile.package.in: Added BZR download
	support
Message-ID: <1290681394-29453-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Makefile.package.in |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 816a013..f7e69e7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -123,6 +123,20 @@ define SHOW_EXTERNAL_DEPS_GIT
 endef
 
 
+define DOWNLOAD_BZR
+	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
+	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
+endef
+
+define SOURCE_CHECK_BZR
+	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
+endef
+
+define SHOW_EXTERNAL_DEPS_BZR
+	echo "$($(PKG)_SITE) [bzr: $($(PKG)_DL_VERSION)]"
+endef
+
+
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
@@ -175,6 +189,7 @@ define DOWNLOAD
 		case "$($(PKG)_SITE_METHOD)" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
+			bzr) $($(DL_MODE)_BZR) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.1
