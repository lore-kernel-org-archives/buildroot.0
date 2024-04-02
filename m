Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6814BC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC59414B7;
	Tue,  2 Apr 2024 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWZsMnlBgURC; Tue,  2 Apr 2024 19:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B445640459
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B445640459;
	Tue,  2 Apr 2024 19:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CC871BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29E6840459
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXNodgH6e6Aw for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BD6D400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD6D400C1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BD6D400C1
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:44:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34378a6994cso469019f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712087077; x=1712691877;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ymb3xanc41CDSfKPb5Z2uUCKYXtyzadmXs6h6Fjt9ao=;
 b=uCZKIn1+WRidaNQ4gW5BqLlFAd4klgZTafK7nn/XtmB66HXZbtEskjc2LxU096alLp
 ZpWxOR9ZfsoRRtD7HZFE5LMYVTGt9PgQeBEKBteLN2MxBZJBXSXxfSkcpY+z3S0rAnzb
 LRAktJcVGvT8IUT1YhCtN/toAN7brmGf2N4PgVapY3ssu//mYYCUscwv8wj/5cp+3v1q
 6urAjEP7CjX55M0D+47a2QdbgnTbxkUWrO11D1Uy6GWQuzQLu1F8wvx89o+4G6h47kI2
 28AtHBrZGDURgkryZ0q028Qy+aYLhA4YqO2+X01RgCrQ8f9iSGZiwZnSOI5vgrSugZ9v
 tDSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPOCwGhrxntYlGKTnZoWZK3E8tFMEEFVOQkLJK65P/esMxjVa+I/h0f+IE9F6/yiOppcoOWZWmBPp4TUfwJGETbhXHOkSN0A==
X-Gm-Message-State: AOJu0YyTrqGubiaKTBP8WNtEbOqosyecrkinW7hQvJ84IoiAlXrUYITy
 9oymBM8khz7SE5TElemCwMvVpO5ilYiLcGq/H7mHM75/q7GXoAmtlK3eoIj8AbT1Th/STi33z7K
 W
X-Google-Smtp-Source: AGHT+IFGxgMuQnLPu5gCg1+kqPirlJD7yzwKo9o615me3iPFQbBOSrNC7HqCH3ZtXuY2YzF7OdcURg==
X-Received: by 2002:a5d:6084:0:b0:33e:a0b1:e783 with SMTP id
 w4-20020a5d6084000000b0033ea0b1e783mr9395920wrt.22.1712087076735; 
 Tue, 02 Apr 2024 12:44:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfca12000000b0033ec81ec4aesm15112866wrh.78.2024.04.02.12.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:44:36 -0700 (PDT)
Message-ID: <040e9174-f0e9-404f-acf3-c24608493eb4@mind.be>
Date: Tue, 2 Apr 2024 21:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240213182157.916696-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240213182157.916696-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712087077; x=1712691877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ymb3xanc41CDSfKPb5Z2uUCKYXtyzadmXs6h6Fjt9ao=;
 b=QQKh6jvTE0sqppiIIv6prjN7rwCzqvvvnbHVplH47x/ruNFI3++BrHAB0mKw5eqnwo
 fpBS8xtT5zd/dTYV0vH6Mh5y4ineeP+5xAbtHUXzOgFoIUs3uVTntFT3BB5HENmzivaA
 Wc1VFdBGFSNymeFsIFRfL+9q+h/U/PtCWJ6yiI1ZiQFleB4GMHNN4Y0L1Mwp7u5bCWdI
 5qgJ+ZS5y/P3XG/nOSbJ7p1x+oO+1mbhMgK8cf4Tp5hHl7dNo78zHA3ycMjpl99ICjkb
 19W3py6IJCqnR5oq9fnikd9Cs+vvTeNC4f1D8lyIIstEfe0P9ch+DIO2XNwNMJ1ybkpZ
 1p1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QQKh6jvT
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycompress: bump to version
 1.2.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 19:21, Julien Olivain wrote:
> For commit log, see:
> https://github.com/alsa-project/tinycompress/commits/v1.2.11/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested master branch at commit e889a1c with commands:
> 
>      utils/test-pkg -a -p tinycompress
>      ...
>      45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   package/tinycompress/tinycompress.hash | 2 +-
>   package/tinycompress/tinycompress.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
> index 164f3a36c3..f86b75f346 100644
> --- a/package/tinycompress/tinycompress.hash
> +++ b/package/tinycompress/tinycompress.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  2f897e5112cd3bca6790b5cecfda6e0662c8bc5ee0fbab972b247a0cc620d66c  tinycompress-1.2.8.tar.bz2
> +sha256  ebbe788c28328e7cca245aaf9194a5ad0dc91e9e0dc883c2cf9feb6d42c9f3fc  tinycompress-1.2.11.tar.bz2
>   
>   # Locally calculated
>   sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
> diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
> index c9cfbb574b..fabd5884b2 100644
> --- a/package/tinycompress/tinycompress.mk
> +++ b/package/tinycompress/tinycompress.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TINYCOMPRESS_VERSION = 1.2.8
> +TINYCOMPRESS_VERSION = 1.2.11
>   TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
>   TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
>   TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
