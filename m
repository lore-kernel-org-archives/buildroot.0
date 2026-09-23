Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CA2C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4DF581250;
	Thu, 24 Sep 2026 18:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ykua89LVDtV; Thu, 24 Sep 2026 18:57:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E4EC181109
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276246;
	b=aj+7aSBjn1azQ7KHl2XNrEdrI4BVw6G4svWjbdLTvedzxBG3AmDziMXZWHti/F4lK6R3
	 01QDObN6mCFWI8KLDjT3KzXCwuG1rzrkrE/V/rZiORnl89DoCbO15q7bLXodhb5PmkvCa
	 9Cm9kEE62R90NtBv1hvkA7nBgjLY5escm90v5VBISKszOqk7dtfIfRzxUmx4W9M/y/umI
	 AGKHUxvfSqAu7tA8JTMnzUn8pkh6mtz/eFH+OjRhv51NMqT7nXIbV6b1dkwu44ffLdQ8/
	 EgaWZG0MGSdzNLVSvlyaICg/TFgyMws1o54OKDjHK0+g7e69sHKKGcjmKUsKkRufxKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2yguzczezYdBhIqjaVugBH7DyuE4wKoKlVxQy248AFA=;
	b=cyek8VP6oBxxoeqq57qtRjh7aHy04X2wVOUsmkaEa8l9q3k04V+WglZCLXvjRHsXlBwu
	 LA0h2hzOKSZhUanqHNatordUiLszz4og2jMEJ++krLcTh/7ciqdlebIf9EKo8gto13CJq
	 GX9DBJpCuxyVvrmvmG0xj3BdRgNp7GWPz2/qYKMGhsmF8AqEEtJXxQDXAWxN/Jgn2W+rV
	 JO6W7gjib671pbNIy67Qj/Prs0qCw9hXrhOve92pcY340EXXnbwjOOJwq9V+8sAsmVNYF
	 hrOtGboRXx1NsS9TGnyA1GT/EUAGtQhc0CFYncGLS0NOvFdeA6ppPTWpmfn9N5n9e+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276246;
	bh=2yguzczezYdBhIqjaVugBH7DyuE4wKoKlVxQy248AFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a8KqeYTCT2+4vSwGoEUcbNemIrA8O8mQ875SfzttdzhfU3cWYlpSeuPcRY9didPvY
	 /nGslIZYPhaiPh1opbJyA2wvUYyUrRXtt21C2VKi4jwiEk5RXAWkb351KATlWFcm+B
	 +Ft5RUS6mFCYitvuv+mi5yLV0BrCRlPRhDZbCMWjIGxJrmlvjDNtStzh6aKzxsUB+7
	 phbGrdqTmVWFohNoqiXc80FWqo+gJihDM404j+d5Jy/xhulq/T+5fnLFtEnkelNne7
	 jYRKZiLoctV73V7YHzF1K8CAYCzTIizjlxcWfKkbEkdcrBWs/DZif9W/dRYNfBvdu3
	 NuNmI/xsLGNgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4EC181109;
	Thu, 24 Sep 2026 18:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 864A13B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7787840ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX7Z9j3E8V0M for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BD05940ACE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=s1nWwFdhI8W1n51rRed/AuWKZk66snatioCBIfWe+AwpeZuRNQUtHoPkwnbz4d8PALBf
 dLjWpfev/Jt2tWwC9/kEgcu3JT1F2kD4547H+Y3/r0uXKRZXLWCJqJPcojp13N+3H6HUU
 TrjuQqOBz7NcR0tHHvjoquZyO8rEYevwpvjHoOgBznkvwHxAE8tAqtQI/FTuLptrN5fH0
 JF3BnhMfD68ivo/PKdaMpsHMS4+LYI+ELwjr5ZIKq2s9St0BBPnrDn7d9Q2yuxQvr4ifQ
 K0xnyau7smMTm+NsWhPXzdifpRIHfJNWJgcv+f5NllWEejkBC5Q0J4OLrERO8Pu3S7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=d7obMlLDzkeb7cFxi/CcgDGbDF12NEWcgTE9FiF4Uns=;
 b=Z96S3HSGlKI8TOMNTkbuhSSM0IZCsIj0PJr4pPXvmmAfkuBo0o1CKnfGlW82ALYYkhzE
 pQU+YMCP3lpeOzLpcUxt+zAVGJVI9h94mvDs/B58lSEs6Eg/KTb2nWrKsEhL42I9FXT7z
 DsgLtXIp406O9fJA2YfReYKnzcuHufqYp0ixO+o6TH7w3ORLuX+Ex3CBSQ2/ReuBl2AR+
 Y8KY/gKkIgFRAuQRsHSoSdWOAi5KdVlkfw3rRXjNQTwOV3lyXd4mH+rpAUfh87jgDLH1S
 iCCQbha1nTBs2xScaATYmcFY/EwIqIkdRocuOtzQ5YYLOvBvVdUT53Id8cr6IeXxjdQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD05940ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60B3398387; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9cb09c7c477b97570a5bb1a060868e96318e3f3c
X-Git-Newrev: 196d433943e33d1535126a43c68bd81fd005f4dd
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.60B3398387@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/rtl8812au-aircrack-ng: enable additional kernel config option
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4210860833982513631=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4210860833982513631==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/196d433943e33d1535126a43c68bd81fd005f4dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Not all Linux defconfigs have CONFIG_INET enabled and this results in:
  LD [M]  88XXau.o
  MODPOST Module.symvers
ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!

So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.

Fixes:
https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/

Fixes: 003ed345b1c4f1c11feecca68bca37bf871001af ("package/rtl8812au-aircrack-ng: fix build failure due to double defined endianness")
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab8471868eaeb7c55b74eb00756c8d5942319daa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 3a7c56a3fc..6ffcf37c20 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -25,6 +25,7 @@ RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 
 define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)

--===============4210860833982513631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4210860833982513631==--
