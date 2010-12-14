From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 14 Dec 2010 13:29:01 +0800
Subject: [Buildroot] [PATCH] buildroot:download: Add option to download SVN
	or GIT repository with version control information.
Message-ID: <1292304542-29813-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Current DOWNLOAD_SVN and DOWNLOAD_GIT scripts only retrieve source code of a
given version from the repository. It is more complicated to generate patches
against the source after fixing bugs and developing in buildroot directly.
This patch adds an option BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT to checkout the
source with version control information. This option is disabled by default.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 Config.in                   |    7 +++++++
 package/Makefile.package.in |   20 ++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index c90de77..7fa2aba 100644
--- a/Config.in
+++ b/Config.in
@@ -154,6 +154,13 @@ config BR2_DEBUG_MUDFLAP
 	  Your GCC must be new enough to support this option.
 endif
 
+config BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT
+	bool "check out source with git or svn revision information"
+	default n
+	help
+	  If y, check out the source from git or svn repository with
+	  revision information and store in the source tar ball.
+
 choice
 	prompt "strip"
 	default BR2_STRIP_strip
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 9f876b9..d72e32d 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -100,15 +100,22 @@ endif
 # source repositories, producing a list of all the "external dependencies" of
 # a given build configuration.
 ################################################################################
-
 define DOWNLOAD_GIT
+	if [ $(BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT) = "y" ] ; then \
+		GITCMD="checkout -b $($(PKG)_BRANCH) $($(PKG)_DL_VERSION)" ; \
+		GITTAR="$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ &&" ; \
+	else \
+		GITCMD="archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
+			gzip -c > $(DL_DIR)/$($(PKG)_SOURCE)" ; \
+		GITTAR= ; \
+	fi ; \
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
 	$(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
-	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	$(GIT) $$GITCMD && \
 	popd > /dev/null && \
+	$$GITTAR \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
@@ -125,9 +132,14 @@ endef
 
 
 define DOWNLOAD_SVN
+	if [ $(BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT) = "y" ] ; then \
+		SVNCMD=checkout ; \
+	else \
+		SVNCMD=export ; \
+	fi ; \
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(SVN) $$SVNCMD -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
-- 
1.6.0
