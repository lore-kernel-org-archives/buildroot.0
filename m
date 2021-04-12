From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 10:13:41 -0500
Subject: [Buildroot] [PATCH] package/python-wpaspy: add python-wpaspy
Message-ID: <20210412151341.50721-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

Update to add python-wpaspy. It is a package that includes
python bindings for wpa_ctrl.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...spy-update-setup.py-to-use-wpaspy.py.patch | 45 +++++++++++++++++++
 package/python-wpaspy/Config.in               |  6 +++
 package/python-wpaspy/python-wpaspy.hash      |  3 ++
 package/python-wpaspy/python-wpaspy.mk        | 17 +++++++
 6 files changed, 73 insertions(+)
 create mode 100644 package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch
 create mode 100644 package/python-wpaspy/Config.in
 create mode 100644 package/python-wpaspy/python-wpaspy.hash
 create mode 100644 package/python-wpaspy/python-wpaspy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 478894582e..e997c0e60a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1793,6 +1793,7 @@ F:	package/python-pyrex/
 F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
+F:	package/python-wpaspy/
 F:	package/qoriq-rcw/
 F:	package/raptor/
 F:	package/rng-tools/
diff --git a/package/Config.in b/package/Config.in
index 621bdca9d0..3e0b288f88 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1250,6 +1250,7 @@ menu "External python modules"
 	source "package/python-websockets/Config.in"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-whoosh/Config.in"
+	source "package/python-wpaspy/Config.in"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
diff --git a/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch b/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch
new file mode 100644
index 0000000000..bfa6e9609a
--- /dev/null
+++ b/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch
@@ -0,0 +1,45 @@
+From b25579dd576ef125741fc72bd39239cb7e60a1e5 Mon Sep 17 00:00:00 2001
+From: Jared Bents <jared.bents@rockwellcollins.com>
+Date: Wed, 1 Apr 2020 10:58:49 -0500
+Subject: [PATCH] wpaspy: update setup.py to use wpaspy.py
+
+update setup.py to use wpaspy.py instead of wpaspy.c due to
+information from Jouni Malinen in the linked mailing list
+correspondence
+
+http://lists.infradead.org/pipermail/hostap/2020-April/041575.html
+
+Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
+---
+ wpaspy/setup.py | 18 ++++++------------
+ 1 file changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/wpaspy/setup.py b/wpaspy/setup.py
+index 4dbf76540..6b924f5f1 100644
+--- a/wpaspy/setup.py
++++ b/wpaspy/setup.py
+@@ -8,15 +8,9 @@
+ 
+ from distutils.core import setup, Extension
+ 
+-ext = Extension(name = 'wpaspy',
+-                sources = ['../src/common/wpa_ctrl.c',
+-                           '../src/utils/os_unix.c',
+-                           'wpaspy.c'],
+-                extra_compile_args = ["-I../src/common",
+-                                      "-I../src/utils",
+-                                      "-DCONFIG_CTRL_IFACE",
+-                                      "-DCONFIG_CTRL_IFACE_UNIX"])
+-
+-setup(name = 'wpaspy',
+-      ext_modules = [ext],
+-      description = 'Python bindings for wpa_ctrl (wpa_supplicant/hostapd)')
++setup(
++    name = "wpaspy",
++    description = "Python bindings for wpa_ctrl (wpa_supplicant/hostapd)",
++    py_modules = ["wpaspy"],
++    license = "BSD-3-Clause",
++    )
+-- 
+2.17.1
+
diff --git a/package/python-wpaspy/Config.in b/package/python-wpaspy/Config.in
new file mode 100644
index 0000000000..a35cefb86c
--- /dev/null
+++ b/package/python-wpaspy/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_WPASPY
+	bool "python-wpaspy"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT #runtime dependency
+	help
+	  Python bindings for wpa_ctrl
+	  (wpa_supplicant/hostapd control interface)
diff --git a/package/python-wpaspy/python-wpaspy.hash b/package/python-wpaspy/python-wpaspy.hash
new file mode 100644
index 0000000000..b27eb79546
--- /dev/null
+++ b/package/python-wpaspy/python-wpaspy.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  cb8ddbab4bf715aeeae67fbb06d85995fccb6f6180968247ea1aff250115ad44  hostap_2_9.tar.gz
+sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
diff --git a/package/python-wpaspy/python-wpaspy.mk b/package/python-wpaspy/python-wpaspy.mk
new file mode 100644
index 0000000000..45d12844c6
--- /dev/null
+++ b/package/python-wpaspy/python-wpaspy.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-wpaspy
+#
+################################################################################
+
+PYTHON_WPASPY_VERSION = 2_9
+PYTHON_WPASPY_SOURCE = hostap_$(PYTHON_WPASPY_VERSION).tar.gz
+PYTHON_WPASPY_SITE = https://w1.fi/cgit/hostap/snapshot
+PYTHON_WPASPY_SUBDIR = wpaspy
+PYTHON_WPASPY_CFLAGS = $(TARGET_CFLAGS)
+PYTHON_WPASPY_LICENSE = BSD-3-Clause
+PYTHON_WPASPY_LICENSE_FILES = README
+PYTHON_WPASPY_CPE_ID_VENDOR = w1.fi
+PYTHON_WPASPY_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.17.1
