From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 23:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with latest live555
Message-ID: <20210522214139.1245167-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure with live555 raised since commit
6ad1c7f12e57ab7c6f022470e0aacec442d14267

Fixes:
 - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ive555.cpp-fix-build-with-live555-20.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch

diff --git a/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
new file mode 100644
index 0000000000..5f046648d4
--- /dev/null
+++ b/package/vlc/0010-modules-access-live555.cpp-fix-build-with-live555-20.patch
@@ -0,0 +1,36 @@
+From eba390d13ec4089cd6b9d8687ab3f8905b9d3ac8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 22 May 2021 22:56:04 +0200
+Subject: [PATCH] modules/access/live555.cpp: fix build with live555 >=
+ 2020.12.11
+
+Since live555-2020.12.11, connectionEndpointAddress() member function
+use a "struct sockaddr_storage" in preparation for eventual support of
+IPv6: http://www.live555.com/liveMedia/public/changelog.txt
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83170984f96238756c45bf1f4e542363afafd45f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/access/live555.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
+index 9d6e01ae32..32a6c294eb 100644
+--- a/modules/access/live555.cpp
++++ b/modules/access/live555.cpp
+@@ -850,7 +850,9 @@ static int SessionsSetup( demux_t *p_demux )
+             if( !p_sys->b_multicast )
+             {
+                 /* We need different rollover behaviour for multicast */
+-                p_sys->b_multicast = IsMulticastAddress( sub->connectionEndpointAddress() );
++                struct sockaddr_storage tempAddr;
++                sub->getConnectionEndpointAddress( tempAddr );
++                p_sys->b_multicast = IsMulticastAddress( tempAddr );
+             }
+ 
+             tk = (live_track_t*)malloc( sizeof( live_track_t ) );
+-- 
+2.30.2
+
-- 
2.30.2
