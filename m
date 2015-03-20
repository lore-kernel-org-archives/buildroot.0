From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:04:14 +0100
Subject: [Buildroot] [git commit] powerpc-utils: security bump to 1.2.24
Message-ID: <20150320130419.9C101818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a12a5a1b94465fd0aef6185e81715880be26ab0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-4040: A local attacker could obtain sensitive information from
the generated archive such as plain text passwords.

Yes, version 1.2.24 seems to be newer than 1.4, which is equivalent to 1.2.20.

Also, switch from git clone to tarball download , and add a .hash file.

The configure script seems to misdetect stack smashing protection support in
the toolchain. gcc accepts -fstack_protector_all, but the linker complains:
"ld: cannot find -lssp".

Cc: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powerpc-utils/powerpc-utils.hash |    3 +++
 package/powerpc-utils/powerpc-utils.mk   |    7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
new file mode 100644
index 0000000..d02f16a
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/powerpc-utils/files/powerpc-utils/
+sha1	975c668e8eaedd5222a7870e82ce295d06dfe649	powerpc-utils-1.2.24.tar.gz
+md5	f492a72f2d4522eba5d9b329c84b3ed3	powerpc-utils-1.2.24.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index eae58d5..3b30458 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.4
-POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
-POWERPC_UTILS_AUTORECONF = YES
+POWERPC_UTILS_VERSION = 1.2.24
+POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_LICENSE = Common Public License Version 1.0
 POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
 
 POWERPC_UTILS_CONF_OPTS = --without-librtas
+POWERPC_UTILS_CONF_ENV = \
+	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 $(eval $(autotools-package))
