Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E281C43217
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9803660F11
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9803660F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60AD0404B1;
	Mon, 11 Oct 2021 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEKJ28o-OJUJ; Mon, 11 Oct 2021 20:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE081404AC;
	Mon, 11 Oct 2021 20:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF3DD1BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE56404AC
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CvJo4ji-jGu for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:56:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 902B8404A7
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:56:26 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id i20so56073504edj.10
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YYGeJ7aLx04gkCOU/l8cJWNpScUCU0UxbP730fE4fvM=;
 b=GQaew0bQAFUWBmBn5sptjOlDUfdggMBmcr7sNMQoK37DNtVz5bO6BqMu/YNMekNSKi
 qBkQXdNB6ncpWJHq1IV+zjOegvdBjqLpz1ScN/Mz1HQ4rxP721h5feaE/Rd42vvkgKKS
 4xxID6NfGLBmfgCqT4TkXM0UUPIdOlVQXnvZ6fAnwWpYUHVFAn23tSSP9J8E+li32tX1
 4vBo+ymscxqCFvIIQjC6PaxZ2sZYZod5GCvqOlzIDOIOzCKIqObERBznzj7FeIDq2zoq
 lTIySpXDmb7hGR2Kw2zqOpmOsTQmyF/Il1ezaVN6P1Y4zMBiTjSTo0VqSekRo/g4jmDv
 a15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YYGeJ7aLx04gkCOU/l8cJWNpScUCU0UxbP730fE4fvM=;
 b=h/Ggzn1JR4G0tCxtxCBElDq13ew3I8n+o602ovWSaq/Tf0o34nDZX5bVdeuWZWUbCn
 RmoTQyQOJK9WymOV35VmTb0BH2UBI0vXIhUsu7RWGO/jsNGAT9dwnIVIg+cXK9jtuVtN
 OnGGz+BZnfDYUWDIcRAl2aSHS1NsJ+d11ogG8Dfyik5ppL9cSrr26P/SqsZKmpwhY0dH
 49JdNpxlrpRSouX8fYqK+uAOi2eMExvL8goZPr997pdNgTbnk26KE8wsQR/0LHBN2xbr
 iJUSRgEeCxbva03KvebQ4BfvdgUh6VuZb0riY9n5A5/lJQyd988ZlKBW0JU0qrz1MWGd
 TXkQ==
X-Gm-Message-State: AOAM533REFu+1oz2bx3nkMDjAtFox16oXtCLHbtUIHrKvNfkEKE0aJGF
 gXewFNA7F6i0C+80YMPhus7klQ==
X-Google-Smtp-Source: ABdhPJwmu/iVqLrsRDYcb0NDH22Bi+t6G+A5HAyjpc8IG92+OyivoFAWwVEHBoPHl9AVw00F3A/+kQ==
X-Received: by 2002:a17:906:25d7:: with SMTP id
 n23mr28151927ejb.322.1633985784619; 
 Mon, 11 Oct 2021 13:56:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t4sm4846522edc.2.2021.10.11.13.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 13:56:24 -0700 (PDT)
Message-ID: <44bbb0a4-00a9-7639-3e3d-ec5aad5d007f@mind.be>
Date: Mon, 11 Oct 2021 22:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Artem Panfilov <Artem.Panfilov@synopsys.com>, buildroot@buildroot.org
References: <20210929161438.85913-1-artemp@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210929161438.85913-1-artemp@synopsys.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lftp: fix build with OpenSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/09/2021 18:14, Artem Panfilov via buildroot wrote:
> Add upstream patch from master(0276d5c) that fixes build with OpenSSL.
> 
> Signed-off-by: Artem Panfilov <artemp@synopsys.com>
> ---
>   ...-with-LibreSSL-following-commit-537f37898.patch | 43 ++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
> 
> diff --git a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
> new file mode 100644
> index 0000000000..b06e9a375b
> --- /dev/null
> +++ b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
> @@ -0,0 +1,43 @@
> +From 0276d5c239c41b3a63f738a5dc47fd56ac389cf0 Mon Sep 17 00:00:00 2001
> +From: Ganael Laplanche <ganael.laplanche@martymac.org>
> +Date: Thu, 20 Aug 2020 12:29:05 +0200
> +Subject: [PATCH] Fix build with LibreSSL (following commit 537f37898)
> +

  You need to add your own Sob here.

  I've done that (with mine as well). I've also added an upstream link, and 
applied to master, thanks.

  Regards,
  Arnout

> +---
> + src/lftp_ssl.cc | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
> +index 14a3b9d4..968d3fb2 100644
> +--- a/src/lftp_ssl.cc
> ++++ b/src/lftp_ssl.cc
> +@@ -34,7 +34,7 @@
> + #include "misc.h"
> + #include "network.h"
> + #include "buffer.h"
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> + #define X509_STORE_CTX_get_by_subject X509_STORE_get_by_subject
> + #endif
> + extern "C" {
> +@@ -840,7 +840,7 @@ lftp_ssl_openssl_instance::lftp_ssl_openssl_instance()
> +    ssl_ctx=SSL_CTX_new();
> +    X509_set_default_verify_paths(ssl_ctx->cert);
> + #else
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> +    SSLeay_add_ssl_algorithms();
> + #endif
> +    ssl_ctx=SSL_CTX_new(SSLv23_client_method());
> +@@ -1080,7 +1080,7 @@ void lftp_ssl_openssl::copy_sid(const lftp_ssl_openssl *o)
> +
> + const char *lftp_ssl_openssl::strerror()
> + {
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
> +    SSL_load_error_strings();
> + #endif
> +    int error=ERR_get_error();
> +--
> +2.25.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
