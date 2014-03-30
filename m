From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 30 Mar 2014 08:56:30 -0300
Subject: [Buildroot] [PATCH] openswan: fix possible build failure
Message-ID: <1396180590-28799-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openswan's Makefile uses gcc instead of $(CC) for gcc version detection
to use advanced warning/error options. The problem is that if the
host gcc version is newish (>=4.6) and the gcc for the target is not it
uses unsupported options.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openswan/openswan-01-gcc-detection.patch | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/openswan/openswan-01-gcc-detection.patch

diff --git a/package/openswan/openswan-01-gcc-detection.patch b/package/openswan/openswan-01-gcc-detection.patch
new file mode 100644
index 0000000..2feb5c5
--- /dev/null
+++ b/package/openswan/openswan-01-gcc-detection.patch
@@ -0,0 +1,43 @@
+From b37d4bd266ec65acdf5288e21722991d1c5ec44a Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 30 Mar 2014 08:52:05 -0300
+Subject: [PATCH] Makefile: use CC for version test instead of gcc
+
+Use $(CC) for the version test since that's different from gcc when
+cross-compiling.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/libopenswan/Makefile | 2 +-
+ programs/pluto/Makefile  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libopenswan/Makefile b/lib/libopenswan/Makefile
+index 3649fe7..06f5317 100644
+--- a/lib/libopenswan/Makefile
++++ b/lib/libopenswan/Makefile
+@@ -90,7 +90,7 @@ CFLAGS+= -Wpointer-arith
+ CFLAGS+= -Wno-error=cast-qual
+ 
+ # Check if GCC's version is recent enough
+-GCC_VERSION_GE_46:=$(shell test `gcc -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
++GCC_VERSION_GE_46:=$(shell test `$(CC) -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
+ ifeq ($(GCC_VERSION_GE_46),true)
+ # some junk left in alg_info.c
+ CFLAGS+= -Wno-error=cpp
+diff --git a/programs/pluto/Makefile b/programs/pluto/Makefile
+index 8e4bc89..ed5e9dc 100644
+--- a/programs/pluto/Makefile
++++ b/programs/pluto/Makefile
+@@ -48,7 +48,7 @@ CPPFLAGS = $(HDRDIRS) $(DEFINES) \
+ # must turn this off due to myid.c
+ CFLAGS+= -Wno-error=cast-qual
+ # Check if GCC's version is recent enough
+-GCC_VERSION_GE_46:=$(shell test `gcc -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
++GCC_VERSION_GE_46:=$(shell test `$(CC) -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
+ ifeq ($(GCC_VERSION_GE_46),true)
+ CFLAGS+= -Wno-error=cpp
+ endif
+-- 
+1.8.3.2
+
-- 
1.8.3.2
