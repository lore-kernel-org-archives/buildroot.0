Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6691BC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DA3409F2;
	Thu, 15 Aug 2024 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96HF79-odFx1; Thu, 15 Aug 2024 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04CDD409F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04CDD409F6;
	Thu, 15 Aug 2024 12:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DEB71BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56DD640B41
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZXSzIVW4q12 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 217C4409F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217C4409F6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217C4409F6
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:50:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBCE360002;
 Thu, 15 Aug 2024 12:50:07 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:50:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240815145006.72b13d72@windsurf>
In-Reply-To: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
References: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrIXLSc360Kuf2nTjWC811lX/E2PmbnxA7vSSpIyY/U=;
 b=AOkZPTHb0x7kRPaiJIhZsB0H/X8y2Vam2U2QO2+xMW7bt+uZ/KTTBxFT/N4gV+Sg5oWi5M
 ErQ22Xb72zVIt1cKiYP0/CeN3d4sHrwsoWMvbvhQYKAK8/IVlZ8+mi6/rH90L+q5Ug146i
 SDghPqit0N7u6sZFA/kqjYwlyxYzRfrYYV1zwRmZktncXH0u3LVF+pSaZptj/FMVZ7JfDq
 PU9wxPlC4gADPbyN6li17XHQ/l4ry634jK3asoQmhIEzpmqzjzrhSu4THxQ9FQX4p8Fdcm
 +RDbPNOT6MS590P7BzINuy3DSf4I9Y2ziR2DQstUg16mbtldjg9jmefZHzc3fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AOkZPTHb
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix microblaze compile issue
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

On Thu, 15 Aug 2024 12:45:45 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +FFMPEG_CONF_OPTS += --disable-optimizations
> +FFMPEG_CFLAGS += -O0
> +endif

Could you clarify why both --disable-optimizations and -O0 are needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
