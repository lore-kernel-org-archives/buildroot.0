Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D624C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B775860F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B775860F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729B340669;
	Wed,  4 Aug 2021 12:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpMnwI3I1Ell; Wed,  4 Aug 2021 12:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1DB4057C;
	Wed,  4 Aug 2021 12:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C48EE1BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B387583B04
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Nd38lN1FEAX for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:25:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD8F083490
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:25:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso3789700wmq.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=WVjv4c5vXiWKcMf+468HIwWGDuepyBVGBpcf0kzZzBU=;
 b=rtZs80mCVHIPcis2ftMttqp2wSHSOzpvi7EGprV56ydlC6uIQgB20Zhq4YYeMkJF2z
 FiKZzHRJjSajQRQHTgat8ZJ6GitYRPewQNCqYHv9AEdQRpaywlFV56svW80i0UBRW1jB
 jjMR9tRRWx8XkTKquXY79euqLdBezfjOobVXG72jYX0AJjxG8yxFSFATIiKdKhDx/stv
 MrIdKwc8S/TX8zII888PpKDGl67+i2gTbPHlVZhF2x2TlgDMMK72dafqy5p6smm+Z8cE
 IUwP0KNksByHmgksLmyLClT4ubAl33cBHC7EfERIegrxkA/Hymb2hsxQf++o3L8sic5X
 mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=WVjv4c5vXiWKcMf+468HIwWGDuepyBVGBpcf0kzZzBU=;
 b=F+Wsux9XQULdy6SZetB1Om4+xbUGZwg7i3KwQQ3bBAdCuNAUkTkG5EEZ49jXxZUFXV
 P+IC2HFsmdEcgI62f7a7L9nEE9sN2Dh8aNd62ZpoQooRmT/wlVFAnvEG1NjhAR1UcFB+
 urJmm91rkD/afM4p596N4AzXBXhcV10UN12vdDZMQdSKbghO1397cn4XZ6x4wJ5oUQTv
 0wkfyedfZVufaXRiH14zXGiatedeURHF9bfS/rBRELUPPjTtDLyTzF7/hwc1FP7qrHdT
 WPsUZDtcQOJIp0LaTOIa54U+eJ/OiH9hs/aab0aALyQj6mjRc4bak6jI2gEEnGpUyYbv
 0tyQ==
X-Gm-Message-State: AOAM5322/TaCndBsG/EC4CfyPSd0kzNvYjjCe/QzTjvB4vM5MHMQBfLP
 oYbQdfgHUVdJiJ4k4NVsaVM=
X-Google-Smtp-Source: ABdhPJwxhCYj2y5MjDAWeQTPgH0J1H63nR9FIFaUImyV00UaLYbSA7MyFjNROz2U8Qndbe4VlJqfPg==
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr27305184wma.186.1628079920014; 
 Wed, 04 Aug 2021 05:25:20 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id o34sm5631022wms.10.2021.08.04.05.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:25:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBFxV-0001ij-W6; Wed, 04 Aug 2021 14:25:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210718200044.19EA988280@busybox.osuosl.org>
Date: Wed, 04 Aug 2021 14:25:17 +0200
In-Reply-To: <20210718200044.19EA988280@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 18 Jul 2021 22:28:08 +0200")
Message-ID: <87eeb9tn0y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/binutils: fix building or1k
 with host gcc version < 5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=747e2eed880b70c085bb93b34a6e1558ae49b6d0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add patches to fix building on hosts that provide gcc version < 5
 > (i.e. 4.9), otherwise they fail due to missing default '-std=gnu11' option
 > on variable declaration inside for loops.

 > The patch is pending upstream:
 > https://sourceware.org/pipermail/binutils/2021-June/116884.html

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Reviewed-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
