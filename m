From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon,  2 May 2011 17:48:58 +0200
Subject: [Buildroot] [PATCH] scm: add mirror support
Message-ID: <1304351338-23388-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this will allow you to use scm mirror for git, bazaar or svn and then download
from their the source code. This is usefull specially when your are offline or
slow network and still want to use scm tree for package instead of tar.gz.
As example for HEAD/trunk build.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 Config.in                             |   26 ++++++++++++++++++++++
 package/Makefile.package.in           |   39 ++++++++++++++++++++++----------
 package/can-utils/can-utils.mk        |    3 +-
 package/libsvgtiny/libsvgtiny.mk      |    3 +-
 package/multimedia/mplayer/mplayer.mk |    3 +-
 package/multimedia/tremor/tremor.mk   |    3 +-
 package/sstrip/sstrip.mk              |    3 +-
 package/tslib/tslib.mk                |    3 +-
 package/vim/vim.mk                    |    3 +-
 9 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/Config.in b/Config.in
index a67c08d..9dc1952 100644
--- a/Config.in
+++ b/Config.in
@@ -149,6 +149,32 @@ config BR2_DEBIAN_MIRROR
 	  Usually, just add your country code like XX here:
 	  http://ftp.XX.debian.org
 
+comment "SCM Mirrors"
+
+config BR2_PRIMARY_BZR_MIRROR
+	string "Bazaar mirror"
+	default ""
+	help
+	  Primary bazaar site to download from. If this option is set then buildroot
+	  will try to fetch package source first from this site and try the
+	  default if not found.
+
+config BR2_PRIMARY_GIT_MIRROR
+	string "GIT mirror"
+	default ""
+	help
+	  Primary git site to download from. If this option is set then buildroot
+	  will try to fetch package source first from this site and try the
+	  default if not found.
+
+config BR2_PRIMARY_SVN_MIRROR
+	string "SVN mirror"
+	default ""
+	help
+	  Primary svn site to download from. If this option is set then buildroot
+	  will try to fetch package source first from this site and try the
+	  default if not found.
+
 endmenu
 
 config BR2_JLEVEL
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..f8d2cb7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -105,7 +105,7 @@ endif
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(GIT) clone --bare $(1)/$($(PKG)_TREE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
@@ -117,43 +117,43 @@ endef
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
 # repository
 define SOURCE_CHECK_GIT
-  $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
+  $(GIT) ls-remote --heads $(1)/$($(PKG)_TREE) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_GIT
-  echo "$($(PKG)_SITE) [git: $($(PKG)_DL_VERSION)]"
+  echo "$(1)/$($(PKG)_TREE) [git: $($(PKG)_DL_VERSION)]"
 endef
 
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
+	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $(1)/$($(PKG)_TREE) -r $($(PKG)_DL_VERSION)
 endef
 
 define SOURCE_CHECK_BZR
-	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
+	$(BZR) ls --quiet $(1)/$($(PKG)_TREE) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_BZR
-	echo "$($(PKG)_SITE) [bzr: $($(PKG)_DL_VERSION)]"
+	echo "$(1)/$($(PKG)_TREE) [bzr: $($(PKG)_DL_VERSION)]"
 endef
 
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(SVN) export -r $($(PKG)_DL_VERSION) $(1)/$($(PKG)_TREE) $($(PKG)_DL_DIR) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
 
 define SOURCE_CHECK_SVN
-  $(SVN) ls $($(PKG)_SITE) > /dev/null
+  $(SVN) ls $(1)/$($(PKG)_TREE) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_SVN
-  echo "$($(PKG)_SITE) [svn: $($(PKG)_DL_VERSION)]"
+  echo "$(1)/$($(PKG)_TREE) [svn: $($(PKG)_DL_VERSION)]"
 endef
 
 
@@ -189,9 +189,24 @@ define DOWNLOAD
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(DL_MODE)_GIT) && exit ;; \
-			svn) $($(DL_MODE)_SVN) && exit ;; \
-			bzr) $($(DL_MODE)_BZR) && exit ;; \
+			git) \
+				if test -n "$(call qstrip,$(BR2_PRIMARY_GIT_MIRROR))" ; then \
+					$(call $(DL_MODE)_GIT,$(BR2_PRIMARY_GIT_MIRROR)) && exit ; \
+				else \
+					$(call $(DL_MODE)_GIT,$($(PKG)_SITE)) && exit ; \
+				fi ;;\
+			svn) \
+				if test -n "$(call qstrip,$(BR2_PRIMARY_SVN_MIRROR))" ; then \
+					$(call $(DL_MODE)_SVN,$(BR2_PRIMARY_SVN_MIRROR)) && exit ; \
+				else \
+					$(call $(DL_MODE)_SVN,$($(PKG)_SITE)) && exit ; \
+				fi ;;\
+			bzr) \
+				if test -n "$(call qstrip,$(BR2_PRIMARY_BZR_MIRROR))" ; then \
+					$(call $(DL_MODE)_BZR,$(BR2_PRIMARY_BZR_MIRROR)) && exit ; \
+				else \
+					$(call $(DL_MODE)_BZR,$($(PKG)_SITE)) && exit ; \
+				fi ;;\
 			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index f602490..3fc5c12 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 CAN_UTILS_VERSION = 1235
-CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
+CAN_UTILS_TREE = can-utils
+CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk
 CAN_UTILS_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS,package,can-utils))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index d9ac41b..b95d60b 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,7 +4,8 @@
 #
 ############################################################
 
-LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
+LIBSVGTINY_TREE = libsvgtiny
+LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk
 LIBSVGTINY_VERSION = 9800
 
 LIBSVGTINY_INSTALL_STAGING = YES
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 7d45960..14db68d 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -6,7 +6,8 @@
 MPLAYER_VERSION = 32726
 # MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.bz2
 # MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
-MPLAYER_SITE = svn://svn.mplayerhq.hu/mplayer/trunk
+MPLAYER_TREE = mplayer/trunk
+MPLAYER_SITE = svn://svn.mplayerhq.hu
 
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index 654a403..21fc4ab 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -4,7 +4,8 @@
 #
 ############################################################
 
-TREMOR_SITE:=http://svn.xiph.org/trunk/Tremor/
+TREMOR_TREE = Tremor
+TREMOR_SITE:=http://svn.xiph.org/trunk
 TREMOR_SITE_METHOD:=svn
 TREMOR_VERSION:=16259
 
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index 2dc383d..318ea4e 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -4,7 +4,8 @@
 #
 ############################################################
 
-SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
+SSTRIP_TREE = tools/sstrip
+SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk
 SSTRIP_VERSION = 20154
 HOST_SSTRIP_BINARY = $(REAL_GNU_TARGET_NAME)-sstrip
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index ef77dac..9dbd1ef 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,8 @@
 #
 #############################################################
 TSLIB_VERSION:=412d99d8b92c
-TSLIB_SITE:=git://github.com/kergoth/tslib.git
+TSLIB_TREE = tslib.git
+TSLIB_SITE = git://github.com/kergoth/
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_TARGET = YES
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 917d1d4..ee37fbb 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 # svn r1889 == 7.2 release + patchlevel 446
-VIM_SITE = https://vim.svn.sourceforge.net/svnroot/vim/branches/vim7.2
+VIM_TREE = vim7.2
+VIM_SITE = https://vim.svn.sourceforge.net/svnroot/vim/branches
 VIM_SITE_METHOD = svn
 VIM_VERSION = 1889
 VIM_DEPENDENCIES = ncurses
-- 
1.7.4.1
