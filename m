From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:29:58 +0100
Subject: [Buildroot] [git commit] taskd: new package
Message-ID: <20160310223005.740938080F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3cbf3e564e890f7fe08aab5c8fa7b8beccff10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Taskwarrior is a task management suite of tools. Taskd is the
synchronization server for it.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
[Thomas:
 - use 'depends on' for BR2_USE_MMU, and add a comment indicating that
   the dependency is due to the use of fork()
 - use 'depends on' for BR2_USE_WCHAR, and add a comment indicating
   that the dependency is due to gnutls and util-linux.
 - add a hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/taskd/Config.in  | 15 +++++++++++++++
 package/taskd/taskd.hash |  4 ++++
 package/taskd/taskd.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d916154..35a24ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1489,6 +1489,7 @@ endif
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
+	source "package/taskd/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
new file mode 100644
index 0000000..2836161
--- /dev/null
+++ b/package/taskd/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_TASKD
+	bool "taskd"
+	depends on BR2_USE_WCHAR # gnutls, util-linux
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Task management synchronization daemon.
+
+	  http://taskwarrior.org/
+
+comment "taskd needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/taskd/taskd.hash b/package/taskd/taskd.hash
new file mode 100644
index 0000000..41d37bb
--- /dev/null
+++ b/package/taskd/taskd.hash
@@ -0,0 +1,4 @@
+# From http://taskwarrior.org/download/
+sha1 ded339deeee65277e4712f71a9159502f8b20b52 taskd-1.1.0.tar.gz
+# Locally calculated
+sha256 7b8488e687971ae56729ff4e2e5209ff8806cf8cd57718bfd7e521be130621b4 taskd-1.1.0.tar.gz
diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
new file mode 100644
index 0000000..0bdf81d
--- /dev/null
+++ b/package/taskd/taskd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# taskd
+#
+################################################################################
+
+TASKD_VERSION = 1.1.0
+TASKD_SOURCE = taskd-$(TASKD_VERSION).tar.gz
+TASKD_SITE = http://taskwarrior.org/download
+TASKD_LICENSE = MIT
+TASKD_LICENSE_FILES = COPYING LICENSE
+TASKD_DEPENDENCIES = gnutls util-linux
+
+$(eval $(cmake-package))
