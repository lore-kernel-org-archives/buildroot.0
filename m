Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0FE9539A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D1640C6F;
	Wed,  4 Feb 2026 13:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-lI2H-XpgKi; Wed,  4 Feb 2026 13:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B74D40C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210886;
	bh=8H/pNQvhn6rofSsgZFQYHgPJNpsxNvtlMLGPIa1c/2o=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=UM7jVv3iPNe/6dIePVPd9ao/tuYynjlogiHzI/XGFpwkiQBQOxbDUtQpGzJq+3mQC
	 sNt9SzWx/0jA5etlMlFwVdV7X5YW2RZGjvUMRSYAtG5NKZ4WVC8NtKWjw1ZfSkbxsb
	 ltpxWJXN3t/s4/uFXrVJ/qspmf1J0A3DHDkkA0wV9nyovgid55jgenHoa1KlHXRuXJ
	 CWIT44aFgO2Yg4b3y8vG8Imk2GO7vg/tEM0LMXpwCowc3M5a2d/xuhqGzTp0GYV2vc
	 HeGhaXkVO1YSqOfs6M498UoWMpUl5xTV5Rbe/xMI0DXaiqt7eDTGyWK/F66bAlIWZE
	 8B6RQAP9qswaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B74D40C24;
	Wed,  4 Feb 2026 13:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E55F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA4A340363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL25MyvNyyqc for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:14:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12C6E400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C6E400FB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12C6E400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A644B979DA1; Wed,  4 Feb 2026 14:14:41 +0100 (CET)
Message-ID: <e89803ee-b69f-4efd-bc15-fe28e305bc97@rnout.be>
Date: Wed, 4 Feb 2026 14:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <20250417190544.1075310-1-lancethepants@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417190544.1075310-1-lancethepants@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770210881; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5t63G9Hgx0qaKmRzN/nbkgbpN5dBBbKM1gQMEwAO58k=;
 b=Mx9+DzyFiuNEaOkaFVTSt5xwfelMNQ5BplEQJ3glqIUMJnKLU9/1ADw44444iRdLF+SAs0
 QoqnDraABokb09itm8SCL1jWgvInEyY34CkDwAWVqfq38UpyFYukw6QKUCFuGWUjMZhXtd
 8RsMCnZxlqkqVv10y2ERMRaMi7DLBTp/CLFiBZIHIAiM/glm181BBiPNGtarGbfPDazWuv
 ssfXKMFjBk6uJnJpizyG5kXB4M17W3M6ahVRLgop/MNXa8XsQml23i4ufeSmWzSOckE8Kc
 ZD03cDUmmu2LHg0RrOb+y/07pVPnV6XwaBPwRWy469+uXaup1p1iN5eQzQyQbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Mx9+DzyF
Subject: Re: [Buildroot] [PATCH] package/libcurl: Also specify the CA bundle
 location
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

  Hi Lance,

On 17/04/2025 21:05, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

  Applied to master, thanks. I extended the commit message quite a bit.

     package/libcurl: also specify the CA bundle location

     When given a certificate directory with --with-ca-path, curl doesn't
     list the files in that directory. Instead, it uses the certificate hash
     to directly open the requested CA certificate. Therefore, putting a
     bundle in that directory and removing all the individual certificates is
     not possible.

     In order to support use of the bundle, a separate configuration option
     --with-ca-bundle is needed. With this option, it is possible to remove
     the individual certificates and include just the bundle, which reduces
     the size of the root filesystem a bit.

     Note that the bundle is generated by the ca-certificates package, which
     also installs the individual certificates and the hash symlinks. It
     keeps both individual certificates and the bundle in the target.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 2066ba0388..509feeab64 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -67,7 +67,8 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>   LIBCURL_DEPENDENCIES += openssl
>   LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
> -	--with-ca-path=/etc/ssl/certs
> +	--with-ca-path=/etc/ssl/certs \
> +	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
>   else
>   LIBCURL_CONF_OPTS += --without-openssl
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
