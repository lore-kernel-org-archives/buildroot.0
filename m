Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881B4CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45407408FF;
	Thu, 15 Oct 2026 20:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoKG0Wf-EsqL; Thu, 15 Oct 2026 20:02:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8EB40408BE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094527;
	b=DdjP8SG+aWmvyc6CZb8qTT8s//Hakwv7OISpsqiIzzgnCcKgsRmZl142gjifSz3c2Qet
	 IXcZAHTxq13W1ZKE1JpfG/4KprpMOdwurv3l0y34qiEKCBPSBzOy6fSOBWUBBujGGjQS9
	 V0hWUwF3UFsiYUGJYNV9xEOI2Jz75gBLeKxw5ouEXsBTPDLVbpOGaLpCuveb2ggqe9liv
	 BjftZxfEqRtzPiVOV0VRxuHyGfMscW7O4mtsqf7na3C++Vtp3DxfB7AsY910pY7l6+PXL
	 0qB3OB3c6Htvnoen5TWTgVFpDMFbTnqB40HdeNQnmKlZoz04O+1uFybrqQBJQEnKRpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wXW8SBW1WnRgA0zUZz4GQa9mArwR9y7vCLbSEERDqp0=;
	b=ohkCcx98Hz8a+LUwV1VwNXkJIWEcasi3H7aKqmT4Nv2j2R7Y1r8jzuAe3bt57exJ8k9Q
	 90OTn7gMr/oODdxBbdqTi1J0h6JUlsyzyn6gPXNnl6H6c5SS4rQajhh/4pmrS3WNZlzVk
	 tnkCVuUsTSSConXmN+KR1gdCjx47PEXW1NclBMAooMxm58cyhQgpaRoexvq63EmbmDWar
	 5yzjd+gdEFG9xGUsEx9M9rqrlEuN+1hgsC0o5r6iTY5ip2y5Fn/mFEE1Xo22IYNPS9Ypx
	 Auapnaq40327ex8awt2yWv444gchU6qLW0zmmaTTY3Jk421fmVaZRBm0FyA3Ahay8eA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094527;
	bh=wXW8SBW1WnRgA0zUZz4GQa9mArwR9y7vCLbSEERDqp0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CExea3C/WigZb4oJSm5IkyWBUoX79/E51vICBAL5Ur16N21geS0OkmkY3DmFspX9V
	 Ag2HIW9oHiZR7sKEQn/0uqkwewE/xXW6Krr6bHbWDZ2hd6V2SfnJWsH6da46ywWWJ/
	 BEXEuvc71uVA5e52iGiwsLfFXmAtz1Pz/xRV7M2SoGT2gzGMsjQxnX1xeXOztlajFa
	 yBPTXYYBceKKkoqSh9JhWxLt9sp2tQNp1oLidQThEAoPQG94m5kQOyPuiej2gHxcPP
	 ErGlz0gjWnO6gnuUfatKSksrGcCgdyXz2PzTwyDoKceCiw/VqhxLXLnwQdJMU72tU2
	 9faNdnm6gHRVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB40408BE;
	Thu, 15 Oct 2026 20:02:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80FA11AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7261D408BE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOap3JjKPQ62 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:02:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED34A4083C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094525;
 b=sOMQKqQ4mm/eJyESw0oq4fhlAPg3b9K1F2bRuI/cXDw9pEK3U9titgWKtAxKEvPbip7K
 Mj122MPbv/NrlxMUrfQKXgTxfGz5s1+vcw2fQ/odVw0YMEe603bWCdrsUVBpwPAQtHxrN
 +ICtJmu1kgPirCIeENaaLjM8TuRiedGtjYZWk7rknBYRphyIFvIpRpF58GnyYX8RtUCtM
 XCdhwdnobalq2vrDWCnEeyQxwj8/EFG/QMZQBd55CYWd4aLbM6kgTEbd16x0XwMlJm44t
 jRW4RHjHlBj7kurbbESKgmee8Ka9ZXmYkAJgkNDfloS9vUl+ULh4rn5b5RrD87K1w+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094525;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TOCGzXID2wDv0ohd9/0MOON+BVQ2NxDjbfJFxVgCouk=;
 b=chomvZQn62zWx5xUizTIg8OFssSKpRd3ZfR/fWDOPS8xiWwPH5lgWPHxRNdwJCS+kHQm
 0398bC3+gsNDK1LrwxIMW3jjCQMEZStpBifzPk9880f5AqjO6kb8cwRZUZFfpNWra7Gh1
 qPtbXSxJM3Ux7L6vPcogrbp/ScvUBS7P4NoHtfcsBBH0hx/Q7hrISaSkdyuJmGNCertny
 j+3exnNiJ7tqIDluUJPW//xsPmDQ+YyBv/HQWEcxDQExjrtpd8WtoJxNjc79aJ4Xuq9sc
 9axZhPMlDaYmZPvWUrRfHV0S7vM9Kub7VvVnPwxVbBBXb0YeLG0nHcdnHzsIiMVFArw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HkUTBh9b; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED34A4083C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 95B2EC63449
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E867A6075C;
 Thu, 15 Oct 2026 20:02:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B835310328629; 
 Thu, 15 Oct 2026 22:01:56 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:01:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Message-ID: <atExLwYBz-0T6gzq@windsurf>
References: <20261013215216.2460255-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215216.2460255-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-markdown: bump to version
 3.11.1
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

On Tue, Oct 13, 2026 at 03:52:09PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
