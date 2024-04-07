Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3712BCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED99F4083B;
	Sun,  7 Apr 2024 15:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhW743Jlwnxc; Sun,  7 Apr 2024 15:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8AD84087D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8AD84087D;
	Sun,  7 Apr 2024 15:37:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDF01BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A317B60A4A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q6qTWb0SigX for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F9060A52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84F9060A52
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EBAB85611; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 102b0ae459cc051bbf39ebe680e65167c5de6be7
X-Git-Newrev: 55f3df2dbedc7880bd949d722254cec7fc9af522
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.1EBAB85611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=55f3df2dbedc7880bd949d722254cec7fc9af522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

../output-1/build/polkit-123/meson.build:267:18: ERROR: C shared or static library 'crypt' not found

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/59926191d274b25e32e6bbd708f5aadb346d3171

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/polkit/Config.in | 1 +
 package/polkit/polkit.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index ca3323931c..fda6c984d7 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  PolicyKit is a toolkit for defining and handling
 	  authorizations. It is used for allowing unprivileged
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e393672c1e..cdbbf8f9b0 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -30,6 +30,10 @@ else
 POLKIT_CONF_OPTS += -Dintrospection=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+POLKIT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
 POLKIT_CONF_OPTS += -Dauthfw=pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
