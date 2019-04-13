From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:15:42 +0200
Subject: [Buildroot] [git commit] package/bind: drop unneeded static openssl
 workarounds
Message-ID: <20190413191128.2E54A83F9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=459dd99f02606425812402f593e12360af428eed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bind can't be built statically since commit
6045904752b06a8b8e52ba8fc2e49a8548964e8d

So drop uneeded LIBS="-lz" which was added by commit
80ebf12906afc3a1e5f4e5682d4c5dc0779a556a to fix static build with
openssl

Also, drop ac_cv_func_EVP_{sha256,sha384,sha512} that was also added to
fix tests in static build by commit
26aefa672c96caefc17adf59a9ab3d327114ad36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 572eacd11a..b2bbafab20 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -55,12 +55,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 BIND_DEPENDENCIES += openssl
-BIND_CONF_ENV += \
-	ac_cv_func_EVP_sha256=yes \
-	ac_cv_func_EVP_sha384=yes \
-	ac_cv_func_EVP_sha512=yes
 BIND_CONF_OPTS += \
-	--with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
+	--with-openssl=$(STAGING_DIR)/usr \
 	--with-ecdsa=yes \
 	--with-eddsa=no \
 	--with-aes=yes
