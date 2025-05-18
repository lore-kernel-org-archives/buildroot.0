Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A50DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA4280EA3;
	Sun, 18 May 2025 14:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrXiu_Zsz_uc; Sun, 18 May 2025 14:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D843080E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D843080E6B;
	Sun, 18 May 2025 14:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C860FDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C509380E0F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfY-1M2bzPYb for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7B8480E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B8480E00
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B8480E00
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF5C21C0FF6; Sun, 18 May 2025 16:46:45 +0200 (CEST)
Message-ID: <71b2a0d5-fc3a-4d0b-819d-06765604dc6f@rnout.be>
Date: Sun, 18 May 2025 16:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
References: <20250517161505.3294288-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517161505.3294288-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7awNthxrOxXc8NWHwfDhuzFhM6u4yjEOSut292vqSps=;
 b=kZlA4qjQE1P+2LCqhl5ihlxkNV0CYm4OX+Eo8EbpM9hZtw82Ph+t4dBV2z/dDt1+/LSQEz
 8pOms6MW0OQBaF/cxJ+a+fzIhVavY78MkewA6P411NaWJnAzZjniHrK6c3MZ5zhypAuZ1M
 EK5IeFt77UcLj4g47PWr1egcm9J42dAOYlChSvovLX8B/Tm9fskODIjC4iBcfx3G+YXswO
 GQUqghH3kAnVk59Nvb0FBvIV+gYTreYKAPn72tYJOIjmOC0mh7cNuTP6kDWsuIWW5GMDt6
 BGI2dBMTdKmVMifY05UNgLIv4oQ6nkG7fXGDMPj2U37b7O4JPyxJNy5cliqJCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kZlA4qjQ
Subject: Re: [Buildroot] [PATCH] package/postgresql: security bump to
 version 17.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2025 18:15, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2025-4207: PostgreSQL GB18030 encoding validation can read one byte past
> end of allocation for text that fails validation
> 
> A buffer over-read in PostgreSQL GB18030 encoding validation allows a
> database input provider to achieve temporary denial of service on platforms
> where a 1-byte over-read can elicit process termination.  This affects the
> database server and also libpq.
> 
> https://www.postgresql.org/about/news/postgresql-175-169-1513-1418-and-1321-released-3072/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/postgresql/postgresql.hash | 4 ++--
>   package/postgresql/postgresql.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 1c77119207..f17d4ca3ce 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.4/postgresql-17.4.tar.bz2.sha256
> -sha256  c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7  postgresql-17.4.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.bz2.sha256
> +sha256  fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8  postgresql-17.5.tar.bz2
>   # License file, Locally calculated
>   sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index bffa544a5a..671bd30347 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -POSTGRESQL_VERSION = 17.4
> +POSTGRESQL_VERSION = 17.5
>   POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>   POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>   POSTGRESQL_LICENSE = PostgreSQL

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
