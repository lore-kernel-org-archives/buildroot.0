Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04041C5CFC1
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 06:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CCDA6070B;
	Mon, 17 Aug 2026 06:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JNeNr9uFI7w; Mon, 17 Aug 2026 06:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF95606DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786949966;
	bh=qlb/cpyeqmwnSh+/zw4TORtIXxQKBfU/TMpySFzMC5w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ImQ5Jp9h6uKSon8peeY6nWTuSJurpZJ4PreLc1AEbKg4JN/fiacwB6m3gMsGltIzv
	 I9hqjp4sNrls0xWahyTTtjkBZ/fPnHFm+nF+pWE3LxLM4U8iDm/6zEeC+t+0k0EDC/
	 TkBFG5Ox99KkXnSejyCaYYS7u+OemgM9YVPuxrj7ksRnt3i74hp1hha9Yh0yRYE5Js
	 riL6auwCU3/93P4cboiEajPZti1WO3glHYs4aQjNk31NC8J7RYmCm7o9mJ3ba/nM+l
	 e5CPNeRpht7gpqdStu+4JTD91ruMa9u2RIUUD4BsIFh5ioLzFTmg9VCzFUpnz3QuT1
	 qNOPRbbl36A8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF95606DA;
	Mon, 17 Aug 2026 06:59:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBF2237
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C59D680987
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reRqVHjIJRGe for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 06:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC27A8096D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC27A8096D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC27A8096D
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:59:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 932161A16C0
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:59:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67E5160352;
 Mon, 17 Aug 2026 06:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC81511C4FDF1; 
 Mon, 17 Aug 2026 08:59:15 +0200 (CEST)
Date: Mon, 17 Aug 2026 08:59:15 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoKxCBccdMnLPUR_@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net>
 <aoDASYp4PBJt3wCJ@windsurf>
 <46e113718286cc5ee2fdac7ca8403087@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46e113718286cc5ee2fdac7ca8403087@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 17, 2026 at 03:47:47AM +0000, Andreas Ziegler wrote:

> I will put the test data in a repository and download it during the build.
> It needs to be present at the start of the system, otherwise more effort is
> needed to integrate it.

But what is that test data? Why does it need to be more special that
normal music files?

> Any reason to use a complete package? Download via post-build.sh could also
> be an option ...

Because we don't want random downloads to happen during the build, as
it breaks "make source", "make legal-info", it doesn't have
hash-checking, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
