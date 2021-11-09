Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878D9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAE961175
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAAE961175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A298180E9D;
	Tue,  9 Nov 2021 07:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUDhssDYQZSZ; Tue,  9 Nov 2021 07:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071A480E98;
	Tue,  9 Nov 2021 07:37:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 218081BF86C
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF8040271
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNTjJfN7cUK0 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 07:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEECB4024F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 07:37:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u11so42398475lfs.1
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 23:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oGe+7Tlx5mv+PFeJEu1mwtgCJI4I7dlIP1pNsSsSUXE=;
 b=iW7rwGMjFvyztpXuUYveQJ2hnVOKamITt1Hr+s/nV53pIyFxWtwpaaxML8hYziFVAz
 gwX7p/dMoXtK1tAEz6j6LEBn+FJSgRUoVvO60JA6AOBXyiiWGA3xgY9JNIoNEvpQNAI/
 KDeDvguzw+QLnb49gcYnHrj5sZ75E7DqRZz5oya1KuXrGDFqToxUVsDZn9i6Qb4ZkIyG
 oZqG6/75Jf6uUNddvhK0gelT8NUJQa17vrLoSvtrv0faCBtA6zSlcS3dTEDqpmNi3Jzq
 UxE/to2c5ZeQ1BwRAk/X6ClN9tVKJejjfsnAvijkE/T6r5RVvbDEwCdAAAP34zoJFzZF
 l5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGe+7Tlx5mv+PFeJEu1mwtgCJI4I7dlIP1pNsSsSUXE=;
 b=zMFX5J7jGaJQ/+DhFYJM60dg5F1msen01aBoImfHXuEtq9EXHpM0+vko0FKXe9zqnH
 GJixnS+dK0Qzojb5QdSZzD8osZBOpuXps8sAKSaiqqTF6sQ6dOxjWBZTb5A/CuS/IFFB
 RwxfFFXQCPxC1hI9akUmdeLyxN0WCtdOYG9XnWrsrU3Z24h9OgHKjdqk5a2FaB1p9Qsh
 w4xuF16JJJS888L1QmdeADaJMSPMzFgpvJ4Jy1YzDqS+xFGmjjwD8kbs/3XuWHbK4BKX
 xd0sQlXbUmS1jy1Wgr+LTy1oAF3Q8EILJcEoUyc+YOHTnUeNGdBzGsAC6yqqXN84eZq3
 s+KA==
X-Gm-Message-State: AOAM5333pgCn300SmI1G2ZkrHYmygkHZ9sYoQqP2yN+rKK5fI+6UbGrT
 L3Bd/gpfx++iX6DP+9yUm4UljmogSvh6ibD5KiA=
X-Google-Smtp-Source: ABdhPJwbkfagppzqo/FIKLIBgi5IY+LSRGVuPFjT84fow9R7x0mR9b0z6aw6JbAAjkwEtlsAwujz5AlG9hD4kt9WUP8=
X-Received: by 2002:a05:6512:e91:: with SMTP id
 bi17mr5168043lfb.14.1636443465676; 
 Mon, 08 Nov 2021 23:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-7-giulio.benetti@benettiengineering.com>
In-Reply-To: <20211108230520.4007148-7-giulio.benetti@benettiengineering.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 9 Nov 2021 08:37:34 +0100
Message-ID: <CAEyMn7byVtNQjGB3uEnsitCCTsnn3LBxFoxErRAFOkUXqEasVQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 6/7] board/kontron/pitx-imx8m/genimage.cfg:
 fix option suffix
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
Cc: Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Guilio,


Am Di., 9. Nov. 2021 um 00:05 Uhr schrieb Giulio Benetti
<giulio.benetti@benettiengineering.com>:
>
> Option 'offset = 4k' must be 'option = 4K'.

Is it really a must that the kilobyte value has an uppercase 'k'? From
the code I see that both k and K are allowed for that. But I have
nothing against unifying it.

Small nitpick here: s/'option = 4K'/option 'offset = 4K'/

>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  board/kontron/pitx-imx8m/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
> index c335b0c026..c78ef0f910 100644
> --- a/board/kontron/pitx-imx8m/genimage.cfg
> +++ b/board/kontron/pitx-imx8m/genimage.cfg
> @@ -5,7 +5,7 @@ image sdcard.img {
>         partition imx-boot {
>                 in-partition-table = "no"
>                 image = "imx8-boot-sd.bin"
> -               offset = 33k
> +               offset = 33K
>         }
>
>         partition rootfs {
> --
> 2.25.1

Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
