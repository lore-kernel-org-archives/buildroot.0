From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:51:56 +0100
Subject: [Buildroot] [PATCH 4/9] New package: Google Breakpad library
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-5-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The breakpad library is a crash reporting framework

See http://code.google.com/p/google-breakpad/ for more details

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/Config.in                                  |    1 +
 package/breakpad/Config.in                         |    7 ++++
 .../breakpad-782_crash_generation_server.patch     |   12 +++++++
 .../breakpad-782_linux_client_cleanup.patch        |   33 ++++++++++++++++++++
 package/breakpad/breakpad-782_linux_exit.patch     |   22 +++++++++++++
 package/breakpad/breakpad.mk                       |   16 +++++++++
 6 files changed, 91 insertions(+), 0 deletions(-)
 create mode 100644 package/breakpad/Config.in
 create mode 100644 package/breakpad/breakpad-782_crash_generation_server.patch
 create mode 100644 package/breakpad/breakpad-782_linux_client_cleanup.patch
 create mode 100644 package/breakpad/breakpad-782_linux_exit.patch
 create mode 100644 package/breakpad/breakpad.mk

diff --git a/package/Config.in b/package/Config.in
index 28cd36f..c14561a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -355,6 +355,7 @@ source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/orc/Config.in"
 source "package/startup-notification/Config.in"
+source "package/breakpad/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/breakpad/Config.in b/package/breakpad/Config.in
new file mode 100644
index 0000000..64042e0
--- /dev/null
+++ b/package/breakpad/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BREAKPAD
+	bool "breakpad"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  An open-source multi-platform crash reporting system 
+
+	  http://code.google.com/p/google-breakpad/
diff --git a/package/breakpad/breakpad-782_crash_generation_server.patch b/package/breakpad/breakpad-782_crash_generation_server.patch
new file mode 100644
index 0000000..ca6693e
--- /dev/null
+++ b/package/breakpad/breakpad-782_crash_generation_server.patch
@@ -0,0 +1,12 @@
+Index: Makefile.am
+===================================================================
+--- a/Makefile.am	(revision 782)
++++ b/Makefile.am	(working copy)
+@@ -64,6 +64,7 @@
+ 
+ src_client_linux_libbreakpad_client_a_SOURCES = \
+ 	src/client/linux/crash_generation/crash_generation_client.cc \
++	src/client/linux/crash_generation/crash_generation_server.cc \
+ 	src/client/linux/handler/exception_handler.cc \
+ 	src/client/linux/minidump_writer/linux_dumper.cc \
+ 	src/client/linux/minidump_writer/minidump_writer.cc \
diff --git a/package/breakpad/breakpad-782_linux_client_cleanup.patch b/package/breakpad/breakpad-782_linux_client_cleanup.patch
new file mode 100644
index 0000000..d7c4cd7
--- /dev/null
+++ b/package/breakpad/breakpad-782_linux_client_cleanup.patch
@@ -0,0 +1,33 @@
+Index: src/client/linux/crash_generation/crash_generation_client.cc
+===================================================================
+--- a/src/client/linux/crash_generation/crash_generation_client.cc	(revision 778)
++++ b/src/client/linux/crash_generation/crash_generation_client.cc	(working copy)
+@@ -40,6 +40,13 @@
+ 
+ namespace google_breakpad {
+ 
++
++CrashGenerationClient::~CrashGenerationClient()
++{
++  if (server_fd_ >= 0)
++    sys_close(server_fd_);
++}
++
+ bool
+ CrashGenerationClient::RequestDump(const void* blob, size_t blob_size)
+ {
+Index: src/client/linux/crash_generation/crash_generation_client.h
+===================================================================
+--- a/src/client/linux/crash_generation/crash_generation_client.h	(revision 778)
++++ b/src/client/linux/crash_generation/crash_generation_client.h	(working copy)
+@@ -36,9 +36,7 @@
+ 
+ class CrashGenerationClient {
+ public:
+-  ~CrashGenerationClient()
+-  {
+-  }
++  ~CrashGenerationClient();
+ 
+   // Request the crash server to generate a dump.  |blob| is a hack,
+   // see exception_handler.h and minidump_writer.h
diff --git a/package/breakpad/breakpad-782_linux_exit.patch b/package/breakpad/breakpad-782_linux_exit.patch
new file mode 100644
index 0000000..6092cb1
--- /dev/null
+++ b/package/breakpad/breakpad-782_linux_exit.patch
@@ -0,0 +1,22 @@
+Index: src/client/linux/crash_generation/crash_generation_server.cc
+===================================================================
+--- a/src/client/linux/crash_generation/crash_generation_server.cc	(revision 778)
++++ b/src/client/linux/crash_generation/crash_generation_server.cc	(working copy)
+@@ -298,7 +298,17 @@
+ CrashGenerationServer::ClientEvent(short revents)
+ {
+   if (POLLHUP & revents)
++  {
++    if (exit_callback_) {
++      ClientInfo info;
++
++      info.crash_server_ = this;
++      info.pid_ = -1;
++
++      exit_callback_(exit_context_, &info);
++    }
+     return false;
++  }
+   assert(POLLIN & revents);
+ 
+   // A process has crashed and has signaled us by writing a datagram
diff --git a/package/breakpad/breakpad.mk b/package/breakpad/breakpad.mk
new file mode 100644
index 0000000..4880867
--- /dev/null
+++ b/package/breakpad/breakpad.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# breakpad
+#
+#############################################################
+
+BREAKPAD_SITE:=http://google-breakpad.googlecode.com/svn/trunk/
+BREAKPAD_SITE_METHOD:=svn
+BREAKPAD_VERSION:=842
+BREAKPAD_DEPENDENCIES:=libcurl
+
+BREAKPAD_LIBTOOL_PATCH = NO
+BREAKPAD_INSTALL_STAGING = YES
+BREAKPAD_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.2.5
