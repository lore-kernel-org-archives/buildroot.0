From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Oct 2015 20:33:05 +0300
Subject: [Buildroot] [PATCH] libssh: needs shared library support
Message-ID: <5f49edd9ffc4715859e0f344ff38d11bda3cd876.1443720785.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libssh builds libssh.so unconditionally.

Fixes:
http://autobuild.buildroot.net/results/7c7/7c7da08c71b5378b68631e3844088307080f6f9e/
http://autobuild.buildroot.net/results/a19/a19c619f4561f5426236b958f09cab4c095a63cc/
http://autobuild.buildroot.net/results/d6d/d6dd4a9b787d654b4173c03174a2fd72bdc017b3/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index e8ef6028ca6f..30aabd621fb6 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSSH
 	bool "libssh"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	# Either OpenSSL or libgcrypt are mandatory
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
@@ -10,3 +11,7 @@ config BR2_PACKAGE_LIBSSH
 	  secure and transparent tunnel for your remote applications.
 
 	  http://www.libssh.org/
+
+comment "libssh needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.5.3
