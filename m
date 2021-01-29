From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:36:57 +0100
Subject: [Buildroot] [git commit] package/dhcpcd: bump to version 9.4.0
Message-ID: <20210129082033.31EDC81530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d2bfb42a5acd0df70f1ba6fa92d83bac8690bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-dhcpcd.c-fix-build-without-fork.patch | 36 ----------------------
 package/dhcpcd/dhcpcd.hash                         |  4 +--
 package/dhcpcd/dhcpcd.mk                           |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch b/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch
deleted file mode 100644
index 07e6d642a7..0000000000
--- a/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 13e475d9847bf7d6a6af62397f67eb269e27613e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 13 Jul 2020 10:43:51 +0200
-Subject: [PATCH] src/dhcpcd.c: fix build without fork
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/17]
----
- src/dhcpcd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dhcpcd.c b/src/dhcpcd.c
-index ee585aa4..b597a5c0 100644
---- a/src/dhcpcd.c
-+++ b/src/dhcpcd.c
-@@ -336,7 +336,7 @@ dhcpcd_daemonise(struct dhcpcd_ctx *ctx)
- #ifdef THERE_IS_NO_FORK
- 	eloop_timeout_delete(ctx->eloop, handle_exit_timeout, ctx);
- 	errno = ENOSYS;
--	return 0;
-+	return;
- #else
- 	int i;
- 	unsigned int logopts = loggetopts();
-@@ -2211,7 +2211,7 @@ printpidfile:
- 	ps_init(&ctx);
- #endif
- 
--#ifdef USE_SIGNALS
-+#if defined(USE_SIGNALS) && !defined(THERE_IS_NO_FORK)
- 	if (pipe(sigpipe) == -1) {
- 		logerr("pipe");
- 		goto exit_failure;
--- 
-2.27.0
-
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 6991e73680..413f5c842b 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.1.4.tar.xz.distinfo
-sha256  5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820  dhcpcd-9.1.4.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.0.tar.xz.distinfo
+sha256  41a69297f380bf15ee8f94f73154f8c2bca7157a087c0d5aca8de000ba1d4513  dhcpcd-9.4.0.tar.xz
 # Locally calculated
 sha256  9cce1077bad23544349788ec750ec6e5aee106fc437fd6b5d73c0d8510426578  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 4900e0581f..ce1443eed0 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 9.1.4
+DHCPCD_VERSION = 9.4.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
