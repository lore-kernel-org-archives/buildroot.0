From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jun 2014 13:48:54 +0200
Subject: [Buildroot] [git commit] ftop: new package
Message-ID: <20140630120027.A60879D122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82c9989691287668d30d3fd37281af7ed106b69f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                     |    1 +
 package/ftop/Config.in                |   12 ++++++++++++
 package/ftop/ftop-0001-overflow.patch |   17 +++++++++++++++++
 package/ftop/ftop.mk                  |   13 +++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d7e1acc..3f3b8d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1118,6 +1118,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/cpuload/Config.in"
 	source "package/dsp-tools/Config.in"
+	source "package/ftop/Config.in"
 	source "package/htop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/keyutils/Config.in"
diff --git a/package/ftop/Config.in b/package/ftop/Config.in
new file mode 100644
index 0000000..878574f
--- /dev/null
+++ b/package/ftop/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FTOP
+	bool "ftop"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_NCURSES
+	help
+	  Ftop is to files what top is to processes.
+	  The progress of all open files and file systems can be monitored.
+
+	  https://code.google.com/p/ftop/
+
+comment "ftop needs a toolchain w/ largefile"
+        depends on !BR2_LARGEFILE
diff --git a/package/ftop/ftop-0001-overflow.patch b/package/ftop/ftop-0001-overflow.patch
new file mode 100644
index 0000000..a3a27c3
--- /dev/null
+++ b/package/ftop/ftop-0001-overflow.patch
@@ -0,0 +1,17 @@
+Set tmp_buf and rate_buf to something ridiculously high to fix a buffer
+overflow when COLUMNS is large. - JeR
+
+(Taken from gentoo portage)
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/ftop.c	2009-02-16 07:00:00.000000000 +0100
++++ b/src/ftop.c	2013-09-06 14:42:41.788852952 +0200
+@@ -736,7 +736,7 @@
+ {
+     size_t i, j, bytes, bar_total;
+     char more_procs_ch, more_files_ch, expanded_ch;
+-    char tmp_buf[80], rate_buf[80];
++    char tmp_buf[2048], rate_buf[2048];
+     char *tmp_str;
+     snapshot *s, *s_prev;
+     file_info *tmp_file;
diff --git a/package/ftop/ftop.mk b/package/ftop/ftop.mk
new file mode 100644
index 0000000..2220317
--- /dev/null
+++ b/package/ftop/ftop.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# ftop
+#
+################################################################################
+
+FTOP_VERSION = 1.0
+FTOP_SITE = http://ftop.googlecode.com/files/
+FTOP_DEPENDENCIES = ncurses
+FTOP_LICENSE = GPLv3+
+FTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
