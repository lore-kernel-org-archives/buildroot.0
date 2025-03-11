Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF4C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 18:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A96440BB9;
	Tue, 11 Mar 2025 18:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JujcWP9LNbX0; Tue, 11 Mar 2025 18:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B4D40BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B4D40BD8;
	Tue, 11 Mar 2025 18:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2AF01DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF26080DF9
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJsAI-LXPBdr for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 18:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA1480E1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA1480E1E
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DFD87F4D; Tue, 11 Mar 2025 18:07:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 19:04:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 605f8f54320cf098a17c4931dee47952bb57e465
X-Git-Newrev: ebcd82198f2c84efddf82c7be9b0782b4180ce93
X-Patchwork-Hint: ignore
Message-Id: <20250311180750.06DFD87F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prboom: Fix big endian fix up
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebcd82198f2c84efddf82c7be9b0782b4180ce93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hack to force big endian support when building
for a big endian machine doesn't work as there is
some whitespace between "#" and "undef" in config.h.

Add a wildcard between those two so that the target
line matches and the replacement is done.

Allows me to play DOOM on my LC475.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index c1ba05ff70..fc440e5cf8 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -40,7 +40,7 @@ PRBOOM_CONF_OPTS = \
 
 # endianness detection isn't used when cross compiling
 define PRBOOM_BIG_ENDIAN_FIXUP
-	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
+	$(SED) 's,.*#.*undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
 		$(PRBOOM_DIR)/config.h
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
