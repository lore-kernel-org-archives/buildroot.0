From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jun 2020 23:20:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/cannelloni: bump to version 1.0.0
Message-ID: <20200614212010.907738-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Add -std=c++11 to fix the build with gcc 4.8 as it has been removed by
  upstream since version 1.0.0 and
  https://github.com/mguentner/cannelloni/commit/2558902f0b2c2750ce99d05ac3cfe149c391482b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-missing-cstdio-include.patch     | 29 -------------------
 package/cannelloni/cannelloni.hash            |  2 +-
 package/cannelloni/cannelloni.mk              |  5 ++--
 3 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 package/cannelloni/0001-Add-missing-cstdio-include.patch

diff --git a/package/cannelloni/0001-Add-missing-cstdio-include.patch b/package/cannelloni/0001-Add-missing-cstdio-include.patch
deleted file mode 100644
index 1e4ad00396..0000000000
--- a/package/cannelloni/0001-Add-missing-cstdio-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d41f5ec6bb66654558757c3ef9cd2a158ee06ccc Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 15 Feb 2017 09:29:29 +0100
-Subject: [PATCH] Add missing <cstdio> include
-
-This header defines EOF macro. Some toolchains cannot
-find this macro, if <cstdio> is missing. So include it
-explicitly.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- sctpthread.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/sctpthread.cpp b/sctpthread.cpp
-index 6c83fed..d83b472 100644
---- a/sctpthread.cpp
-+++ b/sctpthread.cpp
-@@ -19,6 +19,7 @@
-  */
- 
- #include <chrono>
-+#include <cstdio>
- #include <algorithm>
- 
- #include <string.h>
--- 
-2.1.4
-
diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 41cb72816d..107415b0ac 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe5abb1c9e523049c48dd906603bc762cc55ccd20c16dbec7dc64163b9eefccf  cannelloni-20160414.tar.gz
+sha256  de44b7e327fbf38883f46e51a5afd07de5144f2e44c5f42b7f2f0741165f0b13  cannelloni-1.0.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index cc99c54aa1..f97a091760 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 20160414
-CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
+CANNELLONI_VERSION = 1.0.0
+CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
+CANNELLONI_CONF_OPTS = -DCMAKE_CXX_FLAGS="-std=c++11"
 
 ifeq ($(BR2_PACKAGE_LKSCTP_TOOLS),y)
 CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=ON
-- 
2.26.2
