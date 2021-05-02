From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 12:50:37 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libtomcrypt: add pkgconfig
 support
Message-ID: <20210502105038.19483-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use libtomcrypt provided libtomcrypt.pc.in template file
---
 package/libtomcrypt/libtomcrypt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index fccd4b051c..3d166a6854 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -27,6 +27,10 @@ define LIBTOMCRYPT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
 		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
 		INSTALL_GROUP=$(shell id -g) install
+	sed -e 's,^prefix=.*,prefix=/usr,' \
+		-e 's,^Version:.*,Version: $(LIBTOMCRYPT_VERSION),' \
+		$(@D)/libtomcrypt.pc.in \
+		> $(STAGING_DIR)/usr/lib/pkgconfig/libtomcrypt.pc
 endef
 
 $(eval $(generic-package))
-- 
2.31.1
