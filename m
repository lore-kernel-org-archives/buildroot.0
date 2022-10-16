Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA57C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9829840518;
	Sun, 16 Oct 2022 10:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9829840518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPGtJRkPZqYT; Sun, 16 Oct 2022 10:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D66434017B;
	Sun, 16 Oct 2022 10:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66434017B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE201BF591
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 10:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AC304017B
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 10:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC304017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Zt-Qhs6WUax for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 10:43:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CE86400AC
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CE86400AC
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 10:43:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b18so10815220ljr.13
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 03:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjc+yJKfjffJSGBZwzYopkHfdT/JB/hxIpaGCzPOYwA=;
 b=D3UDBp0qMpuB3RplN5mFt2307To6vyDNUiy9CN3Rh+q8MZXcMGq3vqZxtDGtS+9KUs
 6lNrW1cmaHo6cTTN6PKY0FdSkKnx3g7F7OYpdGbQ9EjHHA1AwOrFqUINf7tCwefhPRVt
 txYdFvgLuN5erzLpz2luab66QDdaNvXsOWMiFacuVI3D89nOFHo9E5mJRFSsL8PkPuAR
 XIVi8u5+2RXi0qEQEKKyM6MEkxzR1OXT47LvKiE/+AySpDepHALNG/K/iULRksQN0y/z
 7s/1CuBxqTVe/D47jwHX2rStyvbKtOpYJlXgnW3Y5BQRlC4FEqmhTAWXoOjxOUDU7eSR
 crsg==
X-Gm-Message-State: ACrzQf2l+dT+GhrWQcPnzyhd0CCGzeGDpomm04686DFl/cDiCCBZ1Isf
 haM+e1wNHt+iYWbjcSZuf9Y=
X-Google-Smtp-Source: AMsMyM5aJYS1RTfF/WXTv/F1Pw3BM2MnppzrTbUUVCq4wHFy23F25X4mWluMMW6eFTZysu8lqMmMRw==
X-Received: by 2002:a05:651c:1102:b0:26f:c343:f378 with SMTP id
 e2-20020a05651c110200b0026fc343f378mr2014944ljo.261.1665917027172; 
 Sun, 16 Oct 2022 03:43:47 -0700 (PDT)
Received: from gimli ([2001:9b0:215:1000::af3])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a056512368c00b00497a41b3a42sm1031782lfs.88.2022.10.16.03.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 03:43:46 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>, buildroot@buildroot.org
In-Reply-To: <20221016080629.3354482-1-clabbe@baylibre.com>
References: <20221016080629.3354482-1-clabbe@baylibre.com>
Date: Sun, 16 Oct 2022 12:43:45 +0200
Message-ID: <86ilkkcala.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=zjc+yJKfjffJSGBZwzYopkHfdT/JB/hxIpaGCzPOYwA=;
 b=ZwAmD2xe7wq6yyedwtjTbXIuh1cwDKxhlhDbNsJPzZxfAFTJ95fLTCrALdHTlTrq5L
 T2tl4yjMP1/zK5wnCF05eafXd4A/QYfFPR+xZhjDlxR+YZn1FPQPzgErARzNzg3GeaH/
 ky43vWagSPEYTOzKurTPjFRveR74YuNxpw80NjaTYrF8QseYh792iPTQrWZ4V8LFLCNq
 cIZdxzDs4A4LuDhkCK9Rc76SVaj4S9DJuYiQ7yYQRGsTnE83Ew95sjCKkqp4bXXQcXz2
 kJ0oXjJGZZvI/uiQKCTfc62+u+c2cYOrLB0fCEhLIeE2R8BooVbzCidZCvkThblxDUMh
 ugLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZwAmD2xe
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: handle new SDL2 version
 scheme
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
Cc: Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 16, 2022 at 08:06, Corentin Labbe <clabbe@baylibre.com> wrote:

> Current ffmpeg package does not install ffplay.  The root cause is
> that ffmpeg configure does not detect SDL2 due to version mismatch.
> The patch fixing that is taken from gentoo portage tree.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
