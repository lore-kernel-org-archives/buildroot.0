From: Christian Stewart <christian@paral.in>
Date: Sun, 26 Jul 2015 09:34:07 -0700
Subject: [Buildroot] [PATCH v8 1/1] mosh: new package
Message-ID: <1437928447-26907-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial transport to
start mosh-server which uses UDP to communicate with the client.
Supports a predictive model to enhance performance on weak connections
and compensate for general lag. Also supports disconnections and
reconnections seamlessly.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                  |  1 +
 package/mosh/0001-remove-system-locale-calls.patch | 46 ++++++++++++++++++++++
 package/mosh/Config.in                             | 19 +++++++++
 package/mosh/mosh.hash                             |  2 +
 package/mosh/mosh.mk                               | 13 ++++++
 5 files changed, 81 insertions(+)
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
index 0000000..114e6ed
--- /dev/null
+++ b/package/mosh/0001-remove-system-locale-calls.patch
@@ -0,0 +1,46 @@
+The locale command is not available on many systems. As this variable
+is unused and appears to have been written with the intent of
+displaying the locale settings to the user, it's not really necessary.
+As this breaks Mosh on a lot of systems, it's best to remove the calls.
+
+Upstream status: refused, see: https://github.com/keithw/mosh/issues/650
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
index 0000000..9841b2e
--- /dev/null
+++ b/package/mosh/Config.in
@@ -0,0 +1,19 @@
+comment "mosh needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_MOSH
+	bool "mosh"
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS #protobuf
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT
+	select BR2_PACKAGE_ZLIB
+	help
+	  Remote terminal application that supports intermittent connectivity,
+	  allows roaming, and provides speculative local echo and line editing
+	  of user keystrokes.
+
+	  https://mosh.mit.edu
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
new file mode 100644
index 0000000..ab925b5
--- /dev/null
+++ b/package/mosh/mosh.hash
@@ -0,0 +1,2 @@
+# From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
+sha256 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3 mosh-1.2.5.tar.gz
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
new file mode 100644
index 0000000..dd1ef93
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
+MOSH_SITE = https://mosh.mit.edu/
+MOSH_DEPENDENCIES = zlib ncurses protobuf openssl
+MOSH_LICENSE = GPLv3+ with exception
+MOSH_LICENSE_FILES = COPYING COPYING.iOS
+
+$(eval $(autotools-package))
-- 
2.1.4
