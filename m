From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 20:46:53 +0100
Subject: [Buildroot] [git commit] package/libnss: fix powerpc altivec build
 failure
Message-ID: <20200208193633.83E2F8D5A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aebf953fbc2b143449dd6a88f7bc5e01a6534a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NSS_DISABLE_ALTIVEC variable has been introduced into libnss so let's
use it to prevent Altivec build failure on PowerPc by passing
NSS_DISABLE_ALTIVEC=1 if BR2_POWERPC_CPU_HAS_ALTIVEC is not 'y'.

Fixes:
http://autobuild.buildroot.net/results/957/957cec911bcd68a18418ad02f13e7e3001521c59/
http://autobuild.buildroot.net/results/6a1/6a1578619a477e1605fe152070f004b662f1d839/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 4de9d3183f..e439150ecd 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -50,6 +50,11 @@ LIBNSS_BUILD_VARS = \
 	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
 	NSS_ENABLE_WERROR=0
 
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
+# Disable Altivec if not supported
+LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
+endif
+
 ifeq ($(BR2_ARCH_IS_64),y)
 # MIPS64 n32 is treated as a 32-bit architecture by libnss.
 # See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
