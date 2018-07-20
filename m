From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Jul 2018 09:46:05 +0200
Subject: [Buildroot] [git commit] linux: disable attribute alias with gcc >=
 8.1
Message-ID: <20180720074126.59CC189152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a50447b5d4b2ab0162e3235395ab9a4c8a647d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4c916671..7527b11673 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -121,6 +121,16 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
+# gcc-8 started warning about function aliases that have a
+# non-matching prototype.  This seems rather useful in general, but it
+# causes tons of warnings in the Linux kernel, where we rely on
+# abusing those aliases for system call entry points, in order to
+# sanitize the arguments passed from user space in registers.
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
