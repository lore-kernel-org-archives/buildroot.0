From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:33:08 +0200
Subject: [Buildroot] [git commit] gdb: add support for Python in host gdb
Message-ID: <20140916210716.0C1599D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d79cc3cdef06365d8f15361beb4758c3c314a1b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds an option BR2_PACKAGE_HOST_GDB_PYTHON that allows to
enable Python support in the cross gdb built by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    5 +++++
 package/gdb/gdb.mk         |    7 +++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 5d0e1b4..1e20cd2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -18,6 +18,11 @@ config BR2_PACKAGE_HOST_GDB_TUI
 	help
 	  This option enables terminal user interface (TUI) for gdb
 
+config BR2_PACKAGE_HOST_GDB_PYTHON
+	bool "Python support"
+	help
+	  This option enables the Python support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4a194e2..e12b12b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -138,6 +138,13 @@ else
 	HOST_GDB_CONF_OPT += --disable-tui
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
+	HOST_GDB_CONF_OPT += --with-python
+	HOST_GDB_DEPENDENCIES += host-python
+else
+	HOST_GDB_CONF_OPT += --without-python
+endif
+
 ifeq ($(GDB_FROM_GIT),y)
 HOST_GDB_DEPENDENCIES += host-texinfo
 else
