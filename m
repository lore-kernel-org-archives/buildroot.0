From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 12:09:29 +0100
Subject: [Buildroot] [git commit] qemu: add host/target Linux version check
Message-ID: <20141223110939.77DD98072D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7add51c3933e16f2b747637af82e5ebcc906f8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Raise an error if the host is using an older kernel than the target.
Since qemu-user passes emulated system calls to the host kernel,
this prevents usage of qemu-user in situations where those system
calls will fail.

This is based on an original patch from Frank Hunleth
<fhunleth@troodon-software.com>, but completely rewritten in a
different way:

 * Instead of using shell based testing, we use pure make tests, which
   allows to detect the problem not when host-qemu starts to build,
   but at the very beginning of the entire Buildroot build.

 * Instead of looking at $(STAGING_DIR)/usr/include/linux/version.h
   (which requires having a dependency on the 'toolchain' package,
   which is a bit unusual for a host package), we use the
   BR2_TOOLCHAIN_HEADERS_AT_LEAST Config.in option which tells us the
   version of the kernel headers used in the toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/qemu/qemu.mk |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9cff5ed..6c5ddf3 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -59,6 +59,34 @@ HOST_QEMU_ARCH = ppc
 endif
 HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU),y)
+HOST_QEMU_HOST_SYSTEM_TYPE = $(shell uname -s)
+ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
+$(error "qemu-user can only be used on Linux hosts")
+endif
+
+HOST_QEMU_HOST_SYSTEM_VERSION_MAJOR = $(shell uname -r | cut -f1 -d'.')
+HOST_QEMU_HOST_SYSTEM_VERSION_MINOR = $(shell uname -r | cut -f2 -d'.')
+HOST_QEMU_TARGET_SYSTEM_VERSION_MAJOR = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | cut -f1 -d'.')
+HOST_QEMU_TARGET_SYSTEM_VERSION_MINOR = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | cut -f2 -d'.')
+HOST_QEMU_COMPARE_VERSION_MAJOR = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION_MAJOR) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION_MAJOR) && echo OK)
+HOST_QEMU_COMPARE_VERSION_MINOR = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION_MINOR) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION_MINOR) && echo OK)
+
+#
+# The principle of qemu-user is that it emulates the instructions of
+# the target architecture when running the binary, and then when this
+# binary does a system call, it converts this system call into a
+# system call on the host machine. This mechanism makes an assumption:
+# that the target binary will not do system calls that do not exist on
+# the host. This basically requires that the target binary should be
+# built with kernel headers that are older or the same as the kernel
+# version running on the host machine.
+#
+ifneq ($(HOST_QEMU_COMPARE_VERSION_MAJOR)$(HOST_QEMU_COMPARE_VERSION_MINOR),OKOK)
+$(error "Refusing to build qemu-user: target Linux version newer than host's.")
+endif
+endif
+
 define HOST_QEMU_CONFIGURE_CMDS
 	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
