From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 19:30:22 +0200
Subject: [Buildroot] [git commit] mosh: new package
Message-ID: <20150726173308.B4B7D81DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6406d41e6001093e3c2a0335547f7810d5f0483f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial
transport to start mosh-server which uses UDP to communicate with the
client.  Supports a predictive model to enhance performance on weak
connections and compensate for general lag. Also supports
disconnections and reconnections seamlessly.

[Thomas:
  - Add missing dependency on host-pkgconf, as noticed by Yann
    E. Morin.
  - Indicate that openssh/dropbear is a runtime dependency.
  - Pass some variables in the configure environment to tell that SSP
    support is not available when it isn't. Otherwise, it misdetects
    the SSP support as being available, causing a build failure.]

Signed-off-by: Christian Stewart <christian@paral.in>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/mosh/0001-remove-system-locale-calls.patch |   46 ++++++++++++++++++++
 package/mosh/Config.in                             |   20 +++++++++
 package/mosh/mosh.hash                             |    2 +
 package/mosh/mosh.mk                               |   22 +++++++++
 5 files changed, 91 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2697e56..f029e1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1252,6 +1252,7 @@ endif
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
index 0000000..2f5214c
--- /dev/null
+++ b/package/mosh/Config.in
@@ -0,0 +1,20 @@
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
+	select BR2_PACKAGE_ZLIB
+	# runtime dependency
+	select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT
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
index 0000000..02954f9
--- /dev/null
+++ b/package/mosh/mosh.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# mosh
+#
+################################################################################
+
+MOSH_VERSION = 1.2.5
+MOSH_SITE = https://mosh.mit.edu/
+MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
+MOSH_LICENSE = GPLv3+ with exception
+MOSH_LICENSE_FILES = COPYING COPYING.iOS
+
+# help the detection of the SSP support: mosh configure.ac doesn't do
+# a link test, so it doesn't detect when the toolchain doesn't have
+# libssp.
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+MOSH_CONF_ENV += \
+	ax_cv_check_cflags__Werror___fstack_protector_all=no \
+	ax_cv_check_cxxflags__Werror___fstack_protector_all=no
+endif
+
+$(eval $(autotools-package))
