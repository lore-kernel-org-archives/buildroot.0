From: Robert Hancock <hancock@sedsystems.ca>
Date: Mon,  2 Mar 2020 16:49:34 -0600
Subject: [Buildroot] [PATCH 1/1] linux-tools: perf: Add dependencies for
 binutils and openssl
Message-ID: <20200302224934.1356690-1-hancock@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf auto-detects and uses the libbfd (from binutils) and openssl
libraries if they are detected and happen to be built before perf is,
but if they're not, or if per-package directories are enabled, it won't
detect these libraries. Explicitly add dependencies on these packages if
they are enabled, and disable the feature if not, so that the behavior
is deterministic.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 package/linux-tools/linux-tool-perf.mk.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 80e00c3c56..7106b622cb 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -82,6 +82,18 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+PERF_DEPENDENCIES += binutils
+else
+PERF_MAKE_FLAGS += NO_DEMANGLE=1
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PERF_DEPENDENCIES += openssl
+else
+PERF_MAKE_FLAGS += NO_LIBCRYPTO=1
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PERF_DEPENDENCIES += zlib
 else
-- 
2.24.1
