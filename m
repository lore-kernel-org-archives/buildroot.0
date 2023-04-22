Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C6CC7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 20:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09BAD83B1C;
	Sat, 22 Apr 2023 20:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09BAD83B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ip1rXa9Q6L4; Sat, 22 Apr 2023 20:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EEEC83B29;
	Sat, 22 Apr 2023 20:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EEEC83B29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A54531C2B8D
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECE983B29
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 20:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECE983B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmK1rYjOGXAU for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 20:16:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04B083B28
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 20:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04B083B28
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF21A83FA0; Sat, 22 Apr 2023 20:16:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 22:14:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6ce7cd546b0d9f5315c9840423b6c54f5cc0b9e9
X-Git-Newrev: 2554f30194d79d2cddce8656487571b5a2a095bd
X-Patchwork-Hint: ignore
Message-Id: <20230422201619.AF21A83FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/efivar: don't
 install in $(HOST_DIR)/usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=2554f30194d79d2cddce8656487571b5a2a095bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

For years already, $(HOST_DIR)/usr is deprecated. Install directly in
$(HOST_DIR). This will trigger a check-package error in the following
commit.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 47910ccc361934ab4b3fbcfe05530f38de07844f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efivar/efivar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 8b1d338bec..ee6d7302df 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -39,7 +39,7 @@ define EFIVAR_BUILD_CMDS
 endef
 
 define HOST_EFIVAR_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/makeguids $(HOST_DIR)/usr/bin/makeguids
+	$(INSTALL) -D -m 0755 $(@D)/src/makeguids $(HOST_DIR)/bin/makeguids
 endef
 
 define EFIVAR_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
