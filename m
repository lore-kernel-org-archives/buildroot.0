From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  3 Sep 2017 10:19:20 +0200
Subject: [Buildroot] [PATCH v2] package/sysdig: fix missing curlbuild include
Message-ID: <1504426760-14252-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curlbuild.h was removed in recent versinos of curl, backporting a
patch from mainline to fix it until a newer version of sysdig is
released.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../sysdig/0001-Don-t-include-curlbuild.h.patch    | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/sysdig/0001-Don-t-include-curlbuild.h.patch

diff --git a/package/sysdig/0001-Don-t-include-curlbuild.h.patch b/package/sysdig/0001-Don-t-include-curlbuild.h.patch
new file mode 100644
index 0000000..5b53bb1
--- /dev/null
+++ b/package/sysdig/0001-Don-t-include-curlbuild.h.patch
@@ -0,0 +1,58 @@
+From 8a6670ea4b57c0e2bf8588d4534b22d1ea860989 Mon Sep 17 00:00:00 2001
+From: Mark Stemm <mark.stemm@gmail.com>
+Date: Tue, 15 Aug 2017 17:49:53 -0700
+Subject: [PATCH] Don't include curlbuild.h
+
+It's not required to build and it's not present with some newer versions
+of libcurl, so removing it.
+
+Thanks to https://github.com/hhoffstaette for the tip.
+
+This fixes https://github.com/draios/sysdig/issues/895.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ userspace/libsinsp/marathon_http.cpp | 1 -
+ userspace/libsinsp/mesos_http.cpp    | 1 -
+ userspace/sysdig.project             | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/userspace/libsinsp/marathon_http.cpp b/userspace/libsinsp/marathon_http.cpp
+index f7937b6..2e4449a 100644
+--- a/userspace/libsinsp/marathon_http.cpp
++++ b/userspace/libsinsp/marathon_http.cpp
+@@ -7,7 +7,6 @@
+ #include "marathon_http.h"
+ #include "curl/curl.h"
+ #include "curl/easy.h"
+-#include "curl/curlbuild.h"
+ #define BUFFERSIZE 512 // b64 needs this macro
+ #include "b64/encode.h"
+ #include "sinsp.h"
+diff --git a/userspace/libsinsp/mesos_http.cpp b/userspace/libsinsp/mesos_http.cpp
+index 18ac9f5..c6bfb58 100644
+--- a/userspace/libsinsp/mesos_http.cpp
++++ b/userspace/libsinsp/mesos_http.cpp
+@@ -7,7 +7,6 @@
+ #include "mesos_http.h"
+ #include "curl/curl.h"
+ #include "curl/easy.h"
+-#include "curl/curlbuild.h"
+ #include "sinsp.h"
+ #include "sinsp_int.h"
+ #include "sinsp_curl.h"
+diff --git a/userspace/sysdig.project b/userspace/sysdig.project
+index 5d00f18..76a18f0 100644
+--- a/userspace/sysdig.project
++++ b/userspace/sysdig.project
+@@ -752,7 +752,6 @@
+             </VirtualDirectory>
+             <VirtualDirectory Name="include">
+               <VirtualDirectory Name="curl">
+-                <File Name="../build/release/curl-prefix/src/curl/include/curl/curlbuild.h"/>
+                 <File Name="../build/release/curl-prefix/src/curl/include/curl/easy.h"/>
+                 <File Name="../build/release/curl-prefix/src/curl/include/curl/stdcheaders.h"/>
+                 <File Name="../build/release/curl-prefix/src/curl/include/curl/curlrules.h"/>
+-- 
+2.7.4
+
-- 
2.7.4
