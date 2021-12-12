Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9385540530;
	Sun, 12 Dec 2021 12:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x2qhV40lEos; Sun, 12 Dec 2021 12:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0C440285;
	Sun, 12 Dec 2021 12:19:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 808B21BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9CD42059
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWEMyq7Iy-RI for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3904142043
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:19:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e3so44408213edu.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JI3IYLj1wVhnh7nhlgu2tk1lh3IZtJ0h/S1a8Mj2Kmk=;
 b=UMcxLDDoFkevMUXado1k68k44hc5goQhUaCaFIwrfKAbw3wwnSZ4gaGhYeZSmgTpRV
 IiISwuFAS1219//tPNDhpUkw3qxbrPhmbNambo/MqHoEOZAUe6fqMpCFd7iQEVuo3AoK
 c8W3t44mxhEh3rRLSLpAl/pdoOE6Si7XrTOxE5dNj75st23AWQqyqw0gMz3AbNMO2aDj
 F9BO863KBUskJj/kOiKWkjacaMxkmuKGY/cAxe6q8e4Nmm0JCH2d2dD9rK3QRfCQCngy
 M8m8fmMGLXJ7D6lyYIUCNpYEsqWOxjcGozKxAd7zMx5toHMLoDr96L6jT9r5DB58pwuG
 09Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JI3IYLj1wVhnh7nhlgu2tk1lh3IZtJ0h/S1a8Mj2Kmk=;
 b=m6Yl1WlXtcCvkk9z/FwtmhMjrBF2I923rYq2wR82O5zYbK92X8HjKB/yzzlJkfCTSq
 bIV8FRrF3YJCX484eoTdexJZPpIDnlEZmSvB+G490JxfyBO9YAv0uHFxDbOYHGI/Y4Xj
 1zVKEtXzdPioI19c/ShIweuOgU41qwlTLbvar3KTsvsdZ9ucz+Zai4Buo1NHucH82uZZ
 LafabH1JDBXs4Mwf87mIP7acmziDhgicoGqj/6kG42BBF5oCnPa7YqYt70moospFWwJL
 oSW6wsQ5h6qCfoTPtUh5N002cQJsnRv86ymADEQ0oGbzBCMvfnN18ZNqSaUgd/edqjAk
 LQQw==
X-Gm-Message-State: AOAM532SnqTJSWL7b4z7zXsuTED9p1TR7k9zACOCfoMADnXdgAyJNfzV
 k/QdYf6F5+azeBD1aoDQ0VJVjQ==
X-Google-Smtp-Source: ABdhPJw0B2sS8snewScngHM7OOF8xsC8MajpVPlBfv884eXh68PIly0o1YhWDlrcMioNj+CEBUTKAg==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr55180062eds.98.1639311554528; 
 Sun, 12 Dec 2021 04:19:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ig1sm4324091ejc.77.2021.12.12.04.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:19:14 -0800 (PST)
Message-ID: <4b979887-a2a5-e70e-ac91-3ee4203b9ec9@mind.be>
Date: Sun, 12 Dec 2021 13:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207215013.3316480-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207215013.3316480-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycbor: bump to version 0.6.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 22:50, Fabrice Fontaine wrote:
> https://github.com/intel/tinycbor/releases/tag/v0.6.0
> https://github.com/intel/tinycbor/compare/v0.5.4...v0.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tinycbor/tinycbor.hash | 2 +-
>   package/tinycbor/tinycbor.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
> index 29f0cfabf0..0e616d1e9f 100644
> --- a/package/tinycbor/tinycbor.hash
> +++ b/package/tinycbor/tinycbor.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
> +sha256  512e2c9fce74f60ef9ed3af59161e905f9e19f30a52e433fc55f39f4c70d27e4  tinycbor-0.6.0.tar.gz
>   sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
> diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
> index 476da67363..bf6e8e4c1e 100644
> --- a/package/tinycbor/tinycbor.mk
> +++ b/package/tinycbor/tinycbor.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TINYCBOR_VERSION = 0.5.4
> +TINYCBOR_VERSION = 0.6.0
>   TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
>   TINYCBOR_LICENSE = MIT
>   TINYCBOR_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
