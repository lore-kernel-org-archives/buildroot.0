From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 09:28:46 +0200
Subject: [Buildroot] [git commit] openssh: bump to version 7.7p1
Message-ID: <20180410072857.B8AC788342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a08cd50e98107b8f79d133c85a65187459614649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches, renumber the rest.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-ac-detect-mips-abi.patch        | 44 ---------------
 ...ch => 0001-fix-pam-uclibc-pthreads-clash.patch} |  0
 ...roperly-set-seccomp-audit-arch-for-mips64.patch | 63 ----------------------
 ...nclude.patch => 0002-fix-howmany-include.patch} |  0
 ...pat-bsd-getpagesize.c-include-includes.h-.patch | 35 ------------
 package/openssh/openssh.hash                       |  4 +-
 package/openssh/openssh.mk                         |  6 +--
 7 files changed, 3 insertions(+), 149 deletions(-)

diff --git a/package/openssh/0001-configure-ac-detect-mips-abi.patch b/package/openssh/0001-configure-ac-detect-mips-abi.patch
deleted file mode 100644
index 0d43e6baf0..0000000000
--- a/package/openssh/0001-configure-ac-detect-mips-abi.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f4fcd8c788a4854d4ebae400cf55e3957f906835 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Tue, 20 Jun 2017 16:42:11 +0100
-Subject: [PATCH] configure.ac: detect MIPS ABI
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Upstream commit: ttps://github.com/openssh/openssh-portable/commit/f4fcd8c788a4854d4ebae400cf55e3957f906835]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 18079acba..f990cfe08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -746,6 +746,27 @@ main() { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
- 	fi
- 	AC_CHECK_HEADERS([linux/seccomp.h linux/filter.h linux/audit.h], [],
- 	    [], [#include <linux/types.h>])
-+	# Obtain MIPS ABI
-+	case "$host" in
-+	mips*)
-+		AC_COMPILE_IFELSE([
-+#if _MIPS_SIM != _ABIO32
-+#error
-+#endif
-+			],[mips_abi="o32"],[AC_COMPILE_IFELSE([
-+#if _MIPS_SIM != _ABIN32
-+#error
-+#endif
-+				],[mips_abi="n32"],[AC_COMPILE_IFELSE([
-+#if _MIPS_SIM != _ABI64
-+#error
-+#endif
-+					],[mips_abi="n64"],[AC_MSG_ERROR([unknown MIPS ABI])
-+				])
-+			])
-+		])
-+		;;
-+	esac
- 	AC_MSG_CHECKING([for seccomp architecture])
- 	seccomp_audit_arch=
- 	case "$host" in
diff --git a/package/openssh/0003-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
similarity index 100%
rename from package/openssh/0003-fix-pam-uclibc-pthreads-clash.patch
rename to package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
diff --git a/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch b/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
deleted file mode 100644
index 879af5e3d5..0000000000
--- a/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From afc3e31b637db9dae106d4fad78f7b481c8c24e3 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Tue, 20 Jun 2017 16:42:28 +0100
-Subject: [PATCH] configure.ac: properly set seccomp_audit_arch for MIPS64
-
-Currently seccomp_audit_arch is set to AUDIT_ARCH_MIPS64 or
-AUDIT_ARCH_MIPSEL64 (depending on the endinness) when openssh is built
-for MIPS64. However, that's only valid for n64 ABI. The right macros for
-n32 ABI defined in seccomp.h are AUDIT_ARCH_MIPS64N32 and
-AUDIT_ARCH_MIPSEL64N32, for big and little endian respectively.
-
-Because of that an sshd built for MIPS64 n32 rejects connection attempts
-and the output of strace reveals that the problem is related to seccomp
-audit:
-
-[pid   194] prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=57,
-filter=0x555d5da0}) = 0
-[pid   194] write(7, "\0\0\0]\0\0\0\5\0\0\0Ulist_hostkey_types: "..., 97) = ?
-[pid   193] <... poll resumed> )        = 2 ([{fd=5, revents=POLLIN|POLLHUP},
-{fd=6, revents=POLLHUP}])
-[pid   194] +++ killed by SIGSYS +++
-
-This patch fixes that problem by setting the right value to
-seccomp_audit_arch taking into account the MIPS64 ABI.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Upstream commit: https://github.com/openssh/openssh-portable/commit/afc3e31b637db9dae106d4fad78f7b481c8c24e3]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f990cfe08..5d640f679 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -801,10 +801,24 @@ main() { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
- 		seccomp_audit_arch=AUDIT_ARCH_MIPSEL
- 		;;
- 	mips64-*)
--		seccomp_audit_arch=AUDIT_ARCH_MIPS64
-+		case "$mips_abi" in
-+		"n32")
-+			seccomp_audit_arch=AUDIT_ARCH_MIPS64N32
-+			;;
-+		"n64")
-+			seccomp_audit_arch=AUDIT_ARCH_MIPS64
-+			;;
-+		esac
- 		;;
- 	mips64el-*)
--		seccomp_audit_arch=AUDIT_ARCH_MIPSEL64
-+		case "$mips_abi" in
-+		"n32")
-+			seccomp_audit_arch=AUDIT_ARCH_MIPSEL64N32
-+			;;
-+		"n64")
-+			seccomp_audit_arch=AUDIT_ARCH_MIPSEL64
-+			;;
-+		esac
- 		;;
- 	esac
- 	if test "x$seccomp_audit_arch" != "x" ; then
diff --git a/package/openssh/0004-fix-howmany-include.patch b/package/openssh/0002-fix-howmany-include.patch
similarity index 100%
rename from package/openssh/0004-fix-howmany-include.patch
rename to package/openssh/0002-fix-howmany-include.patch
diff --git a/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch b/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch
deleted file mode 100644
index ce60072934..0000000000
--- a/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9a43657a3dcb868b4f36ade3aba5dcf0871fb412 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 30 Oct 2017 23:36:56 +0100
-Subject: [PATCH] openbsd-compat/bsd-getpagesize.c: include includes.h for
- config.h defines
-
-The configure script checks for getpagesize() and sets HAVE_GETPAGESIZE in
-config.h, but bsd-getpagesize.c forgot to include includes.h (which
-indirectly includes config.h) so the checks always fails, causing linker
-issues when linking statically on systems with getpagesize():
-
-http://autobuild.buildroot.net/results/8cc/8cc30818a400c7a392a3de787cabc9cd8425495f/build-end.log
-
-Fix it by including includes.h
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- openbsd-compat/bsd-getpagesize.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/openbsd-compat/bsd-getpagesize.c b/openbsd-compat/bsd-getpagesize.c
-index 9daddfbd..416a8d4c 100644
---- a/openbsd-compat/bsd-getpagesize.c
-+++ b/openbsd-compat/bsd-getpagesize.c
-@@ -1,5 +1,7 @@
- /* Placed in the public domain */
- 
-+#include "includes.h"
-+
- #ifndef HAVE_GETPAGESIZE
- 
- #include <unistd.h>
--- 
-2.11.0
-
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index d8a4da32ad..69d34ba65e 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From http://www.openssh.com/txt/release-7.6 (base64 encoded)
-sha256 a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723  openssh-7.6p1.tar.gz
+# From http://www.openssh.com/txt/release-7.7 (base64 encoded)
+sha256 d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f  openssh-7.7p1.tar.gz
 # Locally calculated
 sha256 05a4c25ef464e19656c5259bd4f4da8428efab01044f3541b79fbb3ff209350f  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 986bab413d..b28429e1bb 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,14 +4,10 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.6p1
+OPENSSH_VERSION = 7.7p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-# Autoreconf needed due to the following patches modifying configure.ac:
-# 0001-configure-ac-detect-mips-abi.patch
-# 0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
-OPENSSH_AUTORECONF = YES
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
