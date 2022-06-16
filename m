Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E333C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 02:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9264093E;
	Thu, 16 Jun 2022 02:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOaGyw9kEQ2J; Thu, 16 Jun 2022 02:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADFD40921;
	Thu, 16 Jun 2022 02:04:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27C891BF3D7
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 02:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16EAE610F1
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 02:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=icenowy.me
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJ07Lm7JSEHw for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 02:04:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com
 [136.143.188.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 624C4610F2
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 02:04:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1655345042; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b98qTdBkMsHTdg6Zz33Ycl76gHmhteKvHhDUYc0qvg4T8Fkp1+iQ9iekCoGsAvU63g1D+8H41w9gTYg4dq/vbKsLgnph15jT5Mk+PO2hiyLdDFg0hlm3TG4BsBhD31GgVKu1AjKwICd4C2rQSO3cXyUHWB7c+bHEfBJSsM8jtDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1655345042;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=mZ6Mfsymx+kT5aSRlP62DZ41wUKmGItKPFgG1l3Ue4c=; 
 b=UXaUnFJwsAbChDEyenehHiPctELXEb8lskg/pCdM3oVEAqID7PfYKQrIXnphUrc8GoGq48HuYev9vUF17tDY9w5NbRMvqhhKX0+3ZdznDsSxmB6wlaRhYneDc/c9bDJtTzptb6cDmDzywk9c0HyyUQtWV9venaOkk5Va/MROs0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1655345042; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=mZ6Mfsymx+kT5aSRlP62DZ41wUKmGItKPFgG1l3Ue4c=;
 b=fxXzmDACzjG5hGwOFTeKxwM9/hg+1iea4Db4VwxyhHDoW/57ScYCzB+jnm6SdTZk
 7t3uuqYdWHFLt8ZOBjS8rATs4X8ToboFz/f4Xs2sSgqczpCem3jg9yy/FYH0SjXhO7/
 FYS9dOEom3F8ynIKX6ODwsAifpAnuS3YWsFNxqUE=
Received: from edelgard.icenowy.me (59.41.160.44 [59.41.160.44]) by
 mx.zohomail.com with SMTPS id 1655345040915946.444761460437;
 Wed, 15 Jun 2022 19:04:00 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: buildroot@buildroot.org
Date: Thu, 16 Jun 2022 10:03:53 +0800
Message-Id: <20220616020353.497241-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-ZohoMailClient: External
Subject: [Buildroot] [PATCH] package/pkg-generic: ignore error when
 chmod'ing extracted source
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
Cc: Icenowy Zheng <uwu@icenowy.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The chmod command included in GNU coreutils 9.0 will exit with 1 when in
a recursive a symlink is met and the mode of both itself and its target
is retained; however this situation is usually expected (such kind of
symlink exists in, e.g., a newly extracted tarball of Linux kernel),
thus not a failure.

Considering this chmod call is only kind of vanishing, ignore error for
it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b233b07548..03e4b029b3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -216,7 +216,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
-	$(Q)chmod -R +rw $(@D)
+	-$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	@$(call step_end,extract)
 	$(Q)touch $@
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
