From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 13 Jul 2010 09:15:04 +0200
Subject: [Buildroot] [PATCH 4/4] Use the normal download method for
	libsvgtiny
In-Reply-To: <1279005304-8780-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1279005304-8780-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1279005304-8780-5-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the generic download method supports Subversion, fall back to
the normal usage of AUTOTARGETS for libsvgtiny.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 package/libsvgtiny/libsvgtiny.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index b559e52..00e8c7d 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -5,21 +5,13 @@
 ############################################################
 
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
+LIBSVGTINY_SITE_METHOD = svn
 LIBSVGTINY_VERSION = 9800
-LIBSVGTINY_SVNDIR = libsvgtiny-svn-r$(LIBSVGTINY_VERSION)
-LIBSVGTINY_SOURCE = $(LIBSVGTINY_SVNDIR).tar.bz2
+
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_INSTALL_TARGET = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkg-config
 
-$(DL_DIR)/$(LIBSVGTINY_SOURCE):
-	$(SVN_CO) -r $(LIBSVGTINY_VERSION) $(LIBSVGTINY_SITE) $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
-	tar -cv -C $(BUILD_DIR) $(LIBSVGTINY_SVNDIR) | bzip2 - -c > $@
-	rm -rf $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
-
-# use custom download step
-LIBSVGTINY_TARGET_SOURCE := $(DL_DIR)/$(LIBSVGTINY_SOURCE)
-
 define LIBSVGTINY_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
 endef
-- 
1.6.3.3.346.g8a41d
