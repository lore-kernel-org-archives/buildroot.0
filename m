From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:31 +0100
Subject: [Buildroot] [PATCH v6 09/28] package/quazip: Convert to qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-10-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to use correct staging path as prefix after switching to qmake infra,
because the qmake infra no longer overwrites the built in install pathes.

Otherwise the build breaks when the install steps are trying to copy to /usr.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/quazip/quazip.mk | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 53042f6c4c..35cf8adafd 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -13,20 +13,6 @@ QUAZIP_DEPENDENCIES = \
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 
-define QUAZIP_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
+QUAZIP_CONF_OPTS = PREFIX=$(STAGING_DIR)/usr
 
-define QUAZIP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QUAZIP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
-endef
-
-define QUAZIP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
