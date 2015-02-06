From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 13:30:21 +0100
Subject: [Buildroot] [git commit] qemu: correct kernel headers check when
	major numbers differ
Message-ID: <20150206123124.79E8F81787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35bf4f3913fe21c5d47b982454b4487b8c71d816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit f7add51c39 (qemu: add host/target Linux version check) added a
version check between the host kernel version and the version of kernel
headers used by the toolchain, but the logic would fail unless BOTH major
and minor versions were >=, which isn't true for E.G. host kernel = 3.2 and
toolchain 2.6.x.

Instead calculate a single version number (as major << 8 + minor) and
compare that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 259813c..581f4ee 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -65,12 +65,10 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
 $(error "qemu-user can only be used on Linux hosts")
 endif
 
-HOST_QEMU_HOST_SYSTEM_VERSION_MAJOR = $(shell uname -r | cut -f1 -d'.')
-HOST_QEMU_HOST_SYSTEM_VERSION_MINOR = $(shell uname -r | cut -f2 -d'.')
-HOST_QEMU_TARGET_SYSTEM_VERSION_MAJOR = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | cut -f1 -d'.')
-HOST_QEMU_TARGET_SYSTEM_VERSION_MINOR = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | cut -f2 -d'.')
-HOST_QEMU_COMPARE_VERSION_MAJOR = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION_MAJOR) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION_MAJOR) && echo OK)
-HOST_QEMU_COMPARE_VERSION_MINOR = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION_MINOR) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION_MINOR) && echo OK)
+# kernel version as major*256 + minor
+HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
+HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
+HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
 
 #
 # The principle of qemu-user is that it emulates the instructions of
@@ -82,7 +80,7 @@ HOST_QEMU_COMPARE_VERSION_MINOR = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION_M
 # built with kernel headers that are older or the same as the kernel
 # version running on the host machine.
 #
-ifneq ($(HOST_QEMU_COMPARE_VERSION_MAJOR)$(HOST_QEMU_COMPARE_VERSION_MINOR),OKOK)
+ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
 $(error "Refusing to build qemu-user: target Linux version newer than host's.")
 endif
 endif
