From: Matthew Fornero <mfornero@mathworks.com>
Date: Wed,  8 Jun 2016 21:02:56 -0400
Subject: [Buildroot] [PATCH] libiio: Fix pthread linking for iiod
In-Reply-To: <20160608235050.74fe60e9@free-electrons.com>
References: <20160608235050.74fe60e9@free-electrons.com>
Message-ID: <1465434176-548-1-git-send-email-mfornero@mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the iiod CMake configuration to resolve pthread linking issues
introduced with commit:

17ee15da70d23c314a3264c87a785101cbd9d85d
("libiio: Bump version to 0.6")

Fixes:
http://autobuild.buildroot.net/results/ffe/ffec14aa79833a6f0889a87b31dae464d083e6a8/
http://autobuild.buildroot.net/results/49f/49f249632ed021ebe73ee7fab1b55fb3bb4c08f8/

Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
---
 ...IIOD-Link-pthread-with-no-network-backend.patch |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch

diff --git a/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch b/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch
new file mode 100644
index 0000000..df11a49
--- /dev/null
+++ b/package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch
@@ -0,0 +1,30 @@
+From 8dcb6c3f60123511d77b9fc7e4e22ae710e7d2f4 Mon Sep 17 00:00:00 2001
+From: Matthew Fornero <mfornero@mathworks.com>
+Date: Wed, 8 Jun 2016 20:03:56 -0400
+Subject: [PATCH] IIOD: Link pthread with no network backend
+
+If iiod is built without the network backend, CMake will not link in
+pthreads. Update the CMake configuration to accomodate this case.
+
+Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
+---
+ CMakeLists.txt |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 70f61f0..20fa9f1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -56,6 +56,9 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ 	if (WITH_IIOD AND NOT WITH_LOCAL_BACKEND)
+ 		message(SEND_ERROR "IIOD can only be enabled if the local backend is enabled")
+ 	endif()
++	if (WITH_IIOD)
++		set(NEED_THREADS 1)
++	endif()
+ endif()
+ 
+ option(ENABLE_IPV6 "Define if you want to enable IPv6 support" ON)
+-- 
+1.7.10.4
+
-- 
1.7.10.4
