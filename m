Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40844C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF46D4157B;
	Wed,  9 Feb 2022 20:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knd36EUqB618; Wed,  9 Feb 2022 20:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5E74151F;
	Wed,  9 Feb 2022 20:11:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153761BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 021D5401A1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsaetn-tNvMe for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DFAF40150
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:11:51 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id l14so1814152vko.12
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtYV0u4VXzVmVjO3D4KqSSf+umamqZ7fJwCcBOE0PFA=;
 b=e7J1u8RxNcDCmJA1gHx3QhrxMGtQHaMvq025P3F/BFk4FJ5KtqV5iwMGWkbgD9c+DD
 ckfXA2vxtE87iTnOMtmGAh0ZckAsHa9YQuhc9DZJiXKkYB1Gj0yhz9DNoF/FHLaS0mBc
 jbRaqEzSbBVHqWRBPBODiBEfcBTnNnnhjLbsEoe9Sk7xHDYovaNpnAyY59EblOe6uQys
 keDocSP00/S/ZfRohglpTvEeqvpShxCuIrwAwLBgdxEc5sUQUT9D1wDzn48lQh2XWzve
 YqqrDZ7/seqaiQR0kI31y6Zp0dhjNScgdGqNjklVK+xSgFSWwp2njb6eWHcwogpx0wX4
 EzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtYV0u4VXzVmVjO3D4KqSSf+umamqZ7fJwCcBOE0PFA=;
 b=516kHuC0BLf0Hwb5wJfWoPctTb4afaxg1KucsLgHvKpwDXsdESKNZf3zKfCCWH7tcG
 8fwkd/eFa0OV4JAv8ZEuuFE0eegts5hTnw/Qcnry99kD6D18VPNh0Mrch3uiuffLyRu6
 JjqhG2cUBjYCs5XjYugLtxCjLiX/gf0a44rxfY2lcIDsjA+2SBaQTDUrgoH5S8B/mDDz
 dw3Gv4aEEe0zt+ebAl62xHzaACTwFIY8Scc+4iuIRkS8YehswJyvoOm8wSQj3+OkNzUE
 A8G9+9VIbsVrtiUNHXqDx0lOEvYyoyF1KZlndE/OHSiD7mRKftINOZPIV6QoGfDpbZrM
 WrmQ==
X-Gm-Message-State: AOAM532i1zhumd0MweZjTQLECJY8Xo5YuJZhFTplwUN/TS9btz27IbUe
 2kzzdgd4fCHP474JmX8vffUlVRrJ909/kQ==
X-Google-Smtp-Source: ABdhPJzZ/bKP3ltIdrsZ6k1T0qFls7Xd7ES8w7tTgBDgzC3eD8ddbM5ELck1R2MwwW6TUJLLi3k4oQ==
X-Received: by 2002:a1f:3117:: with SMTP id x23mr1539272vkx.1.1644437509231;
 Wed, 09 Feb 2022 12:11:49 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id t207sm225605vkb.45.2022.02.09.12.11.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 12:11:49 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id t22so3942820vsa.4
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:11:48 -0800 (PST)
X-Received: by 2002:a67:fac3:: with SMTP id g3mr1484929vsq.6.1644437508329;
 Wed, 09 Feb 2022 12:11:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644422916.git.yann.morin@orange.com>
 <25580_1644422947_6203E723_25580_17_1_a1a52ce7fd9920435f8cc9e82513d62f9badd738.1644422916.git.yann.morin@orange.com>
In-Reply-To: <25580_1644422947_6203E723_25580_17_1_a1a52ce7fd9920435f8cc9e82513d62f9badd738.1644422916.git.yann.morin@orange.com>
Date: Wed, 9 Feb 2022 12:11:37 -0800
X-Gmail-Original-Message-ID: <CA+h8R2r9r+zfiAXSGh_CZZWhmY-1xL9CDVKMGeQEaDAecQ0mrQ@mail.gmail.com>
Message-ID: <CA+h8R2r9r+zfiAXSGh_CZZWhmY-1xL9CDVKMGeQEaDAecQ0mrQ@mail.gmail.com>
To: yann.morin@orange.com
Subject: Re: [Buildroot] [PATCH 5/5 v2] package/pkg-golang: host-go is also
 a build dependency
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 9, 2022 at 8:09 AM <yann.morin@orange.com> wrote:
>
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Currently, host-go is a download dependency, because we need go for the
> vendoring during the downlaod step.
>
> However, when using a package in override-srcdir, there is no download
> step, so host-go is not pulled in as a dependency, which will break the
> build of a single package from scratch.
>
> We fix that by adding host-go as a standard dependency too.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Christian Stewart <christian@paral.in>
> Cc: Anisse Astier <anisse@astier.eu>
> ---
>  package/pkg-golang.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 69eae02830..ddefdf1214 100644

Reviewed-by: Christian Stewart <christian@paral.in>

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
