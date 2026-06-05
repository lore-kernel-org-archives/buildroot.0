Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999AACD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7403B40934;
	Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seHGAQGca6b5; Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E44240924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663865;
	bh=irwwIBAQQeQMs4QmgrOckGktKiK2tQ6lR0MsEoqyp/Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zph8KWnDInHhohJ3PLR9VUNG9tSYvTsNGevtShqKqDusRoWyL9N/xBoFCXQTm2k2l
	 S/TeBei59POkkmOkI2ay4uJYvdhrDj7yAedZ+/nydEo8d8tMzjsdaxOdbuTbyvYDBE
	 ARIKf+A23O3F6KDfLRjQnd4u3Q6aBolVC/2h9JWyVBHVRfy10tugPkmXtinvsHAPkc
	 gYrBxgzaC5OMyooo1qG60dvYTJZuYZO8Du2WF9HgxaImsir0VUPIvDWgC0A785nWH4
	 MFHgVu5mDKnz1cdTendnj3vG25WI0lwoOIQIlwrR7G0uiCTA5vBF+AeVQWeqeP3lmV
	 mK8FeSwrgaU5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E44240924;
	Fri,  5 Jun 2026 12:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F04F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC284037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4RFm5ASocyc for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 992FA4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 992FA4037E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 992FA4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so23314235e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663858; x=1781268658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PT5OWqw+LvzA0mndogyJLI5zSnq9EwjKs12FPXaKdN0=;
 b=naMl204nsmuZNuMI6HbuU/yVi0AU/oUL9vJeD7zab23exOrd9t5H0JBTjNC3udUtUV
 1d0JzphEr3MM4G7AJIovbpOJ5f5s7hd4qvlJmHWMhZqMqARYrq1NlcijIuqKSEvBz/1b
 ueMnnzqxpNUaEIBD5LR813qtf6RYgTOBQubGZwH5NRh6GOjAzuUNCfD+Flu03kS9hL/4
 +kzzCgNohBaKEMZ6g2gU5MPpaqmtJ6BkQTqTdUbBBvmvAAD7GEp+uDKC/7X3fZKpSxpQ
 qqdpfDlQ3Q6HpxQJrgO+Ys1KDZIR9uFt1ueyh6DVkq+zz2N2I5NT3ERnpwDitUsWS416
 8dyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TQd7FVh+sZXWt/gl81ttLAr0Xx5rdoKNUU4fFgoGzZQRlptBe7afSawR9T57temjHmud3xnTZbZQ=@buildroot.org
X-Gm-Message-State: AOJu0YzYt8X8NeL9I/akI56bHqvzBEI7e+M5Dgz/FnKJADcGMT1zYcmf
 /3YUwqlit/bIcYORm9FyZ5YLw4Ccn3CsgoOoO9TvUuc+0PXsErpbG6xSf0y4dzUifOc=
X-Gm-Gg: Acq92OHEWnP2uTu+c+D7zNyGWKc2M8rPGOirnpQT4SIMI2GrFFSWRcMcOYkZOdThNJI
 8ER/rPTsivKz3koxQ/Lw0MBNYwFYeekAleT5b/WhAPJajeTtjCTKgK+/BIKiB3qpfpwzV57USci
 cnhMSfNKvlTo+ZmOA0tKdCFNJfGvxri5GFYTxiCwGQFrrhsJfRHWybnyBduUIyXykLlhDr9Boq/
 grf0649/QDPOT6vda4LF8c+/ZpzOMDrRsTbcmHLjS6Ris8f3f3mPRirjCWDFuuqjX/KcZLVrfLv
 PA2sJXRBadTzSyGlJrOx2X7dNcEhUscZYdtFY8GcpxGasgms+kJEPH3aQO9kN4Ic3lF2TtnzkE9
 z66ITlnNodw7IpLSq9rp9bDER860ptKjqvZuJPX4slMyjeuuHzZusztjqSEdPNRT0UsTj72jIdP
 Se/B12fxNOpp7ZU42sNhrHN+GA1Q==
X-Received: by 2002:a05:600c:a00b:b0:490:b58b:a8cc with SMTP id
 5b1f17b1804b1-490c25d208bmr56253905e9.29.1780663858571; 
 Fri, 05 Jun 2026 05:50:58 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39eb04sm155069245e9.6.2026.06.05.05.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:57 +0200
Message-ID: <20260605125057.274901-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529164801.1299592-1-bernd@kuhls.net>
References: <20260529164801.1299592-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663858; x=1781268658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PT5OWqw+LvzA0mndogyJLI5zSnq9EwjKs12FPXaKdN0=;
 b=G84STr451hXoH/FarewQ7mrGj27uDNqxjSRgx7uzI8SIJ+19sVmk40cAzd2LcVpngt
 KTXwo/eCX822wUZk8NNZkx7sEqxOy1OYW9IcOLnURNn9ACm8izlncC0CFQuphvCiT2uY
 xI6cKd5vlSUIkO1i92VVRQCvtHOUkk/pN4g//r4xMQsMCctzCt+H3KphzzNc0KWy+qyo
 84nP9N6A5hn/ppkUM73MKBMO+CQIhBxkn6noNJIljEU6diMg9Nfiqe/ZMM+3GxPpY36j
 5c09s0aNbqqpRW+mv1O1z/6mKwmeftPeQUQ85g4Rx8k2u1Ao2GKTtgvZP73xwwxg/26X
 cxoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G84STr45
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.4
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
> https://lists.exim.org/lurker/message/20260529.143857.4c75d7df.en.html
> https://www.exim.org/static/doc/security/EXIM-Security-2026-05-19.1/EXIM-Security-2026-05-19.1.txt
> 
> Fixes CVE-2026-48840.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/3861000877a0a8330b7c6b66a5c9d7aeb4bdcb89
> 
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index e95f7f5efe..cbf29c3f5d 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
> +sha256  87ff38815700dfb1ee4eb7e8dba7916df7a755905354d2d0faa1ae1790c4fd9d  exim-4.99.4.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
> +sha512  30fa01a301f8f4fe0c069f3da9e5247f0e22b19f64119cb8cccaf10aada8280ce02061a4671d110ad29b08af9e23ba3c3e8c7483874c7b1c992d90b51681ca9a  exim-4.99.4.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index c72e25a2c4..60870474c4 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99.3
> +EXIM_VERSION = 4.99.4
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
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
