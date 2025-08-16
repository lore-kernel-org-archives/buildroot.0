Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DE4CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E84556159A;
	Sat, 16 Aug 2025 21:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8a6EitG6_XCm; Sat, 16 Aug 2025 21:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DD661560
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DD661560;
	Sat, 16 Aug 2025 21:05:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36018223
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C97840ED7
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQKNKcXA7bS5 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7812740EA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7812740EA2
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6552487694; Sat, 16 Aug 2025 21:05:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 22:57:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fc81120335e3fc2161e409dc94afff162167bf3
X-Git-Newrev: 1c61d9c12be106472f3ff91498961e520489fca0
X-Patchwork-Hint: ignore
Message-Id: <20250816210551.6552487694@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bash: don't use append-assignment
 where unneeded
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c61d9c12be106472f3ff91498961e520489fca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the first, unconditional assignment, there is no reason to use
append-assignment; it can even be misleading.

Fixes: b367ca32e53a774c174899e44c77ed1d128cbcdc

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bash/bash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 84f581da79..2747802592 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -17,7 +17,7 @@ BASH_CONF_OPTS = \
 	--with-installed-readline \
 	--without-bash-malloc
 
-BASH_CONF_ENV += \
+BASH_CONF_ENV = \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
 	bash_cv_getcwd_malloc=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
