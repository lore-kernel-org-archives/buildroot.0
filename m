From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:22:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/civetweb: fix
 linking failure caused by wrong argument passed to pkg-config
Message-ID: <20190414212510.1785E8A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89029b28b5fce2995c1219fb965e0db9e0593ab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

On commit 027a8b29f1e62d5ff5bbb15b79376614f902a680 pkg-config has been
added to retrieve OpenSSL dependencies, but it's been passed `libssl`
instead of `openssl`, this makes fail some linking. Indeed we need
OpenSSL dependency, so let's use `openssl` with pkg-config.

Substitute `libssl` with `openssl`.

Fixes:

  http://autobuild.buildroot.net/results/b225425ee237852bd9fee4ca0b8d24f3e37d64f9/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e38641851a1bc334e6fb0a019ccf3af91098182f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 80272738e4..1652239ebb 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -32,7 +32,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CIVETWEB_COPT += -DNO_SSL_DL
-CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libssl`
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 CIVETWEB_DEPENDENCIES += openssl host-pkgconf
 else
 CIVETWEB_COPT += -DNO_SSL
