From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  9 Apr 2019 23:10:32 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix link failure due to
 missing OpenSSL dependency
Message-ID: <20190409211032.66320-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During linking one OpenSSL dependecy is missing(-latomic) on linking
library list.

- Substitute explicit library list with `pkg-config libssl` when
BR2_PACKAGE_OPENSSL is enabled. In such way all needed libraries will be
included in linking list.
- Add also `host-pkgconf` to CIVETWEB_DEPENDENCIES if
BR2_PACKAGE_OPENSSL is enabled to make it available for previous point.

Fixes:
http://autobuild.buildroot.net/results/b2e/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index fe1cdd5675..c999ec89be 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -32,8 +32,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CIVETWEB_COPT += -DNO_SSL_DL
-CIVETWEB_LIBS += -lssl -lcrypto -lz
-CIVETWEB_DEPENDENCIES += openssl
+CIVETWEB_LIBS += `$(HOST_DIR)/usr/bin/pkg-config --libs libssl`
+CIVETWEB_DEPENDENCIES += openssl host-pkgconf
 else
 CIVETWEB_COPT += -DNO_SSL
 endif
-- 
2.17.1
