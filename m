Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F210C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 03:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A41606B9;
	Mon, 17 Aug 2026 03:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2M7m57CwXPm; Mon, 17 Aug 2026 03:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8EC0606BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786938475;
	bh=9iZtQT77byVaHieYdNtExEGwZkyDIlNORu+8VIDPx2w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rprY9xcXr7x3RaGVfsNrF6e/utw8UYEffJylcruhFC7WB83ZwKejY56gccMgVTjbf
	 cwhFCHEo6GkcMc+RImXU6NQkEwsSzDpR5QVhRfYYE9gvoflr/BJDH/9ctyL3phtKj1
	 Dr50naSerGvuS3t07QN3/Vg6G3MhPfq/OA2BRBFwuntEonKmuqr9//2OwL/mxAV/Ty
	 VrOV+woCoABb1WxmV13W838KMae27HPJN0pDFEOeF+0LH0Obs2wyOxiSc9b2/cyz8s
	 vZNh2G0K2CfoCu4h6CsG8LDXZHpawXWpH6SH7pkOi3GNMtAZLOq2VX/b8j8yp7HYug
	 6Rcjaem59SGeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8EC0606BA;
	Mon, 17 Aug 2026 03:47:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D9F336
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B3D8606BA
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fsx7CWe-WlH3 for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 03:47:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEA18606B9
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA18606B9
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=omGAKO9b
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEA18606B9
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786938467; bh=CzPKNfwbpfe7sS0QNchrczd2qSzlDjvPMWesRabI9WQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=omGAKO9bsEdd0sg3R/RO5oMJorE5ZmD9nXLc3DJrYZ8bunyyFHel2cNaN3hxOuOXg
 fARZ4DqAs3LQker5SzFx0CI3DyDodB4Bb2YsLGJtoRmMNIgnMgNpW3TxzINWEbWd/x
 TBVIjat7ROTG+Bi/Wv/cDTWFAn8K+RsWyQwAyfEQ=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 96988BDE194B;
 Mon, 17 Aug 2026 05:47:47 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 03:47:47 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoDASYp4PBJt3wCJ@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net> <aoDASYp4PBJt3wCJ@windsurf>
Message-ID: <46e113718286cc5ee2fdac7ca8403087@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2 04/11] support/testing: add test data for
 mpd (1/6)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Everyone,

On 2026-08-15 19:41, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Thu, Jul 09, 2026 at 01:08:08PM +0200, Andreas Ziegler wrote:
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
>> ---
>> Changes v1 -> v2:
>> 	separate test data from test scripts
>> 	create archive chunks of test data that are re-combined during build
> 
> I am sorry but unfortunately, I disagree with the addition of such
> significant obscure binary blobs in Buildroot, for two reasons:
> 
> 1. It adds a significant weight (in terms of size) to Buildroot if
>    each and every test comes with 1 MB of test data
> 
> 2. There is no way to know/verify what this obscure binary data
>    is. When I saw your patches the immediate thing that came to my
>    mind is: "it looks like the xz backdoor where some obscure test
>    data was used to sneak in some malicious code".
> 
> So I don't know what this data is, but instead you have two options:
> 
> 1. Generate it at run-time during the test, if at all possible
> 
> 2. Create a Buildroot package that downloads test data. "mpd" probably
>    needs music, so you can create a Buildroot package in a
>    br2-external inside the mpd test that downloads a bunch of music
>    files, and puts them inside the test root filesystem.

I will put the test data in a repository and download it during the 
build. It needs to be present at the start of the system, otherwise more 
effort is needed to integrate it.

Any reason to use a complete package? Download via post-build.sh could 
also be an option ...

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
