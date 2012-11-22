From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:04 +0100
Subject: [Buildroot] [PATCH 14/33] dependencies: build a host python2 if no
	suitable one can be found
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-15-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some distros choose to change the /usr/bin/python binary, making it pointed
to python3 instead of python2.

This may have some bad consequences for packages that uses some
non-python3-compliant python scripts in their build system (eg. in install
or post-install scripts).

This patch checks for a suitable python2 version (2.6 or 2.7) on the host
system, and declares the following variables:
- PYTHON2: pointing to the host python2 binary;
- NEED_PYTHON2: sets to "host-python" if no python2 binary has been found.

This way, a package using some python2 scripts must:
- adds $(NEED_PYTHON2) to its dependency list;
- sets $(PYTHON2) as the python binary to be used.

A side effect of this patch is getting rid of any host python. Buildroot
can runs on a host without python, or with a too old python2 version, or
with only python3; in such case, $(NEED_PYTHON2) should be added to the
dependency list. So, we can get rid of the python dependency check.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/dependencies/check-host-python2.mk |  6 ++++++
 support/dependencies/check-host-python2.sh | 13 +++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 support/dependencies/check-host-python2.mk
 create mode 100755 support/dependencies/check-host-python2.sh

diff --git a/support/dependencies/check-host-python2.mk b/support/dependencies/check-host-python2.mk
new file mode 100644
index 0000000..ddae701
--- /dev/null
+++ b/support/dependencies/check-host-python2.mk
@@ -0,0 +1,6 @@
+PYTHON2 = $(call suitable-host-package,python2)
+
+ifeq ($(PYTHON2),)
+  NEED_PYTHON2 = host-python
+  PYTHON2 = $(HOST_DIR)/usr/bin/python
+endif
diff --git a/support/dependencies/check-host-python2.sh b/support/dependencies/check-host-python2.sh
new file mode 100755
index 0000000..6ad4b3a
--- /dev/null
+++ b/support/dependencies/check-host-python2.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+candidates="python python2"
+
+for candidate in ${candidates} ; do
+  which ${candidate} &>/dev/null || continue
+  # restrict version of python2 to 2.6 or 2.7
+  if ${candidate} --version 2>&1 | grep -q 'Python 2\.[6-7].*' ; then
+    # found a valid candidate, so quit now
+    echo $(which ${candidate})
+    exit
+  fi
+done
-- 
1.8.0
