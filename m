From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:43:41 +0200
Subject: [Buildroot] [PATCH v2 1/2] dependencies: build a host python2 if no
	suitable one can be found
In-Reply-To: <4FAD8F82.6010007@mind.be>
References: <4FAD8F82.6010007@mind.be>
Message-ID: <1336905822-10021-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some distros choose to change the /usr/bin/python binary, make it pointed to
python3 instead of python2.

This may have some bad consequences for packages that uses some
non-python3-compliant python scripts in their build system (eg. in install or
post-install scripts).

This patch checks for a suitable python2 version (2.6 or 2.7) on the host
system, and declares the following variables:
- PYTHON2: pointing to the host python2 binary;
- NEED_PYTHON2: sets to "host-python" if no python2 binary has been found.

This way, a package using some python2 scripts must:
- adds $(NEED_PYTHON2) to its dependency list;
- sets $(PYTHON2) as the python binary to be used.

A side effect of this patch is getting rid of any host python requirement.
Buildroot can runs on a host without python, or with a too old python2 version,
or with only python3.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 support/dependencies/check-host-python2.mk
 create mode 100755 support/dependencies/check-host-python2.sh

diff --git a/support/dependencies/check-host-python2.mk b/support/dependencies/check-host-python2.mk
new file mode 100644
index 0000000..79197cb
--- /dev/null
+++ b/support/dependencies/check-host-python2.mk
@@ -0,0 +1,7 @@
+PYTHON2 := $(call suitable-host-package,python2)
+NEED_PYTHON2 :=
+
+ifeq (,$(PYTHON2))
+  NEED_PYTHON2 = host-python
+  PYTHON2 = $(HOST_DIR)/usr/bin/python
+endif
diff --git a/support/dependencies/check-host-python2.sh b/support/dependencies/check-host-python2.sh
new file mode 100755
index 0000000..6adb328
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
+  if ${candidate} --version 2>&1 | grep -qE 'Python 2\.[6-7]*' ; then
+    # found a valid candidate, so quit now
+    echo $(which ${candidate})
+    exit
+  fi
+done
--
1.7.10.2
