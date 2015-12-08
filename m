From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Dec 2015 21:54:42 +0100
Subject: [Buildroot] [git commit] pixman: disable vmx for powerpc CS
	toolchains
Message-ID: <20151208210009.6E5D981DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50b02a639558b5319e88d2c3ce66e3950352d694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ppc CS toolchains have flaky VMX (AKA altivec) implementation
causing build failure. Disable it for these toolchains. Fixes:
http://autobuild.buildroot.net/results/3b4/3b4cda40f074578f6b35b1fb381ba37b93174e86/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8281773..8845315 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -32,5 +32,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
 PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
 endif
 
+# Altivec detection isn't reliable for CS toolchains
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
+PIXMAN_CONF_OPTS += --disable-vmx
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
