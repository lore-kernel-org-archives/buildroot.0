From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 Oct 2018 22:07:59 +0200
Subject: [Buildroot] [PATCH 2/3] package/mjpg-streamer: fix zeromq header
 detection
In-Reply-To: <20181024200800.32300-1-bernd.kuhls@t-online.de>
References: <20181024200800.32300-1-bernd.kuhls@t-online.de>
Message-ID: <20181024200800.32300-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/72f/72f560b03cab96161f6d8d127f99150ba3e48aff/
http://autobuild.buildroot.net/results/dad/dad054954de76cab56333747274520f269be2066/
http://autobuild.buildroot.net/results/323/323a19f9a859105e08b0476508d30553577fda69/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-FindZeroMQ-fix-header-detection.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/mjpg-streamer/0001-FindZeroMQ-fix-header-detection.patch

diff --git a/package/mjpg-streamer/0001-FindZeroMQ-fix-header-detection.patch b/package/mjpg-streamer/0001-FindZeroMQ-fix-header-detection.patch
new file mode 100644
index 0000000000..2942e8997c
--- /dev/null
+++ b/package/mjpg-streamer/0001-FindZeroMQ-fix-header-detection.patch
@@ -0,0 +1,46 @@
+From a5a1506c9e003c7d2f719e09b7a6ac98c2a60459 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 24 Oct 2018 21:26:14 +0200
+Subject: [PATCH] FindZeroMQ: fix header detection
+
+FindZeroMQ.cmake, added by
+
+https://github.com/jacksonliam/mjpg-streamer/commit/8943c44e69d66650b9b1c5f873546579bfae7d2c#diff-1760adaac68b242c02c752a6efc72effR11
+
+checks for zmq.hpp but the ZeroMQ output module includes zmq.h instead:
+
+https://github.com/jacksonliam/mjpg-streamer/blob/master/mjpg-streamer-experimental/plugins/output_zmqserver/output_zmqserver.c#L40
+
+so let's check for this file instead because the output module is not
+written in C++. For reference see this Debian bug report about the split
+of the zeromq and cppzmq packages:
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697743
+
+This patch fixes a configure error on systems where cppzmq is not
+present:
+http://autobuild.buildroot.net/results/dad/dad054954de76cab56333747274520f269be2066/build-end.log
+
+Patch sent upstream as PR 174.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mjpg-streamer-experimental/cmake/FindZeroMQ.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mjpg-streamer-experimental/cmake/FindZeroMQ.cmake b/mjpg-streamer-experimental/cmake/FindZeroMQ.cmake
+index 69092e5..c64e7b7 100644
+--- a/mjpg-streamer-experimental/cmake/FindZeroMQ.cmake
++++ b/mjpg-streamer-experimental/cmake/FindZeroMQ.cmake
+@@ -8,7 +8,7 @@ endif()
+ 
+ ## use the hint from above to find where 'zmq.hpp' is located
+ find_path(ZeroMQ_INCLUDE_DIR
+-        NAMES zmq.hpp
++        NAMES zmq.h
+         HINTS ${PC_ZeroMQ_INCLUDEDIR} ${PC_ZeroMQ_INCLUDE_DIRS}
+         )
+ 
+-- 
+2.19.1
+
-- 
2.19.1
