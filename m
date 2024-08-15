Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39630C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 19:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF28A60093;
	Thu, 15 Aug 2024 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BTIxVNs235d; Thu, 15 Aug 2024 19:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27C760727
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D27C760727;
	Thu, 15 Aug 2024 19:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 809901BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E1CD407D2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbBtp8Qrl1fS for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 19:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E94407BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E94407BC
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A69C810E4; Thu, 15 Aug 2024 19:48:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 21:42:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0904d3a2ee4132b2611a86d14da60285080d1adb
X-Git-Newrev: a2675686cdc4f2255084b86dd2195e42bac7af4b
X-Patchwork-Hint: ignore
Message-Id: <20240815194845.6A69C810E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix microblaze compile
 issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2675686cdc4f2255084b86dd2195e42bac7af4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the update of ffmpeg to 6.1.1 in commit
fa36a6375dbeae131c596070570cec66c7bd2456 there are
a lot of microblaze build failures.

The compilation failure is triggered by GCC Bug 68485.

We need to disable optimisations, or ffmpeg would add -O3, which would
be present after the -O0 we add, overriding it.

Fixes:
 - http://autobuild.buildroot.net/results/524/524cef193aec30471e55eb0eecfa39f0d6011a91

And many more.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[yann.morin.1998@free.fr: explain why --disable-optimizations]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 19c270a14b..a010c0168c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -557,6 +557,11 @@ FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+FFMPEG_CONF_OPTS += --disable-optimizations
+FFMPEG_CFLAGS += -O0
+endif
+
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 FFMPEG_CFLAGS += -marm
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
