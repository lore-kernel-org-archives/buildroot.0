From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Oct 2019 14:53:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/libwebsockets: fix build with libev
In-Reply-To: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
References: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
Message-ID: <20191006125339.23402-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-build-with-libev-and-without-test.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
new file mode 100644
index 0000000000..ff85571fc9
--- /dev/null
+++ b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
@@ -0,0 +1,52 @@
+From 72c761789550703f004962ae164c415928e5e35c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Oct 2019 14:45:15 +0200
+Subject: [PATCH] CMakeLists.txt: fix build with libev and without testapps
+
+Move libev workaround outside the
+if ((LWS_ROLE_H1 OR LWS_ROLE_H2) AND NOT LWS_WITHOUT_TESTAPPS) block
+otherwise build fails on:
+
+/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
+/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c:34:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+   ev_timer_set(&pt->ev.hrtimer, ((float)us) / 1000000.0, 0);
+   ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/warmcat/libwebsockets/pull/1707]
+---
+ CMakeLists.txt | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6c26feb2..a10178c2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1435,6 +1435,8 @@ endif()
+ if (LWS_WITH_LIBEV AND LWS_WITH_NETWORK)
+ 	list(APPEND SOURCES
+ 		lib/event-libs/libev/libev.c)
++	# libev generates a big mess of warnings with gcc, maintainer claims gcc to blame
++	set_source_files_properties( lib/event-libs/libev/libev.c PROPERTIES COMPILE_FLAGS "-Wno-error" )
+ endif()
+ 
+ if (LWS_WITH_LEJP)
+@@ -2195,12 +2197,6 @@ if ((LWS_ROLE_H1 OR LWS_ROLE_H2) AND NOT LWS_WITHOUT_TESTAPPS)
+ 		endif()
+ 	endif()
+ 
+-	if (LWS_WITH_LIBEV)
+-		# libev generates a big mess of warnings with gcc, maintainer claims gcc to blame
+-		set_source_files_properties( lib/event-libs/libev/libev.c PROPERTIES COMPILE_FLAGS "-Wno-error" )
+-	endif()
+-
+-
+ 	if (NOT LWS_WITHOUT_SERVER)
+ 		#
+ 		# test-server
+-- 
+2.23.0
+
-- 
2.23.0
