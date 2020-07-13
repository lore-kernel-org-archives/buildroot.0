From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 11:01:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: fix build without fork
Message-ID: <20200713090140.154594-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add a patch to fix build without fork in src/dhcpcd.c
- Disable privsep as it unconditionally uses fork (privsep has been
  enabled by default since version 9.0.0 and
  https://github.com/rsmarples/dhcpcd/commit/3a4c2e5604d72151b06ed365aa71493740a3ad75)

Fixes:
 - http://autobuild.buildroot.org/results/9fcc88abedcb8a02946f37837dcf4fff02f66c23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-dhcpcd.c-fix-build-without-fork.patch | 36 +++++++++++++++++++
 package/dhcpcd/dhcpcd.mk                      |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch

diff --git a/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch b/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch
new file mode 100644
index 0000000000..07e6d642a7
--- /dev/null
+++ b/package/dhcpcd/0001-src-dhcpcd.c-fix-build-without-fork.patch
@@ -0,0 +1,36 @@
+From 13e475d9847bf7d6a6af62397f67eb269e27613e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Jul 2020 10:43:51 +0200
+Subject: [PATCH] src/dhcpcd.c: fix build without fork
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rsmarples/dhcpcd/pull/17]
+---
+ src/dhcpcd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dhcpcd.c b/src/dhcpcd.c
+index ee585aa4..b597a5c0 100644
+--- a/src/dhcpcd.c
++++ b/src/dhcpcd.c
+@@ -336,7 +336,7 @@ dhcpcd_daemonise(struct dhcpcd_ctx *ctx)
+ #ifdef THERE_IS_NO_FORK
+ 	eloop_timeout_delete(ctx->eloop, handle_exit_timeout, ctx);
+ 	errno = ENOSYS;
+-	return 0;
++	return;
+ #else
+ 	int i;
+ 	unsigned int logopts = loggetopts();
+@@ -2211,7 +2211,7 @@ printpidfile:
+ 	ps_init(&ctx);
+ #endif
+ 
+-#ifdef USE_SIGNALS
++#if defined(USE_SIGNALS) && !defined(THERE_IS_NO_FORK)
+ 	if (pipe(sigpipe) == -1) {
+ 		logerr("pipe");
+ 		goto exit_failure;
+-- 
+2.27.0
+
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index a40696924c..0dcd36f369 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,7 +16,7 @@ DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
 ifeq ($(BR2_USE_MMU),)
-DHCPCD_CONFIG_OPTS += --disable-fork
+DHCPCD_CONFIG_OPTS += --disable-fork --disable-privsep
 endif
 
 define DHCPCD_CONFIGURE_CMDS
-- 
2.27.0
