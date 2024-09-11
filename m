Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC87BEE57D0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2F44018A;
	Wed, 11 Sep 2024 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxHBc99h17i2; Wed, 11 Sep 2024 19:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7466840257
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7466840257;
	Wed, 11 Sep 2024 19:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9FB1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 190D940257
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9dNcsVnpX3X for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83C184018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83C184018A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83C184018A
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so1293465e9.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726083669; x=1726688469;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oYN7xC2zfNyGeeO25zJV5OrK8YRI1OdaRPm/Kxpxj3k=;
 b=dKei1k4FVcGGmrTee4nj+kh7rqVg7eAdcyCLH2cr2LhM7fsxGWkXZZseYkWjUBRJ0/
 czQzGrV/OFGgU9TMDYkneGM1S+6TbY1eY10xpnbmoSjId35djgHO+zcP3IPlv+qK0SlU
 xG/hQDUUU5ymT73EhgXlpghyjie8rFp5Y5U9bGb85TlhkyEZ3pFedPSCY/JskTF/Nx90
 zNzJU7BmrnnxxGCG7YHADxu7lgp6NJt87IMS8a/PmYQsU6lFiC0D+YKgsaZgvWUX8oiI
 /jZ4AXSY4lhzR1yXLb/CPL7S1DozffmTDePv1IFOwnqZeHIaWq2XO8Iq9SSdZpBUWjy4
 FtXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF5uSGpnjGM3ujZKUlQjip7iGVjPHdd/v6tbkrNi+tT1nnVghUpa8BKU9RiPtPczRMw55uRw0UY+Y=@buildroot.org
X-Gm-Message-State: AOJu0Yz0kEtIjxeSy9Gf1l8ivrYBdI+ZRjSM9f32u4Mg/qQJWO7TV9jZ
 oj142bzLnAVsKq0C/3rol4UPbyN4LKGfnDY+dI0RMZT6JzAnM2/dtdekyQunEHrT//2XH3xUDCF
 e
X-Google-Smtp-Source: AGHT+IGj2+Js5cLUcX+8ngAGXyL7irSPjRHwQvxqyrUs+JJxUqowm0GqUX0q04d2y0GVUjz/csURkQ==
X-Received: by 2002:a5d:650c:0:b0:371:9149:dc54 with SMTP id
 ffacd0b85a97d-378c2cd3e2emr162637f8f.3.1726083669448; 
 Wed, 11 Sep 2024 12:41:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8162dsm150643465e9.29.2024.09.11.12.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 12:41:08 -0700 (PDT)
Message-ID: <6510ef28-2037-4261-bf1e-2c59762bafe1@mind.be>
Date: Wed, 11 Sep 2024 21:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, buildroot@buildroot.org
References: <20240815200037.509695-1-zgyarmati@zgyarmati.de>
Content-Language: en-GB
In-Reply-To: <20240815200037.509695-1-zgyarmati@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726083669; x=1726688469; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oYN7xC2zfNyGeeO25zJV5OrK8YRI1OdaRPm/Kxpxj3k=;
 b=KtKJ7AUiSAy9ZgF3UcaYerWVCoDHCaecOB6K9jkoW0pBawUXUE/Scs3WLT8Z6orzoF
 LBP6TqESDwp2U9THlsmkIuDhrpTDBlJhFStojaWyjd6Ag8UAQBG5/4H/Ds2TJrYnBbhc
 6fpZsaSAvB8lXykyggUxZp5ACu29vWfW9KpaGCO/Tqv73+NU7Uh2HxT9rWd9dmGMOumB
 cORwJ2hKxWAGRUaCJ/CK8KJYGvo6q5PiEpxHEfYmyDuuS1J5g492IcCYrnkOOKlB743j
 bi//Weocq3K+ZAt3NYtIKmX2/p/5BlgVZlf2Mejk+8eVAtVQ8YlybwCB5pL7FvinLBP/
 rHkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KtKJ7AUi
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to 9.4.1
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



On 15/08/2024 22:00, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/proj/proj.hash | 6 +++---
>   package/proj/proj.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 22e6a43bf7..828380293e 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from http://download.osgeo.org/proj/proj-9.3.0.tar.gz.md5
> -md5  f1d70cb8873bb4429a03c437c65c41c4  proj-9.3.0.tar.gz
> +# Fetched from https://download.osgeo.org/proj/proj-9.4.1.tar.gz.md5
> +md5  e53d826635908369895060c9226f09f6  proj-9.4.1.tar.gz
>   # Locally calculated
> -sha256  91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d  proj-9.3.0.tar.gz
> +sha256  ffe20170ee2b952207adf8a195e2141eab12cda181e49fdeb54425d98c7171d7  proj-9.4.1.tar.gz
>   sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index 0e913fa335..d591d4eb6c 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROJ_VERSION = 9.3.0
> +PROJ_VERSION = 9.4.1
>   PROJ_SITE = http://download.osgeo.org/proj
>   PROJ_LICENSE = MIT
>   PROJ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
