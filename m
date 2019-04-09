From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:26:21 +0200
Subject: [Buildroot] [git commit] package/civetweb: fix link failure due to
 missing OpenSSL dependency
Message-ID: <20190409212308.A62A5836D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=027a8b29f1e62d5ff5bbb15b79376614f902a680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During linking one OpenSSL dependecy is missing(-latomic) on linking
library list.

- Substitute explicit library list with `pkg-config libssl` when
  BR2_PACKAGE_OPENSSL is enabled. In such way all needed libraries
  will be included in linking list.

- Add also `host-pkgconf` to CIVETWEB_DEPENDENCIES if
  BR2_PACKAGE_OPENSSL is enabled to make it available for previous
  point.

Fixes:

  http://autobuild.buildroot.net/results/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index fe1cdd5675..80272738e4 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -32,8 +32,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CIVETWEB_COPT += -DNO_SSL_DL
-CIVETWEB_LIBS += -lssl -lcrypto -lz
-CIVETWEB_DEPENDENCIES += openssl
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libssl`
+CIVETWEB_DEPENDENCIES += openssl host-pkgconf
 else
 CIVETWEB_COPT += -DNO_SSL
 endif
