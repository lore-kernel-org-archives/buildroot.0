From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Mon, 22 Oct 2018 16:18:18 +0200
Subject: [Buildroot] [PATCH 1/1] cc-tool: use the same C++ standard as boost
Message-ID: <20181022141818.335-1-ferdinand@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When boost context is enabled, we build boost with -std=c++11.
That causes cc-tool to fail, which was using the gcc default c++14.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
---
 package/cc-tool/cc-tool.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
index e170e06a21..d5de920f6a 100644
--- a/package/cc-tool/cc-tool.mk
+++ b/package/cc-tool/cc-tool.mk
@@ -18,6 +18,11 @@ CC_TOOL_AUTORECONF = YES
 CC_TOOL_CONF_OPTS = --with-boost=$(STAGING_DIR)/usr
 CC_TOOL_CONF_ENV = LIBS="$(CC_TOOL_LIBS)"
 
+# With boost context selected, boost gets built with c++11
+ifeq ($(BR2_PACKAGE_BOOST_CONTEXT)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),yy)
+CC_TOOL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
+
 # Help boost.m4 find the Boost Regex library, which needs the pthread
 # library, but isn't detected using a modern (pkg-config) mechanism.
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.19.0
