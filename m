From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:18:32 +0100
Subject: [Buildroot] [git commit] taskd: add patch for correct gnutls
	libraries in static build
Message-ID: <20161121201837.AF5C7817A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8528db817d7466fc9b5d5c2c619b57f184cdaca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CMakeLists.txt was using the wrong variables names to add to
includes and libs, so the additional libraries for static build
weren't added to the link command.

Patch sent upstream to taskwarrior-dev at googlegroups.com but it doesn't
seem to be very active.

Fixes:
http://autobuild.buildroot.net/results/d01e947fa807336ffcfd0fad27397af8e7442833

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...se-correct-variables-for-GnuTLS-detection.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch b/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
new file mode 100644
index 0000000..f2365ea
--- /dev/null
+++ b/package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
@@ -0,0 +1,32 @@
+From 88fee5c6eb2271d3de6b9878cd29a0494999aa18 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sun, 20 Nov 2016 23:46:45 +0100
+Subject: [PATCH] Use correct variables for GnuTLS detection
+
+At least with recent CMake, it seems the variables created by
+find_package (GnuTLS) are called PC_GNUTLS_INCLUDE_DIRS and
+PC_GNUTLS_LIBRARIES.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d8125d9..ccf827b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -110,8 +110,8 @@ message ("-- Looking for GnuTLS")
+ find_package (GnuTLS REQUIRED)
+ if (GNUTLS_FOUND)
+   set (HAVE_LIBGNUTLS true)
+-  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${GNUTLS_INCLUDE_DIR})
+-  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
++  set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${PC_GNUTLS_INCLUDE_DIRS})
++  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_LIBRARIES})
+ endif (GNUTLS_FOUND)
+ 
+ message ("-- Looking for libuuid")
+-- 
+2.10.2
+
