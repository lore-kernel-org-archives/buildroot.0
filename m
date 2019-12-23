From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 23 Dec 2019 07:57:34 -0300
Subject: [Buildroot] [PATCH v2] package/tpm2-tss: fix build without C++
Message-ID: <20191223105734.11753-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

C++ is required only for the fuzzing tests but AC_PROG_CXX is included
by configure.ac even when fuzzing is not enabled (which we don't do on
Buildroot). Pull a patch from upstream that solves this.

Fixes:
    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1->v2:
- Use patch from upstream
---
 ...-configure-Only-use-CXX-when-fuzzing.patch | 37 +++++++++++++++++++
 package/tpm2-tss/tpm2-tss.mk                  |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 package/tpm2-tss/0001-configure-Only-use-CXX-when-fuzzing.patch

diff --git a/package/tpm2-tss/0001-configure-Only-use-CXX-when-fuzzing.patch b/package/tpm2-tss/0001-configure-Only-use-CXX-when-fuzzing.patch
new file mode 100644
index 0000000000..c9539987ec
--- /dev/null
+++ b/package/tpm2-tss/0001-configure-Only-use-CXX-when-fuzzing.patch
@@ -0,0 +1,37 @@
+From 23fed12c9b459712295b2dfe41f3480673e4a3af Mon Sep 17 00:00:00 2001
+From: John Andersen <john.s.andersen@intel.com>
+Date: Thu, 19 Dec 2019 08:51:20 -0800
+Subject: [PATCH] configure: Only use CXX when fuzzing
+
+Fixes: #1508
+
+Signed-off-by: John Andersen <john.s.andersen@intel.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cd50451d..537e3cff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,7 +25,6 @@ AC_CANONICAL_HOST
+ AX_IS_RELEASE(dash-version)
+ AX_CHECK_ENABLE_DEBUG([info])
+ 
+-AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_LN_S
+ AC_USE_SYSTEM_EXTENSIONS
+@@ -287,7 +286,8 @@ AS_CASE(["x$with_fuzzing"],
+         [AC_MSG_ERROR([Bad value for --with-fuzzing])])
+ AM_CONDITIONAL([ENABLE_FUZZING],[test "x$with_fuzzing" != "xnone"])
+ AS_IF([test "x$with_fuzzing" != "xnone"],
+-      [AS_IF([test "x$enable_tcti_fuzzing" = xno],
++      [AC_PROG_CXX
++       AS_IF([test "x$enable_tcti_fuzzing" = xno],
+              AC_MSG_ERROR([Fuzz tests can not be enabled without the TCTI_FUZZING module]))
+        AS_IF([test "x$GEN_FUZZ" != "x1"],
+              AC_MSG_ERROR([Fuzz tests can not be enabled without "GEN_FUZZ=1" variable]))])
+-- 
+2.18.1
+
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 425a6703af..08090204ff 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,6 +11,8 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
+# 0001-configure-Only-use-CXX-when-fuzzing.patch
+TPM2_TSS_AUTORECONF = YES
 
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
-- 
2.18.1
