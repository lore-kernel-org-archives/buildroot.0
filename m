From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Mar 2019 17:59:16 +0100
Subject: [Buildroot] [PATCH 1/2] support/dependencies: add a check for
 python3
Message-ID: <20190310165917.24325-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2.29, glibc requires python 3.4 or later to build the GNU C Library [1].

We add a new check to verify the version of python3 interpreter installed on the host.
If no suitable python3 interpreter is found, define BR2_PYTHON3_HOST_DEPENDENCY to add
host-python3 in package dependencies when needed.

[1] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/dependencies/check-host-python3.mk | 13 ++++++++++
 support/dependencies/check-host-python3.sh | 41 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 support/dependencies/check-host-python3.mk
 create mode 100755 support/dependencies/check-host-python3.sh

diff --git a/support/dependencies/check-host-python3.mk b/support/dependencies/check-host-python3.mk
new file mode 100644
index 0000000000..ceb48c969e
--- /dev/null
+++ b/support/dependencies/check-host-python3.mk
@@ -0,0 +1,13 @@
+# Since version 2.29, glibc requires python 3.4 or later to build the GNU C Library.
+# https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html
+
+# Set this to either 3.4 or higher, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot. If a
+# package is bumped or a new one added, and it requires a higher
+# version, our package infra will catch it and whine.
+#
+BR2_PYTHON3_VERSION_MIN = 3.4
+
+ifeq (,$(call suitable-host-package,python3,$(BR2_PYTHON3_VERSION_MIN) python3 python))
+BR2_PYTHON3_HOST_DEPENDENCY = host-python3
+endif
diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
new file mode 100755
index 0000000000..e5745fa7c4
--- /dev/null
+++ b/support/dependencies/check-host-python3.sh
@@ -0,0 +1,41 @@
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
+# The host python interpreter is already checked by dependencies.sh but
+# it only check if the version is at least 2.7.
+# We want to check the version number of the python3 interpreter even
+# if Buildroot is able to use any version but some packages may require
+# a more recent version.
+python3_candidates="$1"
+
+for candidate in $python3_candidates ; do
+	python3=`which $candidate 2>/dev/null`
+	if [ ! -x "$python3" ]; then
+		continue
+	fi
+	version=`$python3 -V 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-].*//g' -e '1q'`
+
+	major=`echo "$version" | cut -d. -f1`
+	minor=`echo "$version" | cut -d. -f2`
+
+	if [ $major -lt $major_min ]; then
+		# no suitable python3 found
+		continue
+	fi
+
+	if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
+		# no suitable python3 found
+		continue
+	fi
+
+	# suitable python3 found
+	echo $python3
+	break
+done
-- 
2.14.5
