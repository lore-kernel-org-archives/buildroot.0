From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:03:40 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] stunnel: fix static link
Message-ID: <20170226210414.0295B82226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd7e3cb079829dd94a89d787264170fe099aca96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

zlib is a dependency of OpenSSL. Take that into account when linking
statically.

Fixes:
http://autobuild.buildroot.net/results/dfe/dfe7c82c7976912378e33e03ea4c677bee6a778d/
http://autobuild.buildroot.net/results/48c/48cb55428613e91abfe8e71456182082d9eabb75/
http://autobuild.buildroot.net/results/810/81029efad8b9e2f48c26a7b20f62c90844fc86df/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b575baeb1ad787dac1ce31343adfd6ee3415ca41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 5e35d67..f98e7b5 100644
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
 
