From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:13:07 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/qt5/qt5base:
 handle sse2/sse3/ssse3/sse4.1/sse4.2/avx/avx2 configuration
Message-ID: <20190222114347.951068C60B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af838045f88eb9525b0bacc78fe8b4511be5c850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The Qt configure auto detection (and announced runtime detection
feature) failes (see e.g. [1]), so override the configuration
with the buildroot determined settings.

[1] http://lists.busybox.net/pipermail/buildroot/2019-January/241862.html

Reported-by: David Picard <dplamp@gmx.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f9009e5bd14fac29038bf6728c1e019d2b2ffc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b79059c2a4..b96c2eb04a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -33,6 +33,25 @@ else
 QT5BASE_DEPENDENCIES += pcre2
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE2),)
+QT5BASE_CONFIGURE_OPTS += -no-sse2
+else ifeq ($(BR2_X86_CPU_HAS_SSE3),)
+QT5BASE_CONFIGURE_OPTS += -no-sse3
+else ifeq ($(BR2_X86_CPU_HAS_SSSE3),)
+QT5BASE_CONFIGURE_OPTS += -no-ssse3
+else ifeq ($(BR2_X86_CPU_HAS_SSE4),)
+QT5BASE_CONFIGURE_OPTS += -no-sse4.1
+else ifeq ($(BR2_X86_CPU_HAS_SSE42),)
+QT5BASE_CONFIGURE_OPTS += -no-sse4.2
+else ifeq ($(BR2_X86_CPU_HAS_AVX),)
+QT5BASE_CONFIGURE_OPTS += -no-avx
+else ifeq ($(BR2_X86_CPU_HAS_AVX2),)
+QT5BASE_CONFIGURE_OPTS += -no-avx2
+else
+# no buildroot BR2_X86_CPU_HAS_AVX512 option yet for qt configure
+# option '-no-avx512' (available for latest only)
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
