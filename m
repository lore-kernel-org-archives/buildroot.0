Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD3DCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3A1F60E22;
	Thu,  1 Oct 2026 14:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTO6SfNs2XBg; Thu,  1 Oct 2026 14:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AD2860E20
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864634;
	b=s9rAmqEnQWpUuocd3Wdh7wdHqNL+ThydsZoNdHj33MkidsUOw4ps1LHp8Y5zYxyW4tAO
	 ni+EuRFeTIiWMnSgytFKTPMZ2aK5CIYOwkpR0smUoX7GkynH+AiKbdXM95Kl3yZ3+CML8
	 HTehpvkDW3/ZssdF5saQg4+q0MJe8+UGd/6dgCPUAmlb1/rOYJB5Gd9vVWvj1BG1N6St1
	 Bu+rUsmPK0+12vZaa3Si2RaLJ5LqtiZhZ+peBpfXdgUj2EMGsrPJ3jpNJDyJyE9L2YVsW
	 LgCaia1Nt54pBsXJp06sWf+dTIXCPE26DMJg7AR9chDzX5Rx9Lah2RwiliUcv9SEIxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7l8E38ktUgBZPfvSgS69Xjf6IWZWCAQc/mSjKFdqOlU=;
	b=mjUqKhyns3TxKwPKc0U5cQK3yiIgcWPlcj8U+Hlr5lm/PTo10WixXQ3jwW1jIlSUqhlo
	 aybi8Ujqf7A8jwGPaIGPdpr8XFplxFDAtOQJXNfbS69SzkhCLVObBiDPsZzBz2ycMJM2q
	 X5AlrsV5P798GuheFn8I4+9+dZpqWi7LjVMuyEhk+aE+O4wSnbaKjx+mKGYTdVDcohTnW
	 faexmhDnyOamgMWJDylGN4MKknH1su+1Lm74Dg3oW6VXK+5du4maW31g4r0xmjMT35x8V
	 ZSjLrps0dNAmQN2FZUJyV0e7wK8qow2S4sq1Gaa8fFKnX1oPTPV0n/xrOIJ+YOAjG+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864634;
	bh=7l8E38ktUgBZPfvSgS69Xjf6IWZWCAQc/mSjKFdqOlU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oxjwsheBRsXLvMhN+EckrJal7c4dv/07PZjUidojPrFYXiJF+SewO4upez6H+7rF1
	 TtdbY+21bZZagWLt3Sw31JDM0omwR+XP2tE0c85qUsjRyH6eh9xj7KH+W45aMR5lUq
	 iE1zFJO9hH2dTBpTeJ2Aeqb8jIAg3sv147pOOWZJfkZJfuAdHIGLkg2uw1bgN9+P/1
	 WJGGxPjFusryk41j7upWpIMN09KW4v6kbdhKTdqapF6DeSj9K6tqIKsPDLqCDqUe93
	 PPvDk31l4UChHOQJVsmSd2W6QW+ztix6T6DYDuPkVxWZ2R1ZHn94GykjvegaNJLw0L
	 rOhiL08dYH0GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD2860E20;
	Thu,  1 Oct 2026 14:23:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E51116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3757240098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39-phpGZ03sQ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 56F4F40537
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=S4rjzojjtQQQpe5GPoY+e71IK4ZPDGJ4wFXPKc41qT1GPxzLkndnu1UUrBfjexrNcgIz
 CSiaViia9/uWG4nUpC3jUyZiT+DMmQ7rggSWO6kJnpk4UN9r2qLRPrClILL2DMyygmcSk
 JpHEySIs4y/2HTNoZf8GPwxiWj3ZPvuplhbAzFjW8RWrLKiNL/jgcHffLMsAKszVMs4ws
 3kIQdSZcPhJIDFBbnuzW+1BSHKN73SqiqPGjUj8RqoUVb8cMTYJRBBVq3G+al6WFEivC0
 tErre3VsNia9nbb1DzlXaXp0fOG31DswnNAexkemdrrHisyFcr212jaWa8/8AS1cIbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wVRLnY0ITuEd9xOqroR5BMCJaBpXWMq8HAQXUclzMJM=;
 b=N/RwMv9zuHku1Y37sg7ndNAMUjycg8gHU15vKGQ/tnKsTox16ppZnEySHuprAG3FikVf
 JBlHmWVP2kF7X/apJy2mfwaB7s1Zyr+KI3zE8K5FlQbfprntb92nqcX0UDXWxr+7BV2uf
 c97Ie7jEqFryswLpiaItbh/tTdlDGf4ZRDLk/lHJ8WuPhY69SlIBStefsN4TOISIwOLQg
 yrDanup/xQIdCu3Vcq0fTMPeIMw40tnxvJvsIAXKEc/Fwp3q/O6GOEJitZPsp2Gx57m5U
 6iZsdYCBsoLBVAlb0MqrBOMPWVVmirFFjUUX8347kNlArrI0iWb9uPQti9IeViTgtpw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F4F40537
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F4199843E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 08:56:03 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ec1365f66b1b85752461beb29dd439369e9bfd79
X-Git-Newrev: 110319c4a9d604c0f7d0d5fb6b0bafa04a1eafc8
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.9F4199843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 6.18.x series
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
Content-Type: multipart/mixed; boundary="===============7802192827294774209=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7802192827294774209==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/110319c4a9d604c0f7d0d5fb6b0bafa04a1eafc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases to:
 - 6.18.53 -> 6.18.54

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/from-6.17/linux.hash                 | 2 +-
 package/linux-headers/{6.18.53 => 6.18.54} | 0
 package/linux-headers/Config.in.host       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3e32af81c2..d6f44591c2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
+sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.53 b/package/linux-headers/6.18.54
similarity index 100%
rename from package/linux-headers/6.18.53
rename to package/linux-headers/6.18.54
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8b77aa398c..37dfa31f2f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -477,7 +477,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
+	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL

--===============7802192827294774209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7802192827294774209==--
