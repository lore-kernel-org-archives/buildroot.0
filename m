Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ACAC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEBE81E73;
	Fri, 23 Aug 2024 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivRWqASePVQv; Fri, 23 Aug 2024 15:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D3181ECD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D3181ECD;
	Fri, 23 Aug 2024 15:31:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9F061BF4E6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A584B81ECD
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgYezG8gTC_E for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 692CD81E73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692CD81E73
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 692CD81E73
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:31:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 803CD240005;
 Fri, 23 Aug 2024 15:31:28 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:31:27 +0200
To: Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>
Message-ID: <20240823173127.36b44786@windsurf>
In-Reply-To: <20240823152547.1023215-1-ykolerov@synopsys.com>
References: <20240823152547.1023215-1-ykolerov@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724427088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61leqwqVSBKvDvn5+26upiHBXSkDy3CJnnLEgwpEnUw=;
 b=YM8cxoiTxwKgHSPsfbcTjicJqoOam3mzLzlb/8B/fRfyhabTCkoE9D9aCK/KOthhsF2NLB
 fGIDn5xqIALMlLXUOb3Kqqz7dIAsu8THJSahxolD1oeowvacbCTiMk9nHPLy6cbOZDH3vm
 pAsC25KIZDuMAC7XeG2QTAG7T3RIGuj0YeldpBuI11322aGDcouiOc3MXtgQ0/wr395sNa
 ZSgbBlTe5Cj2Q2FcKRnbohDzlvWdWbVDCXH1+545YEIRKNbf5CilRlix+Cix0AXEa7Dx5g
 jH3+LRvrQol/p5QWWeX5uoJyTrecNrQgvTlSG0eQZTMDmQOioH4OfFowSjNhjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YM8cxoiT
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700
 targets
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 18:25:47 +0300
Yuriy Kolerov <Yuriy.Kolerov@synopsys.com> wrote:

> Synopsys ARC 700 family is not supported by glibc. Thus, it is
> necessary to prevent selecting glibc while configuring for
> that processors family.
> 
> Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>

Is this fixing:

  http://autobuild.buildroot.net/results/9f0a4d69aed71a840b1c278a9623c9687207ffc6/

 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
