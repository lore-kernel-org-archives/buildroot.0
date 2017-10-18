From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Oct 2017 18:46:48 +0200
Subject: [Buildroot] [V2 1/3] prosody: refactor with PROSODY_CONF_OPTS
	variable
Message-ID: <20171018164650.514-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.mk | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index f7a325b46..5669f7707 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -18,16 +18,17 @@ ifeq ($(BR2_PACKAGE_LUAJIT),y)
 PROSODY_DEPENDENCIES += luajit
 endif
 
+PROSODY_CONF_OPTS = \
+	--with-lua=$(STAGING_DIR)/usr \
+	--c-compiler=$(TARGET_CC) \
+	--cflags="$(TARGET_CFLAGS)" \
+	--linker=$(TARGET_CC) \
+	--ldflags="$(TARGET_LDFLAGS) -shared" \
+	--sysconfdir=/etc/prosody \
+	--prefix=/usr
+
 define PROSODY_CONFIGURE_CMDS
-	cd $(@D) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure --prefix=/usr \
-		--c-compiler=$(TARGET_CC) \
-		--cflags="$(TARGET_CFLAGS)" \
-		--linker=$(TARGET_CC) \
-		--ldflags="$(TARGET_LDFLAGS) -shared" \
-		--sysconfdir=/etc/prosody \
-		--with-lua=$(STAGING_DIR)/usr
+	cd $(@D) && ./configure $(PROSODY_CONF_OPTS)
 endef
 
 define PROSODY_BUILD_CMDS
-- 
2.11.0
