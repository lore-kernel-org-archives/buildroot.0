Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED0C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A107940811;
	Sun, 20 Sep 2026 12:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmIjc_bp4x8g; Sun, 20 Sep 2026 12:23:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C11974081F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907025;
	b=AKC0sGApcx4zesIBRFOfnvafT/C162neq9+/opAKH6vp2QN3GhejuCDR+I8w5pUz4jzo
	 R8ByKeJ+shYniGKokF36jTypzJQoks/s5wlimMgkdrSFGo0N9v2iiggsKZiB+Mia+g9/v
	 D/6cWytGwlegE52ttDNNNvdfvPEG6ttSjFGI9WI+8bwEbGfWfdq2W9PcA3RfxR3AXYesN
	 /AG/fOb17PdNK3zWgstdRJcP5gGeMitIWZF6sCMmGtY4wVRhbfkSm5LMGp9/SHBSFVln2
	 U8vN0ATzOd5TJsvyAQb5CskUM/nw5d8hru0r+Co2UHKzFp+lNq76P/xgZelHplve5HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QZmKCKThjpgckNsWY3yETELlXjf+tNIxkTkr9JBLvmU=;
	b=e5xroPf59n4iGjg7soMIbvfYZMZathtTGFUZ4nMFy/3nNpJSbcPc2RS3+EhpCStju8kQ
	 Jj0sRemmqj20+t5IbkZud6fctyqVSh0+lEwL1ndqzCy4Y2v5Um3EUW+o7DEFkw2X1unMI
	 GCB5J2baX5AG5t2WqgOZSOj8bVOQLESz/ksGW4i67B2JnonWJgp7j8pSNc1fIPXwW641D
	 vdl1lW2pNchaorA9irSwl1DqLy/JJTbn3xZOhxF29+otViSf2UBn7qJR1Yxjno8boxwzW
	 B+sD2kNIVj/fSKqh6ZZ+hJ07pTFm/cKOFgMTwyqggw2spNreiQsj+mKcXMLWEjj3HyQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907025;
	bh=QZmKCKThjpgckNsWY3yETELlXjf+tNIxkTkr9JBLvmU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OZBgxgiGOtYGT+/TsQ0ZR7vZUc+LCiiBar6Z+80ImEjaNhRx2bik9mG9f4cUscr4x
	 IGW1NZc3UBF12QVt+IumXIuUlb2X82CUES1bonpL32tEJdHVxAQjz7esajyGgMiaWx
	 oc/yVDu5VRzHyw0zyOXmDKMivEgLsa+zDdGI7164ifeXXquoiJeUXxxqq04gohghxS
	 dbZyKxDGtwCVsD80GmdSYh808PuIvVtCJPS39qE3D61B4U3CGYotJqH+4ZfLMAnZhv
	 gUDN3TlFn7jr8itWHQwJmzi5bG9my8+Y/mJ+JQFOmgWDFoa/rvPOeM51b0Ec5Dx6jX
	 rzKPlepSXL++w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11974081F;
	Sun, 20 Sep 2026 12:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C29CF37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A818C80EE2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGIR1SwlvG2I for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 090D680E36
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907024;
 b=P6swUNolQyeR7FIpITnyfg6xGMes5NAGqf+OpMx5TXkrUT/RJzSayvC8u1J3bnlvuWia
 5UTATmDA+D6oZae4FLk0uhZ2lulpl9Mmr6PD/MlJvyk5qsj4tG7K5xPL4fgXzTaf8QjVa
 stK+ViYVknEMbzmS4yGggr3VNS451eBJLFsq5ZoUP2OfY9ALBRRGo3HPZTQ4GupBSsdMT
 GMqWXhZJefp2lH9qsxKQifNrGEb/VcoQNye0UF/nv8ycChMvxGUvMdcGmn+oTn95wrt1i
 1CBjB7cLsGN4VImcldpDa/v7UtkkkbY1NZVq58nQrVL8VkLnxEuLcUQQVzIgSvoeTGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907024;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YNFVKbBpfI9y6AJynL6SOdWFkwvdy/bggwlvMZj8xmU=;
 b=fp8S5dDy1ZO1hs2QVY00jbb2O4osz7qQTzN/1cY6/umLiT+eY/ul8O0KGM+BCqmR08Wn
 TFaP2ramvOFn3t34wziqpT8oH1mpUeONespEtc2Zf1Xu/HOkuoiEdJzeosHZYriyNj8tg
 27ydMxQ95SsLPB6z45CdbIH9p6D6EY2NjM8Rn3gO2Vi9UUKYuSa7VuOPOlr+44xfBWMtN
 yUIfp709zOSK4xQ7M7mqYj2HdZgMRP1WKdNpOWUbzDKYtnWnQz4pAbheQaaIeqOx69A8B
 XNpBWFgbHLB3/Jo6PvN3L4VR29QrelrAUhN618Hlu7jcET8sPzLi9eoF3sLBSQkdKKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090D680E36
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD1058D764; Sun, 20 Sep 2026 12:22:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:23:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95b1e8676c0eec0ca039e2554ed00d33258d49a2
X-Git-Newrev: 3b0424588200cd1b067bc50ff265a333f35a0321
X-Patchwork-Hint: ignore
Message-Id: <20260920122235.AD1058D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add eap-aka-3gpp
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b0424588200cd1b067bc50ff265a333f35a0321
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the eap-aka-3gpp plugin, an EAP-AKA backend implementing the
3GPP MILENAGE algorithms in software. Select the EAP-AKA plugin
it depends on.

Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/Config.in     | 4 ++++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 6847ca4f62..11c0ca7780 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -135,6 +135,10 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP
+	bool "Enable EAP AKA backend plugin implementing 3GPP MILENAGE algorithms"
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
 	bool "Enable EAP-AKA 3GPP2 algorithms"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2e20b244ad..8eb349b4a2 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -42,6 +42,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
 	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
 	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
+	--enable-eap-aka-3gpp=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP),yes,no) \
 	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
 	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
 	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
