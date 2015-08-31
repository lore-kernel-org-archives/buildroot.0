From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:11 +0200
Subject: [Buildroot] [PATCH 6/6] python: Adds tests
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-7-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a 'host' test (usr/bin/python exists) and a few target tests.

Current target tests:
Check Python Version: Should be 2
Check Python Math: import math module and check that it works
Check Python Libc: import ctypes and load libc
Check Python Zlib: import zlib
Check Python SSL: import ssl

Tests of zlib and ssl make sure that the result is correct according
to the buildroot configuration.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/python/python.mk    | 17 +++++++++++++++++
 package/python/python.robot | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/python/python.robot

diff --git a/package/python/python.mk b/package/python/python.mk
index 80ffbde..047567a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -214,6 +214,23 @@ endif
 # Provided to other packages
 PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
 
+# Host Tests
+PYTHON_TEST_INSTALL_LOCATION := /usr/bin/python
+
+# Target tests
+PYTHON_TEST_ORIGINAL = python.robot
+ifeq ($(BR2_PACKAGE_PYTHON_ZLIB),y)
+	PYTHON_TEST_VARIABLES += zlib_return_code=0
+else
+	PYTHON_TEST_VARIABLES += zlib_return_code=1
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
+	PYTHON_TEST_VARIABLES += ssl_return_code=0
+else
+	PYTHON_TEST_VARIABLES += ssl_return_code=1
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/python/python.robot b/package/python/python.robot
new file mode 100644
index 0000000..9ea3203
--- /dev/null
+++ b/package/python/python.robot
@@ -0,0 +1,32 @@
+*** Settings ***
+Documentation       Test suite for package python of buildroot
+Library             Process
+*** Variables ***
+*** Test Cases ***
+Python Version
+    ${result}=              Run Process       python      --version       stderr=STDOUT
+    Should Start With       ${result.stdout}     Python 2
+
+Python Math
+    [Template]      Check Python Return Code of Python Command
+    0       import math; math.floor(12.3)
+
+Python Libc
+    [Template]      Check Python Return Code of Python Command
+    0       import ctypes; libc = ctypes.dll.LoadLibrary(\\"libc.so\\"); print libc.time(None)
+
+Python Zlib
+    [Template]      Check Python Return Code of Python Command
+    ${zlib_return_code}       import zlib
+
+Python SSL
+    [Template]      Check Python Return Code of Python Command
+    ${ssl_return_code}       import ssl
+    
+*** Keywords ***
+Check Python Return Code of Python Command
+    [arguments]     ${return_code}      ${command}
+    ${result}=      Run Process       python      -c      "${command}"
+    Should Be Equal As Integers     ${return_code}      ${result.rc}
+
+
-- 
2.5.0
