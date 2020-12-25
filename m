From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Dec 2020 23:13:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix build without openssl
Message-ID: <20201225221343.3822082-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable PKWARE traditional and WinZIP AES encryption without openssl to
avoid the following build failure due to MZ_FETCH_LIBS being set to OFF
since commit f9d31de3b7585e3521aafe2089fcff79bf7f037d

Fixes:
 - http://autobuild.buildroot.org/results/ae16497bf56df9ce4be97651b5ce65f75bdf909f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index e2abfd4f20..9e60bc2aab 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -38,9 +38,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MINIZIP_DEPENDENCIES += openssl
-MINIZIP_CONF_OPTS += -DMZ_OPENSSL=ON
+MINIZIP_CONF_OPTS += \
+	-DMZ_OPENSSL=ON \
+	-DMZ_PKCRYPT=ON \
+	-DMZ_WZAES=ON
 else
-MINIZIP_CONF_OPTS += -DMZ_OPENSSL=OFF
+MINIZIP_CONF_OPTS += \
+	-DMZ_OPENSSL=OFF \
+	-DMZ_PKCRYPT=OFF \
+	-DMZ_WZAES=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
-- 
2.29.2
