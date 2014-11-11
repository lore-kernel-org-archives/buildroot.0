From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 10:08:56 -0300
Subject: [Buildroot] [PATCH] dhcp: fix bad --enable/disable-debug logic
Message-ID: <1415711336-27589-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It interprets disable as enable and wreaks havoc since it changes the
behaviour of the build, for instance not using configured leases files
paths.
Thanks to Nathaniel Roach for pointing me to this problem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/0001-fix-configure-debug.patch | 23 +++++++++++++++++++++++
 package/dhcp/dhcp.mk                        |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 package/dhcp/0001-fix-configure-debug.patch

diff --git a/package/dhcp/0001-fix-configure-debug.patch b/package/dhcp/0001-fix-configure-debug.patch
new file mode 100644
index 0000000..19c9bfe
--- /dev/null
+++ b/package/dhcp/0001-fix-configure-debug.patch
@@ -0,0 +1,23 @@
+AC_ARG_ENABLE is passed wrong parameters for action-if-given:
+If someone passed --enable-debug to configure enable_debug was set to 'yes',
+but if --disable-debug was passed the action is also called and debug was
+also set to 'yes' which is wrong.
+Use $enableval for this case.
+
+Reported upstream as ISC-Bugs #37780 (not publicly accesible).
+Thanks to Nathaniel Roach for pointing out the problem.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura dhcp-4.1-ESV-R10.orig/configure.ac dhcp-4.1-ESV-R10/configure.ac
+--- dhcp-4.1-ESV-R10.orig/configure.ac	2014-11-11 09:50:07.719277076 -0300
++++ dhcp-4.1-ESV-R10/configure.ac	2014-11-11 09:51:10.722432148 -0300
+@@ -53,7 +53,7 @@
+ AC_ARG_ENABLE(debug,
+ 	AC_HELP_STRING([--enable-debug],
+ 		[create a debug-only version of the software (default is no).]),
+-		[enable_debug=yes],[enable_debug=no])
++		[enable_debug=$enableval],[enable_debug=no])
+ # This is very much off by default.
+ if test "$enable_debug" = "yes" ; then
+ 	AC_DEFINE([DEBUG], [1],
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 8b38fd0..27fb60b 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,6 +9,8 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
+# For 0001-fix-configure-debug.patch
+DHCP_AUTORECONF = YES
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-- 
2.0.4
