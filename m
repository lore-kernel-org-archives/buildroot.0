Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6EEC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:23:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3539E60041
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3539E60041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02177608B7;
	Fri, 30 Jul 2021 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzAj8Nv6hoDF; Fri, 30 Jul 2021 13:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6354560748;
	Fri, 30 Jul 2021 13:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CADE81BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB4FE40574
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glDS-jtyKOyG for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F27B440570
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:22:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gs8so16724643ejc.13
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=d7xMNpeP4KS/4BmuG6fMKTCJoWqpn8CgjNtjqPN/H4g=;
 b=U3aTc6kRucw8ag80LSUoHS7zvBi1TTRlocWWf+fHFNxSEDtu6vfB6vQlgPLUlORxdP
 ShIvhM35RDiIDK/qHff/tlw0n+MxVbNZlAG1l8RxF0F5U4XUcUoOidLm98vIQXJXipoL
 ivJJSGsMXwFmYahtefWv90asAchZXLf4F0xxPoPgtiqzNdJR00/9clI5LotrXrB5TydY
 pLuu8erT+tvvxJ0o1FuX6gNIX/rGVuCaMK5iAM12Y2IbogvSyMTf07/gpg7heUzKJaH0
 Ul/QW5ZJSXzUFyowTj5TbIoCJMoi97HyDB/jH+Yr/Jvd95eccUMe5++Bkg1QeAUmZicH
 wKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=d7xMNpeP4KS/4BmuG6fMKTCJoWqpn8CgjNtjqPN/H4g=;
 b=QplLa4l3wKiBNCctIU9r8XjV0qdo4mdZBAZoHDKfwwqFkNFGXlR/NvyF3MPgAchx/t
 uuc2OWXQW6jPifiujIAQRi7rRLX5VYejD6gDH82E8cTOPTpVb/2W8BiZyb5zy5uCdPf2
 Hhj4WD1onpLyOQUJHgves9GUhE9VO/lCAH+WYMKpB7E8nY4ybXAYxhDRWWt0Y2u80XZ9
 ftYwA3aN5iWY/fu+Co+xZUpuFNNIDUJnaJjdfvKWu6vuVFZ5L9b5sGaRl8PeBk+xnrCF
 UXtRIkfFyO5PI+cqhENiVa+MOByi62a/zSDIzKnAJBUzWDnIHxpGApWXpux9EXoBX3bN
 35jQ==
X-Gm-Message-State: AOAM531tZJQbAnIk7Xn98b53bT+irIlHNyUg1wv5Y9PBa+DHVJNHJ1cm
 w+0LJq1z44kY1zfmI26r+B/OqDIM1Bg=
X-Google-Smtp-Source: ABdhPJwgYHFFwn8GNuTeYzWtkTumosl/IT71kSxV6vO7rij2pW7rUH2XRNrESKNn9uNcc74HgpoAFA==
X-Received: by 2002:a17:906:1fd3:: with SMTP id
 e19mr2524314ejt.421.1627651356181; 
 Fri, 30 Jul 2021 06:22:36 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n15sm688300edw.70.2021.07.30.06.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:22:35 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9STC-0001PI-TG; Fri, 30 Jul 2021 15:22:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
 <20210714085346.2464634-3-fontaine.fabrice@gmail.com>
Date: Fri, 30 Jul 2021 15:22:34 +0200
In-Reply-To: <20210714085346.2464634-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Jul 2021 10:53:46 +0200")
Message-ID: <877dh80wdh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/libmodsecurity: security bump
 to version 3.0.5
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Security Impacting Issues
 >     Handle URI received with uri-fragment
 >     [@martinhsv]

 > - Drop patches (already in version) and so drop autoreconf
 > - Static linking is supported since
 >   https://github.com/SpiderLabs/ModSecurity/commit/f76a1a667b8fdbcfe0d943daca9b41eb59cc61f3
 > - Update indentation in hash file (two spaces)

 > https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
