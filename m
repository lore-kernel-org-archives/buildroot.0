From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Feb 2016 13:45:49 -0300
Subject: [Buildroot] [PATCH] graphite2: security bump to version 1.3.5
Message-ID: <1455554749-11434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1521 - An exploitable out-of-bounds read vulnerability exists
in the opcode handling functionality of Libgraphite. A specially crafted
font can cause an out-of-bounds read resulting in arbitrary code
execution. An attacker can provide a malicious font to trigger this
vulnerability.
CVE-2016-1522 - An exploitable NULL pointer dereference exists in the
bidirectional font handling functionality of Libgraphite. A specially
crafted font can cause a NULL pointer dereference resulting in a crash.
An attacker can provide a malicious font to trigger this vulnerability.
CVE-2016-1523 - An exploitable heap-based buffer overflow exists in the
context item handling functionality of Libgraphite. A specially crafted
font can cause a buffer overflow resulting in potential code execution.
An attacker can provide a malicious font to trigger this vulnerability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/graphite2/0001-disable-double-promotion.patch | 13 +++++++------
 package/graphite2/graphite2.hash                      |  4 ++--
 package/graphite2/graphite2.mk                        |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/graphite2/0001-disable-double-promotion.patch b/package/graphite2/0001-disable-double-promotion.patch
index 9199a63..3bda3d7 100644
--- a/package/graphite2/0001-disable-double-promotion.patch
+++ b/package/graphite2/0001-disable-double-promotion.patch
@@ -4,10 +4,11 @@ The warning flag isn't recognized for older GCC versions (blackfin),
 so just disable it.
 
 Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+[Gustavo: update for 1.3.5]
 
-diff -Nura graphite2-1.3.3.orig/src/CMakeLists.txt graphite2-1.3.3/src/CMakeLists.txt
---- graphite2-1.3.3.orig/src/CMakeLists.txt	2015-09-24 10:06:28.877851596 -0300
-+++ graphite2-1.3.3/src/CMakeLists.txt	2015-09-24 10:06:48.201519767 -0300
+diff -Nura graphite2-1.3.5.orig/src/CMakeLists.txt graphite2-1.3.5/src/CMakeLists.txt
+--- graphite2-1.3.5.orig/src/CMakeLists.txt	2016-02-15 11:46:45.941906112 -0300
++++ graphite2-1.3.5/src/CMakeLists.txt	2016-02-15 11:46:54.237194222 -0300
 @@ -111,9 +111,6 @@
          COMPILE_FLAGS   "-Wall -Wextra -Wno-unknown-pragmas -Wendif-labels -Wshadow -Wctor-dtor-privacy -Wnon-virtual-dtor -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -fno-stack-protector"
          LINK_FLAGS      "-nodefaultlibs ${GRAPHITE_LINK_FLAGS}" 
@@ -15,6 +16,6 @@ diff -Nura graphite2-1.3.3.orig/src/CMakeLists.txt graphite2-1.3.3/src/CMakeList
 -    if (CMAKE_COMPILER_IS_GNUCXX)
 -        add_definitions(-Wdouble-promotion)
 -    endif (CMAKE_COMPILER_IS_GNUCXX)
-     if (${CMAKE_CXX_COMPILER} MATCHES  ".*mingw.*")
-         target_link_libraries(graphite2 kernel32 msvcr90 mingw32 gcc user32)
-     else (${CMAKE_CXX_COMPILER} MATCHES  ".*mingw.*")
+     message(STATUS "Compiler ID is: ${CMAKE_CXX_COMPILER_ID}")
+     if (${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
+         add_definitions(-Wimplicit-fallthrough)
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index 1e8a54b..07102cf 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5	7cda6fc6bc197b216777b15ce52c38a8	graphite2-1.3.3.tgz
-sha1	54b04c283bab4695de63ae2dd6cff392dd49d7f0	graphite2-1.3.3.tgz
+md5	5b8d22a8bbf031838e31432868c0109c	graphite2-1.3.5.tgz
+sha1	044f65d5b4ade3169f5fcd75a25f047c81f5d33e	graphite2-1.3.5.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 0de4178..82c4a3b 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.3
+GRAPHITE2_VERSION = 1.3.5
 GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
-- 
2.4.10
