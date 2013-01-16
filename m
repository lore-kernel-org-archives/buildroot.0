From: Matt Weber <rc.lsw.collaborate@gmail.com>
Date: Wed, 16 Jan 2013 06:12:52 -0600
Subject: [Buildroot] [PATCH 1/2] new package: python-posix_ipc.
Message-ID: <1358338373-8288-1-git-send-email-rc.lsw.collaborate@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Weber <matthew.l.weber@gmail.com>


Signed-off-by: Matt Weber <rc.lsw.collaborate@gmail.com>
---
 package/python-posix_ipc/Config.in           |   10 +++++++++
 package/python-posix_ipc/python-posix_ipc.mk |   29 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 package/python-posix_ipc/Config.in
 create mode 100644 package/python-posix_ipc/python-posix_ipc.mk

diff --git a/package/python-posix_ipc/Config.in b/package/python-posix_ipc/Config.in
new file mode 100644
index 0000000..276fe29
--- /dev/null
+++ b/package/python-posix_ipc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_POSIX_IPC
+	bool "python-posix_ipc"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  The Python extension module posix_ipc gives access to POSIX 
+	  inter-process semaphores, shared memory and message queues 
+	  on systems that support the POSIX Realtime Extensions a.k.a. POSIX 1003.1b-1993.
+
+	  http://semanchuk.com/philip/posix_ipc/
diff --git a/package/python-posix_ipc/python-posix_ipc.mk b/package/python-posix_ipc/python-posix_ipc.mk
new file mode 100644
index 0000000..19fc0bf
--- /dev/null
+++ b/package/python-posix_ipc/python-posix_ipc.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# python-posix_ipc
+#
+#############################################################
+
+PYTHON_POSIX_IPC_VERSION = 0.9.3
+PYTHON_POSIX_IPC_SOURCE  = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
+PYTHON_POSIX_IPC_SITE    = http://semanchuk.com/philip/posix_ipc/
+
+PYTHON_POSIX_IPC_DEPENDENCIES = python host-python-setuptools host-python-distutilscross
+
+define PYTHON_POSIX_IPC_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+		CFLAGS="$(TARGET_CFLAGS)" 	\
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" 	\
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_POSIX_IPC_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
