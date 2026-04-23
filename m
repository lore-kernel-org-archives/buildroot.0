Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B03FDEE3F
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC153411B6;
	Thu, 23 Apr 2026 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NQmU6dbe2Vj; Thu, 23 Apr 2026 19:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D6E411AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776972791;
	bh=r+lcUmzybnQ41Lu9MUR52LqLpmP4V1/juupAqMYjbj4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qWYOhuHJsjj2AyLRuqv0VyATMa1ctoPPUJZjrhuTyPINaIh3K3JooP6Li3mUqUZ1d
	 PfAhFaH3EP2bWN0t60oUT3fNHY2Afa72bjTUwTMEikwXYLEz1BEaDAM1CtIMQqoLKR
	 gTgQ/Klu6E0FCjNbwHRPoWJOUFWWSSLLY1RobN5b3ib79MLdzASEn6UN+9NotfKekk
	 IYLXDP0lvw5BItEXvmG0GkwEpbrk2aBd0zduBxaerj/3CC1UW3g1RQtV+Cq9HwA1F3
	 4R0bb3jM3c/UKRNSjbVgp5NnaL34Fya7w4l28sKkrrT7djPyvr9n46M6K8uncxbywM
	 aNrrLbyM2eUZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D6E411AE;
	Thu, 23 Apr 2026 19:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4763324D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E2960F3F
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alP8zpLOSumF for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7044360F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7044360F3A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7044360F3A
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:33:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 00BDC5FFB7;
 Thu, 23 Apr 2026 21:33:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 21:33:04 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 21:33:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260423061402.39498-1-bernd@kuhls.net>
References: <20260423061402.39498-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <bd8932e9201389b55192f1efe3ee8617@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776972786;
 bh=PSjvtoDkO1Cl8ytYn8WU6/sbZvTDAEnu8rPCHuUcUb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hIdO3X2GNQUMObWb6r6LylWMjOcA7Xtv0SRp/BL2YoLspPSTE+cnzSZS5nS1TfPG0
 n/Su/o86i6p3UhIi7B5jIwksyrPbAQxbo+rd4JcCWRqFx8MwhWnCz/obdGZ3ooWRJk
 2+7dEm2zIyON8nJSJ7A5P8LEwRCPlZ5crwF/88irnAg8O3f1nP7rRXUE7OYTa5BNiv
 GGqWASy89stnd7TWuHVVTXl1xrbROP2QSVNQwYHUjijhjInPMN/1dONbImRjHSr5QY
 NztYmN+n3TOKnD8a6B4RHG6InehQU+DqYSk+9dYxgrioHuFEo8Ax8tsKmDuSHOwNyo
 ETwH/DC+1h/NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hIdO3X2G
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12, 18,
 19}.x / 7.0.x series
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

On 23/04/2026 08:14, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
