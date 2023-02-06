Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D3DC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F334173E;
	Mon,  6 Feb 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F334173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AXkzTTk79gL; Mon,  6 Feb 2023 20:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D1541739;
	Mon,  6 Feb 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D1541739
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6921BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7198A4174F
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7198A4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78aHp3PX-ufq for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 20:59:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D004173E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21D004173E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 20:59:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id qw12so37973714ejc.2
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 12:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7SW4NVP4pWl8pBc9id7QlZ39AClkADJZVJ5WKDZWZk=;
 b=1stO7v/FCwcoMRIat0CWf72Ypx1JbyKnTIIncDUSk9Q/BduvKX0C0iRU1ICUwm/YEP
 xBSIia+Y5zQkHWTOCshzR4ZVToFprTX3w2aaNCZiONNwFXNO0TJFt986aPHZXcIq3iTV
 DoKwy//ZqTa0dqt94VsJJnm8eaJXWogfWrzgieA4FMGAFgOBQQIujWouEoQql3zLjsgU
 wR2oAt4fLZ3ivWIpBJmOjVZQFu9bpTwRYRTFXgzpJTDhi5gxJJ/56DQJ0CUp0hVDvux0
 Pl98JE985IVeTpwLFQbgZSv9tksZs/7K7DvjFc0X+mqx21HtcKR7knOqhiG9j37xqAxS
 LdPQ==
X-Gm-Message-State: AO0yUKWgoWk0Mnbc9H2CJYOeEFkDSX/VbRJEfKRKZX3Ak9lv3alZvoXj
 pRClnY28bWi35fK2N4rUy4iXeNn+saVTqPxA4FIrI99jBo0=
X-Google-Smtp-Source: AK7set/tZ5N61IIqb/H0BEPfIsHt03rbeQccIJLit+CaJcWVSEoVPz60+jDlUYPeQ/FeKxPNSlCKFs2M4Yzhz2KtACc=
X-Received: by 2002:a17:906:29cc:b0:886:221b:44e3 with SMTP id
 y12-20020a17090629cc00b00886221b44e3mr224337eje.40.1675717146215; Mon, 06 Feb
 2023 12:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20221126003807.462157-1-pevik@seznam.cz>
 <20230206112156.GC3565@scaer>
In-Reply-To: <20230206112156.GC3565@scaer>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 6 Feb 2023 21:58:54 +0100
Message-ID: <CAB1t1CzEZsN5kGcr35+tSW36z6cNaUitAou5_fStHMzwuu0uHg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g7SW4NVP4pWl8pBc9id7QlZ39AClkADJZVJ5WKDZWZk=;
 b=h4XzyoLKIjhrqMg8v7Pn07klq1ojS+LyIndb7SmDYfzSruoRq15nK/WZxlkBiEIAQW
 8OT9lW2B6xet+c9RhX9dlHZuIf/t6+W+d3pj1J/2jQbq4/UBOPchWzGnKYv1FTbEC3yX
 qIDklZrxLBhQsVwmDGWGfgBqDwnrB9oqa8PXKBAMHFvYB5dEZ8/sCRU/rOhAb7nVWh0M
 FTucdiMghsn1ERfuvPydKRjZovWmRlWrvUa4Vn0FN8YkJ7eMg7fU34MSn9XGV9oavPIZ
 X01RX+I76URWYapM9KkBzNldDmy5aVA94MXLt1+ZT8hb3DA7bbuxjbabp1UxFnHwWiGe
 nbMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h4XzyoLK
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20221126
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
Cc: buildroot@buildroot.org, Petr Vorel <pevik@seznam.cz>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

thanks a lot for merging. I completely forgot on this patch, I'm glad
it was not lost in the queue.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
