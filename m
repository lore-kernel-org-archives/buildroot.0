From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2021 09:32:20 +0100
Subject: [Buildroot] [git commit] package/qemu: disable tests
Message-ID: <20210226081843.3C7B386598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ef20378b7db54a0ccbebb3dfb71dca4f5eb64e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tests/fp/fp-bench.c use fenv.h that is not always provided
by the libc (uClibc).

To workaround this issue, add an new meson option to
disable tests while building Qemu.

Fixes:
http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/0004-meson-add-tests-option.patch | 92 ++++++++++++++++++++++++++
 package/qemu/qemu.mk                           |  2 +
 2 files changed, 94 insertions(+)

diff --git a/package/qemu/0004-meson-add-tests-option.patch b/package/qemu/0004-meson-add-tests-option.patch
new file mode 100644
index 0000000000..aff8a0f9fc
--- /dev/null
+++ b/package/qemu/0004-meson-add-tests-option.patch
@@ -0,0 +1,92 @@
+From c24f6cc8f847a4f90cd8fe0f94604862c5ac4a5e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 21 Dec 2020 22:12:14 +0100
+Subject: [PATCH] meson: add tests option
+
+tests/fp/fp-bench.c use fenv.h that is not always provided
+by the libc (uClibc).
+
+To workaround this issue, add an new meson option to
+disable tests while building Qemu.
+
+Fixes:
+http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure         | 7 +++++++
+ meson.build       | 5 ++++-
+ meson_options.txt | 2 ++
+ 3 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 18c26e0389..7cceae4418 100755
+--- a/configure
++++ b/configure
+@@ -449,6 +449,7 @@ meson=""
+ ninja=""
+ skip_meson=no
+ gettext=""
++tests="auto"
+ 
+ bogus_os="no"
+ malloc_trim="auto"
+@@ -1525,6 +1526,10 @@ for opt do
+   ;;
+   --disable-libdaxctl) libdaxctl=no
+   ;;
++  --disable-tests) tests="disabled"
++  ;;
++  --enable-tests) tests="enabled"
++  ;;
+   *)
+       echo "ERROR: unknown option $opt"
+       echo "Try '$0 --help' for more information"
+@@ -1850,6 +1855,7 @@ disabled with --disable-FEATURE, default is enabled if available:
+   xkbcommon       xkbcommon support
+   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
+   libdaxctl       libdaxctl support
++  tests           build tests
+ 
+ NOTE: The object files are built at the place where configure is launched
+ EOF
+@@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
+         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
+         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
+         -Dvhost_user_blk_server=$vhost_user_blk_server \
++        -Dtests=$tests \
+         $cross_arg \
+         "$PWD" "$source_path"
+ 
+diff --git a/meson.build b/meson.build
+index e3386196ba..7f4efdc347 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1944,7 +1944,10 @@ subdir('scripts')
+ subdir('tools')
+ subdir('pc-bios')
+ subdir('docs')
+-subdir('tests')
++if get_option('tests').enabled()
++  subdir('tests')
++endif
++
+ if 'CONFIG_GTK' in config_host
+   subdir('po')
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index f6f64785fe..81bffbfe87 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -66,6 +66,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
+        description: 'build virtiofs daemon (virtiofsd)')
+ option('vhost_user_blk_server', type: 'feature', value: 'auto',
+        description: 'build vhost-user-blk server')
++option('tests', type : 'feature', value : 'auto',
++       description: 'Tests build support')
+ 
+ option('capstone', type: 'combo', value: 'auto',
+        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
+-- 
+2.29.2
+
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 323ae01283..b552ea139e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -202,6 +202,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-opengl \
 			--disable-vhost-user-blk-server \
 			--disable-virtiofsd \
+			--disable-tests \
 			$(QEMU_OPTS)
 endef
 
@@ -348,6 +349,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
 		--disable-vnc-sasl \
+		--disable-tests \
 		$(HOST_QEMU_OPTS)
 endef
 
