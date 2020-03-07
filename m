From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Mar 2020 12:36:04 +0100
Subject: [Buildroot] [PATCH v1] package/libdrm: tests/amdgpu needs atomic_ops
Message-ID: <20200307113604.14754-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix tests/amdpu dependency on atomic_ops.

Fixes:

  http://autobuild.buildroot.net/results/e29dae423f3f80d2c34dde9a125bd216a75ad1c0

  FAILED: tests/amdgpu/amdgpu_test
  .../host/bin/sparc-linux-gcc  -o tests/amdgpu/amdgpu_test 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/amdgpu_test.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/basic_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/bo_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/cs_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vce_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/uvd_enc_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vcn_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/deadlock_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vm_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/ras_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/syncobj_tests.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group libdrm.so.2.4.0 amdgpu/libdrm_amdgpu.so.1.0.0 .../host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcunit.so -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/../..:$ORIGIN/../../amdgpu' -Wl,-rpath-link,.../build/libdrm-2.4.100/build/ -Wl,-rpath-link,.../build/libdrm-2.4.100/build/amdgpu
  .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: tests/amdgpu/b9f2b1d@@amdgpu_test at exe/bo_tests.c.o: undefined reference to symbol 'AO_fetch_compare_and_swap_emulation'
  .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: .../host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libatomic_ops.so.1: error adding symbols: DSO missing from command line

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0007-tests-amdgpu-needs-atomic_ops.patch  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch

diff --git a/package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch b/package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch
new file mode 100644
index 0000000000..78a844b02e
--- /dev/null
+++ b/package/libdrm/0007-tests-amdgpu-needs-atomic_ops.patch
@@ -0,0 +1,26 @@
+From f0adb08424e624aeee340291343281256b7a98e8 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 7 Mar 2020 12:23:09 +0100
+Subject: [PATCH] tests/amdgpu: needs atomic_ops
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ tests/amdgpu/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
+index 1726cb43..4dfa5c83 100644
+--- a/tests/amdgpu/meson.build
++++ b/tests/amdgpu/meson.build
+@@ -26,7 +26,7 @@ if dep_cunit.found()
+       'vce_tests.c', 'uvd_enc_tests.c', 'vcn_tests.c', 'deadlock_tests.c',
+       'vm_tests.c', 'ras_tests.c', 'syncobj_tests.c',
+     ),
+-    dependencies : [dep_cunit, dep_threads],
++    dependencies : [dep_cunit, dep_threads, dep_atomic_ops],
+     include_directories : [inc_root, inc_drm, include_directories('../../amdgpu')],
+     link_with : [libdrm, libdrm_amdgpu],
+     install : with_install_tests,
+-- 
+2.25.1
+
-- 
2.25.1
