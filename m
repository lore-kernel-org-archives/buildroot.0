Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945FFFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6886981C11;
	Fri,  2 Jan 2026 22:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIu96pHbnw5N; Fri,  2 Jan 2026 22:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D9681980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391646;
	bh=TVZ0NhdWgA33whvK08xoT9htBq2fHWg/A24CFlmpdgw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g4DpqjmmC8Sr9VEYL5tSGw8MTmCL8/u1D87Aa+fNWkK6oDzcB7yaqTR5DYu0L2by0
	 GAWnAombs/1nv8aOL551ReTbr8lrId1K0Ek+ckw4qNJHSSTa2NbCkpk2WBPMVeq+n/
	 gQmPnwXgpeNRgnulcIae4GmnB2MG2QG+M2EvKgbCp+cs6BWWY13yaj3k2ePhlRY9D/
	 b3jB3vCqkFTS5w0Qchg61yagkSX66WGLJGQiLX0k9YMSD/OUBJsNiSM4o6L3yqV42o
	 JlOdKuUiPJN+up6z17slJFp42yVfwk/9f7D7/WANsskcdMgbiroO/H9kit/L+yvBOR
	 KKsc8unVVxOuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D9681980;
	Fri,  2 Jan 2026 22:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 864FA249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEBF6063B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xxn3qmbQpEbw for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1EDA460725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EDA460725
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EDA460725
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7BC484E41F05;
 Fri,  2 Jan 2026 22:07:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4C624606C7;
 Fri,  2 Jan 2026 22:07:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57C28113B023D; Fri,  2 Jan 2026 23:07:21 +0100 (CET)
Date: Fri, 2 Jan 2026 23:07:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20260102230720.5e74df9f@windsurf>
In-Reply-To: <20260102211551.65873-1-james.hilliard1@gmail.com>
References: <20260102211551.65873-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9JoGvPuYnGaQQ92ZdLEBhOCU8F6W2vcl8Y1x6car4jw=;
 b=of2CPU2uihDEKj7a7P+mTLXqzyAoFtUAi7fSFPPd1hK8yUOB2OgbH3qYFXzZC1URKBAuhC
 9vqcVdZm3gqTMqYIRVG/YrchiUgNtzhpOiWnp+BUD+cS7rfW7Tybw7wJQ68q7N6SvRbE5F
 k17XlRbF+JS0V3o/5xQqCrOFgK6ZN9I/whlEiY19QwhgEKiP2bONm8pzlplqa/dEiguXFm
 ca3HU40ZWunqy0xokMA9UFS/bqPqoi/myLKepBP8Dv6Tv1nY+2BGplJJOnBznuDa57MvPw
 +hJETY7VGXPyFegHavx913PuIKm6P3jl1xMPvx7nDQipSZ6ZGv0knzmEFCQbOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=of2CPU2u
Subject: Re: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.22.0
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

On Fri,  2 Jan 2026 14:15:51 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
>  package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
