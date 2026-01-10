Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671B0D25020
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378174063A;
	Sat, 10 Jan 2026 20:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvC_fQ31_x-Y; Sat, 10 Jan 2026 20:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3EB40571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768078379;
	bh=/rwo5gqZw1dlAIyOw1nAKpPxJ6dLfoYpZLSMZ5e2eow=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=plYps49nMGa32uPcXqBy5lE8ZUfrZhp8XZ2HSGyMo2ZO68o6jr/UrFqy4Y5hnjxjp
	 fw+0YxB7fPOUJcELXrsY0elN1iJ5U2p3Pyc2+oh/UL5UXnedFm6b3EiWCXsTscg/sA
	 lab3Fm3+H/+Vtyax5/3aPT0vPvH8oT5GniYM0Q2tijXCDWem6l8YYbfKs0JWPsKn+C
	 F5JJ2MZVdhk8qJ+XhChO7VtEVBmhR1ejyd57GaHcnKTq1fnklCz6A1shCHn2uRj8eb
	 QIllcaeRcRPM8HAszd4dvv+KC3ctRrtmhZg9L81qKFI2j9V7Kr8jSKp8CtOkVgRtD9
	 NqoXM4Iq24hpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3EB40571;
	Sat, 10 Jan 2026 20:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A5B18D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 833AE60769
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVmj1oRHwxQe for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 20:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D932B606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D932B606A9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D932B606A9
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:52:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3150C78032A;
 Sat, 10 Jan 2026 21:52:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Jan 2026 21:52:52 +0100
MIME-Version: 1.0
Date: Sat, 10 Jan 2026 21:52:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260110180729.2240224-1-bernd@kuhls.net>
References: <20260110180729.2240224-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <5921c327ecf1150047da397d80e6bae8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768078373;
 bh=GJ2gDET0qOcH2gIsswe/DqeX6dj/gYoKx5OqsY7T5LE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cW61aJeDdW/jvFXrZTzj2zJ9GoHE8GdXyblPFxzocRSFOnUOZABbCVzSckxOWrs5F
 OaPCryUzb4KPGyzoNHOxoK+mPOMJKCCFKCAo2MZal+zo+NqvfxtTuOA6vapmcoP9on
 dpSgaYnFJ74TjDCUlYPHsX8yPGFrE3OLaq9BDRqssfj2yxUJxybSn5SRt0QRPaatFA
 hwh1vb+Ri5E8LSyhweuAQVBJ52U22xSIIgvmjKeghD58tkVsgst4U0US+G4NhPrNm5
 f/IGGYtW05v0Fa6aeqVIY3g4U866WPo37OPdvU/lIXLyYJ4yMyuuSEVWKVtK/fWUGT
 NSNkD4+vlDrqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cW61aJeD
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.18.0
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

On 10/01/2026 19:07, Bernd Kuhls wrote:
> https://curl.se/ch/8.18.0.html
> 
> Fixes CVE-2025-13034, CVE-2025-14017, CVE-2025-14524, CVE-2025-14819,
> CVE-2025-15079 & CVE-2025-15224: https://curl.se/docs/vuln-8.17.0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
