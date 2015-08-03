From: vj <vicencb@gmail.com>
Date: Mon, 3 Aug 2015 19:55:10 +0100
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
Message-ID: <CAAMcf8BWy-NzBFHKsbyx3SRz9RC98_KUiCoq-7C5C-nRS+jmGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain

I've tested your patch series successfully!

Just a few notes:

1)
It's been tested with the musl c library. To do so, I had to remove the
libc restriction you added.
When using musl, there are some packages (at least pulseaudio) that can not
be build, so the BR2_PACKAGE_EFL_RECOMMENDED_CONFIG had to be disabled.
So, as it build and worked fine, could you remove the glibc requirement or
add musl to the restricted list of supported libcs ?

2)
When BR2_PACKAGE_EFL_RECOMMENDED_CONFIG is disabled the efl dependency on
BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is lost but it is still a requirement, so
this patch (or a variation of it) is needed:
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_EFL
     select BR2_PACKAGE_LIBCURL # eina_module, runtime dependency
     select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
     select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+    select BR2_PACKAGE_UTIL_LINUX
+    select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
     help
       Enlightenment Foundation Libraries

3)
To test it I've added the terminology package which depends on efl and
configured buildroot like:
BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_NEON=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_BINUTILS_VERSION_2_25_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_GRAPHITE=y
BR2_TARGET_OPTIMIZATION="-march=armv7-a -mtune=cortex-a8 -mcpu=cortex-a8
-mfpu=neon -mfloat-abi=hard"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_TERMINOLOGY=y
# BR2_PACKAGE_EFL_RECOMMENDED_CONFIG is not set
BR2_PACKAGE_EFL_FB=y
BR2_PACKAGE_EFL_PNG=y
BR2_PACKAGE_EFL_JPEG=y
BR2_PACKAGE_LUA_5_3=y
BR2_TARGET_ROOTFS_CPIO=y
# BR2_TARGET_ROOTFS_TAR is not set

4)
Unrelated to efl: to make it work with an external toolchain when the
arhitecture is "armhf" instead of "arm" this patch is also required:
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -496,6 +496,8 @@ endef
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
 ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
+else ifeq ($(BR2_ARM_EABIHF),y)
+MUSL_ARCH = armhf
 else
 MUSL_ARCH = $(ARCH)
 endif

Thanks for updating efl!

Regards,
  Vicente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150803/5bc3c367/attachment.html>
