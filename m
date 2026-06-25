Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FC7CDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 18:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6333180C7E;
	Thu, 25 Jun 2026 18:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cdj4lnmrmC7K; Thu, 25 Jun 2026 18:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C5E810DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782410710;
	bh=hY9mX3KUKPVVWv2HGDiGBr0W/uxAqL4F+Mg2BEHNqsk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HO6/zvnnGWyyyH/TKdHyt+XxkP77x3Wghp9RFUx3l42N5t0amcAA/GV1UbAzf9BVR
	 YrST5w+emnm5DDxKu8NPXFyfF/PwxG9r3BvNRLQN/jNQsm2eQ8zFE7eI7BJufW7Sws
	 1tE2ly2Dw4b5ucY4Cc5IY0SuXngjy/nY8MKBAW/D3dh+jFJrB8oKLDUbmoWzlAq9Qp
	 d+L70cZdeJiHpzGCTm8BVZerGA859/CeeVX+mXDsYEbhHzkcrj5l6c0D4o69Vu2c0r
	 F/AU6zp2lqPXWstX6eescIFF+KM7wonsiIlTR30ReutXFDUOfN3C9HUmY9SqfosOif
	 UPwIEt3ckl5nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C5E810DC;
	Thu, 25 Jun 2026 18:05:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 666463AD
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 578684116D
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhUlaQTG3pfM for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 18:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1EE341118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1EE341118
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1EE341118
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 18:05:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -245420312; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 25 Jun 2026 18:05:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wcoRe-0000000Guqx-1Sm8;
 Thu, 25 Jun 2026 20:04:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz via buildroot <buildroot@buildroot.org>,  Quentin Schulz
 <foss+buildroot@0leil.net>,  Thomas Perale <thomas.perale@mind.be>,
 Martin Bark <martin@barkynet.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <8636dc29-19d0-479e-a48f-c0f67fb7a3bf@cherry.de> (Quentin
 Schulz's message of "Thu, 25 Jun 2026 12:56:40 +0200")
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
 <87y0h0kao2.fsf@dell.be.48ers.dk>
 <8636dc29-19d0-479e-a48f-c0f67fb7a3bf@cherry.de>
Date: Thu, 25 Jun 2026 20:04:57 +0200
Message-ID: <877bnm7aye.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=O+UjcfRhSaeFakYAVS8WSTzW5ttjOyU7UaTu4hgDix+sIweEBMH/pGmZMWPml5RvLA/NlVqv+8uYa6GwN4p2z9nmer6NBbE8NZRlDHZ8RVfThThMA/LZHs7EK1hJpPG9/jOkTaFzQH+8cIz2NC3Co538SM+Dl/I46uAL/1W+PbKclt4+qDm6KoOqpEmajjyJSmpSf5wC0ma7pcDDBUmLm3XwO2/Lwe1+2FV2DBGIDx8D6ecEEM70tz0F1bZ/jPPEW2P9xIMlsaccnqpN2/9BAvRCQEV42j4EqxuZayCR7cOVSybzrAORfmtcnP8TMsBXBkLw2nO6GnbEyexbeCbU6A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=aXPNmqD9o+PVL6Z3bYtGAce+cR7H9vwcluY2mA9p5WE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=O+UjcfRh
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@cherry.de> writes:

Hello,

 >> Out of interest, why is that / what version of python does
 >> generate-cyclonedx need?
 >> 

 > list[] type hints aren't supported in Python < 3.9.
 > As far as I understood, it needs to be typing.List[] in <3.9 but then
 > it's also deprecated since 3.9 so not sure it's worth the trouble.

 > c.f. https://docs.python.org/3/library/typing.html#typing.List

 > From recollection, on 2025.02.14, if I remove the two list typing
 > annotations (extract_cves_from_header and cyclonedx_patches) then it
 > works.
 > On master (and 2025.02.15?), I'm assuming we also need to remove the
 > typing annotations in parse_uris?

Then I think that the pragmatic solution is to drop those list type
hints. Thomas, I think you originally added them, what do you say?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
