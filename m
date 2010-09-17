From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Fri, 17 Sep 2010 14:09:48 +0200
Subject: [Buildroot] [git commit master 1/1] Use the normal download method
	for libsvgtiny
Message-ID: <20100917121200.1DF2D8B3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9b2ac9f9acd915d8086f4e74c2be672aa83f0d70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the generic download method supports Subversion, fall back to
the normal usage of AUTOTARGETS for libsvgtiny.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvgtiny/libsvgtiny.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index b559e52..d9ac41b 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -6,20 +6,11 @@
 
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
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
1.7.1
