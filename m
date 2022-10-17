Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE25C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EE8982BF5;
	Mon, 17 Oct 2022 18:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EE8982BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_m4ej95Utbx; Mon, 17 Oct 2022 18:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A938C81325;
	Mon, 17 Oct 2022 18:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A938C81325
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 443BA1BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9DD81325
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9DD81325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Da6d8duyBqVk for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9955881320
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9955881320
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:51:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id d26so27006316ejc.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKUwb5Up+R/TUecZ3qxzFf16rA8e5IK0gKjMDWZ6kog=;
 b=L+x0VseX+ro2VdPGAgR5BYIlQ2fO9KUj8JAtcKZamNWviEqRditkoeMAcN7FXTDyrR
 GAj1FiHj/52RmEw1cs9lt3ca9AkimQUuRamxKVyhO6FColwW1/Rf/LZRH0DP/naTtkRG
 KmhgAI449NmKOpc9xoWM8us74NuxPbWxuikZPUAZyckqK85d8OIUTIpTSi/Dl3zRGYjj
 G5Zdgm7FkHsmFID2T6TizTgXST743zzn3FHDDwT2NYHYhA4mQBo9E/t92w+tX0f2aJKT
 /QDI4QLjY6a+1+RZHvzpWmBd2RrFjOispoV9GTdGqSmDzzurPx47bTQOJLZHkSzwJzAx
 8fYQ==
X-Gm-Message-State: ACrzQf1EOUAgNCa9Z3RrzDBnyPa4mWSFBZNdI1AIRkm8mTHLaPKEJrFj
 yd6hPnEubShhqPd7QIMlTS5Ud60OTTCp9zo61FA=
X-Google-Smtp-Source: AMsMyM5fG2nOiWoi9k5670di9EJPVW3T7L+NxjYxNUFcUK0VyNR82NALMU8Z43IhP0eGFmD3RHyMSA==
X-Received: by 2002:a17:907:2cf5:b0:78d:f9cc:794a with SMTP id
 hz21-20020a1709072cf500b0078df9cc794amr9438343ejc.577.1666032673245; 
 Mon, 17 Oct 2022 11:51:13 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 r17-20020a170906351100b0078d4962a46bsm6389303eja.190.2022.10.17.11.51.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 11:51:12 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id q9so27143424ejd.0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:51:12 -0700 (PDT)
X-Received: by 2002:a17:907:3f26:b0:78d:9c30:4529 with SMTP id
 hq38-20020a1709073f2600b0078d9c304529mr9785975ejc.195.1666032672171; Mon, 17
 Oct 2022 11:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
 <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
 <20221017184442.GD3666@scaer>
In-Reply-To: <20221017184442.GD3666@scaer>
Date: Mon, 17 Oct 2022 11:51:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rvN_5TbQondFaBJQVsoEXR2V8r_JB2NiwCpkb33XB3KA@mail.gmail.com>
Message-ID: <CA+h8R2rvN_5TbQondFaBJQVsoEXR2V8r_JB2NiwCpkb33XB3KA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uKUwb5Up+R/TUecZ3qxzFf16rA8e5IK0gKjMDWZ6kog=;
 b=EWgeJoCglayn6IhI4WOPqmvzSCI466F/O1WA+FKJa6zye0wPNV3Krq5eAVtGqxVlgI
 ANkgk5VIkS8Cz0UaGz1gDkEmZFBKfF2flVQeYfZQVyVLEt0ilvifx6jgJGFDeM8LPYGx
 Rm8OR48IlZnTQSbCom7EZW8NIlLL8Eo5zJnyGpRSw6IylpRS3VD1l95F+CC8ngHvyD4o
 IQHyp74B5SWifw2PhHoq1IsijR42liwyHEO/veEJLDLRoiYpPivmV313TIaBLRIo1ugc
 V7aDHjaAqdnNov8RdGkcmt/sUXc8sfwEyQy69y3wX4nLHri+5iKAoH5QbVgd/101W6lv
 8ypQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=EWgeJoCg
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Just to reply to that one question on why a host go compiler is useful-

On Mon, Oct 17, 2022 at 11:45 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >    - host go compiler (see patch linked below)
>
> If we have a pre-built host-go in the tree, thetre is then no reason to
> be able to use the host system go compiler, is there?

The host Go compiler may be compiled from source (i.e. Gentoo) and the
user (me) wants to trust the gentoo binary for Go over downloading
another precompiled bin from the internet.

Thomas -

On Mon, Oct 17, 2022 at 11:48 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>  - NodeJS (proposed by me)
>    virtual package:             host-nodejs
>    pre-compiled package:        host-nodejs-bin
>    from source package:         host-nodejs-src
>
>    The odd thing here being that host-nodejs is a virtual package, but
>    nodejs is a regular package building NodeJS from source for the
>    target.
>
>  - Go (proposed by Thomas Perale)
>    virtual package:             host-goc
>    pre-compiled package:        host-go-bin
>    from source package:         host-go
>
> So Thomas aligned on the naming used in the Rust world. I must say I do
> have a preference for the naming I have chosen for NodeJS, which IMO is
> clearer.

I agree that the following would be preferable:

virtual package:             host-go
pre-compiled package:        host-go-bin
from source package:         host-go-src

... although I would submit that all 3 could live in a single host-go package.

Best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
