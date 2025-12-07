Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C954CD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89FD66073A;
	Sun,  7 Dec 2025 12:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-c78GM5P_kP; Sun,  7 Dec 2025 12:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5966260723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111827;
	bh=2TCcdxvxJ5LIoBGBPEUti77qOsAVL8U5rvDTN7hiCtU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CEXzxM8BA2H3O2yg5CP1ee54Gbaqd2e0dkIJcjmKc+p9FyfX7VxkblPkKSbKDVhn7
	 YkJOpl2l0IhMbvaYkkWs0ieNQKe1X9QdbOVk+DunXUUHNbW2WAROYKDptJgf88HJZD
	 l5tgHLv021cMPyCWbvxdDeOdT93pEvmATH3MHWVGHSjgXbsb9+Adi91ItUYhbN9RR2
	 GZpGNe56Q94iJGQaA/h+QMCukFf/d/y6/MXCC0M0Yv1A0KZJPnPH7TX/YBdivHWaHi
	 MMpH0hcEqDFrVe4PQCbjdau9IaFCvZezST5ndYY6T7uYvMbCrTolK1G+Te0ogLnz5/
	 NwwBqn4OiPeCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5966260723;
	Sun,  7 Dec 2025 12:50:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C7DFE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42B2060723
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3WvgcPxCixe for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58FDB606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FDB606F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FDB606F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:50:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CC5A613F88F;
 Sun,  7 Dec 2025 13:50:15 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 13:50:15 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 13:50:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, =?UTF-8?Q?Jos=C3=A9_Luis_Salv?=
 =?UTF-8?Q?ador_Rufo?= <salvador.joseluis@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251207091410.28979-1-bernd@kuhls.net>
References: <20251207091410.28979-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <cdab949290c3c9d91c3cbcedc593d190@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765111821;
 bh=c7CQWgOSc3KCP4IViiC1G4n3fesz8oSFGKdTxasfqcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Px2fFQIqgRDhBVzuYexiS/iabO0rZ8UAKGKGXPKLm7SVn5crYBI9xAqUA8GoyEPbx
 5jG84ndmGE3LV32+0W7/34AOrFmN+5MQukuZvFiIolfWqHo3X/9oRTxNmVCyGtMyQI
 alTcN3ALyWLZdnqQS9np/n6yRNXlRIoRHwu+/3SbTsynIlmzKRg/m0zUFUYMLdsnk4
 tfZyqkcWG0nrG+Hnz68OF81ZyQeMj0+NQEwYfb26n2lL8jSgUl+rcOvgyw7khDFE9W
 aK0x/Qk/awE+HslaHJXJ2J/sNbY6VaVt8/aNw9N0587mQXiK/TY+HVahfqGvl/35OO
 N2L/b1LU82+tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Px2fFQIq
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 17}.x series
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

On 07/12/2025 10:14, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
