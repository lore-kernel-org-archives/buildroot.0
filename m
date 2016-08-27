From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:37:48 +0200
Subject: [Buildroot] [PATCH] libamcodec: fix build with musl
Message-ID: <1472301468-30919-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to the libamcodec in order to fix the build
with musl, which was failing due to missing <stdint.h> includes.

Fixes:

  http://autobuild.buildroot.net/results/1f3b0d483603fb69765c15c7189ff975b72d09c3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Include-stdint.h-where-needed.patch       | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libamcodec/0001-Include-stdint.h-where-needed.patch

diff --git a/package/libamcodec/0001-Include-stdint.h-where-needed.patch b/package/libamcodec/0001-Include-stdint.h-where-needed.patch
new file mode 100644
index 0000000..6d588f6
--- /dev/null
+++ b/package/libamcodec/0001-Include-stdint.h-where-needed.patch
@@ -0,0 +1,47 @@
+From ff6d4326f839321c079d60ae9301c6202942f675 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 27 Aug 2016 14:31:04 +0200
+Subject: [PATCH] Include <stdint.h> where needed
+
+The {u,}int{8,16,32}_t types are defined in <stdint.h>, so it should be
+included when such types are used.
+
+Not including <stdint.h> might work by accident with some C libraries
+due to it being included by other headers, but it for example causes
+build failures with the musl C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: https://github.com/mdrjr/c2_aml_libs/pull/1
+---
+ amadec/audio-dec.h               | 1 +
+ amavutils/include/Amvideoutils.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/amadec/audio-dec.h b/amadec/audio-dec.h
+index 4325fe4..ac0f36b 100644
+--- a/amadec/audio-dec.h
++++ b/amadec/audio-dec.h
+@@ -12,6 +12,7 @@
+ #define AUDIO_DEC_H
+ 
+ #include<pthread.h>
++#include <stdint.h>
+ 
+ #include <audio-out.h>
+ #include <audiodsp.h>
+diff --git a/amavutils/include/Amvideoutils.h b/amavutils/include/Amvideoutils.h
+index 6f978e4..94f10a6 100644
+--- a/amavutils/include/Amvideoutils.h
++++ b/amavutils/include/Amvideoutils.h
+@@ -5,6 +5,8 @@
+ extern "C" {
+ #endif
+ 
++#include <stdint.h>
++
+ #define HDMI_HDCP_PASS           (1)
+ #define HDMI_HDCP_FAILED      (0)
+ #define HDMI_NOCONNECT        (-1)
+-- 
+2.7.4
+
-- 
2.7.4
