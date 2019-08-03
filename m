From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Aug 2019 00:25:52 +0200
Subject: [Buildroot] [git commit] package/qemu: drop host kernel version
 check
Message-ID: <20190803222313.3D5298DFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64ef25d738063416ca2a62e772b7841caaab30d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no clean way to check if a program will actually run using
host-qemu, making this check too restrictive.

Add a warning in the help text.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/Config.in.host |  6 ++++++
 package/qemu/qemu.mk        | 22 ----------------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 0287f20514..9eceba5021 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -64,6 +64,12 @@ config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	  Enables the build of the user-land emulator, which allows to
 	  run user-space applications.
 
+	  Note that system calls made by the emulated user-land are
+	  serviced by the running host kernel. Therefore, if the
+	  kernel headers used by your target are more recent than
+	  the running host kernel, you may run into invalid system
+	  calls, which may yield surprising effects.
+
 config BR2_PACKAGE_HOST_QEMU_VDE2
 	bool "VDE2 support"
 	help
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2a148c8b6e..d36ec3e655 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -241,28 +241,6 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
 $(error "qemu-user can only be used on Linux hosts")
 endif
 
-# kernel version as major*256 + minor
-HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
-HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
-HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
-
-#
-# The principle of qemu-user is that it emulates the instructions of
-# the target architecture when running the binary, and then when this
-# binary does a system call, it converts this system call into a
-# system call on the host machine. This mechanism makes an assumption:
-# that the target binary will not do system calls that do not exist on
-# the host. This basically requires that the target binary should be
-# built with kernel headers that are older or the same as the kernel
-# version running on the host machine.
-#
-
-ifeq ($(BR_BUILDING),y)
-ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
-$(error "Refusing to build qemu-user: target Linux version newer than host's.")
-endif
-endif # BR_BUILDING
-
 else # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 HOST_QEMU_OPTS += --disable-linux-user
 endif # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
