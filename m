From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  3 Aug 2019 18:52:40 +0200
Subject: [Buildroot] [PATCH] package/lapack: enable unconditionally complex
 matrices support
Message-ID: <20190803165240.4674-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to avoid build issues when complex matrices support is
disabled, we enable it unconditionally.

While working on new runtime tests for python-numpy package, we
noticed a build issue whith python-numpy package when
BR2_PACKAGE_LAPACK_COMPLEX is not set. The python-numpy package
was patched to add the dependency on lapack package instead of
clapack.

It failed with the following error:

libcblas.so: undefined reference to `scnrm2_'
libcblas.so: undefined reference to `scasum_'

Indeed, scnrm2 and scasum are added to libblas.so only when
BUILD_COMPLEX is enabled.

Also, there is no really important space saving on the target:

| Library name  | Without lapack complex | With lapack complex |
| liblapack.so  | 2,4M                   | 4,6M                |
| liblapacke.so | 1,8M                   | 1,5M                |
| libcblas.so   | 48K                    | 76K                 |
| libblas.so    | 96K                    | 232K                |

(Tested with the ARM external toolchain 2019.03)

Complex matrices support are likeley expected when lapack package
is selected.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Benjamin Kamath <bkamath@spaceflight.com>
---
 Config.in.legacy         | 7 +++++++
 package/lapack/Config.in | 7 -------
 package/lapack/lapack.mk | 9 ++-------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a241b1ec8..bab89bd219 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_LAPACK_COMPLEX
+	bool "Complex/Complex16 option was removed"
+	select BR2_LEGACY
+	help
+	  Complex/Complex16 support is now unconditionally enabled in
+	  lapack package.
+
 config BR2_GDB_VERSION_7_12
 	bool "gdb 7.12.x has been removed"
 	select BR2_LEGACY
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index 9687ace82d..f7844e29c2 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -12,10 +12,3 @@ config BR2_PACKAGE_LAPACK
 	  installs two libraries: libblas and liblapack.
 
 	  http://www.netlib.org/lapack/
-
-config BR2_PACKAGE_LAPACK_COMPLEX
-	bool "Complex/Complex16 support"
-	default y
-	depends on BR2_PACKAGE_LAPACK
-	help
-	  Builds support for COMPLEX and COMPLEX16 data types.
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3b59214e4b..fcf4da3235 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -10,12 +10,7 @@ LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = http://www.netlib.org/lapack
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
-LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
-
-ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
-else
-LAPACK_CONF_OPTS += -DBUILD_COMPLEX=OFF -DBUILD_COMPLEX16=OFF
-endif
+LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON -DBUILD_COMPLEX=ON \
+	-DBUILD_COMPLEX16=ON
 
 $(eval $(cmake-package))
-- 
2.20.1
