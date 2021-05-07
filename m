From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 May 2021 20:30:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.4.1
Message-ID: <20210507183009.2584138-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add ac_cv_prog_cc_c99 to avoid a build failure due to
  https://github.com/open-mpi/hwloc/commit/f2226f76e104923a76c5d09328284104abad6b01
- Update hash of COPYING, copyrights added with
  https://github.com/open-mpi/hwloc/commit/ebaa3595e2ddc6e0e94e8ea5b1472f1a21969c80
- Update indentation in hash file (two spaces)

As a side effect, this will remove numactl dependency (which raises a
build failure with sparc v8 since commit
4ed540ddf59bec4b389be44d7f42820d2466904f) thanks to:
https://github.com/open-mpi/hwloc/commit/e6a53bbf65458fd5fe4d45d5a83027b530566591

https://github.com/open-mpi/hwloc/blob/hwloc-2.4.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/5f9394d3bab4e83edbea9bc607c3e135adfdabbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hwloc/hwloc.hash |  8 +++-----
 package/hwloc/hwloc.mk   | 17 +++++++----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index 9637ba1325..e207a6bb1a 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,6 +1,4 @@
-# From https://www.open-mpi.org/software/hwloc/v1.11/
-md5 3c792e23c209e9e1bafe9bdbc613d401  hwloc-1.11.13.tar.bz2
-sha1 c3ae96a845ff3800f28b28fdb48146f971589653  hwloc-1.11.13.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.4/
+sha256  392421e69f26120c8ab95d151fe989f2b4b69dab3c7735741c4e0a6d7de5de63  hwloc-2.4.1.tar.bz2
 # Locally computed
-sha256 a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8  hwloc-1.11.13.tar.bz2
-sha256 c1816ed2da6aea779c4f27352f807c8bbaf545c2843d7b2ae818e1d529028821  COPYING
+sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 9ec94f818d..77a25a1775 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,16 +4,20 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 1.11
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).13
+HWLOC_VERSION_MAJOR = 2.4
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
-HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/downloads
+HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
 HWLOC_INSTALL_STAGING = YES
 HWLOC_SELINUX_MODULES = hwloc
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+HWLOC_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 HWLOC_CONF_OPTS = \
 	--disable-opencl \
 	--disable-cuda \
@@ -30,11 +34,4 @@ else
 HWLOC_CONF_OPTS += --disable-pci
 endif
 
-ifeq ($(BR2_PACKAGE_NUMACTL),y)
-HWLOC_CONF_OPTS += --enable-libnuma
-HWLOC_DEPENDENCIES += numactl
-else
-HWLOC_CONF_OPTS += --disable-libnuma
-endif
-
 $(eval $(autotools-package))
-- 
2.30.2
