From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 27 Dec 2020 02:15:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: Fix deprecation warnings
 in cross-compilation config
Message-ID: <20201227021505.1970065-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of meson 0.56.0, `<lang>_args` and `<lang>_link_args` in the `[properties]` section are deprecated and should be placed in the `[built-in options]` section instead.

Source: https://mesonbuild.com/Machine-files.html#properties

Fixes the following deprecation warnings:

> DEPRECATION: c_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> DEPRECATION: c_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> DEPRECATION: cpp_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> DEPRECATION: cpp_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/meson/cross-compilation.conf.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 1880051315..37b49eea3b 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -12,12 +12,14 @@ pkgconfig = '@HOST_DIR@/bin/pkgconf'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 
-[properties]
-needs_exe_wrapper = true
+[built-in options]
 c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+
+[properties]
+needs_exe_wrapper = true
 sys_root = '@STAGING_DIR@'
 pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
 pkg_config_static = '@STATIC@'
-- 
2.27.0
