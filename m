From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  9 Mar 2015 17:24:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/samba4: remove
	SAMBA4_BUILD_PYC_FILES hook
In-Reply-To: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
References: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1425918264-1912-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is now handled by target-finalize.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/samba4/samba4.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 78d92ef..7b104fb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -122,16 +122,6 @@ define SAMBA4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-# Samba just installs .py files so the purge causes problems with some tools
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
-define SAMBA4_BUILD_PYC_FILES
-	PYTHONPATH="$(PYTHON_PATH)" \
-		$(HOST_DIR)/usr/bin/python -c "import compileall; \
-		compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/samba')"
-endef
-SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_BUILD_PYC_FILES
-endif
-
 ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),)
 SAMBA4_CONF_OPTS += --without-ad-dc
 endif
-- 
2.1.0
