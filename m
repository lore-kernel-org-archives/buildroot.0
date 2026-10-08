Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716F5CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B8240986;
	Sat, 10 Oct 2026 09:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXR75x4CWrOM; Sat, 10 Oct 2026 09:22:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E35E40976
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624137;
	b=nSMK6ZtdRRYrSclewlX9hPuMvgP5qEiSB4b/RklfvycLm+g9+RvESZtMAm1HzD4UAWmf
	 Yh9G8kCtfFbRwUNquf1gN4TfKw/OxBkrmUu0B4guEeLehUCEsUXAjKbgW4MBoi+8nW2LC
	 KsqMwgp24vT8JLdonF66EvxU/ac2I0KNEm4Etd7l6S49Y+mtMEAu/+Fv1zlzWG+Tn1ccT
	 hZ4+V28pSLWxCJghbhytBkzCSqNMRPXutRgMP2XlVmCcnQhPt/RtAlDwGSMfCazoWRfxI
	 +k3pFxcA7C5t/dHOA3hqLf9404+BQuGWGN1Ra5akx9ks7Ex3lRyHDeqcNrwq3NvU37A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dN6yESQe7Ao0KyzzgNL1yE30OcGUpbXM2daYzLYvQkw=;
	b=DhZk4gdr9woNibLPWmURSzfWh6WIRF6eZcUmRY9Kf0B9AHeqE0+yWcoj/rOF3oC7ltSY
	 WHJRXWC9/J8GGk6gQo2GU8oil+3HJLDvZJCvDbLnzgjrvIMZiZQJMOWrALcvUjsA4tQ6o
	 uuKGPD5F0jEFFaHYNqycBh440jEsQSOniGeIiwoVzNljkiH8c96i/gkABQLBgggI7/G2l
	 ftne5TdHXu/AlNMoM66LLBBgK6klZwqC7Cp+x3BaFTdLLxxvI7RbQ3Z4WxwAbqEGYkF/u
	 arXbDToSuSR+vYpwCqlHKZhY1s0gqxEvbMRRGllzpzCXDL7MvuhOxx3KEajQt+iT/ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624137;
	bh=dN6yESQe7Ao0KyzzgNL1yE30OcGUpbXM2daYzLYvQkw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nmX9HusZC0H/3a7ecyClWUnFzR/Ls9dfeHsbpj94XcbpwBdacl1R0hsNUD66P0IpQ
	 1F2TmQazIqh5xk0RIRzX9TUk1PIx69SzwUJDFr48e4UGdvyGpIHu9KKBTttIiAfCXv
	 eQ1DxUsfTss6CAyLCtD3Ds+MR9/c//Q5GpDuqbghXii2/7+u8hGapLVIkTsCR8anYt
	 tNUuvxVnahHhwWezu6M2JOEKgPchlksMquDoYLPdJqSPQLwUsmW7e60fbIQ3/iLfH3
	 UbW4ElFR75b4GGH7hofOVcGHPvZc4xyO8FF3kD+G4RlokzqNL2qGV6Wurh52qpujdf
	 P8mv3r3ZyZz5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E35E40976;
	Sat, 10 Oct 2026 09:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D451356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8373A81299
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqNledfFt7FB for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7247812A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=aIMA68Al/+7q/55PuxN0wcoZEvS7/PR1VzJ+sfP9W5k9QLbeEVpGviR8CYRWFkmK4SoQ
 sVUiwOwVehMcRNbsxLpAbULlw4SwbnWfBRGJn1ONsNxtQsO4oTgE+Cd5Jk9ID+BtPWxuw
 2NtF58/fksW0E7D8026qRNmAudDX8cv63RhddrIXR0iBCvT1g856iHIQI3urX45/pD5ba
 lw8wrebQti4od+QNJnVLgDyrbaDD+OuX7BnOyezgCT60ncJn+GwOoXlxoHPz6jtKGwhsc
 JNuUKeKicim4yhuXk6hDh4KIKAylZM00OOCwyhvX7Q+YnjO5De73VHSKQOid/lLsAZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3QnunCLiGmz07MAxdHJefVzIooq9frZr4VIKGaSC3/c=;
 b=ff+J/8NNs1bic12jO4Ur3k5mTOLryFb0NBGlPyMrVk5Dy6Cb5LPTWj4WuMy2Y6bDb9s0
 eGMF8NcTrVUhkNQPld4I3U0aadomCC8ETUixmmZhEhjHINumod+d3gz9RpySQ/T01cNUk
 kl+AYdewEhv5DGPXn7Wmj0IR0h/XCQ/eFHA9UTcExKIlLKX3meR9epbBv4gH0XUVIxmWE
 TKhqJ+pSiX8I5CTVUluOr9EDmi3tUlch2Dh0W/7dEqBJxMYYM6TDJnoAfQyIPJIpZexrz
 nIKN1q9cI4t/q3UfKku+a8jz6FO4IyDJZ1gTvxgX4UYq9nQ1KsMfr0O5NB0NIv0HgtQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7247812A8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0CD98F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:28:12 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 76b472df0a2c500b1a5f8df9ce03a9bf867679f9
X-Git-Newrev: 0bc7fbf48f7d0eeb19a5f87f4a01adeda17e508c
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.A0CD98F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/setserial: CPE ID
 for setserial
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
Content-Type: multipart/mixed; boundary="===============7541586455847126599=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7541586455847126599==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0bc7fbf48f7d0eeb19a5f87f4a01adeda17e508c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This is a valid CPE ID:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:setserial_project:setserial:2.17:*

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3010c801e36762a97c453cd7bd173bd02f4b6b6e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/setserial/setserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9beee349c8..98b2dde2f8 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -10,6 +10,8 @@ SETSERIAL_SITE = https://snapshot.debian.org/archive/debian/20250307T084701Z/poo
 SETSERIAL_EXTRA_DOWNLOADS = setserial_$(SETSERIAL_VERSION)-57.debian.tar.xz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
+SETSERIAL_CPE_ID_VALID = YES
+
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 

--===============7541586455847126599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7541586455847126599==--
