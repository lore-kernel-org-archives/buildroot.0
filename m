From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Jan 2021 20:47:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgeos: depends on wchar
Message-ID: <20210131194722.4032192-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgeos unconditionally uses wstring which raises the following build
failure:

In file included from /srv/storage/autobuild/run/instance-3/output-1/build/libgeos-3.9.0/tools/astyle/ASLocalizer.cpp:40:
/srv/storage/autobuild/run/instance-3/output-1/build/libgeos-3.9.0/tools/astyle/ASLocalizer.h:72:34: error: 'wstring' does not name a type; did you mean 'stdin'?
  string convertToMultiByte(const wstring& wideStr) const;
                                  ^~~~~~~
                                  stdin

Fixes:
 - http://autobuild.buildroot.org/results/e97d03848d9bbf1845b994f391679a1dbf49f61e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeos/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 224c30c2ad..9f02c8b13f 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -10,5 +11,5 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libgeos needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
2.29.2
