From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jun 2018 16:34:07 +0200
Subject: [Buildroot] [PATCH v2] linux: disable attribute alias with gcc >=
 8.1
Message-ID: <20180602143407.20985-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-8 started warning about function aliases that have a non-matching
prototype. This seems rather useful in general, but it causes tons of
warnings in the Linux kernel, where we rely on abusing those aliases
for system call entry points, in order to sanitze the arguments passed
from user space in registers.

See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435

Disable the attribute-alias warning introduced by gcc-8 by adding
-Wno-attribute-alias to KCFLAGS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v2: use KCFLAGS instead of KBUILD_CFLAGS (ThomasP)

Fixes most of build errors reported by toolchains-builder on Gitlab.
https://gitlab.com/free-electrons/toolchains-builder/pipelines/22921464
---
 linux/linux.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6b5f5344ed..f6cf005196 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -121,6 +121,15 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
+# gcc-8 started warning about function aliases that have a non-matching prototype.
+# This seems rather useful in general, but it causes tons of warnings in the Linux kernel,
+# where we rely on abusing those aliases for system call entry points, in order to sanitze
+# the arguments passed from user space in registers.
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
-- 
2.14.3
