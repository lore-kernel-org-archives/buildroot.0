From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:08 +0200
Subject: [Buildroot] [PATCH 3/6] tests: create variable files through kconfig
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-4-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install of target tests can now be selected from menuconfig
This patch adds a new menu entry in Config.in in order to configure
the test environnment.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 Config.in       | 6 ++++++
 tests/Config.in | 8 ++++++++
 tests/tests.mk  | 3 +++
 3 files changed, 17 insertions(+)
 create mode 100644 tests/Config.in

diff --git a/Config.in b/Config.in
index 8b1bd8d..51e0ea2 100644
--- a/Config.in
+++ b/Config.in
@@ -624,3 +624,9 @@ menu "User-provided options"
 source "$BR2_EXTERNAL/Config.in"
 
 endmenu
+
+menu "Test Configuration Settings"
+
+source "tests/Config.in"
+
+endmenu
diff --git a/tests/Config.in b/tests/Config.in
new file mode 100644
index 0000000..937753c
--- /dev/null
+++ b/tests/Config.in
@@ -0,0 +1,8 @@
+comment "Target tests require robotframework"
+	depends on !BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+
+config BR2_TEST_TARGET
+	bool "Install tests to target"
+	depends on BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+	help
+	  Enable this if you want to install tests on your target
diff --git a/tests/tests.mk b/tests/tests.mk
index a246c6e..ad05f7c 100644
--- a/tests/tests.mk
+++ b/tests/tests.mk
@@ -6,6 +6,9 @@ tests-common-resources: host-python-robotframework
 	echo target_dir = \"$(TARGET_DIR)\" >> $(TEST_DIR)/host/resources/common_variables.py
 	mkdir -p $(TEST_DIR)/target
 	cp -r tests/target $(TEST_DIR)/target/resources
+ifeq ($(BR2_TEST_TARGET),y)
+	cp -r $(TEST_DIR)/target $(TARGET_DIR)/usr/share/buildroot_tests
+endif
 
 
 PYBOT = $(HOST_DIR)/usr/bin/pybot
-- 
2.5.0
