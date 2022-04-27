Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B38CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA18060F25;
	Wed, 27 Apr 2022 17:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1l5brlvC0-4; Wed, 27 Apr 2022 17:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13E260E4B;
	Wed, 27 Apr 2022 17:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFA301BF9CB
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3B960F25
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-6dzr0XjUZh for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06FB660701
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 880FC845FD; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 18:23:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25f56c5d602903b2c572fd05ded3be8bee79f981
X-Git-Newrev: 8bbd3e31f1fe906670306bc7224ac3f932219c5c
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.880FC845FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: fix build with
 argp-standalone
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8bbd3e31f1fe906670306bc7224ac3f932219c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of argp-standalone to
version 1.4.1 in commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'

Fixes:
 - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...002-configure.ac-replace-argp_usage-check.patch | 40 ++++++++++++++++++++++
 package/cryptsetup/cryptsetup.mk                   |  1 +
 2 files changed, 41 insertions(+)

diff --git a/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
new file mode 100644
index 0000000000..66e3be350c
--- /dev/null
+++ b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
@@ -0,0 +1,40 @@
+From 21515ad7a3b000ee6038f82bbb428ab527002bbd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Apr 2022 19:47:53 +0200
+Subject: [PATCH] configure.ac: replace argp_usage check
+
+Replace check for argp_usage by argp_parse as argp_usage is not used by
+cryptsetup. Moreover, this will fix the following build failure raised
+with argp-standalone in version 1.4.0 and
+https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
+
+/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
+cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
+/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
+cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.com/cryptsetup/cryptsetup/-/issues/737]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d31fb0a7..e47179f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -413,7 +413,7 @@ if test "x$enable_ssh_token" = "xyes"; then
+ 	AC_CHECK_DECLS([ssh_session_is_known_server], [], [], [#include <libssh/libssh.h>])
+ 	AC_CHECK_HEADER([argp.h], [], AC_MSG_ERROR([You need argp library.]))
+ 	saved_LIBS=$LIBS
+-	AC_SEARCH_LIBS([argp_usage],[argp])
++	AC_SEARCH_LIBS([argp_parse],[argp])
+ 	AC_SUBST(ARGP_LIBS, $LIBS)
+ 	LIBS=$saved_LIBS
+ fi
+-- 
+2.35.1
+
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 81469c511e..0f5c2dc5ae 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
 
 # 0001-Add-check-program-for-symver-attribute.patch
+# 0002-configure.ac-replace-argp_usage-check.patch
 CRYPTSETUP_AUTORECONF = YES
 
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
