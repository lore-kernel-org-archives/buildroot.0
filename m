Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CD3FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21610607E2;
	Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBlmZkPKQn8e; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22DD607E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138836;
	bh=t4HsDDL8O4DCssiDfkHuXS/H8BvAczpvtB54lvNDWsQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G+/yhHDDFQwoiv/YFyHB9bSL0reGgCSrR7ECUDp3cdyxVkvEERYZLxUX/9TkoDIFH
	 z1qj9lHUfpAIlwoXGX3FYfQ9ZNgB8b1n7jMabpX7R3Oh2s3vUFkyBqtYWjtXSV6r75
	 QxUbt0HIh2T+/1sA0OHiYheU1E440Eb0Hy+vZDqsqCIdPIja7mTO8HE1BnzAObsAga
	 gIJIrKD40NuCrsch5WEFKERGW7CoLYlo0szY9LEi/wppUtn7+8C3HZH0IIr+ed5V/Z
	 lAZXaxC+M/zGMTR8hAnktBJ25OJNgDjnOiSDvaFhLJpWh9FmQxwFmMLJdGQzwo0oNp
	 Soo7FZVGaYYNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22DD607E5;
	Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE9423D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019334048B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmmkdE5sHWob for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1A4C40467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1A4C40467
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1A4C40467
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4398ebdf520so1530395f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138829; x=1772743629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dznkNAiKCJGp3nUuy/skOiYgu9EJ2gK5N1RCCjPaL+E=;
 b=eVSWgn1BR79qamtaAKE+y5uECvx8aXjuVuimlKrKQsihhPb/grgZIlXb4iUTabBIVi
 OAKoVy3coFINpoHYLQc2uhKJjpcbc0CURAoxRSMWrNU8g9N4DQSk3QX30dNtxqlcYLfE
 EO9q1sxJwn/Q9nfcbf+YphmHgtrTW//Qn/SkJbuTYxR6rLUJjADYocMNtsK8JQwUCHDv
 CAB7951JwdYqDsLRJ768EFpzBYduDSAXnnnNp6vGfJicMWjGK61F1jVHuNKspWPKpyRZ
 T++0yYM0S+rc8j/am+1E/bUJudXTCepKNxNKSP8lcarFjfEyjGblzmNZ3EfqnU0JnIw2
 xY0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI1zkzhRF/zYD/PaPdj0Pq3V2oxrY20eTdIflsl9UtUNxZVyCV7vADQcw8e9bKNVTTLbMpotXYaKE=@buildroot.org
X-Gm-Message-State: AOJu0Yw9RM0Jeb9Duc+d+OFNaXYny5on1+fCmyUKioSoPRrDxLnXFd+A
 /umNKCLQ1+NWg5Z22hBtomXI8QYXMPe7FxnH2ke4f/RfnhlM9nEZS+UEdg57EHYxxIhpeJrxFYy
 OiAc2
X-Gm-Gg: ATEYQzyCRQeZlcpm0zJ7JwGAuGYliccT4uCupWJccmtiE8HVcLUh3zHi11FVyG5q1Ld
 CxtDjWN9CSizfwR1xsLQPuTy0ZVLXqKdHSrG5NS2sVSzQ1iuHiCgN9DkoRIsOKlRm8PrU3zz93m
 pvbBRsOcIsPCqEd0wGnRICHi3g5xkTMbLTynUuvEsTuzf1QalnGI/gKuGKMpx1w/pxD5OrdXqdP
 8TKocg2EfpTDXVHfRb25LaDKuUkpqE4ZL05h4s6EAZhU6ve5suoJRJC33mmqett/NPZ4aThCUIR
 ikyGo270iZ6pw8IKbfBAsVYbEc98n0wsse7Gr0scsG03gixaGA2YQfrGAn/fAk89XRmxaIYdlb0
 l1g+zqPLrCNoy+lr1EvYEVqPtM4tzc2CL3DGVxoby6Uh4BIhREkh7qnJbQ4QHYhx1I4J4LEhP55
 YucGDqSpXFW1DmexA=
X-Received: by 2002:a05:6000:250e:b0:436:14fa:a3fd with SMTP id
 ffacd0b85a97d-439971fc709mr7145165f8f.24.1772138828883; 
 Thu, 26 Feb 2026 12:47:08 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60f764sm2004014f8f.3.2026.02.26.12.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:08 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:08 +0100
Message-ID: <20260226204708.253839-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218190918.2574524-1-bernd@kuhls.net>
References: <20260218190918.2574524-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138829; x=1772743629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dznkNAiKCJGp3nUuy/skOiYgu9EJ2gK5N1RCCjPaL+E=;
 b=dLwVTB0/pTVcMFO0/oSP20ETyAeJ81JssC25gtABoxqWWcSu3Z5VeZD6w7vSRF3lg+
 1X873cwo54SnTCh7pHVCMLn+z5qv2/2A3N03kVMWlotU7nKe749A/pV5exlflYeV8J55
 o3fL+UMl3kvkz2UhSsCG7NdiW4JLTRGuPd1rkdY/KBUwnAXjaZlPrPHJ0mvcwnTZ1eAJ
 gKNUqFUYzkqIXYgvku4+2PooEWonv0LQW2cibLgN9BvTwKNB2ZW6szGkYXNKc0nqdc9K
 h8EAMtag15MkHZUQSk2kOHz/JAp9Z6lLwiR7pWHNbdsKzxsMsXLipzZOvgJR7hXPb4pR
 nSnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dLwVTB0/
Subject: Re: [Buildroot] [PATCH 1/1] package/libzlib: security bump version
 to 1.3.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/madler/zlib/releases/tag/v1.3.2
> https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
> https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/
> 
> Updated license hash due to copyright year bumps:
> https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
> https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libzlib/libzlib.hash | 4 ++--
>  package/libzlib/libzlib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
> index cbd9313870..bc8b046426 100644
> --- a/package/libzlib/libzlib.hash
> +++ b/package/libzlib/libzlib.hash
> @@ -1,4 +1,4 @@
>  # From http://www.zlib.net/
> -sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
> +sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
>  # License files, locally calculated
> -sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
> +sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
> diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
> index bc5092d9a9..c73328deee 100644
> --- a/package/libzlib/libzlib.mk
> +++ b/package/libzlib/libzlib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBZLIB_VERSION = 1.3.1
> +LIBZLIB_VERSION = 1.3.2
>  LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
>  LIBZLIB_SITE = https://www.zlib.net
>  LIBZLIB_LICENSE = Zlib
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
