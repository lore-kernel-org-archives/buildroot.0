From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  5 Feb 2019 22:41:22 +0100
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: handle
 sse2/sse3/ssse3/sse4.1/sse4.2/avx/avx2 configuration
Message-ID: <20190205214122.25115-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt configure auto detection (and announced runtime detection
feature) failes (see e.g. [1]), so override the configuration
with the buildroot determined settings.

[1] http://lists.busybox.net/pipermail/buildroot/2019-January/241862.html

Reported-by: David Picard <dplamp@gmx.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use 'else ifeq' (suggested by Thomas Petazzoni)
  - fix typo (anounced vs. announced)
  - clarify no-avx512 comment

Notes:
 - suggested by Arnout Vandecappelle [2]

[2] http://lists.busybox.net/pipermail/buildroot/2019-January/242030.html
---
 package/qt5/qt5base/qt5base.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d10f233b46..b0307344d5 100644
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
+# option # '-no-avx512' (available for latest only)
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-- 
2.20.1
