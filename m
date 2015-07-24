From: Christian Stewart <christian@paral.in>
Date: Fri, 24 Jul 2015 15:24:50 -0700
Subject: [Buildroot] [PATCH v5 1/1] mosh: new package
Message-ID: <1437776690-23542-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding mosh, the mobile shell.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                  |  1 +
 package/mosh/0001-remove-system-locale-calls.patch | 49 ++++++++++++++++++++++
 package/mosh/Config.in                             | 22 ++++++++++
 package/mosh/mosh.hash                             |  1 +
 package/mosh/mosh.mk                               | 13 ++++++
 5 files changed, 86 insertions(+)
 create mode 100644 package/mosh/0001-remove-system-locale-calls.patch
 create mode 100644 package/mosh/Config.in
 create mode 100644 package/mosh/mosh.hash
 create mode 100644 package/mosh/mosh.mk

diff --git a/package/Config.in b/package/Config.in
index cfa7512..d1e6640 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1250,6 +1250,7 @@ endif
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
 	source "package/monkey/Config.in"
+	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
diff --git a/package/mosh/0001-remove-system-locale-calls.patch b/package/mosh/0001-remove-system-locale-calls.patch
new file mode 100644
index 0000000..f44e166
--- /dev/null
+++ b/package/mosh/0001-remove-system-locale-calls.patch
@@ -0,0 +1,49 @@
+From b6075c578d2104b58d55e088dccb74370019dde9 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 23 Jul 2015 13:52:35 -0700
+Subject: [PATCH 1/1] Remove system("locale") calls.
+
+The locale command is not available on many systems. As this variable
+is unused and appears to have been written with the intent of
+displaying the locale settings to the user, it's not really necessary.
+As this breaks Mosh on a lot of systems, it's best to remove the calls.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ src/frontend/mosh-server.cc | 4 +++-
+ src/frontend/stmclient.cc   | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/frontend/mosh-server.cc b/src/frontend/mosh-server.cc
+index 76ed2ed..0d2f222 100644
+--- a/src/frontend/mosh-server.cc
++++ b/src/frontend/mosh-server.cc
+@@ -313,7 +313,9 @@ int main( int argc, char *argv[] )
+       fprintf( stderr, "mosh-server needs a UTF-8 native locale to run.\n\n" );
+       fprintf( stderr, "Unfortunately, the local environment (%s) specifies\nthe character set \"%s\",\n\n", native_ctype.str().c_str(), native_charset.c_str() );
+       fprintf( stderr, "The client-supplied environment (%s) specifies\nthe character set \"%s\".\n\n", client_ctype.str().c_str(), client_charset.c_str() );
+-      int unused __attribute((unused)) = system( "locale" );
++
++      fprintf( stderr, "This is a buildroot system, 'locale' debug output has been removed." );
++
+       exit( 1 );
+     }
+   }
+diff --git a/src/frontend/stmclient.cc b/src/frontend/stmclient.cc
+index 9e4d916..06fac8b 100644
+--- a/src/frontend/stmclient.cc
++++ b/src/frontend/stmclient.cc
+@@ -85,7 +85,9 @@ void STMClient::init( void )
+ 
+     fprintf( stderr, "mosh-client needs a UTF-8 native locale to run.\n\n" );
+     fprintf( stderr, "Unfortunately, the client's environment (%s) specifies\nthe character set \"%s\".\n\n", native_ctype.str().c_str(), native_charset.c_str() );
+-    int unused __attribute((unused)) = system( "locale" );
++
++    fprintf( stderr, "This is a buildroot system, 'locale' debug output has been removed." );
++
+     exit( 1 );
+   }
+ 
+-- 
+2.1.4
+
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
new file mode 100644
index 0000000..4013f80
--- /dev/null
+++ b/package/mosh/Config.in
@@ -0,0 +1,22 @@
+comment "mosh needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "mosh needs a host architecture of x64 or x86"
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on !(BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
+
+config BR2_PACKAGE_MOSH
+	bool "mosh"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSH
+	help
+	  Remote terminal application that supports intermittent connectivity,
+	  allows roaming, and provides speculative local echo and line editing
+	  of user keystrokes.
+
+	  https://mosh.mit.edu
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
new file mode 100644
index 0000000..a78cb33
--- /dev/null
+++ b/package/mosh/mosh.hash
@@ -0,0 +1 @@
+sha256 637adb7f67406447e9264d30468fe69a6d5e8f97518ef133d794cdc65483fa54 mosh-1.2.5.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
new file mode 100644
index 0000000..dcb12fc
--- /dev/null
+++ b/package/mosh/mosh.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mosh
+#
+################################################################################
+
+MOSH_VERSION = 1.2.5
+MOSH_SITE = https://mosh.mit.edu/mosh-$(MOSH_VERSION).tar.gz
+MOSH_DEPENDENCIES = zlib ncurses protobuf openssl
+MOSH_LICENSE = GPLv3+
+MOSH_LICENSE_FILES = COPYING COPYING.iOS
+
+$(eval $(autotools-package))
-- 
2.1.4
