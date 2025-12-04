Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C21D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0EE60E1A;
	Thu,  4 Dec 2025 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De-VCl6NEzH3; Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA0BA61C76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881027;
	bh=RPF8IyaqaXMjsYxuIA4ZXjur63i0+8wNRxsEIrDvlHE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YrO2UtzDSJMz9w8gEWoLAdg1wmFgClrA/5Ey9EW+Dw72YRzTaicZHyGRbC9V/uxTw
	 0CdoJA8WJPUhD3LKw+ytpu9PyLm1f8qXtHz0Kdjgau7hRoRXvqGkxSGtWgVMyBZaWl
	 XRcuuM9PiVSu3UAglgQd8vGKYM2b2GfqVrX9oOQo6EB0QPQ2MqNwzAWMN7X+xM+a5L
	 +lIK9L+lFl37JJB9Eh2C7nGQqZl7XkEEeFLxq4l6cbcK7WluDfZCkYPxF6Ok4pNLRa
	 jw44abHtuhDJToHI6NFwbq1kSz1wrlPU0tmRBYPUoHGjeGwg9DKaeZtfpVcA8gxkNC
	 HKlLMJfapyllg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0BA61C76;
	Thu,  4 Dec 2025 20:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4A7D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FEF4035B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eiPzmbs89Hq for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6651A4015C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6651A4015C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6651A4015C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51ADBB979ECE; Thu,  4 Dec 2025 21:43:42 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:41 +0100
Message-ID: <20251204204341.13144-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251014211858.150756-1-bernd@kuhls.net>
References: <20251014211858.150756-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881023; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=HiT01T9L9Y6xAXYtJWTgCFLKDyU2yH34A6hKeVALQi8=;
 b=oPCO58IYv9ObLwtmxeEYGJvyHBMcUqrz3FovOWqnh6KGuagxnKj2ZPkuxDZH9vsbpdT1Bo
 uo7+zKBQGyniR3K3GSPvJkj4z7gX58qNppOR8a4MBu+rSHh1d+NFNtahG4ZyIepvzlb52G
 oAKKvzCyNirfHH2fUrNeLL19oZvV3WNFgUYI5ySjS5ImJwd/r6Ow4fpWaMQiWcGIpSnw4E
 dET3+NzG7OnUU7s3zkrXKgsfpRs+NrGNrg39DBjRFGa3Y1bjglulVCZHU9QGv8zCkzBZDc
 IqgzsCRyPV4l2BPq3fAAk72iaG74Q373tEkCEL2knz2vFDa/g2f2zxeguCfu6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oPCO58IY
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes: https://www.python.org/downloads/release/python-3138/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 8d9e67685f..a7ab3856cd 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-3137/
> -md5  256cdb3bbf45cdce7499e52ba6c36ea3  Python-3.13.7.tar.xz
> +# From https://www.python.org/downloads/release/python-3138/
> +md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
>  # Locally computed
> -sha256  5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a  Python-3.13.7.tar.xz
> +sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
>  sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 1546915f08..b501aa7859 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
