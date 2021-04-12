From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Apr 2021 21:55:25 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/libtomcrypt: add pkgconfig
 support
Message-ID: <20210412195527.9282-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libtomcrypt/libtomcrypt.mk    |  3 +++
 package/libtomcrypt/libtomcrypt.pc.in | 10 ++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 package/libtomcrypt/libtomcrypt.pc.in

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index fccd4b051c..fa6dde64cd 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -27,6 +27,9 @@ define LIBTOMCRYPT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
 		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
 		INSTALL_GROUP=$(shell id -g) install
+	$(INSTALL) -D -m 0644 package/libtomcrypt/libtomcrypt.pc.in \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libtomcrypt.pc
+	$(SED) "s/@PACKAGE_VERSION@/${LIBTOMCRYPT_VERSION}/" $(STAGING_DIR)/usr/lib/pkgconfig/libtomcrypt.pc
 endef
 
 $(eval $(generic-package))
diff --git a/package/libtomcrypt/libtomcrypt.pc.in b/package/libtomcrypt/libtomcrypt.pc.in
new file mode 100644
index 0000000000..14a010e216
--- /dev/null
+++ b/package/libtomcrypt/libtomcrypt.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: LibTomCrypt
+Description: public domain open source cryptographic toolkit
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -ltomcrypt
+Cflags: -I${includedir}
-- 
2.31.1
