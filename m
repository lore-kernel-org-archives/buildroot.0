From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:32:40 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] linux-tools: perf: Add
 dependencies for binutils and openssl
Message-ID: <20200327222007.67CE2886D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=578e241de8971d75600950817677b1dff4054b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

perf auto-detects and uses the libbfd (from binutils) and openssl
libraries if they are detected and happen to be built before perf is,
but if they're not, or if per-package directories are enabled, it won't
detect these libraries. Explicitly add dependencies on these packages if
they are enabled, and disable the feature if not, so that the behavior
is deterministic.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 013cc68bf7cd92fc66dc65f7bb62592dc87123db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
