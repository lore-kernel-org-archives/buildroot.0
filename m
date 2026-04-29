Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE6AFF8873
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC7C84615;
	Wed, 29 Apr 2026 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpGmBA9J50sG; Wed, 29 Apr 2026 20:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 390138460E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777496013;
	bh=8mbfbNwiKl2isPRTuWKlO9fQUlMyulpjVn1tpukaFZM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RSuKC3/6N7FIS5eicV86g/DtjoytJ15eyMNRvSsOsrl2KA/y27NNBA20QKUg0XX7D
	 sxKoGR7zYUwtHtpTqSgY0I120rs78x8uV7yj93cQxnUNOP/N/IiFhd80s2aFZQHO5e
	 oyctfBQkmeL//dHdjN1n3X+TW38CMLzSR6TBSuw0jtZ93EKw4xKm5n/ByJsGbAqJrW
	 2/Vwo3Mhm62xoLycmJW3i8/hdKS/DHDChI8l3c3gSNEgKMW+YNpNpqy0LFGMY8V1Eu
	 5QBwt/zIUay9BtkN3Y36TuD0R4QfNtggb0yq5P5V/c6xQxYJd0BRi2VKz2vEoQ+Wfo
	 FgeVLku4zhZhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390138460E;
	Wed, 29 Apr 2026 20:53:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A059192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BA840181
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBFiSFLGLmbX for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF9AF40079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF9AF40079
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF9AF40079
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:53:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 18B9E13F89C;
 Wed, 29 Apr 2026 22:53:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Apr 2026 22:53:25 +0200
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 22:53:25 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <f6840785c94aea9f23d411ecb1624ea6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777496008;
 bh=owdcDxO7iBTq/FkmhdWF/fRHvFDgEBVnEEqt0rPnlEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cLIrZJn4isK0jBoIQrsLDB633HUWPFivRQ2EpbintHJK7JmeBkqZd/2r9nQ6B1sYh
 mlu2NI5QwupJ2zipkyBXEnX/OOeZbvEc4ffWNciyqgtBjSqmqS0letqB48OssOatKM
 jAoxJbK4xfMSUpVKaY1oUum3EvhFLAXVXNGMqOs1UdJhpo7Mh3pa5U5iqIWx5wLGQb
 GMXzac13+/qpYFxiCNCp+SJp6o77no4DcWEpc6A8IUza6Dpu2Auq5mEebVwuNm8aWc
 Z3INVKoLEMqGbS6uauDbg4zhNHaGRHmXNW+XhngHRI9GmquAf2sfiYQCrToPgJAyLX
 2EQDxLPk2s9zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cLIrZJn4
Subject: Re: [Buildroot] [PATCH 1/3] package/python-pydantic: bump to
 version 2.13.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/04/2026 09:35, Manuel Diener wrote:
> This patch also included the versions with the corresponding 
> changelogs:
> v2.13.0b1: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b1
> v2.13.0b2: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b2
> v2.13.0b3: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b3
> v2.13.0: https://github.com/pydantic/pydantic/releases/tag/v2.13.0
> v2.13.1: https://github.com/pydantic/pydantic/releases/tag/v2.13.1
> v2.13.2: https://github.com/pydantic/pydantic/releases/tag/v2.13.2
> v2.13.3: https://github.com/pydantic/pydantic/releases/tag/v2.13.3
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Patch 1 and 3 applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
