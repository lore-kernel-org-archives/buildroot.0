Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3224D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCB140E39;
	Tue, 13 Jan 2026 19:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11sIjGg8Tc7l; Tue, 13 Jan 2026 19:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6D440E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333666;
	bh=btXrysP1eXDcyXEYep0eyJ7dsbL5SDDk7rWVyd8/DCY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nkV8m7iR4TO0hFxmMw5P7e9rb+8rbiCNxwM91I2ClFQ7UEe8m+r7MCxvNh7zXNm+e
	 tfb7aLfJRw4RDGwyYcnON67au+ivmDXLYaWu0UnWLKPSk0duzHI0Ktf/vkc07v2Mw2
	 dSiA4rcjkBIXDAaSIT+Ri4wHVHkbtadx4dYwewwrBEOJ0VecVqKAVseIOFgP+fuOxH
	 2TRMOyxY6Py/8QQQss+/XQriDzEozr3bXHw6iOFuwn2HqemLNQXbBpVEiQkExcEAu7
	 tIqLSbSK/wMF3kgdIwGqsAfwv0b79xKvQDlyu9RlGlbrG5UpIRPxep6ldVdJdchIy3
	 SlCZh6eLfZhug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD6D440E3A;
	Tue, 13 Jan 2026 19:47:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F06231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D86A60BD2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ST6otILPgIah for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89F2B60BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F2B60BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89F2B60BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C07E7B97A885; Tue, 13 Jan 2026 20:47:39 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:38 +0100
Message-ID: <20260113194738.100147-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-9-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-9-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333659; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=X65g9Vakwc/jCvOOFEgdQXJExdCuTCkmFYxjQc5yu+w=;
 b=ae5bRqRLAgQBmIxv0ZyyOot2Q/O75mnoP61vrpc0UGOwCo/cZ73vGUHY3biOXsrYYfYf/q
 5zvR7tKzMyopYQMD2ECqm35rZAtchSWc4MJeMxz6gbI8ISJ3s7wTwI3sLlUbTXg/5N9dtq
 t1plhmBGgY2sbUK0u1e/A3Bhuj2Xag3oBbwQ3EiAAKICzyrMgLly8n4p/lBeIunIqPNMqj
 /1lkZrSBOHj4pNZU7j3Bkf9aENjhRMlczI5obDrk9VibHJ/C7SHg/Sn6h6nkqvowWTbTCt
 mV4+grW5R90aJ+GM7zwnPhZaU1I+UZO8UqiNChIY6e0m44/a9mzsAQR/MRpLiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ae5bRqRL
Subject: Re: [Buildroot] [PATCH 09/11] package/perl-dbd-mysql: update
 dependency comments
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
> and therefore perl-dbd-mysql directly selects mariadb. As part of
> that, the comments related to the dependencies have not been updated
> accordingly. Fix that up.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/perl-dbd-mysql/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
> index eff76f5b61..b430e44027 100644
> --- a/package/perl-dbd-mysql/Config.in
> +++ b/package/perl-dbd-mysql/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_PERL_DBD_MYSQL
>  	bool "perl-dbd-mysql"
>  	depends on !BR2_STATIC_LIBS
> -	depends on BR2_INSTALL_LIBSTDCPP # mysql
> -	depends on BR2_USE_MMU # mysql
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
> +	depends on BR2_INSTALL_LIBSTDCPP # mariadb
> +	depends on BR2_USE_MMU # mariadb
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
>  	select BR2_PACKAGE_MARIADB
>  	select BR2_PACKAGE_PERL_DBI # runtime
>  	help
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
