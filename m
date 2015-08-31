From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:10 +0200
Subject: [Buildroot] [PATCH 5/6] flask: Adds robotframework tests
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-6-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a 'host' test to check that the flask folder is created,
a 'target' test that checks that flask runs correctly

The 'host' test is ran on the target folder, it merely checks that
the flask folder exists

The 'target' test starts a flask process on a specified port and localhost

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/python-flask/python-flask.mk               |  5 +++++
 .../target_test_material/target_test.robot         | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/python-flask/target_test_material/target_test.robot

diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 8aa675e..18dc846 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -12,4 +12,9 @@ PYTHON_FLASK_LICENSE = BSD-3c
 PYTHON_FLASK_LICENSE_FILES = LICENSE
 PYTHON_FLASK_DEPENDENCIES = python-werkzeug python-jinja2 python-itsdangerous
 
+
+PYTHON_FLASK_TEST_INSTALL_LOCATION = /usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/flask
+
+PYTHON_FLASK_TEST_MATERIAL = target_test_material
+
 $(eval $(python-package))
diff --git a/package/python-flask/target_test_material/target_test.robot b/package/python-flask/target_test_material/target_test.robot
new file mode 100644
index 0000000..78f4d38
--- /dev/null
+++ b/package/python-flask/target_test_material/target_test.robot
@@ -0,0 +1,25 @@
+*** Settings ***
+Documentation   This is a simple test suite meant to make sure that flask works
+...             properly. Please ensure that no other program is using tcp port
+...             5000 before running it.
+Library         Process
+*** Variables ***
+${flask_range}=         "127.0.0.1"
+${flask_port}=          5000
+${flask_address}=       "127.0.0.1"
+*** Test Cases ***
+Test Port
+    [setup]         Start Flask With Hello World
+    [Teardown]      Kill Flask
+    Wait Until Keyword Succeeds      2 sec    10 sec     Wget Returns OK
+*** Keywords ***
+Start Flask With Hello World
+    ${handle}=    Start Process     python2     -c     from flask import Flask; app \= Flask(__name__); app.route(\"/\")(lambda: \"hello world\"); app.run(host\=${flask_range},port\=${flask_port})
+    Set Suite Variable    ${HANDLE}    ${handle}
+
+Kill Flask
+    Terminate Process    ${HANDLE}
+
+Wget Returns Ok
+    ${result}=      Run Process     wget    http://127.0.0.1:5000
+    Should Be Equal As Integers    0   ${result.rc}
-- 
2.5.0
