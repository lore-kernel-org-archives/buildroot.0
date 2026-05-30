Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6FBCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64DFF6F5AB;
	Sat, 30 May 2026 15:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0WDEtnUFu9I; Sat, 30 May 2026 15:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D976F5A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780154109;
	bh=cADD3nZUI7Z6JaB381Bgz8nGJxf6HLdMoFJsqKoIi3g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I3k5UMcve+98/ZsHt5jigcM3iduX3/Gy7MdNsJcGP/UcA0bWhhJnqHviKzh3Nzvog
	 qWcyFIWSePDNlXBMbRAFo9qGQFMJ7SPIqN1lmM/OCwfcI07SOoFhVq7adLTAAyDS8l
	 0PiOE0tFyFIBMZEeq22FtAqgLDD2xDwKdZTEDZmQNMI4/QpYrYSMqwH5NBRHSVpeLF
	 GSrCoMwfSPtpzVkvjQEQ8OFcmQki5kzq7BIyU7dhO5Qot4+BQc0fgjAhiQ3ViDld9b
	 ujNuDGay80dh4HuhVvXANLff7xb16r4bjrdDt8QKGcgyWdybX7zstRjPONX4PMim2c
	 qNoxd4XAzSQFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D976F5A4;
	Sat, 30 May 2026 15:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F7BD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3BF885350
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4np15LeLkFUn for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0512A8534B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0512A8534B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0512A8534B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DC9874E42DA3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95FE46073B;
 Sat, 30 May 2026 15:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A284710888CDB; 
 Sat, 30 May 2026 17:15:01 +0200 (CEST)
Date: Sat, 30 May 2026 17:15:01 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Message-ID: <ahr8IZ-dp4xDNGjC@windsurf>
References: <ec612e55099118043d351762107b9c1a18387130.1775471071.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec612e55099118043d351762107b9c1a18387130.1775471071.git.baruch@tkos.co.il>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780154103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=kKH5U+4KTYgWNT2hK1f5aGyMuHtFyYlNOykoUJ4Wl7Y=;
 b=n3sTrH4apwXqARTZCp+Kqwy+waCgiys++DNzYFqZg7CMbDpW7woDq6uURYJcKuwqDt5DWO
 nHjpabQkLl7DIIz6KAqw2TWNksw6LwZun1qSyDH2Lb+lYeeO1T12a+od47Xwio6fqjoa7M
 VlRIgtHDbhwuz1Kj0fYiiQRFadMqMtwA9kp0VYYVjwx9Mbu/lssPJt5tGSdxz8Anal0Erh
 s8TIVzKVc/LFmzeV3r/r1aQDCd+A3ZH1Halxa1RfYv3Ye/h02qDUChSi6r+IFgJri1bVCR
 vjgszCgaiUQt7fiA9G2usqTMMDNqyXrnDkJFkGZfObJ78CkqcTkJXidhLBvnoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=n3sTrH4a
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build with wolfssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 06, 2026 at 01:24:31PM +0300, Baruch Siach via buildroot wrote:
> wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
> ("package/libcurl: security bump to version 8.19.0") removed
> SIZEOF_LONG_LONG definitions from libcurl autotools build system,
> breaking build with wolfssl.
> 
> Add a patch to restore SIZEOF_LONG_LONG.
> 
> Fixes:
> https://autobuild.buildroot.org/results/54140f8139f40a708afd25cd0264b52c7a9bf332
> https://autobuild.buildroot.org/results/07fa4932fe247e8e472f0f134db6ec36421303e4
> https://autobuild.buildroot.org/results/c0c64b348b5fbaa77ecc117078cbad8ecb9c4941
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

My understanding is that upstream rejected this fix, and instead
suggested to fix WolfSSL, which was done in Buildroot in commit:

  50feb8738464448c74a7e51e037716fa6a2f38f3 package/wolfssl: fix build with libcurl >= 8.19.0

So I'll mark this patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
