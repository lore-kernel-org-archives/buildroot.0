From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 19:46:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/rpm: disable openmp
Message-ID: <20201112184600.427081-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable openmp to fix a build failure with codesourcery toolchain that
doesn't have OpenMP >= 4.5 indeed upstream doesn't want to remove the
build failure if the user provides --enable-openmp and OpenMP is < 4.5:
https://github.com/rpm-software-management/rpm/pull/1433

Fixes:
 - http://autobuild.buildroot.org/results/05dd945d24e8684aad6a2343ba7f6f8a7cea8349

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 661409294b..b6c76df216 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -20,7 +20,10 @@ RPM_DEPENDENCIES = \
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
 
+# Disable openmp as it fails to build with OpenMP < 4.5:
+# https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
+	--disable-openmp \
 	--disable-python \
 	--disable-rpath \
 	--with-external-db \
@@ -106,12 +109,6 @@ else
 RPM_CONF_OPTS += --disable-zstd
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
-RPM_CONF_OPTS += --enable-openmp
-else
-RPM_CONF_OPTS += --disable-openmp
-endif
-
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-- 
2.28.0
