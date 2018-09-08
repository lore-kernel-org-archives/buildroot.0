From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:36:36 +0200
Subject: [Buildroot] [git commit] dependencies: host-make version check
Message-ID: <20180908213619.5CFCA83774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6db3df79940c84e51eb413907237112d6b2fa9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host make program is already checked by dependencies.sh but we
want to check the version number even if Buildroot is able to use
GNU make >= 3.81 but some packages may require a more recent version.

For example, since version 2.28 [1], glibc requires GNU Make >= 4.0.

For packages requiring make >= 4.0, the package makefile must use:
<PKG>_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) ...
<PKG>_MAKE = $(BR2_MAKE)

BR2_MAKE1 is also available if needed.

[1] https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: remove extraction of "bugfix" part of the version, since it's
not used anywhere.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/check-host-make.mk | 21 +++++++++++++++++++
 support/dependencies/check-host-make.sh | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/support/dependencies/check-host-make.mk b/support/dependencies/check-host-make.mk
new file mode 100644
index 0000000000..4235a393fd
--- /dev/null
+++ b/support/dependencies/check-host-make.mk
@@ -0,0 +1,21 @@
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
+BR2_MAKE = $(HOST_DIR)/bin/make -j$(PARALLEL_JOBS)
+BR2_MAKE1 = $(HOST_DIR)/bin/make -j1
+BR2_MAKE_HOST_DEPENDENCY = host-make
+else
+BR2_MAKE = $(MAKE)
+BR2_MAKE1 = $(MAKE1)
+endif
diff --git a/support/dependencies/check-host-make.sh b/support/dependencies/check-host-make.sh
new file mode 100755
index 0000000000..0de7e9f6fa
--- /dev/null
+++ b/support/dependencies/check-host-make.sh
@@ -0,0 +1,37 @@
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
