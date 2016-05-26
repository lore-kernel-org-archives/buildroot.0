From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 22:08:36 +0200
Subject: [Buildroot] [git commit branch/next] samba4: remove compilation of
	.pyc files
Message-ID: <20160526200855.DF44B802E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfa73104fa8cc12925b56a482e7bd4b200f6be9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that .py files are globally compiled into .pyc files, we can get
rid of the samba4 specific logic doing this compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9ccc6a7..bb546f0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -118,16 +118,6 @@ define SAMBA4_INSTALL_TARGET_CMDS
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
