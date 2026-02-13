Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791AEDF152
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 11:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2C241B54;
	Fri, 13 Feb 2026 11:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZuLRHaQFU0y; Fri, 13 Feb 2026 11:13:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A607641A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770981207;
	bh=f+ds6t7DC+RUDEsLzlPDGEUMLdLu5BnuWPAQg6e9ISQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jegh16IITyqr5uCpHgOyMfkscwjEkAoq+i7ywF3KTQpqyvdmo6j/EEU90hKR4/HXz
	 1MIaDaKekbA3ESm8v9ShClToTu77OsFoUjT/QCwHaoS035PlNCV4BlpJaJw8dZoJIt
	 cPTEQlaGBCeN72sT5g78939eqLGqqejlSItAo8adxGe7nYTaOtPfNhFPZkj/OcI7so
	 UJQvFiWWOlcJs4besjIR7MFtVtPDne7mt4JvhzShhB0ueksz7zA3pJutRCoMOokZio
	 vMsvMxpV/QjxoXHxaUV75+ns7GH1iqSzvVNILOuzXfkDeb9zDkHo3vVlNP7X/7wNyu
	 e2zxs/JgLBTQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A607641A5F;
	Fri, 13 Feb 2026 11:13:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96ACD255
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84422842E2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csr5zoTNSty0 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 11:13:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD00384218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD00384218
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD00384218
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:13:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D29A55FFC0;
 Fri, 13 Feb 2026 12:13:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 12:13:21 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 12:13:21 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260211145304.4018549-2-buildroot@heine.tech>
References: <20260211145304.4018549-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.13
Message-ID: <6f97323896a6bd3d4bf1cd749c616592@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770981204;
 bh=EYH8APhwn6Ru52rN7fbMTIUIoAjRsJ36SwKmqp4boWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cs2hbQP+fOD53MxGbucFcqibTKURmHbU8subrNA67Z8YgKLfVnrw+2zKoJsY7yJyg
 BfUz5SujIxe8hRmvvUd9XU0/MLvOe56vmBlWKjojpultOodw5qaGIUNgQ8M95QEQyt
 ExZagMI2O1TT2M1qSTbuY62OmN265xDJFTqOVOctRKFNZ4P5r1v6zkIuyHT5BPg9Ax
 vzCPqSccQl0b22ROlMcgJWWxrKLP1skhBQ7UAfmm0OeqOjbeBCR4JnUmMYxrVrf4os
 GmCQ3ayNjPtYWyPuT0jnBzs0999HXj7JGKgig71yqYmwjTyHvCAvM8Jc9CNgNK1vPA
 eY2gYcWiu9NAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cs2hbQP+
Subject: Re: [Buildroot] [PATCH] package/log4cxx: bump to version 1.6.1
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

On 11/02/2026 15:53, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://logging.apache.org/log4cxx/1.6.1/changelog.html
> 
> Remove dependency on Boost.DateTime because since Boost 1.77 it's
> not a dependency of Boost.Thread anymore and that's the only thing
> log4cxx actually requires as fallback.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
