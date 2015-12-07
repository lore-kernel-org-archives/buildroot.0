From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Dec 2015 11:27:11 -0300
Subject: [Buildroot] [PATCH] pixman: disable vmx for powerpc CS toolchains
Message-ID: <1449498431-5872-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ppc CS toolchains have flaky VMX (AKA altivec) implementation
causing build failure. Disable it for these toolchains. Fixes:
http://autobuild.buildroot.net/results/3b4/3b4cda40f074578f6b35b1fb381ba37b93174e86/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
