Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE21C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B9C380DB0;
	Tue,  9 Jul 2024 21:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U129zJ71PxmB; Tue,  9 Jul 2024 21:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2574480C0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2574480C0D;
	Tue,  9 Jul 2024 21:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85DF41BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD9780C0D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuUf16PdJasj for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3489D80C08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3489D80C08
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3489D80C08
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:19:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE0A4FF804;
 Tue,  9 Jul 2024 21:19:14 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:19:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240709231913.7ccc01dd@windsurf>
In-Reply-To: <20240702162857.199474-1-giulio.benetti@benettiengineering.com>
References: <20240702162857.199474-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720559954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpFkelty7CvDv8kHQsm/LsB2/yO21WkJQBHnsPommpY=;
 b=YTvJCCUm6HAhRFSOfg24a6xsyKngU6kanmKu1l2lOsgXsjQaiNte73CnR5orzGAFHOXJ82
 /hqc9ut/HtwYMKcTzyN96cByMVkJqamr40HRTQPXGRbB+L1Fu4xyV/BRCkX3RiLKh7EYkQ
 FHyeRSwZY2fv/B9WYPpLv65ErhNuBNbiSPKyZV1jO4X5H+RC/+ly0Kn1Ym5ipGD1Zi2stF
 DS/+8mPwFBBWpjovVVctS2NPuEGB3dGmkoUgEPF1ZYCTa+cVYmSacK80/ipmXY0T2+KpMt
 h/Wo7gNLZ04+SLW3W0fMdtkamz/3KKzdpfjiCr5u0Fw2OzslLbTnCGRBdb4S/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YTvJCCUm
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jul 2024 18:28:57 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Starting with libnvme commit [0] MMU is required so let's add a depends
> on BR2_USE_MMU accordingly.
> 
> [0]:
> https://github.com/linux-nvme/libnvme/commit/7d927f5f38ebd7c90abebb5ebac4701a1bad0993
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnvme/Config.in    | 1 +
>  package/libnvme/libnvme.hash | 2 +-
>  package/libnvme/libnvme.mk   | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
