From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 11:46:26 +0200
Subject: [Buildroot] [git commit] prosody: refactor with PROSODY_CONF_OPTS
	variable
Message-ID: <20171021093917.C9B737FE4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=918e5a45c0edc3f8279720903ee767dcf5148951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: keep TARGET_CONFIGURE_OPTS in the environment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/prosody/prosody.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index f7a325b..b98748e 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -18,16 +18,19 @@ ifeq ($(BR2_PACKAGE_LUAJIT),y)
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
 	cd $(@D) && \
 		$(TARGET_CONFIGURE_OPTS) \
-		./configure --prefix=/usr \
-		--c-compiler=$(TARGET_CC) \
-		--cflags="$(TARGET_CFLAGS)" \
-		--linker=$(TARGET_CC) \
-		--ldflags="$(TARGET_LDFLAGS) -shared" \
-		--sysconfdir=/etc/prosody \
-		--with-lua=$(STAGING_DIR)/usr
+		./configure $(PROSODY_CONF_OPTS)
 endef
 
 define PROSODY_BUILD_CMDS
