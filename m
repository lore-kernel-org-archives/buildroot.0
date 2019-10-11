From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:06:15 +0200
Subject: [Buildroot] [git commit] package/libzip: fix build with musl-fts
Message-ID: <20191011200221.21AE28D426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8cf282fa04d85a832c0665269130be9dfb6e1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/89f5fc111bb8bcecbe05ab79d62ac809094b6ce1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libzip/Config.in | 1 +
 package/libzip/libzip.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/libzip/Config.in b/package/libzip/Config.in
index f69dd0d4d5..c6ddabe6b5 100644
--- a/package/libzip/Config.in
+++ b/package/libzip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBZIP
 	bool "libzip"
 	depends on !BR2_STATIC_LIBS # dlsym()
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_ZLIB
 	help
 	  C library for reading, creating, and modifying zip archives.
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 280ca6d8c7..a312dd90df 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -33,5 +33,10 @@ else
 LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LIBZIP_DEPENDENCIES += musl-fts
+LIBZIP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
