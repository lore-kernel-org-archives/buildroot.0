From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:33:25 +0200
Subject: [Buildroot] [git commit] libcap-ng: cannot be built with nios2 CS
	2014.05 toolchain
Message-ID: <20150514230014.126BC7FADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3038d061e541aef0bc449149bf72c6f458d6942
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d13/d136f763ca3389cdc6a404db7a4fc0cd18329955/
http://autobuild.buildroot.net/results/e00/e002e2a3bd52a3cc3b0d06625de61315d86de524/
http://autobuild.buildroot.net/results/bba/bba9f7130315c9d97cc060a73663276d0fa2c1b3/
http://autobuild.buildroot.net/results/fc7/fc7bc050ef769716dedb0ad81a51e33a12deec47/

And many more.

Building libcap-ng with that toolchain triggers an internal compiler /
assembler bug, so blacklist that combination and propagate to the reverse
dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in    |    1 +
 package/libcap-ng/Config.in  |    1 +
 package/ofono/Config.in      |    2 ++
 package/util-linux/Config.in |    1 +
 4 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index a887c2f..ba238af 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_CONNMAN_NEARD
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
 	select BR2_PACKAGE_OFONO
 
 config BR2_PACKAGE_CONNMAN_DEBUG
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..a52d230 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # triggers compiler bug
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index b26b5e7..eb1856f 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -17,3 +18,4 @@ config BR2_PACKAGE_OFONO
 comment "ofono needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8ed56b0..39df11c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -214,6 +214,7 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
