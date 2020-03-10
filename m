From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 09:45:40 +0100
Subject: [Buildroot] [PATCH v1] package/libevdev: fix static compile
Message-ID: <20200310084540.7176-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to enable meson static library build (use meson
library() instead of shared_library()).

Fixes:

  - http://autobuild.buildroot.net/results/b920ef5a250e7d23223352367ded50bf32bb5688

  .../host/bin/arm-linux-gcc  -o libevdev.so.2.3.0 'evdev at sha/libevdev_libevdev-uinput.c.o' 'evdev at sha/libevdev_libevdev.c.o' 'evdev at sha/libevdev_libevdev-names.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libevdev.so.2 -Wl,--end-group -Wl,-elf2flt -static -Wl,--version-script,.../build/libevdev-1.9.0/libevdev/libevdev.sym
  ld (ld-elf2flt): -shared used without passing a shared library ID

  - http://autobuild.buildroot.net/results/dc52a705c7490b722380af7b00ff7c6e172450cf

  .../host/bin/x86_64-linux-gcc  -o libevdev.so.2.3.0 'evdev at sha/libevdev_libevdev-uinput.c.o' 'evdev at sha/libevdev_libevdev.c.o' 'evdev at sha/libevdev_libevdev-names.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libevdev.so.2 -Wl,--end-group -static -Wl,--version-script,.../build/libevdev-1.9.0/libevdev/libevdev.sym
  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object
  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/crtend.o: relocation R_X86_64_32 against `.ctors' can not be used when making a shared object; recompile with -fPIC
  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: final link failed: nonrepresentable section on output

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...on.build-enable-static-library-build.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libevdev/0003-meson.build-enable-static-library-build.patch

diff --git a/package/libevdev/0003-meson.build-enable-static-library-build.patch b/package/libevdev/0003-meson.build-enable-static-library-build.patch
new file mode 100644
index 0000000000..36722bf9a3
--- /dev/null
+++ b/package/libevdev/0003-meson.build-enable-static-library-build.patch
@@ -0,0 +1,29 @@
+From 0d39ee4958869e9dd7657d6d0528bc4e2461e912 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 10 Mar 2020 09:35:52 +0100
+Subject: [PATCH] meson.build: enable static library build
+
+Use meson library() instead of shared_library() to enable
+static build.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a623a90..94224cb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -70,7 +70,7 @@ src_libevdev = [
+ 
+ mapfile = join_paths(dir_src, 'libevdev.sym')
+ version_flag = '-Wl,--version-script, at 0@'.format(mapfile)
+-lib_libevdev = shared_library('evdev',
++lib_libevdev = library('evdev',
+ 	src_libevdev,
+ 	include_directories: [includes_include],
+ 	dependencies: [],
+-- 
+2.25.1
+
-- 
2.25.1
