From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Jul 2018 21:53:03 +0300
Subject: [Buildroot] [PATCH 1/2] bind: fix build with openssl
Message-ID: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bind configure.in uses AC_TRY_RUN that is not compatible with cross
compile. Disable eddsa unconditionally since it requires a newer OpenSSL
version than we currently have. Enable aes; this is always supported in
current OpenSSL versions.

Fixes:
http://autobuild.buildroot.net/results/3ed/3edb1659954b00401b68ffc7e1c8b3c29581c0e4/
http://autobuild.buildroot.net/results/025/025e377b51b39ba34647636ad0d0661a3cb95572/
http://autobuild.buildroot.net/results/725/7250564e780e43e793ae6c8c526985e5519681f4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bind/bind.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c4429ef6cc7f..e71eddcd7f00 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -61,7 +61,9 @@ BIND_CONF_ENV += \
 	ac_cv_func_EVP_sha512=yes
 BIND_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
-	--with-ecdsa=yes
+	--with-ecdsa=yes \
+	--with-eddsa=no \
+	--with-aes=yes
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 BIND_CONF_OPTS += --with-gost=yes
-- 
2.18.0
