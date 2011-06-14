From: fabien.marteau at armadeus.com <fabien.marteau@armadeus.com>
Date: Tue, 14 Jun 2011 18:32:42 +0200
Subject: [Buildroot] [PATCH] Adding copy method for download.
In-Reply-To: <1308069162-7315-1-git-send-email-fabien.marteau@armadeus.com>
References: <1308069162-7315-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <1308069162-7315-2-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabien Marteau <fabien.marteau@armadeus.com>


Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
---
 package/Makefile.package.in |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..47672a9 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -73,6 +73,7 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN)) $(QUIET)
 BZR:=$(call qstrip,$(BR2_BZR)) $(QUIET)
 GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+COPY:=$(call qstrip,$(BR2_COPY)) $(QUIET)
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -170,6 +171,24 @@ define SHOW_EXTERNAL_DEPS_WGET
   echo $(2)
 endef
 
+define DOWNLOAD_COPY
+	pushd $(DL_DIR) > /dev/null && \
+	$(COPY) $($(PKG)_SITE) $($(PKG)_DL_DIR)/ && \
+	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
+	rm -rf $($(PKG)_DL_DIR) && \
+	popd > /dev/null
+endef
+
+define SOURCE_CHECK_COPY
+	test -e $($(PKG)_SITE)
+endef
+
+define SHOW_EXTERNAL_DEPS_COPY
+  echo $(2)
+endef
+
+
+
 ################################################################################
 # DOWNLOAD -- Download helper. Will try to download source from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -192,6 +211,7 @@ define DOWNLOAD
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			copy) $($(DL_MODE)_COPY) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
-- 
1.7.0.4
