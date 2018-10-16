From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 14:45:15 +0200
Subject: [Buildroot] [git commit] libssh: security bump to version 0.8.4
Message-ID: <20181016135755.D89C47FF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de24e47d90f64f546978b6ec12f769dc4fd89587
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-10933: authentication bypass vulnerability in the server
code. By presenting the server an SSH2_MSG_USERAUTH_SUCCESS message in
place of the SSH2_MSG_USERAUTH_REQUEST message which the server would
expect to initiate authentication, the attacker could successfully
authenticate without any credentials.

  https://www.libssh.org/security/advisories/CVE-2018-10933.txt

Drop an upstream patch.

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fig-Fix-building-without-globbing-support.patch | 30 ----------------------
 package/libssh/libssh.hash                         |  4 +--
 package/libssh/libssh.mk                           |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/libssh/0001-config-Fix-building-without-globbing-support.patch b/package/libssh/0001-config-Fix-building-without-globbing-support.patch
deleted file mode 100644
index 81585db49f..0000000000
--- a/package/libssh/0001-config-Fix-building-without-globbing-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 97b2a61d74edebad43ad09612c92a0341090f165 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Tue, 25 Sep 2018 14:35:43 +0200
-Subject: [PATCH] config: Fix building without globbing support
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-(cherry picked from commit f709c3ac585f7b47317758b8693a6d104b30f951)
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 97b2a61d74 (stable-0.8 branch)
-
- src/config.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/config.c b/src/config.c
-index df6b48bf6d5e..3d87a1780a58 100644
---- a/src/config.c
-+++ b/src/config.c
-@@ -462,7 +462,7 @@ static int ssh_config_parse_line(ssh_session session, const char *line,
- 
-       p = ssh_config_get_str_tok(&s, NULL);
-       if (p && *parsing) {
--#ifdef HAVE_GLOB
-+#if defined(HAVE_GLOB) && defined(HAVE_GLOB_GL_FLAGS_MEMBER)
-         local_parse_glob(session, p, parsing, seen);
- #else
-         local_parse_file(session, p, parsing, seen);
--- 
-2.19.1
-
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 1810545daa..257b93cb61 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.8/libssh-0.8.3.tar.xz.asc
+# https://www.libssh.org/files/0.8/libssh-0.8.4.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 302f31f606f2368cd3ce77d7a69f7464c18eae176e73e59102e0524401bd29d0  libssh-0.8.3.tar.xz
+sha256 6bb07713021a8586ba2120b2c36c468dc9ac8096d043f9b1726639aa4275b81b  libssh-0.8.4.tar.xz
 sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 42dcdc48e0..1ef09b3a21 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
