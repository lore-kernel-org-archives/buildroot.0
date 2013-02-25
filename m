From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 25 Feb 2013 15:47:36 -0300
Subject: [Buildroot] [PATCHv3] f2fs-tools: new package
Message-ID: <1361818056-2789-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---

v2->v3:
* Comment on why AUTORECONF as pointed by Yann
* Add license definitions, Yann again!

v1->v2:
* Switch from git:// to http:// as recommended by Yegor Yefremov
* ac_cv_file__git should be "no" since it's tagged as a release (VERSION file)

 package/Config.in                |  1 +
 package/f2fs-tools/Config.in     | 12 ++++++++++++
 package/f2fs-tools/f2fs-tools.mk | 17 +++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/f2fs-tools/Config.in
 create mode 100644 package/f2fs-tools/f2fs-tools.mk

diff --git a/package/Config.in b/package/Config.in
index a0404ad..4defd72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/exfat/Config.in"
 source "package/exfat-utils/Config.in"
+source "package/f2fs-tools/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
new file mode 100644
index 0000000..20db928
--- /dev/null
+++ b/package/f2fs-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_F2FS_TOOLS
+	bool "f2fs-tools"
+	select BR2_PACKAGE_UTIL_LINUX
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  Tools for Flash-Friendly File System (F2FS)
+
+	  http://sourceforge.net/projects/f2fs-tools/
+
+comment "f2fs-tools requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
new file mode 100644
index 0000000..f217bf4
--- /dev/null
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# f2fs-tools
+#
+#############################################################
+
+F2FS_TOOLS_VERSION = e3eadd686ed1da1828f32977a36b694bc0090f4e
+F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
+F2FS_TOOLS_SITE_METHOD = git
+F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
+F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
+# GIT version, shipped without configure
+F2FS_TOOLS_AUTORECONF = YES
+F2FS_LICENSE = GPLv2
+F2FS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.12.4
