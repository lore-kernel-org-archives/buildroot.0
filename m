From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Jan 2016 11:18:54 -0300
Subject: [Buildroot] [PATCH] libnss: add build workaround for older gcc
	versions
Message-ID: <1452089934-10364-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nss uses some #pragma directives that require newish (>= 4.6) versions
of gcc, so disable Werror when building with older versions to avoid the
build from breaking unfairly.
However make this a gcc >= 4.8 conditional since the kludge is called so
(NSS_NO_GCC48) and other bits might depend upon it.

Upstream bug https://bugzilla.mozilla.org/show_bug.cgi?id=1226179

Fixes:
http://autobuild.buildroot.net/results/ebd/ebd0647eb1eef41a7fb6e5f5bab18d4d12168661/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 10879e2..6fdb77c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -30,6 +30,12 @@ LIBNSS_BUILD_VARS = \
 	OS_RELEASE="2.6" \
 	OS_TEST="$(ARCH)"
 
+# #pragma usage needs gcc >= 4.8
+# See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),)
+LIBNSS_BUILD_VARS += NSS_ENABLE_WERROR=0
+endif
+
 ifeq ($(BR2_ARCH_IS_64),y)
 # MIPS64 n32 is treated as a 32-bit architecture by libnss.
 # See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
-- 
2.4.10
