From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Oct 2019 08:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: set WANT_SWIG
Message-ID: <20191015061128.5986-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set WANT_SWIG={ON,OFF} to {en,dis}able swig and avoid a random build
failures probably due to parallel build issue when extracting
pre-generated tarball:

CMake Error: Problem with archive_write_header(): Can't unlink already-existing object
CMake Error: Current file: swigpyrun.h
CMake Error: Problem extracting tar: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/znc-1.7.5/modules/modpython/generated.tar.gz

Fixes:
 - http://autobuild.buildroot.org/results/f3394de616cea4f474b6d5887aa0d5f5dff05281

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/znc/znc.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 54dc63f4ea..3932c98020 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -42,9 +42,12 @@ ifeq ($(BR2_PACKAGE_ICU)$(BR2_PACKAGE_PYTHON3),yy)
 ZNC_DEPENDENCIES += python3 host-swig
 ZNC_CONF_OPTS += \
 	-DWANT_PYTHON=ON \
-	-DWANT_PYTHON_VERSION=python3
+	-DWANT_PYTHON_VERSION=python3 \
+	-DWANT_SWIG=ON
 else
-ZNC_CONF_OPTS += -DWANT_PYTHON=OFF
+ZNC_CONF_OPTS += \
+	-DWANT_PYTHON=OFF \
+	-DWANT_SWIG=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.23.0
