Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FE1C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 594F281444;
	Wed,  3 Aug 2022 20:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 594F281444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HBlZA1fgs0E; Wed,  3 Aug 2022 20:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F128124A;
	Wed,  3 Aug 2022 20:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F128124A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD2391BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B53EB8124A
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53EB8124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhVINk7T8ktA for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F6080DAB
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57F6080DAB
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:54:07 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id w29so13564538qtv.9
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 13:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tvYXcLHTZDIw9dGrIClJ82Xg6Sc7m6n+Vozstv1JNP4=;
 b=0ZXYvhV5JWrDn27mSUvs+yqPjeNp4BgUsv3X+gxRTt5mHBS2JCgTL0D+16uX7XkVcH
 RJm9HpUwg9VdvYt46/WDHGp0AUTx8fR4pYHPrgpBWwswkwa9WZ3PRGnb3DEcZO47ZPNa
 2DYZCeO65nJkMmEJuR8Bt3d5rDz2bLsu1jOFbNKEhkeJ+OHR9c+Eqbff7TImz5G4KkTs
 kwit8Gk9kKbnR1ozBcx+l1KORYHRgpwy4fv+IcYUfpiGPcCtJ1qqMEnI2zedRLz41RdG
 poGAnlYKiO+ZejsTUrfljAIlyUcQPUTfelOitljXxNLPWYZFlTfKfpin85vSudp00UNB
 rz7w==
X-Gm-Message-State: AJIora8s+K3j27sXew017r/K1abdOo2yNqZSPYCwReQoTG1Yb8ePnkI5
 1/ZO965aGx21dkZNHDHpSwCkCA==
X-Google-Smtp-Source: AGRyM1vGXrQUn7x2fHvRx4bcMqlfJ2FsF0XWSv1DYrB682Z0KTaqOSOrrxYvav9WjLqDJsWoCdFT9w==
X-Received: by 2002:a05:622a:198f:b0:31f:cc6:b082 with SMTP id
 u15-20020a05622a198f00b0031f0cc6b082mr24179850qtc.220.1659560046260; 
 Wed, 03 Aug 2022 13:54:06 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 dm40-20020a05620a1d6800b006a6ab259261sm3470907qkb.29.2022.08.03.13.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:54:05 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Wed, 3 Aug 2022 16:54:03 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Yurga8czIJ5QDnWB@hefring>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220802202142.1770838-3-Ben.Wolsieffer@hefring.com>
 <20220803001306.01608551@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803001306.01608551@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tvYXcLHTZDIw9dGrIClJ82Xg6Sc7m6n+Vozstv1JNP4=;
 b=AJ05E8aDT+5L+0DGwDbehisIZITbz3HJ72Lr5YQBCRmvEb9L+bD99fDNeL34HVHZHO
 JHPq0pNK2YIaD8uuX83FNocVBgaPpeCwvyvZgxRinFvDhZoku+qejfDGchPDT0aoghEm
 bX06CY90ThukHTIlqKXWM//Gl5Ynb5dgByyYCcvd4BEtHSk97e0adApF7aDtH5KGTMQ9
 T0gC+D8hBCIvOX3weQbxCquzu9TU2s+GVdzstLuoNvdQTl3TQucMAPiSspY0k954Prrx
 U5goI46YsGTGyymC1fi2Eq07gyUOKanl7ZgBHSpxcuqbupH7PTzXIhewcJxduVanc5kR
 UaAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AJ05E8aD
Subject: Re: [Buildroot] [PATCH v2 2/4] arch/arm: add support for FDPIC
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 03, 2022 at 12:13:06AM +0200, Thomas Petazzoni wrote:
> I am (genuinely) surprised it's all what's needed. All of
> binutils/gcc/gdb automagically now that we're using FDPIC just by
> looking at the uclinuxfdpiceabi part of the tuple?
> 

Yes, there was a bit of discussion [1] regarding whether FDPIC support
should be activated with compiler flags or be enabled by default with a
special toolchain target. It's not clear to me whether the former is
possible in the final version of the patches, but the latter seems to be
preferred.

[1] https://gcc.gnu.org/legacy-ml/gcc-patches/2018-10/msg01707.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
