Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A0EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3639861051
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3639861051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3F60426B9;
	Fri,  3 Sep 2021 16:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4kBuzihAuCux; Fri,  3 Sep 2021 16:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365154267E;
	Fri,  3 Sep 2021 16:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B67D51BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A558B80D7A
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIR5uudEeQiN for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:16:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D53080D68
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 16:16:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ia27so13086224ejc.10
 for <buildroot@busybox.net>; Fri, 03 Sep 2021 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7yLXNNPM3EUzyFI1rud8vbaDCbzHanWODpsboT20xtM=;
 b=CpMikkRdSjWYYs9VycRKonuj4vOeBkIkgGroP7YDy0BkhFeBDke3ZO9oxQIQKmDCRB
 IyJNhkBITdon5Ya8zjJoaedta/7YPLOvUs/FTPyhlAOVW1tM12NdvXHUIa4Zt9qiNjtb
 Ysb6GagogX8XGSuzONPyGF4fYF/M9PgrAAhaiIxwoZXkc+SCS6RAUAAFVBV6HsvAzxaT
 Z169GjKNmIOmR0EFnTyzppScvK1XlLlZAEeEaCqclr7lcitAC92WaE7ykP18R1P0JaXS
 0NQi4y+Vmr7V/p3mE3n3fKYhTJCZpHc/shGGWHkVUsiWSJLX3StX2MZePJntVGo+IQ/w
 SdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7yLXNNPM3EUzyFI1rud8vbaDCbzHanWODpsboT20xtM=;
 b=Zluoa2wABuJlm6i1wFhzxjm7SszeXbpqaNgdR0VdAgfJwscREImn0r/Kt60OIDPYRi
 GmCE+1ejoLFNqNSm+/39PgNC3WKpFsixtAgzE6g+pEICOBIJ5T2d+gzxtspdTK9Az1Tu
 a+JEJoD7VHnw/ZdqL5uzpVW6m+rb6GQcLj0EFFciJDKS3sqcATQB6uH8hjaGYLpxLGny
 yBZVD8ddfomxJI/8FiUiH3hPJ5CotKGwYi2b9VNc9TnJ2lD9N70Lz95LFcwAAd0vf045
 OGYBSix402E8qkAYzPCJfzi8o1gGZdtET1THhILI3BajoZ3hQnqBD4CjBDGDnyP1kwN6
 OeGw==
X-Gm-Message-State: AOAM533/EX+FDK215ej2UJfu4wnx3FrSWRi6wmlnlcuE/KqsZom1CD6F
 F6dpKkKYEsGraSNuY5/KX0E=
X-Google-Smtp-Source: ABdhPJxa/NHVqTipRAcjurTj/kkvT1ZBpIsGdkE4FF4HT2PvJfiCDq3vwNEXzPCUuvKOwv6AsN/SUQ==
X-Received: by 2002:a17:906:2c5a:: with SMTP id
 f26mr5111517ejh.205.1630685783033; 
 Fri, 03 Sep 2021 09:16:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 l18sm3269888edr.83.2021.09.03.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:16:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMBrZ-0006bL-Ms; Fri, 03 Sep 2021 18:16:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
Date: Fri, 03 Sep 2021 18:16:21 +0200
In-Reply-To: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 3 Sep 2021 07:39:28 +0300")
Message-ID: <87lf4dr5wq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/netsniff-ng: fix static build of
 mausezahn
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The configure script fails to detect libpcap in static build because it
 > does not take into account the libnl dependency on link. As a result the
 > configure script silently disables mausezahn build even when
 > BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN is enabled. Add upstream patch to use
 > pkg-config for libpcap link flags.

 > Cc: Joris Lijssens <joris.lijssens@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Hmm, we currently don't have host-pkgconf as a dependency of
netsniff-ng, so I've amended the commit to do that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
