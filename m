Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D41C433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 11:08:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0435A610CC
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0435A610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C748983F84;
	Wed,  6 Oct 2021 11:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZBDjeIPLWGb; Wed,  6 Oct 2021 11:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1A283F81;
	Wed,  6 Oct 2021 11:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCC91BF370
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFAD83F81
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 11:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8pRjNF5nsoc for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 11:08:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9058383F77
 for <buildroot@busybox.net>; Wed,  6 Oct 2021 11:08:29 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id j13so1522862uaq.0
 for <buildroot@busybox.net>; Wed, 06 Oct 2021 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFnqM0HgnscUC4kr583LK6TvCIdnuxbs+MaUPoGEJ1c=;
 b=R0W6MY0BkX1xqfS9YoEdrslX7lqIFWBx6+oQhCWPsBAV/QzGrj7PqbPuuSe49wsxif
 qRoudgT0tdiDy7sVCOs1wPvsEOClEXP/2Uex5fY088x1jn/cNAGuPYnJC7uzdoQDvQf7
 T2nqYCfk4/0rZ2siOUG6sH3csU5wl+4MJeTdLKZ/0HgWy7a+kkH4Wfdo/fM0Cn1X0T7X
 0YmB0t3nw8Kt2gmYkDNAn7+Y9qtMNOshqoQmeDUyRkZEezhC1D3RqDo8vx+cD48KfSoz
 O07v7fQkLyaDVDUdOWrOFmsA+l5Jr6O5xqq0n5MnUmln2XtsncqeIrhW2I+C2Ho7l5iu
 77tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFnqM0HgnscUC4kr583LK6TvCIdnuxbs+MaUPoGEJ1c=;
 b=PJWomFSxR9joPqHWgzX/dPx+ju3d4zoYsGOUfP68Ov1BIr8kszdtwCU7pZR/K7Z/S/
 xoFdqVWqF+qALq0RoUAKvs5ipz+cDH7HP6X3vGukqiMZB5HKke46aZYdvciLyle8UirS
 rx+bL7/eNfDXshG5YqdWrJiBpdYpvACE4lfwbNcGWg4sUC5KEvDfr+V9vpFU1PurfReF
 zS3AM5Ckv0+jjQeg7srIILP1vK+6zedbzZg6ing0+u2kG2p0FaEA4QIcey2TIKTAH8zj
 b+46HxZl+tx9LBjfQTiPrZieV6aCfKHThDXfAmxkm/dWgrAetOMcovihCXrn1hOObN41
 fzPQ==
X-Gm-Message-State: AOAM533WaNJhFxJ1hWdeWbXfYeWrM3OKBae1vGCothh2mz5BsdcMsgl3
 DfnEbIhAxK2BfR1HnMaJwLJFtyGr7QN+vudrJpw=
X-Google-Smtp-Source: ABdhPJwKYpr+Yr3szR/sE9tVrrUbZ2uG+8+MhrN98oJ+HdUWXTptzCOUZ7rycgnRF7qcGM83JQeFzPjClpextKIsBYk=
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr16260549uae.85.1633518508311; 
 Wed, 06 Oct 2021 04:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211006103207.1366438-1-francois.perrad@gadz.org>
In-Reply-To: <20211006103207.1366438-1-francois.perrad@gadz.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Oct 2021 08:08:17 -0300
Message-ID: <CAOMZO5BXqfEPLQuiD1-zs7v7u+omyujW2nnvScR+m03WCOs9ZQ@mail.gmail.com>
To: Francois Perrad <fperrad@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot
 versions
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
Cc: buildroot <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Wed, Oct 6, 2021 at 7:32 AM Francois Perrad <fperrad@gmail.com> wrote:
>
> remove merged patches
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for the patch:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
