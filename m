From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Sat,  4 Mar 2017 07:04:16 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
Message-ID: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/dc3dd/Config.in  |  9 +++++++++
 package/dc3dd/dc3dd.hash |  2 ++
 package/dc3dd/dc3dd.mk   | 19 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/dc3dd/Config.in
 create mode 100644 package/dc3dd/dc3dd.hash
 create mode 100644 package/dc3dd/dc3dd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bf07c3..6ed713b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -146,6 +146,9 @@ F:	package/taskd/
 N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
+N:	Beno?t Allard <benoit.allard@greenbone.net>
+F:	package/dc3dd/
+
 N:	Bernd Kuhls <bernd.kuhls@t-online.de>
 F:	package/apache/
 F:	package/apr/
diff --git a/package/Config.in b/package/Config.in
index 921a06c..376c573 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1762,6 +1762,7 @@ menu "System tools"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
+	source "package/dc3dd/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
new file mode 100644
index 0000000..0a2a32e
--- /dev/null
+++ b/package/dc3dd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DC3DD
+	bool "dc3dd"
+	help
+          dc3dd is a patch to the GNU dd program, this version has several
+          features intended for forensic acquisition of data. Highlights
+          include hashing on-the-fly, split output files, pattern writing, a
+          progress meter, and file verification.
+
+          https://sourceforge.net/projects/dc3dd/
diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
new file mode 100644
index 0000000..edd75c2
--- /dev/null
+++ b/package/dc3dd/dc3dd.hash
@@ -0,0 +1,2 @@
+# From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2.646/dc3dd%207.2.646/
+sha1 3d3d9ba5f3b18fbf4798e1f3554f2d34d0ce5e2c dc3dd-7.2.646.zip
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
new file mode 100644
index 0000000..5a25bee
--- /dev/null
+++ b/package/dc3dd/dc3dd.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# dc3dd
+#
+################################################################################
+
+DC3DD_VERSION = 7.2.646
+DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).zip
+DC3DD_SITE = http://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION)/dc3dd%20$(DC3DD_VERSION)
+DC3DD_LICENSE = GPLv3
+DC3DD_LICENSE_FILES = COPYING
+
+define DC3DD_EXTRACT_CMDS
+        $(UNZIP) -d $(@D)/.. $(DL_DIR)/$(DC3DD_SOURCE) || true
+        chmod a+x $(@D)/configure
+        chmod a+x $(@D)/build-aux/install-sh
+endef
+
+$(eval $(autotools-package))
-- 
2.1.4
