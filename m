From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 21:56:16 +0200
Subject: [Buildroot] [git commit] libpjsip: fix m68k uclinux compile
Message-ID: <20160806195629.BDFF37FB86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e11e8b3c3ddf028d3ea14af4bd6ab6bbcde84ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC manual suggest when getting:
relocation truncated to fit: R_68K_GOT16O foobar
to use -mxgot.

Fixes:

  http://autobuild.buildroot.org/results/e8cdfaf8e2da29a855b5bc09774f3aadee087737/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/libpjsip.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ebb5897..2b5e18f 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -13,9 +13,16 @@ LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
+LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
+
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+LIBPJSIP_CFLAGS += -mxgot
+endif
+
 LIBPJSIP_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
+	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
