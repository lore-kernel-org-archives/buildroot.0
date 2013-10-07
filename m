From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Oct 2013 17:59:51 -0300
Subject: [Buildroot] [PATCH] lighttpd: fix build failure without ipv6
Message-ID: <1381179591-13643-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported in https://bugs.gentoo.org/show_bug.cgi?id=486426
and http://redmine.lighttpd.net/issues/2515
Autobuilders didn't hit it yet, but i did.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd-02-mod_extforward.patch  | 14 ++++
 .../lighttpd-Fix-default-config-file.patch         | 98 ----------------------
 2 files changed, 14 insertions(+), 98 deletions(-)
 create mode 100644 package/lighttpd/lighttpd-02-mod_extforward.patch
 delete mode 100644 package/lighttpd/lighttpd-Fix-default-config-file.patch

diff --git a/package/lighttpd/lighttpd-02-mod_extforward.patch b/package/lighttpd/lighttpd-02-mod_extforward.patch
new file mode 100644
index 0000000..3efd2b1
--- /dev/null
+++ b/package/lighttpd/lighttpd-02-mod_extforward.patch
@@ -0,0 +1,14 @@
+From http://redmine.lighttpd.net/issues/2515
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/mod_extforward.c	(revision 2909)
++++ b/src/mod_extforward.c	(working copy)
+@@ -439,7 +439,6 @@
+ #ifdef HAVE_IPV6
+ 		ipstr_to_sockaddr(srv, real_remote_addr, &sock);
+ #else
+-		UNUSED(addrs_left);
+ 		sock.ipv4.sin_addr.s_addr = inet_addr(real_remote_addr);
+ 		sock.plain.sa_family = (sock.ipv4.sin_addr.s_addr == 0xFFFFFFFF) ? AF_UNSPEC : AF_INET;
+ #endif
diff --git a/package/lighttpd/lighttpd-Fix-default-config-file.patch b/package/lighttpd/lighttpd-Fix-default-config-file.patch
deleted file mode 100644
index 88d2c6f..0000000
--- a/package/lighttpd/lighttpd-Fix-default-config-file.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Modify the default lighttpd configuration file to have one a starting conf
-
-  * Changed the log path to /var/log and logs filenames
-  * Disable IPv6
-  * Do not setuid to a user that doesn't exist on the system
-  * Disable pdf ranges fix for Adobe Reader since it uses regex and we
-    don't always have pcre support
-  * Change the network backend to writev since linux-sendfile fails on buildroot
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
---- a/doc/config/conf.d/access_log.conf	2010-07-11 18:01:32.000000000 +0100
-+++ b/doc/config/conf.d/access_log.conf	2012-07-21 19:37:58.453207990 +0100
-@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
- ##
- ## Default access log.
- ##
--accesslog.filename          = log_root + "/access.log"
-+accesslog.filename          = log_root + "/lighttpd-access.log"
- 
- ##
- ## The default format produces CLF compatible output.
-diff -Nurp a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
---- a/doc/config/lighttpd.conf	2011-12-18 12:57:25.000000000 +0000
-+++ b/doc/config/lighttpd.conf	2012-07-21 19:40:45.281200552 +0100
-@@ -13,8 +13,8 @@
- ## if you add a variable here. Add the corresponding variable in the
- ## chroot example aswell.
- ##
--var.log_root    = "/var/log/lighttpd"
--var.server_root = "/srv/www"
-+var.log_root    = "/var/log"
-+var.server_root = "/var/www"
- var.state_dir   = "/var/run"
- var.home_dir    = "/var/lib/lighttpd"
- var.conf_dir    = "/etc/lighttpd"
-@@ -90,7 +90,7 @@ server.port = 80
- ##
- ## Use IPv6?
- ##
--server.use-ipv6 = "enable"
-+# server.use-ipv6 = "enable"
- 
- ##
- ## bind to a specific IP
-@@ -101,8 +101,8 @@ server.use-ipv6 = "enable"
- ## Run as a different username/groupname.
- ## This requires root permissions during startup. 
- ##
--server.username  = "lighttpd"
--server.groupname = "lighttpd"
-+# server.username  = "lighttpd"
-+# server.groupname = "lighttpd"
- 
- ## 
- ## enable core files.
-@@ -112,7 +112,7 @@ server.groupname = "lighttpd"
- ##
- ## Document root
- ##
--server.document-root = server_root + "/htdocs"
-+server.document-root = server_root
- 
- ##
- ## The value for the "Server:" response field.
-@@ -138,7 +138,7 @@ server.pid-file = state_dir + "/lighttpd
- ##
- ## Path to the error log file
- ##
--server.errorlog             = log_root + "/error.log"
-+server.errorlog             = log_root + "/lighttpd-error.log"
- 
- ##
- ## If you want to log to syslog you have to unset the 
-@@ -188,7 +188,7 @@ server.event-handler = "linux-sysepoll"
- ## linux-sendfile - is recommended for small files.
- ## writev         - is recommended for sending many large files
- ##
--server.network-backend = "linux-sendfile"
-+server.network-backend = "writev"
- 
- ##
- ## As lighttpd is a single-threaded server, its main resource limit is
-@@ -311,9 +311,9 @@ url.access-deny             = ( "~", ".i
- ## disable range requests for pdf files
- ## workaround for a bug in the Acrobat Reader plugin.
- ##
--$HTTP["url"] =~ "\.pdf$" {
--  server.range-requests = "disable"
--}
-+# $HTTP["url"] =~ "\.pdf$" {
-+#  server.range-requests = "disable"
-+# }
- 
- ##
- ## url handling modules (rewrite, redirect)
-- 
1.8.1.5
