Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F55FE7BD8C
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 10:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37F660B48;
	Mon, 16 Feb 2026 10:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUaUG7AD_Ag1; Mon, 16 Feb 2026 10:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0758160ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771239385;
	bh=Nop8lOvcvgSj2xbz2RQcK1dQKd5CrrQYS7Mpjd5HpwM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sf1S1ejTrZtLgBvOHIo9Pa/XaHV7SOcn/RsSiyrYssXbpYQAE6LTNTvpSanIjwlQ6
	 d3BL9oIP9SjQ4GRbPMWSFOw6lkn9kP/XE0p38d6Risog3a4FfOGRzUasdj5I5ufIpv
	 TGxfc0lTg0GpUtV22A77Ppvn4JewpWaS2l4Vo1wiHzJBHagBwVPu7Ul/ePUFU0GnfC
	 RUq7iS53cUP3VJLiQZiItO97gooU8LSi9dzffng/a4p7QhCQSFJh2WDKKbI75rIf1n
	 pL+xxhXoppCVtUTPgzVxUhbpDjt2M4ESK5b6VvnZZYkWtQR7LuYuphN+a8iJPRGMoV
	 +j2YarkRQfk2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0758160ADA;
	Mon, 16 Feb 2026 10:56:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 282F535B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22404406D6
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5Cljp8OOtcP for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 10:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDE77404E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE77404E5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDE77404E5
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:56:21 +0000 (UTC)
Received: from L30177.local (unknown
 [IPv6:2a01:e0a:2af:22b0:d832:645:b733:2cf6])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 10F1613F88D;
 Mon, 16 Feb 2026 11:56:17 +0100 (CET)
Date: Mon, 16 Feb 2026 11:56:15 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aZL3z9j_EidjRg5i@L30177.local>
References: <20260216093535.20643-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216093535.20643-1-mooz@blockos.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771239379;
 bh=VHccENq1jwhENvwFfA1sRzBtcWrwnMwLCgyYeAbkFEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VM5/tv5KaJzeTFQa0KgZ0D2d/oXSeDv5Sk2/zfpoZ2k2dBQfsOvZ7jxPkWObmJYGk
 962hy6AKBh7z0K+GeyGlBytLW0tftwgAxqEiWfgw8KYlPxgDs6FAFNU/mKjfzh3XiR
 qwI1Nmr/tS1CQfS35cBZZxYx2d0VKzUMCxFrFM7xh4sMhJNCSYnO5rJL4ksns7iR1m
 yv3yjeTFKK8ha3RNjtL0AqWu9cqfIA81EDJZXCPkj5osdnaZLGoXdlt59VsYMlFW6V
 CFCgdqM6KJe/0wt41TICUZebpRXWBq3lLIatCb6CVYrlWdIiOapJuB9GMKVJk3v8b7
 rMrRA8Pyd5qWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VM5/tv5K
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libnss-ato: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Le 16/02/26 10:33, Vincent Cruz a =E9crit :
> The libnss_ato module is a set of C library extensions which allows to
> map every nss request for unknown user to a single predefined user.
> =

> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

OK for me, thanks Vincent C for this update.

Please, can a Buildroot's maintainer merge it ?

> ---
> =

> Tested with Buildroot gitlab CI (12/12 glibc toolchains pass):
>   https://gitlab.com/vjardin/buildroot/-/pipelines/2313074190

It was my check pipeline before the libnss-ato maintainer did set the tag v=
0.2.0

> +LIBNSS_ATO_VERSION =3D 0.2.0

ok, there was no libnss-ato code changes since the version 4a29c8410cda vs =
v0.2.0 =


FYI, since your patchwork is more up to date,
  https://patchwork.ozlabs.org/project/buildroot/patch/20260216093535.20643=
-1-mooz@blockos.org/
I did archive my former one,
  https://patchwork.ozlabs.org/project/buildroot/patch/20260208204057.92731=
7-1-vjardin@free.fr/

best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
