Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8858C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677B283E3A;
	Sat, 23 Apr 2022 16:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwmg6YGuVfpP; Sat, 23 Apr 2022 16:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429ED83E2C;
	Sat, 23 Apr 2022 16:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D96E1BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8004083E0C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjqhONavLIUn for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B437A8272A
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5CD18822ED; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc10bd5777af492b786c7d6c7fc917b855c6b7d8
X-Git-Newrev: e940ec95e01c2bc015ba384774bf8428119580a8
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.5CD18822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wtfutil: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e940ec95e01c2bc015ba384774bf8428119580a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of wtfutils modules (i.e. plugins) can call to external tools, so
it needs to fork(), so needs an MMU.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in            |  1 +
 package/wtfutil/Config.in    |  8 ++++++++
 package/wtfutil/wtfutil.hash |  2 ++
 package/wtfutil/wtfutil.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 24f7af5ea8..bee1590e85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2499,6 +2499,7 @@ comment "Utilities"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
 	source "package/which/Config.in"
+	source "package/wtfutil/Config.in"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
new file mode 100644
index 0000000000..8c3efcea5d
--- /dev/null
+++ b/package/wtfutil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WTFUTIL
+	bool "wtfutil"
+	depends on BR2_USE_MMU  # fork()
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  WTF is the personal information dashboard for your terminal.
+
+	  https://wtfutil.com/
diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
new file mode 100644
index 0000000000..deb162794e
--- /dev/null
+++ b/package/wtfutil/wtfutil.hash
@@ -0,0 +1,2 @@
+sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0.tar.gz
+sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
new file mode 100644
index 0000000000..6e841411a9
--- /dev/null
+++ b/package/wtfutil/wtfutil.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wtfutil
+#
+################################################################################
+
+WTFUTIL_VERSION = 0.41.0
+WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
+WTFUTIL_LICENSE = MPL-2.0
+WTFUTIL_LICENSE_FILES = LICENSE.md
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
