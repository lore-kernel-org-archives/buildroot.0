From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Jun 2021 23:25:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: always disable tls_check
Message-ID: <20210609212503.1580411-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Always disable tls_check to avoid the following build failure since bump to
version 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:

../output-1/build/libsoup-2.72.0/meson.build:184:4: ERROR: Can not run test applications in this cross environment.

tls_check will run code since
https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c45253243a2deca4880d4f614f2932373445cf9

Fixes:
 - http://autobuild.buildroot.org/results/9e539dc7185cfb81f18438dd36357cb49ef23a5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsoup/libsoup.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2f63e9e85c..73c8c080c5 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -30,6 +30,7 @@ LIBSOUP_CONF_OPTS = \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
 	-Dtests=false \
+	-Dtls_check=false \
 	-Dvapi=disabled
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
@@ -54,8 +55,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
-else
-LIBSOUP_CONF_OPTS += -Dtls_check=false
 endif
 
 $(eval $(meson-package))
-- 
2.30.2
