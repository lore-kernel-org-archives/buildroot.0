From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 07 Jun 2021 15:17:34 -0000
Subject: [Buildroot] [git commit] package/qemu: bump version to 6.0.0
Message-ID: <20210607144654.7EA06814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b86c9335fc3ff381878156c6243454d4b688df9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Drop patch 0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch as it
    is part of 6.0.0.
  - Rename 0004-meson-add-tests-option.patch to
    0003-meson-add-tests-option.patch and refresh it for 6.0.0

Signed-off-by: Adam Duskett <aduskett@rivian.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch |  2 +-
 .../qemu/0002-Fix-build-with-64-bits-time_t.patch  |  4 +-
 ...b-host-libusb.c-fix-build-with-kernel-5.0.patch | 43 -----------------
 ...ion.patch => 0003-meson-add-tests-option.patch} | 54 +++++++++++-----------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 6 files changed, 33 insertions(+), 74 deletions(-)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
index 841708995e..6db4e8bc92 100644
--- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
+++ b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
@@ -21,7 +21,7 @@ diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
 index 4ebe25461a..0496674fbd 100644
 --- a/accel/tcg/user-exec.c
 +++ b/accel/tcg/user-exec.c
-@@ -536,7 +536,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+@@ -540,7 +540,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
  
  #if defined(__NetBSD__)
      pc = uc->uc_mcontext.__gregs[_REG_R15];
diff --git a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch b/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
index 7a72047136..934c0e28fd 100644
--- a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
+++ b/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
@@ -29,7 +29,7 @@ diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
 index 6020c6f33a..e688c3e0a9 100644
 --- a/contrib/vhost-user-input/main.c
 +++ b/contrib/vhost-user-input/main.c
-@@ -17,6 +17,11 @@
+@@ -15,6 +15,11 @@
  #include "standard-headers/linux/virtio_input.h"
  #include "qapi/error.h"
  
@@ -41,7 +41,7 @@ index 6020c6f33a..e688c3e0a9 100644
  enum {
      VHOST_USER_INPUT_MAX_QUEUES = 2,
  };
