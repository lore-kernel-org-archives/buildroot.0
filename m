From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Oct 2017 16:33:49 +0200
Subject: [Buildroot] [PATCH] socat: bump down to version 1.7.3.2
Message-ID: <d6ae63148fa0ada0848cb05f2d6b5d6fde70114f.1509287629.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream socat2 branch seems to be dead. Last commit is from January
2016 . Over the last few years socat2 received only fixes cherry picked
from the master 1.x branch. Most major general purpose distros only
package socat 1.x.

Drop the threads dependency; not needed for 1.x.

Mention the OpenSSL exception in the license. Add hashes for license
files.

Correct the autoconf comment. The tarball configure script is recent
enough. But since we patch configure.in and Makefile.in we still need to
autoconf.

All patches we carry for socat2 are also needed for socat 1.x.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/Config.in  |  5 -----
 package/socat/socat.hash |  8 ++++++--
 package/socat/socat.mk   | 13 ++++++-------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index 09eb2b616d99..af456ab7aa6b 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_SOCAT
 	bool "socat"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
 	  Multipurpose socket relay program.
 
 	  http://www.dest-unreach.org/socat/
-
-comment "socat needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index d867d8ac10b1..77abcf29a996 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,4 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	553b1593d0a192cb09cbdc687ef1baac	socat-2.0.0-b9.tar.bz2
+md5	607a24c15bd2cb54e9328bfbbd3a1ae9	socat-1.7.3.2.tar.bz2
 # Calculated based on the hash above
-sha256	49efb0a5c66b94b279014addc2851faf8ebbd1ec4b7e31c1de7e912d7b4983d2	socat-2.0.0-b9.tar.bz2
+sha256	e3561f808739383eb10fada1e5d4f26883f0311b34fd0af7837d0c95ef379251	socat-1.7.3.2.tar.bz2
+# Locally calculated
+sha256	4846488cea98a2905dc75b7aa5eea721568e372447efe06b85bd896ee8c54f10	README
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761	COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 97f6c5b1450f..5fea067d82a1 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b9
+SOCAT_VERSION = 1.7.3.2
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
-SOCAT_LICENSE = GPL-2.0
-SOCAT_LICENSE_FILES = COPYING
+SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
+SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
 
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no
 
@@ -24,10 +24,9 @@ SOCAT_CONF_ENV += \
 	sc_cv_sys_csize_shift=4
 endif
 
-# We need to run autoconf to regenerate the configure script, in order
-# to ensure that the test checking linux/ext2_fs.h works
-# properly. However, the package only uses autoconf and not automake,
-# so we can't use the normal autoreconf logic.
+# We need to run autoconf to regenerate the configure script, since we patch
+# configure.in and Makefile.in. However, the package only uses autoconf and not
+# automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
 
-- 
2.14.2
