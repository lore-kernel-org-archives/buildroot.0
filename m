From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 09:38:01 +0200
Subject: [Buildroot] [PATCHv2] nodejs: fix build when python3 is selected in
	Buildroot
Message-ID: <1400657881-30959-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When Python 3 is selected in Buildroot, the host/usr/bin/python
symlink of the host Python interpreter points to python3. Packages
that need to use the host Python 2 interpreter have to use python2.

In commit 40218a16526946f35dab0d05f379f71a01f29530 ("nodejs: force
python interpreter"), Samuel made some changes to the nodejs package
to use python2. One part of the changes is to sed a .gyp file to
replace the string 'python' by the path to python2. However, this
operation is done *after* calling the configure script, so it has in
fact no effect. Putting this sed before calling the configure script
fixes the problem.

However, there is a better solution: the nodejs build system has a
mechanism of variables, and it already defines a python variable
according to the environment variable PYTHON being passed. So this
patch instead adds a new patch to nodejs to use this python variable.

Fixes:

  http://autobuild.buildroot.org/results/aff/affd7300895ec400de50a33d51b4e94e15d63341/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Remove obsolete comment above host configure commands
 - Remove useless SED command in the target configure commands

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../nodejs/nodejs-0003-use-python-variable.patch   | 43 ++++++++++++++++++++++
 package/nodejs/nodejs.mk                           |  6 ---
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 package/nodejs/nodejs-0003-use-python-variable.patch

diff --git a/package/nodejs/nodejs-0003-use-python-variable.patch b/package/nodejs/nodejs-0003-use-python-variable.patch
new file mode 100644
index 0000000..f231f4c
--- /dev/null
+++ b/package/nodejs/nodejs-0003-use-python-variable.patch
@@ -0,0 +1,43 @@
+Use a python variable instead of hardcoding Python
+
+The nodejs build system uses python in a number of locations. However,
+there are some locations where it hardcodes 'python' as the Python
+interpreter. However, this causes problems when we need to use python2
+instead of just python.
+
+This patch fixes that by using the python variable already in place in
+the nodejs build system.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/deps/v8/tools/gyp/v8.gyp
+===================================================================
+--- a/deps/v8/tools/gyp/v8.gyp
++++ b/deps/v8/tools/gyp/v8.gyp
+@@ -792,7 +792,7 @@
+                 '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
+               ],
+               'action': [
+-                'python',
++                '<(python)',
+                 '../../tools/js2c.py',
+                 '<@(_outputs)',
+                 'CORE',
+@@ -810,7 +810,7 @@
+                 '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
+               ],
+               'action': [
+-                'python',
++                '<(python)',
+                 '../../tools/js2c.py',
+                 '<@(_outputs)',
+                 'EXPERIMENTAL',
+@@ -840,7 +840,7 @@
+                   '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
+                 ],
+                 'action': [
+-                  'python',
++                  '<(python)',
+                   '../../tools/gen-postmortem-metadata.py',
+                   '<@(_outputs)',
+                   '<@(heapobject_files)'
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b5973b5..a85384e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -19,8 +19,6 @@ endif
 
 # nodejs build system is based on python, but only support python-2.6 or
 # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
-# However, few build scripts hard-code 'python' as the interpreter to be
-# invoked; so we have to manually fix them.
 define HOST_NODEJS_CONFIGURE_CMDS
 	# Build with the static, built-in OpenSSL which is supplied as part of
 	# the nodejs source distribution.  This is needed on the host because
@@ -35,8 +33,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--without-dtrace \
 		--without-etw \
 	)
-	$(SED) "s@'python',@'$(HOST_DIR)/usr/bin/python2',@" \
-		$(@D)/deps/v8/tools/gyp/v8.gyp
 endef
 
 define HOST_NODEJS_BUILD_CMDS
@@ -81,8 +77,6 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
 		--dest-os=linux \
 	)
-	$(SED) "s@'python',@'$(HOST_DIR)/usr/bin/python2',@" \
-		$(@D)/deps/v8/tools/gyp/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
-- 
1.9.3
