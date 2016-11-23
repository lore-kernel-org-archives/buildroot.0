From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:56:49 +0100
Subject: [Buildroot] [git commit] linux: override build timestamp for
	reproducible builds
Message-ID: <20161201222139.2D4127FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af109fb44469a89b2576d167b02f02a811d13c12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux kernel include a few information about build environment in its binary.
This feature is incompatible with BR2_REPRODUCIBLE. This patch overload build
information when BR2_REPRODUCIBLE is enabled.

Note that usage of KBUILD_BUILD_TIMESTAMP is not mandatory since Buildroot
use `fakedate'. However, native solution is prefered when upstream
provide one.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 988427c..7e826cc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -94,6 +94,14 @@ LINUX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+LINUX_MAKE_ENV += \
+	KBUILD_BUILD_VERSION=1 \
+	KBUILD_BUILD_USER=buildroot \
+	KBUILD_BUILD_HOST=buildroot \
+	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
