From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 11 Jun 2019 15:26:05 +0200
Subject: [Buildroot] [toolchain-builder ] configs/common: enable Fortran
 support
Message-ID: <20190611132605.26354-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fortran depends on wchar only for architectures requiring libquadmath.

Since uclibc toolchain built by toolchain-builder enable locales (so wchar
is automatically selected), it's safe to enable unconditionally Fortran
support for all toolchains.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 build.sh              | 5 +++++
 configs/common.config | 1 +
 2 files changed, 6 insertions(+)

diff --git a/build.sh b/build.sh
index 5b28b88..835d714 100755
--- a/build.sh
+++ b/build.sh
@@ -309,6 +309,11 @@ function make_br_fragment {
     else
         echo "# BR2_TOOLCHAIN_EXTERNAL_CXX is not set" >> ${fragment_file}
     fi
+    if grep "BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y" ${configfile} > /dev/null 2>&1; then
+        echo "BR2_TOOLCHAIN_EXTERNAL_FORTRAN=y" >> ${fragment_file}
+    else
+        echo "# BR2_TOOLCHAIN_EXTERNAL_FORTRAN is not set" >> ${fragment_file}
+    fi
     if grep "BR2_TOOLCHAIN_HAS_SSP=y" ${configfile} > /dev/null 2>&1; then
         echo "BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y" >> ${fragment_file}
     else
diff --git a/configs/common.config b/configs/common.config
index 7f728ad..85ae490 100644
--- a/configs/common.config
+++ b/configs/common.config
@@ -1,6 +1,7 @@
 BR2_WGET="wget --passive-ftp -nd -t 3 --no-check-certificate"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
 BR2_INIT_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.20.1
