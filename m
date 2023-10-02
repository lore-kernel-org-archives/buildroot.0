Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C702CE784B5
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 14:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BEA60FA2;
	Mon,  2 Oct 2023 14:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BEA60FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OKsppLxTv73; Mon,  2 Oct 2023 14:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B57C660F89;
	Mon,  2 Oct 2023 14:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B57C660F89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91B481BF410
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B3E460F89
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B3E460F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3C5Muar_mGoQ for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 14:18:19 +0000 (UTC)
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03C8B6068B
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 14:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C8B6068B
Received: by mail-qv1-xf42.google.com with SMTP id
 6a1803df08f44-668d9c1f70fso7712386d6.3
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 07:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696256298; x=1696861098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQtD9Wjfkx0j6M9G+eF7uM5FMAXW3MTnxtSd7VTMB40=;
 b=g1Fdz0/z0fqurKiXT7W1EOOW1SA+JGgYAiTwYTDlIw2LLtoaf51Gv5T4RRzdMfN2Oc
 S2rlBCHnuGuvvYkWmHxpFaYr/xiJagnEXXxa6sWUZFMZxLmzQe8BLhVYWCm3OXIHOtS3
 Yw0NSF6Jf0NobLVuP9NdebiOnw1+hp/FMFgpR/H1o4QYB+FJ+Pgy/YjJrlSSmZgneuyn
 GN5m76RE+cTISR9ds51Syk7B7Fhfw4STWtTGgo1tTZ5TowfvbAWZUHuJEb22afZeP2iT
 j28AJTXzpicttJNEXt6WgmqCjDwmrif1Kb2fIsCcuBPw2cWuRiJdV+SxoSd847YwQ9/1
 0BVw==
X-Gm-Message-State: AOJu0Yz0WuG3Q87h0KBrVtYRp7RoGKkMwDay2v9IAzQF5bQGpWU7thQz
 a90aBLpE3Q2NYJV3TwUEr71c9w==
X-Google-Smtp-Source: AGHT+IEchAkKM/FI2gLvfXHrl0IH046cKqt5QBmryDyAblGq4Rq8y01LSdQlQfrcoPWhOGAkLoyzZQ==
X-Received: by 2002:a0c:e383:0:b0:65d:31e:b80f with SMTP id
 a3-20020a0ce383000000b0065d031eb80fmr14026334qvl.35.1696256297458; 
 Mon, 02 Oct 2023 07:18:17 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 oj2-20020a056214440200b0065af4977ea3sm7756049qvb.24.2023.10.02.07.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 07:18:17 -0700 (PDT)
Date: Mon, 2 Oct 2023 10:18:08 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZRrRIKvNZ92GhIkH@dell-precision-5540>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
 <20230930221218.023aa2c5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930221218.023aa2c5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696256298; x=1696861098;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FQtD9Wjfkx0j6M9G+eF7uM5FMAXW3MTnxtSd7VTMB40=;
 b=2vJ5jYGET/grrgKwzkijrMUJMMRdhQbkZF+0LaeKy/qfgd0Lc0ScgHB3qZ+oZlC4Wr
 AcuDZ0VczShznvKEMEpnafMxBA/c2B6WTOhkD/0C6BjN/Hy4naESLdZunqgrnpJV+L9f
 K6t4MVxJgkj08/NMsYrBUAuXwF+fO2d7LjvA9Y6em7ZzAYbses3Hu44843tmTo9PfWQ6
 r1q9VjGsd6ihqD8Di3PfAe9JkNbutURMcqVkgqfCQuLvw6W0q9RZCN5x6rju3feGj3oQ
 cy3/2Ez6fPU9wmufdNmeQDvsZ6nuEs1DM7YhkGTy5lXWF7DqwQSbtrUzfBUN/KEsaeKE
 BeZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com
 header.i=@hefring-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2vJ5jYGE
Subject: Re: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, Sep 30, 2023 at 10:12:18PM +0200, Thomas Petazzoni wrote:
> Hello Ben,
> 
> On Fri, 19 Aug 2022 11:17:25 -0400
> Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> 
> > Ben Wolsieffer (8):
> >   Revert "arch: drop now useless support for FDPIC"
> >   arch: don't enable FDPIC binaries by default
> >   arch: make FDPIC dependent on toolchain support
> >   arch/arm: add support for FDPIC
> >   boot/uboot: pass -mno-fdpic if FDPIC is enabled
> >   linux: pass -mno-fdpic if FDPIC is enabled
> >   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
> >   package/pkg-autotools: patch libtool to support ARM FDPIC
> 
> Thanks for submitting this, and as Yann said already many months ago,
> sorry for the delay.
> 
> To be honest, we're not entirely sure we want to merge this without a
> really active user of it. The changes are not too complicated, but it's
> another fairly special use-case to support, and we would really like to
> have someone using it "for real" before we merge this.
> 
> Also, Waldemar pointed out a number of small issues he encountered
> while testing this. There's not been activity on this topic for a year,
> so we're not sure how committed you are to pushing this and more
> importantly maintaining this.
> 
> Could you provide more details on whether you're actually using this in
> a project/product? Or is anyone else using this, or going to use it?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

No problem about the delay, we haven't had a chance to work on this
again until recently either. We are actively using this feature now on a
custom platform based around Emcraft's STM32F746 SOM [1]. I have a
version of these patches locally that addresses most of the feedback
from the first submission, and I just need to fix a few more things
before submitting it again.

Thanks, Ben

[1] https://emcraft.com/products/700
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
