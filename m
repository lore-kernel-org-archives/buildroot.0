From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun,  9 Aug 2020 11:35:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/librtlsdr: bump to more recent
 upstream master version
Message-ID: <20200809093538.126676-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 948666dfde1e0a5d149442f80facc162a83016ad, librtlsdr in Buildroot is no longer
built from an official release, but from a commit on the master branch. However, the
commit that was referenced has a broken pkgconfig file templating, such that
other packages using `pkgconfig --libs librtlsdr` as part of their build process
(such as dump1090) could not be built anymore:

Before 948666dfde1e0a5d149442f80facc162a83016ad:
$ cat staging/usr/lib/pkgconfig/librtlsdr.pc
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: RTL-SDR Library
Description: C Utility Library
Version: 0.6.0
Cflags: -I${includedir}/
Libs: -L${libdir} -lrtlsdr -lusb-1.0
Libs.private:

On 948666dfde1e0a5d149442f80facc162a83016ad:
$ cat staging/usr/lib/pkgconfig/librtlsdr.pc
prefix=
exec_prefix=
libdir=
includedir=

Name: RTL-SDR Library
Description: C Utility Library
Version: 7082
Cflags: -I${includedir}/
Libs: -L${libdir} -lrtlsdr
Libs.private:  -lusb-1.0

In the meantime, upstream released a bugfix for that ([1]), so we bump to that
commit as well, and update the only patch for shared libs accordingly, because
upstream also added a new tool called `rtl_biast` in the meantime.

Finaly, we update the hash file to the two-spaces convention.

Fixes: http://autobuild.buildroot.net/results/b4c/b4cdcb59cc61c51c024197a64865ad4b60023d0c/

[1]: https://github.com/steve-m/librtlsdr/commit/ed0317e6a58c098874ac58b769cf2e609c18d9a5

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 .../0001-disable_shared_library_target_in_build.patch    | 9 +++++----
 package/librtlsdr/librtlsdr.hash                         | 4 ++--
 package/librtlsdr/librtlsdr.mk                           | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
index 376aa23344..2fb63465de 100644
--- a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
+++ b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
@@ -1,4 +1,4 @@
-From c8878472bf84c656979ea1d07e7ed55b0aa2c939 Mon Sep 17 00:00:00 2001
+From 9a1c2587d4ef18e2026811deabd024eb7577d9ce Mon Sep 17 00:00:00 2001
 From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 Date: Fri, 15 May 2020 16:14:48 +0200
 Subject: [PATCH] disable shared library target in build
@@ -19,12 +19,13 @@ will be install.
 Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 ---
  src/CMakeLists.txt | 30 +++++++++++++++++++++---------
  1 file changed, 21 insertions(+), 9 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 33faee7..d82fc87 100644
+index de93044..13b7b1a 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
 @@ -18,6 +18,8 @@
@@ -121,9 +122,9 @@ index 33faee7..d82fc87 100644
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
    )
 +endif()
- install(TARGETS rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power
+ install(TARGETS rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast
    DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
 -- 
-2.26.2
+2.25.3
 
diff --git a/package/librtlsdr/librtlsdr.hash b/package/librtlsdr/librtlsdr.hash
index 920a755033..e4b0871db3 100644
--- a/package/librtlsdr/librtlsdr.hash
+++ b/package/librtlsdr/librtlsdr.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 78c20031287017d057941640dcf05cb7666cfedcfad1b4a1186ed00cabfabc2f  librtlsdr-d794155ba65796a76cd0a436f9709f4601509320.tar.gz
+sha256  f09ff5ba2fa1780071321ba22885b9d1a16ac9d4b944a97e39b6921960439301  librtlsdr-ed0317e6a58c098874ac58b769cf2e609c18d9a5.tar.gz
 # License file, locally calculated
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 16f2632789..47586bdfb2 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTLSDR_VERSION = d794155ba65796a76cd0a436f9709f4601509320
+LIBRTLSDR_VERSION = ed0317e6a58c098874ac58b769cf2e609c18d9a5
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
 LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
-- 
2.25.3
