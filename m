Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8AACCF9E5
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 22:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A935A81399;
	Sat, 25 Oct 2025 22:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZDwFDYAMBx5; Sat, 25 Oct 2025 22:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D968133F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D968133F;
	Sat, 25 Oct 2025 22:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F652976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7727E8117D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhypkOQFAjwq for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7174A81332
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7174A81332
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60B14878D2; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 00:06:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c5a28e46116c4f0caedb35aa422b983aa86b0a5
X-Git-Newrev: 0268d7deeccc4bdfe0a334c2e480cd2fb9e2f1dc
X-Patchwork-Hint: ignore
Message-Id: <20251025220740.60B14878D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtheora: fix build on arm
 big-endian
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0268d7deeccc4bdfe0a334c2e480cd2fb9e2f1dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 5e769b87ecfb5d61c6f32fac3f8cdf2fb24e91a6 bumped
libtheora to version 1.2.0 and forgot to disable asm on arm big-endian
as well.

Fixes:
https://autobuild.buildroot.net/results/8af/8af9ce8c03b00da2dcf29bc1c6f4afef9a002a58/

arm/armint.h:24:5: error: #error "Big-endian configurations are not
 supported by the ARM asm. " "Reconfigure with --disable-asm or undefine
 OC_ARM_ASM."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtheora/libtheora.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 2cf62e5623..906acc8641 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -22,7 +22,7 @@ LIBTHEORA_CONF_OPTS = \
 
 # assembly code on arm is broken:
 # https://gitlab.xiph.org/xiph/theora/-/merge_requests/53
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBTHEORA_CONF_OPTS += --disable-asm
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
