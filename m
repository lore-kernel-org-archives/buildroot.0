From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 24 Dec 2016 21:10:42 +0200
Subject: [Buildroot] [PATCH] stunnel: fix static link
Message-ID: <ca7b0588b4175ace369af46ded807fd088ae310f.1482606642.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is a dependency of OpenSSL. Take that into account when linking
statically.

Fixes:
http://autobuild.buildroot.net/results/dfe/dfe7c82c7976912378e33e03ea4c677bee6a778d/
http://autobuild.buildroot.net/results/48c/48cb55428613e91abfe8e71456182082d9eabb75/
http://autobuild.buildroot.net/results/810/81029efad8b9e2f48c26a7b20f62c90844fc86df/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stunnel/stunnel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 5e35d672683b..f98e7b59eb2a 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -11,7 +11,8 @@ STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
 STUNNEL_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
+	LIBS=$(if $(BR2_STATIC_LIBS),-lz)
 STUNNEL_LICENSE = GPLv2+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
-- 
2.11.0
