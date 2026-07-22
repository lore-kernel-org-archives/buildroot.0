Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D7DC4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 17:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DED60873;
	Wed, 22 Jul 2026 17:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfvPcVYSmDZF; Wed, 22 Jul 2026 17:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42FF6072C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784742777;
	bh=cHE0i+7jsCdpy0WJB7sHxmagv+YVOnEkoGOnAYUvq5w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TkYr283kHrMjCVvdxnv0porZMSzTbul6QMKiImoZCSxnfsKKsOJPTirW78MRWskay
	 xZd2g4eK7bv7sN/1dgpaAxCIRtgbjTEqXEusZQwUEqpkN5vNUFfwzj6lzoMONzZwCe
	 S/xDeKjdpngRtMBPBPixfcdosXqd5DTEXX8ycUyxjKUu3Izj5B3bQDr5ZU4nCUJlnt
	 j2BKgDDw1WBq5pwcr2XvNhsyBr+VqazLpJl+8MGIRyN0QwIDRJnTbYV6AEKpoXZBcY
	 wXsqLQsyrnfJ/nYmQG/aoWzDgHZrUQUV6rwqrBIV6l8pfoMrfp9+vKSX8n0pkAV8cx
	 cU3qzJOu3l1kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42FF6072C;
	Wed, 22 Jul 2026 17:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C042E5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5574D6072C
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iiLJu9rV7vq for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 17:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67A92605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A92605E0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67A92605E0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:52:55 +0000 (UTC)
Received: from L30177.local (unknown [78.240.184.24])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2CA256013A;
 Wed, 22 Jul 2026 19:52:49 +0200 (CEST)
Date: Wed, 22 Jul 2026 19:52:48 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <amEDcCcm-khwiBo7@L30177.local>
References: <20260722124524.1678904-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260722124524.1678904-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784742772;
 bh=Ebv/I5c+hsDMXJkVNRIFUkekt9+0v8bsdAMUcjaQ9Fk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcDna8AcE9PMSbqfoP24bnW1Ep+9XVn+nostB9HqYzCCHdrBvxOvEW5KaKIElfSvz
 Tibiw5LPQW977BdLmLiUmWNuvPZimUmvo8EgDKPaD1vZQkc2ZS6qNn8V+DQtwvF8A+
 beA+gO0dCoZcIGv4Lb2vSuoF1Sxuv2+zs7aksP6YdYzeOkPk1u+LnsdUTQtdZjMEur
 jpHASwoZxFdLObvD2qz6QT5Igog8X9J3cZ12bPOgsuyG9VgCeMwy4MzJhSTaF76e3t
 s8lTqUPmshjV4+qcBSnu9Hqz2acYK2PuRck/DpxdK1I+Szdn8sw0ouR7i+z9NJDEA9
 f6ObOroDfXH/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gcDna8Ac
Subject: Re: [Buildroot] [PATCH] package/grout: bump version to 0.16.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> Tested in GitLab CI (all jobs passed):
> https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2696302810
> 
> -GROUT_VERSION = 0.15.0
> +GROUT_VERSION = 0.16.2

ok

Acked-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
