From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 13:53:09 +0200
Subject: [Buildroot] [git commit] tn5250: fix static build with openssl
Message-ID: <20150826120452.F17097F981@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a07750cc55b83730fc264dc6c35bb8efebd5bf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenSSL needs libz. Use pkg-config to find dependencies.

Fixes:
http://autobuild.buildroot.net/results/95f/95f6df0d01e4944ecd84e830e2bbd8389e1d3e3d/
http://autobuild.buildroot.net/results/432/432b1fdec1e6282d51ba1d859c0f4ab9ed2a5efc/
http://autobuild.buildroot.net/results/d6a/d6a7125c21b4f92b69bb9e30b05c4727eedb63ba/

and more.

[Thomas: use += instead of = when assigning <pkg>_CONF_ENV to avoid
future mistakes.]

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tn5250/tn5250.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 213f02c..bbaa686 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -13,7 +13,8 @@ TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
-TN5250_DEPENDENCIES += openssl
+TN5250_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+TN5250_DEPENDENCIES += openssl host-pkgconf
 else
 TN5250_CONF_OPTS += --without-ssl
 endif
