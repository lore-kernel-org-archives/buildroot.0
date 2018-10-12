From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Oct 2018 07:39:50 +0300
Subject: [Buildroot] [PATCH 1/2] spandsp: fix static build with jpeg enabled
Message-ID: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When jpeg is enabled libtiff links with it, but the spandsp configure
test doesn't take that into account, so the configure test fails. Use
pkg-config to add the required tiff dependencies.

Fixes:
http://autobuild.buildroot.net/results/243/243f1d1271a767556e0a4cd56a42fcc8c1a371ed/
http://autobuild.buildroot.net/results/485/48527e144bc4ad3eaab807f302888380bd9e78bb/
http://autobuild.buildroot.net/results/058/05885325ec274cb9860d423c57eed5e7063aedc0/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/spandsp/spandsp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index 4b1f89cf4b34..fc9db34bfcae 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -10,8 +10,9 @@ SPANDSP_SITE = https://www.soft-switch.org/downloads/spandsp/snapshots
 SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 SPANDSP_LICENSE_FILES = COPYING
 
-SPANDSP_DEPENDENCIES = tiff
+SPANDSP_DEPENDENCIES = tiff host-pkgconf
 SPANDSP_INSTALL_STAGING = YES
+SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
 SPANDSP_CONF_OPTS = \
 	--disable-doc \
-- 
2.19.1
