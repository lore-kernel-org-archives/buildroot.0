Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C6D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBDDA80C62;
	Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNTEZMjIqd2L; Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFE580F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808163;
	bh=Avlm4LjsqqRXXEUfTvGZx1c5Ep6BgtM0jS+wzniwHAk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=noZB5oPWcljes3JJjFkZ+BbmGmHbQ0dOg3mSs080oxn9x/gxIi8+KAdz8KQqI4AiK
	 D8NB1QGdjRDoRwdcECmXPIFcLNf8eUUzW+7SSsgmZ1MIzU04TQU8M0W7/ofW3b8nqC
	 ndd/6Ne/7gU4nK9WdqXdXm8eGGSggadh8ZHdYXWvw7jjP0ZN7GIBBcemThFuApQgTl
	 z7JUXR3TSvkstsgLYLsmLD04oeBo5Vppzy0rQr8W7Gj2JyFiOPQtjXY0n/WmEs1Xaw
	 FiEeaYKWhDdViYfQ3pbAREVpC4qv32OSgioa6TXuq0/UrLlNobsrB1eia+tligR3Ia
	 DHpEM3oZ0XWvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFE580F46;
	Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E13E9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E97B580F46
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uZ_umYLURH5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9192822F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9192822F0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9192822F0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F340CB97A192; Wed,  7 Jan 2026 18:49:18 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:17 +0100
Message-ID: <20260107174917.225111-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217181314.3675513-1-bernd@kuhls.net>
References: <20251217181314.3675513-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808159; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qkbXHdwZPuEvvGTM5zos9cs4spPuTNQH8FR8BYW16iw=;
 b=RyE4xEeud0lIRAriOl4Lp6EH+pVEj8nqY2LJju3vQGrWqMzvsZOqg0VIw/1/4IQyvmPFcj
 56TydQhoEfrQhEta1Ymk1dsHimW7XDg0fHwZUnsNbDMEZXjKWJYOETwn4hHyY6vAIml71x
 UkuT1K7t58jRmb0DhKGgg9tWWntaJkeYY+/3KOiO52oyiTclWanXDD7Y9f9DYyeP3/lHG1
 smB0qHf2zrGC6ZsHyX60Ciaw1BG7RDhSi+UoxZ0e4X9L2iEMKcNYQJkJtlY7Q55n06MnSn
 lyVmiJLvoQVQgA3ceVrVf2CgDd7S9GwRhobLK5FKBjOR7cQjVd4AB66dE33VlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RyE4xEeu
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.1
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
> Release notes:
> https://lists.exim.org/lurker/message/20251217.151548.85d1a2bc.en.html
> 
> Fixes CVE-2025-67896:
> https://code.exim.org/exim/exim/src/branch/exim-4.99+fixes/doc/doc-txt/exim-security-2025-12-09.1/report.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index dd20fb805a..f9a62e0188 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  5df38b042ffa9a9c8d31b20bc8481558070e361b06f657608622a62a327adcba  exim-4.99.tar.xz
> +sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  06521aff437dfe99c015606d2cdde76eaf6e4d2f03779b07fbc0e7d06fe0584366cae9c3fa7d73a86c348f0d25336acd06c42bd5b8f18e5a969de9849088e3aa  exim-4.99.tar.xz
> +sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index d9adfb59d5..47fe17b372 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99
> +EXIM_VERSION = 4.99.1
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
