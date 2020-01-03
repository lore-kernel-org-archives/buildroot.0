From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 14:37:47 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/libwebsockets: bump to version 3.2.1
In-Reply-To: <20200103133747.1504249-1-fontaine.fabrice@gmail.com>
References: <20200103133747.1504249-1-fontaine.fabrice@gmail.com>
Message-ID: <20200103133747.1504249-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove first patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-build-with-libev-and-without-test.patch | 52 -------------------
 ...s.txt-fix-static-build-with-openssl.patch} |  0
 ...x-build-with-openssl-and-without-th.patch} |  0
 ...keLists.txt-fix-LWS_HAS_GETOPT_LONG.patch} |  0
 package/libwebsockets/libwebsockets.hash      |  2 +-
 package/libwebsockets/libwebsockets.mk        |  2 +-
 6 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
 rename package/libwebsockets/{0002-CMakeLists.txt-fix-static-build-with-openssl.patch => 0001-CMakeLists.txt-fix-static-build-with-openssl.patch} (100%)
 rename package/libwebsockets/{0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch => 0002-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch} (100%)
 rename package/libwebsockets/{0004-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch => 0003-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch} (100%)

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
deleted file mode 100644
index 09715d6b26..0000000000
--- a/package/libwebsockets/0001-CMakeLists.txt-fix-build-with-libev-and-without-test.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 72c761789550703f004962ae164c415928e5e35c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 6 Oct 2019 14:45:15 +0200
-Subject: [PATCH] CMakeLists.txt: fix build with libev and without testapps
-
-Move libev workaround outside the
-if ((LWS_ROLE_H1 OR LWS_ROLE_H2) AND NOT LWS_WITHOUT_TESTAPPS) block
-otherwise build fails on:
-
-/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c: In function 'lws_ev_hrtimer_cb':
-/home/naourr/work/instance-1/output-1/build/libwebsockets-3.2.0/lib/event-libs/libev/libev.c:34:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
-   ev_timer_set(&pt->ev.hrtimer, ((float)us) / 1000000.0, 0);
-   ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b5a2188dce90f3ca9bf0cc7a043c1a946b8e288f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream: https://github.com/warmcat/libwebsockets/commit/875739ca9913de8db1b1b616ecd7101df8dfc9db]
----
- CMakeLists.txt | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c26feb2..a10178c2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1435,6 +1435,8 @@ endif()
- if (LWS_WITH_LIBEV AND LWS_WITH_NETWORK)
- 	list(APPEND SOURCES
- 		lib/event-libs/libev/libev.c)
-+	# libev generates a big mess of warnings with gcc, maintainer claims gcc to blame
-+	set_source_files_properties( lib/event-libs/libev/libev.c PROPERTIES COMPILE_FLAGS "-Wno-error" )
- endif()
- 
- if (LWS_WITH_LEJP)
-@@ -2195,12 +2197,6 @@ if ((LWS_ROLE_H1 OR LWS_ROLE_H2) AND NOT LWS_WITHOUT_TESTAPPS)
- 		endif()
- 	endif()
- 
--	if (LWS_WITH_LIBEV)
--		# libev generates a big mess of warnings with gcc, maintainer claims gcc to blame
--		set_source_files_properties( lib/event-libs/libev/libev.c PROPERTIES COMPILE_FLAGS "-Wno-error" )
--	endif()
--
--
- 	if (NOT LWS_WITHOUT_SERVER)
- 		#
- 		# test-server
--- 
-2.23.0
-
diff --git a/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-static-build-with-openssl.patch
similarity index 100%
rename from package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch
rename to package/libwebsockets/0001-CMakeLists.txt-fix-static-build-with-openssl.patch
diff --git a/package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch b/package/libwebsockets/0002-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch
similarity index 100%
rename from package/libwebsockets/0003-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch
rename to package/libwebsockets/0002-CMakeLists.txt-fix-build-with-openssl-and-without-th.patch
diff --git a/package/libwebsockets/0004-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch b/package/libwebsockets/0003-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch
similarity index 100%
rename from package/libwebsockets/0004-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch
rename to package/libwebsockets/0003-CMakeLists.txt-fix-LWS_HAS_GETOPT_LONG.patch
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 5bd728bc04..9aefe5c8b6 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5e731c536a20d9c03ae611631db073f05cd77bf0906a8c30d2a13638d4c8c667  libwebsockets-3.2.0.tar.gz
+sha256	5b1521002771420bc91e1c91f36bc51f54bf4035c4bebde296dec235a45c33df  libwebsockets-3.2.1.tar.gz
 sha256  4d092cd5e062c5ab0cf6408963d74619b5baf1571344410be6aa5bcef512eb70  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 7a065dfb22..5b54eebb94 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 3.2.0
+LIBWEBSOCKETS_VERSION = 3.2.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.24.0
