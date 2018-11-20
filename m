From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 19 Nov 2018 20:42:55 -0600
Subject: [Buildroot] [PATCH] package/sconeserver: Gzipstream requires zlib
Message-ID: <1542681775-28857-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

checking pkg-config is at least version 0.9.0... yes
checking for dlopen in -ldl... (cached) yes
checking for deflate in -lz... no
configure: error: library 'libz' is required

Resolves
http://autobuild.buildroot.net/results/b5e2b8635b37e6f2803a6031b154cf67685a4221

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

The one build failure so far has only occurred on master
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 7027bd9..e984801 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Sconeserver is a modular, object-orientated and extremely
 	  versatile network server framework for GNU/Linux and
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 12cadbf..c160c8b 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
-SCONESERVER_DEPENDENCIES = host-pkgconf pcre
+SCONESERVER_DEPENDENCIES = host-pkgconf pcre zlib
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
-- 
1.9.1
