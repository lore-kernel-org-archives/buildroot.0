Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D142FC54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 02:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B09760BC4;
	Sun,  8 Jan 2023 02:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B09760BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmiZbjBSdQBH; Sun,  8 Jan 2023 02:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D8560BA4;
	Sun,  8 Jan 2023 02:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D8560BA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248421BF3A1
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 02:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB45402E6
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 02:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB45402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln2tNUeX3Bi5 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 02:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 153004015F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 153004015F
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 02:41:08 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lc27so2757638ejc.1
 for <buildroot@buildroot.org>; Sat, 07 Jan 2023 18:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NelXhxbTp1msdpr9TOMUAFwg8d7CHecatpg4ESKJyTw=;
 b=Ua+O2qOJzx213yKxIFR/OnP7GB5icO9xT8uzJp9BwXcSZmW1XmgwWLEReRdZ8duHnU
 YUdBmCcdGgH0leyKRpyjas845NW2i4Xanad6A8zuKDgv6mKAbczNQ83jGCqb9J6V2sc7
 /IveseQrHvK/vYhPIGyqXf3/Pm6DS3F94oyyk7zuZdPrPQjIadokXtPV30SRDtPIW4LT
 rvP1IyaSRA/O30WE3lL6icAZE2pYie/ySCS6e4EN7H7SHesHnR2OUKb80obQVSHH3/8q
 WLfhiAPtm+NzQyTVFHjEWSh+pLRiSP8FQRjLTRI1Fd+ZzC2oYvT4SlAzsa2KGEeMyjLt
 KBdw==
X-Gm-Message-State: AFqh2ko5uCcd+WtrMe5jAYWsVuk3/vGUzOFiO9mlf2YMZdBxa4CwLqNc
 iTQWS/B/oBSjAbbP6A89THdyGLDrbLDHAw/4IDg=
X-Google-Smtp-Source: AMrXdXvWdY4+mswbRX9Tc2rGntvKzFWbarPNYxXcTRGK4ziPzKgenGFTEVZhcfpyJxqSHRGdhfX4lQ==
X-Received: by 2002:a17:907:8e93:b0:7bf:3627:df32 with SMTP id
 tx19-20020a1709078e9300b007bf3627df32mr54925918ejc.75.1673145667127; 
 Sat, 07 Jan 2023 18:41:07 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 lj1-20020a170906f9c100b0078d22b0bcf2sm1994257ejb.168.2023.01.07.18.41.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 18:41:06 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id fc4so12001802ejc.12
 for <buildroot@buildroot.org>; Sat, 07 Jan 2023 18:41:06 -0800 (PST)
X-Received: by 2002:a17:907:c388:b0:7c1:8fa0:527 with SMTP id
 tm8-20020a170907c38800b007c18fa00527mr7925993ejc.180.1673145666385; Sat, 07
 Jan 2023 18:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20221006140754.46144-1-tianyuanhao3@163.com>
In-Reply-To: <20221006140754.46144-1-tianyuanhao3@163.com>
Date: Sat, 7 Jan 2023 18:40:55 -0800
X-Gmail-Original-Message-ID: <CA+h8R2p6i0ixT49tMD_biNKnXzoGHe6AZ+gf5mdfBwx5s19dDw@mail.gmail.com>
Message-ID: <CA+h8R2p6i0ixT49tMD_biNKnXzoGHe6AZ+gf5mdfBwx5s19dDw@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NelXhxbTp1msdpr9TOMUAFwg8d7CHecatpg4ESKJyTw=;
 b=OiDd0TmI18H3f2np/I7bWg7i/v0ihd9bSchPGLgv4jwj/f/cJj05DEhd3PV0Ztr/ia
 yHcKijqFA1joawoId11XNbxm31BmrWQ9AzmF1jG0V2DfaHikQp/c0NMsn9rrs+aQqdsK
 5FDXe9Cq3pNr1HHTk3ncCj64Xs6rF0dzWgV4bTEoiO4d7paskDkTkc4L+/sov/dGIeFd
 Sqw+NK02Yc/qbAdtBHvQCNjzlXhhmuTRV0QEPb4dh3u9tcr+Wmxm8uAUuAfgya21iPt6
 WcaHNYfgYEdkGLX7BRWJVu/TGZ66XARUlLyfKSA9JMfneyW1qJWpVd1IT2MYpu96Es+v
 xunA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=OiDd0TmI
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as runtime
 in containerd
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
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,


On Thu, Oct 6, 2022 at 7:08 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
> Create runc symlink to crun when runc is missing.
>
> See: https://github.com/containerd/containerd/discussions/6162
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/containerd/Config.in | 2 +-
>  package/crun/crun.mk         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/package/containerd/Config.in b/package/containerd/Config.in
> index 0e3a55ef39..e69dd6768a 100644
> --- a/package/containerd/Config.in
> +++ b/package/containerd/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
>         depends on BR2_USE_MMU # util-linux
> -       select BR2_PACKAGE_RUNC # runtime dependency
> +       select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
>         select BR2_PACKAGE_UTIL_LINUX # runtime dependency
>         select BR2_PACKAGE_UTIL_LINUX_BINARIES
>         select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 4a0c150594..19dda71a9f 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -36,4 +36,11 @@ else
>  CRUN_CONF_OPTS += --disable-systemd
>  endif
>

This patch is still good, seems stalled though, can we merge?

Thanks!
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
