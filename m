Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94491C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 17:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473D160F4D;
	Wed, 26 Jan 2022 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9v_-TgjyTjK; Wed, 26 Jan 2022 17:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 837A460F3E;
	Wed, 26 Jan 2022 17:44:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 521021BF417
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40BDE813B5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uou5oocYLs_Y for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 17:44:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADCC0813B0
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 17:44:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u129so1032075oib.4
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 09:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+dAn+GoicNwLHArXlrRhUWAWM6jyp7JwDjea76Wrl70=;
 b=g3BD0Ps/rSQi0dAW+0Wxlu3WzoFt/epoz8d/aAUA1xJtyKWWTMvdW03yd2A2Z61EjJ
 lY1Xwb2QACSG6S+JeO/wWbwQMkrzesBLc7bp3y3SZTbqjpNIi6gV5NtLGeTJQTv5qUH+
 AGohhWcugv9mCCp6kdV+cCfrEvkg90Bqd49IRlXp4IO4fmABs/ZzCEX1OdTYkr5Xy98L
 HKI05Nk3A6Armh0Tm++469liZZsGfRMflSZ8dMngj9cFka0Q+8PqHzVqoULtX2a+guBX
 y0+nXC+x1GT0mvk1a3QMC9c3CBIaXzsNbL7n1wsOTKAQKl70mpEEn70BGB/G6edCUI9D
 cjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+dAn+GoicNwLHArXlrRhUWAWM6jyp7JwDjea76Wrl70=;
 b=oZ16rOwAb8N6/BTD3NVqb5e2y7gDzisuRPTg0k9bVotlfyTbvhPETPcfYPZa0TfWh+
 vg0hTlYS+zfxtSjswD1frtFMIEqPyPIzYBUtuPfTvIuUvwyK6z7oUopTwzrKLjC0ijiE
 kMDPYra0LPdCiTTKlnYslW4DJHIrs9Fr6JrUKwPglcL83EjDQR7GO7DuJtYeufSz2rvM
 G4qCt/2G2qxY4yvjmfCX9Qx0Hb6KGv3iUzLwxAP/FeB8f5OURrKKs/SbnBFGI8kZm2ky
 B7357ahiIaC2N17G40ll+epGJivpMsCLYCTb705xhMco1waxAPxdrtsLvQgHZDF7rT2m
 LZHw==
X-Gm-Message-State: AOAM53387mgoFZ/ut6pUGbCmET/ahhiRiSqkzQkLXIcEutJk5lTAGCkp
 OKzYRrH5zXXwxC53J5d7GUJqhEQ7FfEbPqsml5K2uZ3DEo8=
X-Google-Smtp-Source: ABdhPJz2CgILULkgcqU1GWbX47uckoo1pnwb8QJd+otaathpRr3YuTrjlfVr0vlhcHRwvPAhu4owXk+ME1IGUQgPQR0=
X-Received: by 2002:a05:6808:201b:: with SMTP id
 q27mr4455247oiw.73.1643219091649; 
 Wed, 26 Jan 2022 09:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220101000408.1538099-1-james.hilliard1@gmail.com>
 <87v8y6h8c7.fsf@dell.be.48ers.dk>
In-Reply-To: <87v8y6h8c7.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Jan 2022 10:44:40 -0700
Message-ID: <CADvTj4rOqP1pZnp4hz=xb3Y5wBK2eJO7v9EMsd2VGcgRScAu2w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: add aiosignal
 runtime dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 26, 2022 at 7:36 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Fixes:
>  >   File "/usr/lib/python3.10/site-packages/aiohttp/__init__.py", line 6, in <module>
>  >   File "/usr/lib/python3.10/site-packages/aiohttp/client.py", line 88, in <module>
>  >   File "/usr/lib/python3.10/site-packages/aiohttp/tracing.py", line 5, in <module>
>  > ModuleNotFoundError: No module named 'aiosignal'
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> When was this introduced? Do we need to backport this to 2021.02.x /
> 2021.11.x?

Looks like it's required for aiohttp v3.8.0 and newer, so we shouldn't
need to backport.

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
