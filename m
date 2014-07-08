From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 Jul 2014 10:00:43 -0300
Subject: [Buildroot] [PATCH] php: fix phar build failure for CLI
Message-ID: <1404824443-5326-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the phar command-line tool since it requires php to pack itself
up. Fixes build failure for CLI (or CLI+CGI) variants of php.
Hardly useful for embedded scenarios.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php-03-disable-pharcmd.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/php/php-03-disable-pharcmd.patch

diff --git a/package/php/php-03-disable-pharcmd.patch b/package/php/php-03-disable-pharcmd.patch
new file mode 100644
index 0000000..d4a8464
--- /dev/null
+++ b/package/php/php-03-disable-pharcmd.patch
@@ -0,0 +1,26 @@
+Disable the 'phar' command-line tool build/installation since it requires
+php to run and pack up phar itself in phar format. This would require
+a host-php instance and really probably nobody needs the phar tool
+on the target.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.5.14.orig/configure php-5.5.14/configure
+--- php-5.5.14.orig/configure	2014-07-08 09:52:52.657753194 -0300
++++ php-5.5.14/configure	2014-07-08 09:53:07.610243933 -0300
+@@ -112930,13 +112930,8 @@
+ INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
+ CXXFLAGS="$CXXFLAGS $standard_libtool_flag"
+ 
+-if test "$PHP_PHAR" != "no" && test "$PHP_CLI" != "no"; then
+-  pharcmd=pharcmd
+-  pharcmd_install=install-pharcmd
+-else
+-  pharcmd=
+-  pharcmd_install=
+-fi;
++pharcmd=
++pharcmd_install=
+ 
+ all_targets="$lcov_target \$(OVERALL_TARGET) \$(PHP_MODULES) \$(PHP_ZEND_EX) \$(PHP_BINARIES) $pharcmd"
+ install_targets="$install_sapi $install_modules $install_binaries install-build install-headers install-programs $install_pear $pharcmd_install"
-- 
1.8.5.5
