From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 22:33:29 +0100
Subject: [Buildroot] [PATCH 5/8] dependencies: build a host python2 if no
	suitable one can be found
In-Reply-To: <cover.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
Message-ID: <f7b441d9ab5e9f123964f4e8b5c720a15432170b.1356903063.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some distros now comes with only python3 installed, with or without a
/usr/bin/python pointing to python3.

So, /usr/bin/python may refer to either python2 or python3.

This may have some bad consequences for packages that uses some
non python{2,3}-friendly scripts in their build system (eg. in install
or post-install scripts).

This patch checks for a suitable python2 version (2.6 or 2.7) on the host
system, and:
* if a valid python2 interperter is found on the host system, then:
  - a symlink pointing to the found python2 interpreter is created in the
    buildroot host tree at the beginning of the build;
  - a make target host-python2-if-needed is set to '$(HOST_DIR)/usr/bin/python'.
    This way, if the host-python package is built later, the symlink will be
    automatically overriden by the host-python install rules.
* if no valid python2 interperter is found on the host system, then:
  - a make target host-python2-if-needed is set to 'host-python'.

Note 1: The symlink is checked and created if necessary at the beginning of
        each build.
Note 2: Since there is no target named '$(HOST_DIR)/usr/bin/python' in the
        python makefiles, there is no need for removing the symlink before
        installing the host-pyhton package.
Note 3: The host-python is only built when necessary.
        This also means that in the case there is no python2 interperter
        available on the host system, there won't any host python2 interperter
        until the host-python package is built.
Note 4: Any package containing some non python{2,3}-friendly scripts should:
        - have 'host-python2-if-needed' in its *_DEPENDENCIES list;
        - set and add to their build/install environment, either
        PATH="$(HOST_PATH)" or PATH="$(TARGET_PATH)".

A (good) side effect of this patch is getting rid of any host python dependency.

Buildroot can run on a host without python, or with a too old python2 version,
or with only python3.

In any case where a host python2 interpreter is expected to run some build or
install scripts, 'host-python2-if-needed' should be added to the dependency
list.

With this patch, the host python2 interpreter is either found in the host
system, or build by Buildroot. So, we can drop the python dependency check.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/dependencies/check-host-python2.mk | 18 ++++++++++++++++++
 support/dependencies/check-host-python2.sh | 13 +++++++++++++
 support/dependencies/dependencies.sh       |  2 +-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 support/dependencies/check-host-python2.mk
 create mode 100755 support/dependencies/check-host-python2.sh

diff --git a/support/dependencies/check-host-python2.mk b/support/dependencies/check-host-python2.mk
new file mode 100644
index 0000000..5bc2986
--- /dev/null
+++ b/support/dependencies/check-host-python2.mk
@@ -0,0 +1,18 @@
+PYTHON2 = $(call suitable-host-package,python2,$(HOST_DIR)/usr/bin/python)
+
+ifeq ($(PYTHON2),)
+host-python2-if-needed: host-python
+else
+host-python2-if-needed: $(HOST_DIR)/usr/bin/python
+# Create the python symlink once for all at the beginning of the build.
+DEPENDENCIES_HOST_PREREQ += host-python2-symlink
+endif
+
+# host-python install rules override the symlink created here.
+# So, there is no need to patch the python package to remove the symlink
+# before installing itself.
+host-python2-symlink:
+	@mkdir -p $(HOST_DIR)/usr/bin
+	test -x "$(HOST_DIR)/usr/bin/python" -a \
+		"$(PYTHON2)" = "$(HOST_DIR)/usr/bin/python" || \
+		$(HOSTLN) -sf "$(PYTHON2)" "$(HOST_DIR)/usr/bin/python"
diff --git a/support/dependencies/check-host-python2.sh b/support/dependencies/check-host-python2.sh
new file mode 100755
index 0000000..a340674
--- /dev/null
+++ b/support/dependencies/check-host-python2.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+candidates="${@} python python2"
+
+for candidate in ${candidates} ; do
+  which "${candidate}" &>/dev/null || continue
+  # restrict version of python2 to 2.6 or 2.7
+  if "${candidate}" --version 2>&1 | grep -q 'Python 2\.[6-7]\..*' ; then
+    # found a valid candidate, so quit now
+    echo $(which "${candidate}")
+    exit
+  fi
+done
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 7a02512..0a5cf8b 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -131,7 +131,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.8.0.3
