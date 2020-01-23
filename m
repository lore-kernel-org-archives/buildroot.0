From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 23:58:07 +0100
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 3.2.2
Message-ID: <20200124091748.DFF718396A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=455d49a3882a657caedc27cb241ccb2a97b07e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches, including two additional ones contributed by Fabrice, are
included in this version.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...txt-fix-build-with-libev-and-without-test.patch | 52 ----------------------
 ...keLists.txt-fix-static-build-with-openssl.patch | 36 ---------------
 package/libwebsockets/libwebsockets.hash           |  2 +-
 package/libwebsockets/libwebsockets.mk             |  2 +-
 4 files changed, 2 insertions(+), 90 deletions(-)

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
diff --git a/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch b/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch
deleted file mode 100644
index c5aaafab85..0000000000
--- a/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From faf26eee75f5d58ff499cdc40ad1af58a33fb83f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 16 Oct 2019 20:09:13 +0200
-Subject: [PATCH] CMakeLists.txt: fix static build with openssl
-
-openssl can depends on -latomic so use pkg-config (if available) to
-retrieve these static dependencies otherwise build will fail because
-HMAC_CTX_new test will return a wrong result
-
-Fixes:
- - http://autobuild.buildroot.org/results/65d0528b208c0a470264f7e2433be89425971dd7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/warmcat/libwebsockets/pull/1717]
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2693ac56..888f65e8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1803,7 +1803,10 @@ if (LWS_WITH_SSL)
- 		if (NOT OPENSSL_FOUND AND NOT LWS_WITH_BORINGSSL)
- 			# TODO: Add support for STATIC also.
- 		if (NOT LWS_WITH_ESP32)
-+			find_package(PkgConfig QUIET)
-+			pkg_check_modules(PC_OPENSSL openssl QUIET)
- 			find_package(OpenSSL REQUIRED)
-+			list(APPEND OPENSSL_LIBRARIES ${PC_OPENSSL_LIBRARIES})
- 		endif()
- 			set(OPENSSL_INCLUDE_DIRS "${OPENSSL_INCLUDE_DIR}")
- 		endif()
--- 
-2.23.0
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 5bd728bc04..ca0c1db2d5 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	5e731c536a20d9c03ae611631db073f05cd77bf0906a8c30d2a13638d4c8c667  libwebsockets-3.2.0.tar.gz
+sha256	166d6e17cab64bfc10c2a71799c298284540a1fa63f6ea3de5caccb34502243c  libwebsockets-3.2.2.tar.gz
 sha256  4d092cd5e062c5ab0cf6408963d74619b5baf1571344410be6aa5bcef512eb70  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 7a065dfb22..dedd03347d 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 3.2.0
+LIBWEBSOCKETS_VERSION = 3.2.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
