From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Sep 2016 09:51:07 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: bump to version 87286ee (beta)
Message-ID: <1473148267-18593-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version includes the patch on execinfo
(commit 775da272719b52bca37b44a40e935a1eb9d10466) so remove
the 0001-add-proper-check-for-detecting-header-execinfo.h.patch file

This version also fixes arc and musl build (ambiguous call to abs and
missing linux/ioctl header):
  http://autobuild.buildroot.net/results/b5406ca587592a3bac446d1f1df93d3eb45b96a9 fixed by commit 331cd7d6eef6f9f2658b91e662644d88c31eaf64
  http://autobuild.buildroot.net/results/62ec0d348153dff0efd4c1975a9198c17f01f1fa fixed by commit 6ea21db228124565466bf16b0400d40a5eaad30d

Due to DOS line endings, it is easier to reference this beta release
than converting git patches.
The stable release should be released in the first week of October.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...per-check-for-detecting-header-execinfo.h.patch | 58 ----------------------
 package/domoticz/domoticz.hash                     |  2 +-
 package/domoticz/domoticz.mk                       |  2 +-
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch

diff --git a/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch b/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
deleted file mode 100644
index 55bbb7d..0000000
--- a/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f0da50118f7bd01ed7fa97e75b790a8232d8d4dc Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
-Date: Thu, 25 Aug 2016 17:23:38 +0530
-Subject: [PATCH] add proper check for detecting header <execinfo.h>
-
-domoticz.cpp currently assumes that on GNU/Linux systems header
-<execinfo.h> is available. But that is not true. Since it provided by
-C library and uClibc can be built without backtrace support. And in
-such cases we get following build error.
-
-  domoticz-3.4834/main/domoticz.cpp:48:22: fatal error: execinfo.h: No such file or directory
-   #include <execinfo.h>
-                        ^
-  compilation terminated.
-
-Instead of depending on __gnu_linux__, add check for detecting
-presence of <execinfo.h> and guard code for dumpstack accordingly.
-
-This build failure is detected by Buildroot autobuilder.
-http://autobuild.buildroot.net/results/393/393f839e160b51ca12ac36058718ad2f0c1b50a6/
-
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- CMakeLists.txt    | 7 +++++++
- main/domoticz.cpp | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -61,6 +61,13 @@
-   "Where to put the executables for Domoticz"
-   )
- 
-+INCLUDE(CheckIncludeFiles)
-+CHECK_INCLUDE_FILES (execinfo.h HAVE_EXECINFO_H)
-+
-+IF(HAVE_EXECINFO_H)
-+  ADD_DEFINITIONS(-DHAVE_EXECINFO_H)
-+ENDIF(HAVE_EXECINFO_H)
-+
- #set(CMAKE_EXE_LINKER_FLAGS "-static")
- 
- # Macro for setting up precompiled headers. Usage:
-Index: b/main/domoticz.cpp
-===================================================================
---- a/main/domoticz.cpp
-+++ b/main/domoticz.cpp
-@@ -44,7 +44,7 @@
- 	#include <string.h> 
- #endif
- 
--#ifdef __gnu_linux__
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
- static void dumpstack(void) {
- 	// Notes :
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 9180a9b..b56bb95 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	02b4cdde8e376258aeae3d5621edf8bb6b3563c34282e50194db343fcec9c0f5	domoticz-3.4834.tar.gz
+sha256	f5eaa8db192c314374deb8d58471f3a338da1397be635ebaa4b1a5f664450b05	domoticz-87286ee76ad15420c52689f1e4eeeab56fb04d40.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index adcf061..aceae2d 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 3.4834
+DOMOTICZ_VERSION = 87286ee76ad15420c52689f1e4eeeab56fb04d40
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPLv3
 DOMOTICZ_LICENSE_FILES = License.txt
-- 
2.7.4