-@@ -115,13 +120,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
+@@ -113,13 +118,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
  static void vi_handle_status(VuInput *vi, virtio_input_event *event)
  {
      struct input_event evdev;
diff --git a/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch b/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch
deleted file mode 100644
index 2510dc9cd4..0000000000
--- a/package/qemu/0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ecd615dfe328e3ab551cea3ba243d908936ed382 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 13 Dec 2020 21:27:31 +0100
-Subject: [PATCH] hw/usb/host-libusb.c: fix build with kernel < 5.0
-
-USBDEVFS_GET_SPEED is used since version 5.2.0 and
-https://gitlab.com/qemu-project/qemu/-/commit/202d69a715a4b1824dcd7ec1683d027ed2bae6d3
-resulting in the following build failure with kernel < 5.0:
-
-../hw/usb/host-libusb.c: In function 'usb_host_open':
-../hw/usb/host-libusb.c:953:32: error: 'USBDEVFS_GET_SPEED' undeclared (first use in this function); did you mean 'USBDEVFS_GETDRIVER'?
-         int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
-                                ^~~~~~~~~~~~~~~~~~
-                                USBDEVFS_GETDRIVER
-
-A tentative was made to fix this build failure with
-https://gitlab.com/qemu-project/qemu/-/commit/4969e697c15ac536d5c0700381d5d026ef7f0588
-
-However, the assumtion that distros with old kernels also have old
-libusb is just wrong so also add a check for defined(USBDEVFS_GET_SPEED)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to qemu-devel at nongnu.org]
----
- hw/usb/host-libusb.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
-index b950501d10..0343300d3e 100644
---- a/hw/usb/host-libusb.c
-+++ b/hw/usb/host-libusb.c
-@@ -941,7 +941,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
-     usb_host_ep_update(s);
- 
-     libusb_speed = libusb_get_device_speed(dev);
--#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
-+#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX) && defined(USBDEVFS_GET_SPEED)
-     if (hostfd && libusb_speed == 0) {
-         /*
-          * Workaround libusb bug: libusb_get_device_speed() does not
--- 
-2.29.2
-
diff --git a/package/qemu/0004-meson-add-tests-option.patch b/package/qemu/0003-meson-add-tests-option.patch
similarity index 59%
rename from package/qemu/0004-meson-add-tests-option.patch
rename to package/qemu/0003-meson-add-tests-option.patch
index aff8a0f9fc..b52a7aaf2f 100644
--- a/package/qemu/0004-meson-add-tests-option.patch
+++ b/package/qemu/0003-meson-add-tests-option.patch
@@ -13,6 +13,8 @@ Fixes:
 http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 6.0.0
 ---
  configure         | 7 +++++++
  meson.build       | 5 ++++-
@@ -23,15 +25,15 @@ diff --git a/configure b/configure
 index 18c26e0389..7cceae4418 100755
 --- a/configure
 +++ b/configure
-@@ -449,6 +449,7 @@ meson=""
+@@ -460,6 +460,7 @@ meson=""
  ninja=""
  skip_meson=no
- gettext=""
+ gettext="auto"
 +tests="auto"
- 
- bogus_os="no"
- malloc_trim="auto"
-@@ -1525,6 +1526,10 @@ for opt do
+ fuse="auto"
+ fuse_lseek="auto"
+ multiprocess="auto"
+@@ -1549,6 +1550,10 @@ for opt do
    ;;
    --disable-libdaxctl) libdaxctl=no
    ;;
@@ -39,30 +41,30 @@ index 18c26e0389..7cceae4418 100755
 +  ;;
 +  --enable-tests) tests="enabled"
 +  ;;
-   *)
-       echo "ERROR: unknown option $opt"
-       echo "Try '$0 --help' for more information"
-@@ -1850,6 +1855,7 @@ disabled with --disable-FEATURE, default is enabled if available:
+   --enable-fuse) fuse="enabled"
+   ;;
+   --disable-fuse) fuse="disabled"
+@@ -1915,6 +1920,7 @@ disabled with --disable-FEATURE, default is enabled if available
    xkbcommon       xkbcommon support
    rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
    libdaxctl       libdaxctl support
 +  tests           build tests
- 
- NOTE: The object files are built at the place where configure is launched
- EOF
-@@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
-         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
+   fuse            FUSE block device export
+   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+   multiprocess    Out of process device emulation support
+@@ -6422,6 +6428,7 @@ NINJA=$ninja $meson setup \
+         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
+         -Dattr=$attr -Ddefault_devices=$default_devices \
          -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
-         -Dvhost_user_blk_server=$vhost_user_blk_server \
 +        -Dtests=$tests \
-         $cross_arg \
-         "$PWD" "$source_path"
- 
+         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
+         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
+         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
 diff --git a/meson.build b/meson.build
 index e3386196ba..7f4efdc347 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1944,7 +1944,10 @@ subdir('scripts')
+@@ -2381,7 +2381,10 @@ subdir('scripts')
  subdir('tools')
  subdir('pc-bios')
  subdir('docs')
@@ -71,22 +73,22 @@ index e3386196ba..7f4efdc347 100644
 +  subdir('tests')
 +endif
 +
- if 'CONFIG_GTK' in config_host
+ if gtk.found()
    subdir('po')
  endif
 diff --git a/meson_options.txt b/meson_options.txt
 index f6f64785fe..81bffbfe87 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -66,6 +66,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
-        description: 'build virtiofs daemon (virtiofsd)')
+@@ -111,6 +111,8 @@ option('fuse_lseek', type : 'feature', value : 'auto',
+ 
  option('vhost_user_blk_server', type: 'feature', value: 'auto',
         description: 'build vhost-user-blk server')
 +option('tests', type : 'feature', value : 'auto',
 +       description: 'Tests build support')
- 
- option('capstone', type: 'combo', value: 'auto',
-        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
+ option('virtfs', type: 'feature', value: 'auto',
+        description: 'virtio-9p support')
+ option('virtiofsd', type: 'feature', value: 'auto',
 -- 
 2.29.2
 
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 7d9936adb4..5e873791b8 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc  qemu-5.2.0.tar.xz
+sha256  87bc1a471ca24b97e7005711066007d443423d19aacda3d442558ae032fa30b9  qemu-6.0.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b552ea139e..e0f722cf42 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 5.2.0
+QEMU_VERSION = 6.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
