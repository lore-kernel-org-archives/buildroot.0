Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43F8C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9675C40386;
	Sat,  3 Aug 2024 18:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUyvx9uLnvWA; Sat,  3 Aug 2024 18:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5665E4038D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5665E4038D;
	Sat,  3 Aug 2024 18:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC88D1BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E61F180D59
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgIcBR4yVRR7 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B29C480D1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29C480D1E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B29C480D1E
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:25:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAEB1FF802;
 Sat,  3 Aug 2024 18:25:15 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:25:14 +0200
To: Chris Dimich <cdimich2188@gmail.com>
Message-ID: <20240803202514.6c56437c@windsurf>
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ8kaGnzG43hq1YZO4MCT8ecVXBIHOaGquASDGbBTkY=;
 b=bxUzmVapqe1CyIiW0USdEljjvGqFSb/vuODWwgJ+HwC+/UddU+nT/4mAptK827Vbob1YGB
 hfcmZFWwdQQUDRC3OyLHNhznpVFiK3mpIf6WoD794w8ym76s4wpiFAw8t+b0K/mDvj20FQ
 +FhUGdKtYemjNKkgbYK7U8UOmg6Lefw0nZBSx7shom9t4QMEMF0Ht1UzXC7EKu2c2MipTz
 KksZ+UzkbmaGmytI/r5fXAqPK1A4Q4XRnhAlaRsi0lr6ZxPE07Q8WxSLSjF4/B80y5t0WG
 oxcRPT2LoOSLHvxvoevnl3mz2OEnaIZGNnisy2d6dcTEoo5ESwcF5uvO1vlZ+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bxUzmVap
Subject: Re: [Buildroot] [PATCH 0/8] boundarydevices: update/add defconfigs
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Tue, 11 Jun 2024 11:01:59 -0700
Chris Dimich <cdimich2188@gmail.com> wrote:

> Chris Dimich (8):
>   board/boundarydevices: update boot scripts
>   board/boundarydevices: add i.MX 93 support to post-build.sh
>   configs/nitrogen*: bump kernel revision to f789d32c
>   configs/nitrogen*: bump u-boot revision to e3228228
>   configs/nitrogen8*: bump atf revision to d18357b7
>   configs/nitrogen8mm_defconfig: add SMARC support
>   configs/nitrogen8ulp: new defconfig
>   configs/nitrogen93: new defconfig

There were quite a few review comments or questions on multiple patches.

Also, in existing defconfigs, while bumping, it would be nice to enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in those defconfigs.

Could you work on an updated version, and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
