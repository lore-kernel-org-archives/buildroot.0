From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 00:19:08 +0200
Subject: [Buildroot] [PATCH] libgcrypt: install libgcrypt-config in host
	directory
Message-ID: <1341958748-9024-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages depending on libgcrypt call libgcrypt-config to determine its
CFLAGS.  If libgcrypt-config happens to be installed on the host, this
will add /usr/include to the target include path.  So make sure
libgcrypt-config is in the host directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/libgcrypt/libgcrypt.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 68c6c47..2671819 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -17,4 +17,13 @@ LIBGCRYPT_CONF_OPT = \
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
+# libgcrypt doesn't use pkg-config but instead has its own
+# libgcrypt-config.  Install this in the host directory so
+# packages depending on libgcrypt can find it.
+define LIBGCRYPT_HOST_INSTALL_LIBGCRYPT_CONFIG
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/libgcrypt-config $(HOST_DIR)/usr/bin/libgcrypt-config
+endef
+
+LIBGCRYPT_POST_INSTALL_STAGING_HOOKS += LIBGCRYPT_HOST_INSTALL_LIBGCRYPT_CONFIG
+
 $(eval $(call AUTOTARGETS))
-- 
tg: (b8b57bb..) t/libgcrypt-config (depends on: master)
