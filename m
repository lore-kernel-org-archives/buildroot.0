Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C21D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D0B4032E;
	Thu, 27 Nov 2025 19:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOcdcsjbM_N4; Thu, 27 Nov 2025 19:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D39440257
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D39440257;
	Thu, 27 Nov 2025 19:56:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FFE2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FC3E81E06
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3KIXH5S2f_n for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:56:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7B6781AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B6781AA7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B6781AA7
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:56:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED6DFB979CE7; Thu, 27 Nov 2025 20:56:02 +0100 (CET)
Message-ID: <0c54e15e-f06e-4f93-9a7b-f37baeffffa3@rnout.be>
Date: Thu, 27 Nov 2025 20:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
References: <20251115102052.3459680-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251115102052.3459680-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=OZZi7bVHBISj9tet3iq3P7y7z2z/PtiVAYOOsRZ1xgw=;
 b=XbahnIVTEqDlun5xjQmAbrG14Unui34SjJCxGxZPwyyMv+C/0XMUS5cvXXeeAazqX02/NV
 XULWlEEn/yMwvH6j+eUjLhZ5qh7jGKDMTN7kHFbCyvp6Qx/7UaZcTnpXd+MWxXuZvib/qX
 cJhzSuPchSSbJX2e/KLdKEeYc+H/mFtCgd2qNZA71FR6Clo4hSKp9jyOrw8obKAY0qUDvu
 p73TTHJaD9FujUWyh/GFZPrer0tS9FXwD30t5wRHwqtCyXtO52uRsEPBTyDtLqlNC1jraS
 +sJK9ZOd0x5UpbWbgh20tmnQT9WqdEHq+2BHZi50HGekd90IvLq21Vnc8VFN1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XbahnIVT
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql: security bump to
 version 17.7
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



On 15/11/2025 11:20, Bernd Kuhls wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-181-177-1611-1515-1420-and-1323-released-3171/
> 
> Fixes CVE-2025-12817 & CVE-2025-12818.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/postgresql/postgresql.hash | 4 ++--
>   package/postgresql/postgresql.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 3b5e773c65..efa1b5e751 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
> -sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
> +sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
>   # License file, Locally calculated
>   sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 31d0068328..86761bf939 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -POSTGRESQL_VERSION = 17.6
> +POSTGRESQL_VERSION = 17.7
>   POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>   POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>   POSTGRESQL_LICENSE = PostgreSQL

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
