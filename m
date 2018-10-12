From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 21:58:19 +0200
Subject: [Buildroot] [git commit] spandsp: fix static build with jpeg enabled
Message-ID: <20181012195931.61BAF83624@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf41bfd83fab5351696421c19954116a00f33dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When jpeg is enabled libtiff links with it, but the spandsp configure
test doesn't take that into account, so the configure test fails. Use
pkg-config to add the required tiff dependencies.

Fixes:
http://autobuild.buildroot.net/results/243/243f1d1271a767556e0a4cd56a42fcc8c1a371ed/
http://autobuild.buildroot.net/results/485/48527e144bc4ad3eaab807f302888380bd9e78bb/
http://autobuild.buildroot.net/results/058/05885325ec274cb9860d423c57eed5e7063aedc0/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spandsp/spandsp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index 4b1f89cf4b..fc9db34bfc 100644
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
