Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F9D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9587F843DE;
	Tue, 13 Jan 2026 19:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3EnW-INmOUX; Tue, 13 Jan 2026 19:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29AE843BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333665;
	bh=MeBpEMFpqYs6QzPDvw3XpO/E8dznRgenBmPfZJwZNok=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UxNZfDZ7zqy+YkTacuupSbIFleVGSv+gqTLK6bAnPrai06bO68xXnmaXUde7Pax6L
	 tBfdMRWuZRtf4b66bXNdsWNzAlrLv1+VXVtOY0Ylc3EqIR56MGpOEwENiBww1Y0XMg
	 Goj3fEeIYMeenwiuRFxrUqXPJ3Bb1BL9SQT2YV2/C+yJBIkwvOA+6u57JKrjycsxQ7
	 4b8o2AgTCAOOJYkXSzB2uYt1Rz52RZWqdm/4hFywiJFDHAM6SmT4UNyhNA3mqhAwFE
	 g1GgOoSsKU5z4TlmmXvaHKt9aPpJwblVv88GQ5ZXKr5xdh1eSoTbR5XedISXuUXekW
	 2ec8dkjmgSa0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29AE843BB;
	Tue, 13 Jan 2026 19:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88DC81C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A31E40E29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADTPCcS1qQ9D for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CBDB40E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CBDB40E2D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CBDB40E2D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8286BB97A863; Tue, 13 Jan 2026 20:47:37 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:35 +0100
Message-ID: <20260113194735.100099-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-10-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-10-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333657; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qifnib7uu66NmSSbJm/TWi+LqKGNV9sNcPNNO4DNJZo=;
 b=mdQ8Vp3lI+MhXKZxitqk3PPTao7dBcd6GYmsYvSiFC64LypUZF/mR2+A8QS6inXhbSj6AH
 f5H7YKZgOil148w8mbXiGZd/7G8/+4IVzmeqiUX4McMSN+GDectQrAuOfX+SBa5hyEK8aD
 M6B4XcQN8fqsKu/4g8gI1/1Aeof0Ifc1Ye9ai2+F9Oz8JP+UpwZeDqMeZt+0Gegr5P0cZX
 eWOm0tNimu9jBbUCNOt2oFMbTYuc9O78/jlhBPKFRrAPG939yP+AUILUdNGzJ8HsMVtxTd
 JEcuj1nkeAGwBiom7M2eRKYs6y4MkROr80QMDrsA4ZKf0h4K5u2ImhyV2ksI4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mdQ8Vp3l
Subject: Re: [Buildroot] [PATCH 10/11] package/perl-dbd-mysql: add missing
 dependencies
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
> Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
> drop virtual package"), we no longer have mysql as a virtual package,
> and therefore perl-dbd-mysql directly selects mariadb. However,
> mariadb as stricter dependencies than what the mysql virtual package
> had, and this commit forgot to properly propagate those dependencies,
> causing a Config.in warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
>   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=y] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PERL_DBD_MYSQL [=y] && BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
> 
> Fixes: 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql: drop virtual package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/perl-dbd-mysql/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
> index b430e44027..cd75c9d18b 100644
> --- a/package/perl-dbd-mysql/Config.in
> +++ b/package/perl-dbd-mysql/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
>  	depends on BR2_INSTALL_LIBSTDCPP # mariadb
>  	depends on BR2_USE_MMU # mariadb
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
> +	depends on BR2_USE_WCHAR # mariadb
>  	select BR2_PACKAGE_MARIADB
>  	select BR2_PACKAGE_PERL_DBI # runtime
>  	help
> @@ -11,7 +13,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
>  
>  	  http://dbi.perl.org/
>  
> -comment "perl-dbd-mysql needs a toolchain w/ dynamic library, C++, threads"
> +comment "perl-dbd-mysql needs a toolchain w/ dynamic library, wchar, C++, threads"
>  	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
>  	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
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
