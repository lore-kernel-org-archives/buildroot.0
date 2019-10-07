From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:47:15 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: fix build with libev
Message-ID: <20191007204140.4B7BD8113D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=492591d53a62047ef3a152f905b12fab184cbcaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-fix-build-with-libev-and-without-test.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
new file mode 100644
index 0000000000..09715d6b26
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
+[Upstream: https://github.com/warmcat/libwebsockets/commit/875739ca9913de8db1b1b616ecd7101df8dfc9db]
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
