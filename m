From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 23:49:03 +0100
Subject: [Buildroot] [git commit] package/minizip: fix build without openssl
Message-ID: <20201225223201.2C40B82A96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a71be469ae191f1a67963956d6c0f17fee6d1db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable PKWARE traditional and WinZIP AES encryption without openssl to
avoid the following build failure due to MZ_FETCH_LIBS being set to OFF
since commit f9d31de3b7585e3521aafe2089fcff79bf7f037d

Fixes:
 - http://autobuild.buildroot.org/results/ae16497bf56df9ce4be97651b5ce65f75bdf909f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
