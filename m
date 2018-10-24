From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:12:46 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] libssh: bump to version
 0.8.3
Message-ID: <20181024112042.80F0080091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c26f59e1a68f838deef11968f6473198b520c15d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Drop GNU glob detection patch; issue fixed upstream.

Add upstream patch that completes the build fix when GNU glob is not
present.

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 540e37bf7457fe41ffb6270ad23bea2fc8a706a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ake-check-for-GNU-compatible-glob-support.patch | 44 ----------------------
 ...fig-Fix-building-without-globbing-support.patch | 30 +++++++++++++++
 package/libssh/libssh.hash                         |  4 +-
 package/libssh/libssh.mk                           |  2 +-
 4 files changed, 34 insertions(+), 46 deletions(-)

diff --git a/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch b/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch
deleted file mode 100644
index 139879b86c..0000000000
--- a/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3bb8b5e4517a720d178dbe5c53b4a444d718bcf1 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 14 Sep 2018 15:19:48 +0300
-Subject: [PATCH] cmake: check for GNU compatible glob support
-
-The GLOB_TILDE flag is a GNU extension. musl libc does not implement
-this extension, which leads to build failure:
-
-.../libssh-0.8.1/src/config.c: In function 'local_parse_glob':
-/home/buildroot/autobuild/run/instance-1/output/build/libssh-0.8.1/src/config.c:329:10: error: 'glob_t {aka struct <anonymous>}' has no member named 'gl_flags'; did you mean 'gl_offs'?
-         .gl_flags = 0,
-          ^~~~~~~~
-          gl_offs
-.../libssh-0.8.1/src/config.c:334:25: error: 'GLOB_TILDE' undeclared (first use in this function); did you mean '_IO_FILE'?
-     rt = glob(fileglob, GLOB_TILDE, NULL, &globbuf);
-                         ^~~~~~~~~~
-                         _IO_FILE
-
-Check for GLOB_TILDE directly to make sure the libc provides the
-required extension.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://www.libssh.org/archive/libssh/2018-09/0000020.html
-
- ConfigureChecks.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
-index f91bd038f5a3..dac61bcf678e 100644
---- a/ConfigureChecks.cmake
-+++ b/ConfigureChecks.cmake
-@@ -156,7 +156,7 @@ check_function_exists(explicit_bzero HAVE_EXPLICIT_BZERO)
- check_function_exists(memset_s HAVE_MEMSET_S)
- 
- if (HAVE_GLOB_H)
--  check_function_exists(glob HAVE_GLOB)
-+  check_symbol_exists(GLOB_TILDE "glob.h" HAVE_GLOB)
- endif (HAVE_GLOB_H)
- 
- if (NOT WIN32)
--- 
-2.18.0
-
diff --git a/package/libssh/0001-config-Fix-building-without-globbing-support.patch b/package/libssh/0001-config-Fix-building-without-globbing-support.patch
new file mode 100644
index 0000000000..81585db49f
--- /dev/null
+++ b/package/libssh/0001-config-Fix-building-without-globbing-support.patch
@@ -0,0 +1,30 @@
+From 97b2a61d74edebad43ad09612c92a0341090f165 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Tue, 25 Sep 2018 14:35:43 +0200
+Subject: [PATCH] config: Fix building without globbing support
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit f709c3ac585f7b47317758b8693a6d104b30f951)
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 97b2a61d74 (stable-0.8 branch)
+
+ src/config.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/config.c b/src/config.c
+index df6b48bf6d5e..3d87a1780a58 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -462,7 +462,7 @@ static int ssh_config_parse_line(ssh_session session, const char *line,
+ 
+       p = ssh_config_get_str_tok(&s, NULL);
+       if (p && *parsing) {
+-#ifdef HAVE_GLOB
++#if defined(HAVE_GLOB) && defined(HAVE_GLOB_GL_FLAGS_MEMBER)
+         local_parse_glob(session, p, parsing, seen);
+ #else
+         local_parse_file(session, p, parsing, seen);
+-- 
+2.19.1
+
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 7220c337cf..1810545daa 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,3 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 d17f1267b4a5e46c0fbe66d39a3e702b8cefe788928f2eb6e339a18bb00b1924  libssh-0.8.1.tar.xz
+# https://www.libssh.org/files/0.8/libssh-0.8.3.tar.xz.asc
+# with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
+sha256 302f31f606f2368cd3ce77d7a69f7464c18eae176e73e59102e0524401bd29d0  libssh-0.8.3.tar.xz
 sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 635d72ad98..42dcdc48e0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
