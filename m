From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 30 Aug 2018 22:30:54 +0200
Subject: [Buildroot] [for-next: 2/2] dependencies: host-make version check
In-Reply-To: <20180830203054.7373-1-romain.naour@gmail.com>
References: <20180830203054.7373-1-romain.naour@gmail.com>
Message-ID: <20180830203054.7373-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host make program is already checked by dependencies.sh but we
want to check the version number even if Buildroot is able to use
GNU make >= 3.81 but some packages may require a more recent version.

For example, since version 2.28 [1], glibc requires GNU Make >= 4.0.

[1] https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html

Fixes:
http://autobuild.buildroot.net/results/576/5760ea2635d9aecc9c789494a8b2cc73a1af1ceb
http://autobuild.buildroot.net/results/583/58347b94884eee2db28740486eda280e8c08e22f
http://autobuild.buildroot.net/results/dc7/dc7c8cd548409864ab0055e196c0280457a5fb5f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk                  |  3 ++-
 support/dependencies/check-host-make.mk | 17 +++++++++++++
 support/dependencies/check-host-make.sh | 42 +++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 support/dependencies/check-host-make.mk
 create mode 100755 support/dependencies/check-host-make.sh

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 399cf395ce..fd9e394f92 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,7 +28,8 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
-GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk
+GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
+	$(BR2_MAKE_HOST_DEPENDENCY)
 
 GLIBC_SUBDIR = build
 
diff --git a/support/dependencies/check-host-make.mk b/support/dependencies/check-host-make.mk
new file mode 100644
index 0000000000..fa45fac8e0
--- /dev/null
+++ b/support/dependencies/check-host-make.mk
@@ -0,0 +1,17 @@
+# Since version 2.28, glibc requires GNU Make >= 4.0
+# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
+#
+# Set this to either 4.0 or higher, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot. If a
+# package is bumped or a new one added, and it requires a higher
+# version, our package infra will catch it and whine.
+#
+BR2_MAKE_VERSION_MIN = 4.0
+
+BR2_MAKE ?= $(call suitable-host-package,make,\
+	$(BR2_MAKE_VERSION_MIN) $(MAKE))
+
+ifeq ($(BR2_MAKE),)
+BR2_MAKE = $(HOST_DIR)/bin/make
+BR2_MAKE_HOST_DEPENDENCY = host-make
+endif
diff --git a/support/dependencies/check-host-make.sh b/support/dependencies/check-host-make.sh
new file mode 100755
index 0000000000..9c31f4a415
--- /dev/null
+++ b/support/dependencies/check-host-make.sh
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+# prevent shift error
+[ $# -lt 2 ] && exit 1
+
+major_min="${1%.*}"
+minor_min="${1#*.}"
+
+shift
+
+# The host make program is already checked by dependencies.sh but we
+# want to check the version number even if Buildroot is able to use
+# GNU make >= 3.81 but some packages may require a more recent version.
+make="$1"
+
+# Output of 'make --version' examples:
+# GNU Make 4.2.1
+# GNU Make 4.0
+# GNU Make 3.81
+version=`$make --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\
+].*//g' -e '1q'`
+
+major=`echo "$version" | cut -d. -f1`
+minor=`echo "$version" | cut -d. -f2`
+bugfix=`echo "$version" | cut -d. -f3`
+
+if [ -z "${bugfix}" ] ; then
+	bugfix=0
+fi
+
+if [ $major -lt $major_min ]; then
+	# echo nothing: no suitable make found
+	exit 1
+fi
+
+if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
+	# echo nothing: no suitable make found
+	exit 1
+fi
+
+# valid
+echo $make
-- 
2.14.4
