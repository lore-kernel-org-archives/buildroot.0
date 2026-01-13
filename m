Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFABD29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D7584346;
	Tue, 13 Jan 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8-7Pxm2hak7; Tue, 13 Jan 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D78928433F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333634;
	bh=6aouWOgnkUyX3NVn0597PD903ioxM7cnIo8HzBcuT3s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sU7W538DRTtiAJsjJf0ip3UyOZYM0XWqNs7S8Yp5O/nC/DXtwRiRRpUPuGNBicsuf
	 qbIHPNqx8whRT/KlPdFQ7U33z+qyehJmIh9cdPGnJw7u4SPV92zpavVpVgziayqt3c
	 rAAbmn6pdlUSBZb0GgyliICyZ+1rRg4QFKZ9J0Il2A7A6jSK9GTkZfltJhTANvSQnL
	 MyihcgJNHOaeYLwDr7UnILC6f4zStVGiNaS6dIZPQyRR/HgTA9gtpjQOxdd8kcZyyc
	 82Oe9QdAzBH0nsIrozPAlo6Bkxe9Y42lbw4/1XaoLNW7vO3qZqEgSDE9OaXH+RVloW
	 WJOdgBCZ7bjaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78928433F;
	Tue, 13 Jan 2026 19:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC3EA231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF3FC40376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpuB0lqvxPLS for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92CBC40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CBC40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92CBC40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A09B0B97A863; Tue, 13 Jan 2026 20:47:10 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:09 +0100
Message-ID: <20260113194709.99516-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-7-thomas.perale@mind.be>
References: <20251230081917.18676-7-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333630; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ENopsG4PwIRjXelvciyNP7izmFUTpmNrAQKIoIEFRRg=;
 b=fkxsaRutA2kr5GHnkXp3nLFnCwAYQfSwJstTeMI2v7ttRkHCOyAD+uKOqBvEACHJnksXY7
 2/5vYz2yGaQfa38AtL9eqhOyZslfPWKzf/KgURLwLuzvnxcF/SVT9cjv2gfDfb2Suf8pLe
 NNrclO3MZgg4sjPfvGFvHbNr4BDYx7c3puMSjipGSuigEccOz/jV2k0Uf9aKieDyC1mJfI
 moh40/hSCaxc3q7jDFgWqdmp+7bwOSDGwyYkM5RpuBCK6LElCP7XNtgmUJqEF3bpuyO9/2
 bb2Psy0jtJcHCYHFBvbKIL9h16WlYBvvwrdZUeJcqSRFNBzSOCzu9ckEfJiAnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fkxsaRut
Subject: Re: [Buildroot] [PATCH v2 06/15] package/postgresql: remove stale
 IGNORE_CVES
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
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> The CVE-2017-8806 is then no longer matched to the postgresql package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/postgresql/postgresql.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 78d7cef4f6..38403b0f45 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -28,10 +28,6 @@ POSTGRESQL_DEPENDENCIES = \
>  	host-bison \
>  	host-flex
>  
> -# CVE-2017-8806 is related to postgresql-common package
> -# It is false positive for postgresql
> -POSTGRESQL_IGNORE_CVES += CVE-2017-8806
> -
>  ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
>  POSTGRESQL_NINJA_OPTS += world
>  POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
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
