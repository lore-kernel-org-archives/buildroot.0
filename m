Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EEBD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E46A843F1;
	Tue, 13 Jan 2026 19:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFdTmkiXtCRh; Tue, 13 Jan 2026 19:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9E5843F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333671;
	bh=WKLiYWysACxPKcrmoICdoOU2/SDcwGwRr+iB1ffhMMQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JOHrt9EjCa950QNT8YSF0KVdtZNiVJtgwk9xX4sunklSvuBBfnq2iTAEgZRUAY94u
	 /eKozycfFmyQ5E1lK1dtjI31I5hLgqXk+EYOGtRKmCYmvd9aMVMV8IjrXC4iuRRqG9
	 aLrNCgGsk6Qp5ce38fWXa6DUjiFwTLqvxUEmZgM8H5njYbJ3pADpVyFPYtlzGYwD42
	 ulYJ6fGXReWnIiJNObj4nmmHpLjIlCfDHGKkRORc9hXWYgOpP2eMlgj0bgJ0CGF6Fo
	 xEsvqSwOodnRxvDdcwpjsKlJiKpYfvXljO2TfvxIehYbEA+JJmJHu7R63kZNuI0oya
	 PQW4/aZYkIDew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9E5843F3;
	Tue, 13 Jan 2026 19:47:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D6291C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F124F60BD2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voSteg9OBs4r for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E68A260BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68A260BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E68A260BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E841FB97A863; Tue, 13 Jan 2026 20:47:41 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:40 +0100
Message-ID: <20260113194740.100193-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105203506.997611-1-ju.o@free.fr>
References: <20260105203506.997611-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333662; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=D+22Engvp+FeN/LkufbiW3W797O3BVpLP5bKqpTu10w=;
 b=BJpdSZLrnlgdITgdX7IGz5VAZdLe7gjW2sooxyXWdTV4x/IewTeIAueoGhuzT5nXqKzA5v
 DfKeokRL3GgvJH+dtf+yt3iViDJ6tkW7ZwMqXJEkyRqM8LBMmsxTrAWS2+9mEtophL8siw
 oMiorEJR4ugB//Q2/3U4Bvi8/901/tJDdE8e4602etpkVf6PQ+Ivb1sOU67a4TLYeFn7fJ
 0u5aR3zQe8ssWWixYfnu0dxSU/NFH4PzHq/ILnvTgXD98FzvzZJWAb4V+SgRNENPZbAqex
 vSvBTKbOOihJJXifumI7EQihm/iAMlRDPZNRwyBxdQEcbbtwgmKuXoG/OKRjPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BJpdSZLr
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.16
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
> For release announce, see:
> https://lists.gnupg.org/pipermail/gnupg-announce/2025q4/000500.html
> 
> Quoting the announce:
> """
> Note that the 2.5 series is now declared the stable version of GnuPG.
> The oldstable 2.4 series will reach end-of-life in just 6 months.
> """
> 
> Also, an important feature in the 2.5 series is the introduction of
> Kyber (aka ML-KEM or FIPS-203) as PQC (Post-Quantum Cryptography)
> encryption algorithm.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12610896917
> https://gitlab.com/jolivain/buildroot/-/pipelines/2246006250
> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index ee37e6a3af..feafbb328b 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
> -sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
> +sha1  3acefeef08c82a4d4a8ba36f95c2986fb925d359  gnupg-2.5.16.tar.bz2
> +sha256  05144040fedb828ced2a6bafa2c4a0479ee4cceacf3b6d68ccc75b175ac13b7e  gnupg-2.5.16.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index d083ea850a..fafc383ec8 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.4.9
> +GNUPG2_VERSION = 2.5.16
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
