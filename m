From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 19:41:05 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openssh: don't download
	patch from Github
Message-ID: <20171028174327.01BD381137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=701f943d203eaa18879d800180764f8da2fce952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e7522aacd4e76c0ab5e602ade9a60f5a4473939)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure-ac-detect-mips-abi.patch        | 44 +++++++++++++++
 ...roperly-set-seccomp-audit-arch-for-mips64.patch | 63 ++++++++++++++++++++++
 ...ch => 0003-fix-pam-uclibc-pthreads-clash.patch} |  0
 ...nclude.patch => 0004-fix-howmany-include.patch} |  0
 package/openssh/openssh.hash                       |  2 -
 package/openssh/openssh.mk                         |  6 +--
 6 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/package/openssh/0001-configure-ac-detect-mips-abi.patch b/package/openssh/0001-configure-ac-detect-mips-abi.patch
new file mode 100644
index 0000000..0d43e6b
--- /dev/null
+++ b/package/openssh/0001-configure-ac-detect-mips-abi.patch
@@ -0,0 +1,44 @@
+From f4fcd8c788a4854d4ebae400cf55e3957f906835 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Tue, 20 Jun 2017 16:42:11 +0100
+Subject: [PATCH] configure.ac: detect MIPS ABI
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Upstream commit: ttps://github.com/openssh/openssh-portable/commit/f4fcd8c788a4854d4ebae400cf55e3957f906835]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 18079acba..f990cfe08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -746,6 +746,27 @@ main() { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
+ 	fi
+ 	AC_CHECK_HEADERS([linux/seccomp.h linux/filter.h linux/audit.h], [],
+ 	    [], [#include <linux/types.h>])
++	# Obtain MIPS ABI
++	case "$host" in
++	mips*)
++		AC_COMPILE_IFELSE([
++#if _MIPS_SIM != _ABIO32
++#error
++#endif
++			],[mips_abi="o32"],[AC_COMPILE_IFELSE([
++#if _MIPS_SIM != _ABIN32
++#error
++#endif
++				],[mips_abi="n32"],[AC_COMPILE_IFELSE([
++#if _MIPS_SIM != _ABI64
++#error
++#endif
++					],[mips_abi="n64"],[AC_MSG_ERROR([unknown MIPS ABI])
++				])
++			])
++		])
++		;;
++	esac
+ 	AC_MSG_CHECKING([for seccomp architecture])
+ 	seccomp_audit_arch=
+ 	case "$host" in
diff --git a/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch b/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
new file mode 100644
index 0000000..879af5e
--- /dev/null
+++ b/package/openssh/0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
@@ -0,0 +1,63 @@
+From afc3e31b637db9dae106d4fad78f7b481c8c24e3 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Tue, 20 Jun 2017 16:42:28 +0100
+Subject: [PATCH] configure.ac: properly set seccomp_audit_arch for MIPS64
+
+Currently seccomp_audit_arch is set to AUDIT_ARCH_MIPS64 or
+AUDIT_ARCH_MIPSEL64 (depending on the endinness) when openssh is built
+for MIPS64. However, that's only valid for n64 ABI. The right macros for
+n32 ABI defined in seccomp.h are AUDIT_ARCH_MIPS64N32 and
+AUDIT_ARCH_MIPSEL64N32, for big and little endian respectively.
+
+Because of that an sshd built for MIPS64 n32 rejects connection attempts
+and the output of strace reveals that the problem is related to seccomp
+audit:
+
+[pid   194] prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=57,
+filter=0x555d5da0}) = 0
+[pid   194] write(7, "\0\0\0]\0\0\0\5\0\0\0Ulist_hostkey_types: "..., 97) = ?
+[pid   193] <... poll resumed> )        = 2 ([{fd=5, revents=POLLIN|POLLHUP},
+{fd=6, revents=POLLHUP}])
+[pid   194] +++ killed by SIGSYS +++
+
+This patch fixes that problem by setting the right value to
+seccomp_audit_arch taking into account the MIPS64 ABI.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Upstream commit: https://github.com/openssh/openssh-portable/commit/afc3e31b637db9dae106d4fad78f7b481c8c24e3]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f990cfe08..5d640f679 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -801,10 +801,24 @@ main() { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
+ 		seccomp_audit_arch=AUDIT_ARCH_MIPSEL
+ 		;;
+ 	mips64-*)
+-		seccomp_audit_arch=AUDIT_ARCH_MIPS64
++		case "$mips_abi" in
++		"n32")
++			seccomp_audit_arch=AUDIT_ARCH_MIPS64N32
++			;;
++		"n64")
++			seccomp_audit_arch=AUDIT_ARCH_MIPS64
++			;;
++		esac
+ 		;;
+ 	mips64el-*)
+-		seccomp_audit_arch=AUDIT_ARCH_MIPSEL64
++		case "$mips_abi" in
++		"n32")
++			seccomp_audit_arch=AUDIT_ARCH_MIPSEL64N32
++			;;
++		"n64")
++			seccomp_audit_arch=AUDIT_ARCH_MIPSEL64
++			;;
++		esac
+ 		;;
+ 	esac
+ 	if test "x$seccomp_audit_arch" != "x" ; then
diff --git a/package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch b/package/openssh/0003-fix-pam-uclibc-pthreads-clash.patch
similarity index 100%
rename from package/openssh/0001-fix-pam-uclibc-pthreads-clash.patch
rename to package/openssh/0003-fix-pam-uclibc-pthreads-clash.patch
diff --git a/package/openssh/0002-fix-howmany-include.patch b/package/openssh/0004-fix-howmany-include.patch
similarity index 100%
rename from package/openssh/0002-fix-howmany-include.patch
rename to package/openssh/0004-fix-howmany-include.patch
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index ed628fa..3685bc0 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,2 @@
 # From http://www.openssh.com/txt/release-7.5 (base64 encoded)
 sha256 9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0  openssh-7.5p1.tar.gz
-sha256 310860606c4175cdfd095e724f624df27340c89a916f7a09300bcb7988d5cfbf  afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
-sha256 395aa1006967713b599555440e09f898781a5559e496223587401768ece10904  f4fcd8c788a4854d4ebae400cf55e3957f906835.patch
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index dea7b47..f9167e5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -9,11 +9,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 # Autoreconf needed due to the following patches modifying configure.ac:
-# f4fcd8c788a4854d4ebae400cf55e3957f906835.patch
-# afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
+# 0001-configure-ac-detect-mips-abi.patch
+# 0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
 OPENSSH_AUTORECONF = YES
-OPENSSH_PATCH = https://github.com/openssh/openssh-portable/commit/f4fcd8c788a4854d4ebae400cf55e3957f906835.patch \
-	https://github.com/openssh/openssh-portable/commit/afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
