Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E593C5DF66
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 11:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFD24077B;
	Mon, 17 Aug 2026 11:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oGKSsfrsU0H; Mon, 17 Aug 2026 11:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2921B40762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786966082;
	bh=8RtGydMraOEsaQcsc8NBHtnGTqNeg1yDWc6XA3hi3lA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWEWSyNWo1/7OMOsiIqRxK3dlluJvR5BPwappBJf+0AOwnePgBVgvVk96QVpWBli5
	 EEzn/94aahKYWzU/xRkCoip0luyYggOgY1k1Phv+615vxnTQzv5fAksMRy5VvDrhiu
	 S8FQgIuaXKnvYwECR75WYRXTf8XJ1r5OolmYtJ9TygVcX+R/Suf6fSe/7SeeoeFL+G
	 GnTdBtNBZCpCiJbap4X5O1IchTumUrREcU/kpxAXymByu0UhqgoDT9nnjT+yIN0INO
	 bUVzK6WEDrkLvNPg6X3Lx0p+Aw90BgfEQ63uP9C7UcPvqm/HQvKmmkWg9KhfT03tCQ
	 oJDY8RgGneXBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2921B40762;
	Mon, 17 Aug 2026 11:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3ECC282
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 11:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A7260744
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 11:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T4Uk76yWd6Y for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 11:27:59 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7766160721
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7766160721
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=EJXHnRZO
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7766160721
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786966074; bh=dRrjoXo1caoL4umbUdRckzwY7wl+7Zwdi9/g83Rqvb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EJXHnRZOvSQ9a3qSVp4lgIvRLpii8sUFkIyHCbB77kbzWk9NmxycaKulUvVr5B2n0
 aYdWU3dwMeHlqkCCJ/t2g4mD5fg1ORjTCaj5cS3lyyNREf5Q6bwLbCDpGTw8Ptbpeq
 VGmhxJCqlrQciZSDnO0xAWvigWZhiowx/n/itwdo=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6F5D3BDE0FDC;
 Mon, 17 Aug 2026 13:27:54 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 11:27:54 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoKxCBccdMnLPUR_@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net> <aoDASYp4PBJt3wCJ@windsurf>
 <46e113718286cc5ee2fdac7ca8403087@umbiko.net> <aoKxCBccdMnLPUR_@windsurf>
Message-ID: <5cefbba7714f52842a7b47d665394e61@umbiko.net>
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



On 2026-08-17 06:59, Thomas Petazzoni wrote:
> On Mon, Aug 17, 2026 at 03:47:47AM +0000, Andreas Ziegler wrote:
> 
>> I will put the test data in a repository and download it during the 
>> build.
>> It needs to be present at the start of the system, otherwise more 
>> effort is
>> needed to integrate it.
> 
> But what is that test data? Why does it need to be more special that
> normal music files?

Because of legal issues I cannot use (copyrighted) existing music files. 
I do not like online download sites, because it's difficult to predict 
what you get. So I prepared some audio files, containing test signals, 
which are tagged to resemble music files. The whole thing needs a 
structure (aka directory tree), because it is also intended to validate 
correct indexing by mpd.

The runtime test is just a very basic representation of what I normally 
do to validate the correct function of a fresh build.

>> Any reason to use a complete package? Download via post-build.sh could 
>> also
>> be an option ...
> 
> Because we don't want random downloads to happen during the build, as
> it breaks "make source", "make legal-info", it doesn't have
> hash-checking, etc.

Understood.

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
