Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D81CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A849360769;
	Tue, 13 Oct 2026 08:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkGw6PVDHBQK; Tue, 13 Oct 2026 08:07:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A0E796075A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878869;
	b=cpL1FO3O3J36DBwzdMhW4jbggi5QlzL85C1px5O4BQqeA+yv9zVYE/yUbKRdWsKjEPpx
	 N/a+FWPuLuhVgbbo9H9rEFxcbHH1op2uvd9bEdYG1RQ1sphvI3KlPdD8xGppcYMtqO8Ji
	 fLnzHI2+wUufD+TqUAA3X4j9BsFYCjBzXp8h+g5Hjq8WU/RXqLjZcYOcvQ2Zd6w0/4HQ3
	 fwqrdlrqaYfeZBl6dLie6RCez/0KXHw7qMVeVqEk91NXpo/mFG+/X9n1LzpHKic5X01zU
	 igQN7nrNPrEc40vEexmkjxeah2GK35onDPsI+416yVOt2Ew2U7k7YKVeF6M3babqfOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7+rQbrH/aT9us23CFPcOdY9sTfJARNoUlaZ2BDDKcu4=;
	b=YxouPORvml1OY1T8A6eSp1r/n7hQ5rVUQ4mfugUrImvAGZhO/pyJ71W86Y3Fx5WCGaOo
	 x77yvES2TYMERTUN0GUdEMXu4+WLUBLy5rCemzRHgv3VlaOXPKXeaDSAzaun8b/V8fwQ5
	 zdVM2G/fX8qNi3V8zgdL8yjdvZFf/vY1XrzZsQAs5t9NBy0NdBaerf0MyNGXvuqqvPD7y
	 3V5EI6YA5o26H0uPIuuFzhS7iTqf8Uv4PEqVZWQX8jVXtvvxls3QS7ttn8XfvpobQ/QPr
	 kLwvpuCqcaToCNX3XUXeNlROxLg21J0TdFN1ENGkwQeiLgzfFgClB+hSnNgs424L/NA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878869;
	bh=7+rQbrH/aT9us23CFPcOdY9sTfJARNoUlaZ2BDDKcu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MyDKBFf7VCPtqIlVPcmYA/iHfqbAB+wotexGQuRVu5t4fxTBmqfn4wk5GT//PR7U1
	 m5d18xWXXENDRiRZ1JG4wvgeVT2VeoPwwhXE+j9twpdECIQRMDufsiJM8/hOuwexq2
	 DrzXKSkGIIRvxOg1pYLwj74mjFNIt9CTaoo9KarzhBakzc01kJcImMuqX78q6v0e5o
	 3rHh3vzZv3X7i9WYGwpLNjH9QVKceIQxbUv6VBIH3ZShav+jFrveke4pAnsDhoU36v
	 SfBs8X3J7XJBiLlPNdcQd0zKkBnRTo0DtU3jbFkQmrZPE0lkMd1kBlYwWr3A/YXtHH
	 FcpWQN8fTcKGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E796075A;
	Tue, 13 Oct 2026 08:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE0B788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 959234047E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EskXOE1FAtX for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC48B403AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878867;
 b=D2hW6DweQDVk2/DN+bJNIt2HkTBhEme+bRKx6gileannBWdIsGbxDFhzyT4uGiTkG40P
 G0DM5l/Z7Ol7hUDCooYABQP5hSk14wyy4IA5YhW21Sx4sTmSLbrRa7rH8WisMP6Ym4P5N
 PU1t/TQTDhjIV/y25CQdTAhxX9TaZ0RnDcVxJx6cDvi/Yzqyeq4xra/Sc5dM3GQ7prr1m
 E3LW/BtRl0KqSb00S0mEAOZ5TtU8X65G4tdeOAeFHYuZ/3UTnE1VUd9ZsBq+6bXl6KrXT
 mNq+1k8yPlAHgCcF/fPUN0dJbQiF0bUwJtnZf4gGKyxjveGsFsu/RKJLy0yyO0mYl/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878867;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5LJ+7wHyU5CB49S1GyxOoagVTYuaFG+ovUtlNSssuSU=;
 b=dMFlv8SvNfg6ze2yrb8rkBOEuLn6vJA2SEP+eoxDT+5EdhMvNZCjqxOt6oM+N3MwpSrQ
 lAyksPofYHBn+J9OTy7Ss33MlMejScn78RpL1QSllBz2VLSrCUXT3Qk4ewCGU7fcSbmN6
 BXTekYpRv53+SkP9vZDdAI2/u7gl2VFmm/su7wg/AuTHD4eCPKVA+tzClFtjWq91+XlMu
 YTcpGhi8E3L1mDCOZFVUi1CnjTpUSWtRGjYSOMj+80RJclxdRVJOhS1FxYepaT0aW5jd+
 sTNVwIms6gHau3ZIKm5o9NRhHVdFEdotXxzNohAeV7zdSC8Lemv5uZSvJxCOKG7IRSQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC48B403AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 624179546C; Tue, 13 Oct 2026 08:06:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:06:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 260b6ad8f02f44695a4be6848f24f7557e7c6b84
X-Git-Newrev: 9fde910991a14e492f391faf02c61f7f88d4f265
X-Patchwork-Hint: ignore
Message-Id: <20261013080627.624179546C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: do not enable
 CONFIG_CRYPTO_MD4 for kernel
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9fde910991a14e492f391faf02c61f7f88d4f265
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This was added in 8c12a6bf51bc4b166948b4392e96344259a64778
"package/iwd: enable required kernel dependencies". The iwd code
referenced there did not check for MD4 then (iwd version 1.20), nor
does it now (3.12), so remove the Kconfig fixup. It did and does check
for MD5, which remains enabled.

Fixes: 8c12a6bf51bc4b166948b4392e96344259a64778

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iwd/iwd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 8f662ce5e5..bb6bbcd868 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -77,7 +77,6 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
