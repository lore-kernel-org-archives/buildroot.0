Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BC7C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1991E8442A;
	Wed,  5 Jun 2024 21:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihRB-aH6IGm3; Wed,  5 Jun 2024 21:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF1C78436A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF1C78436A;
	Wed,  5 Jun 2024 21:19:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB651BF954
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7803F4197A
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fea9Vzj1Ioy for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05A434057E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A434057E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05A434057E
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:19:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so3289125e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717622385; x=1718227185;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbtHvClUW5s3yAYmFdQXRJz3EXgt7JLaotjwJe+8Z+g=;
 b=MhKWPUQh2RJHwjofxp/IsvWpbrJPn4NBGznq9Zi7Jgm8xoeoJd4bANpKRmUfEKLY3J
 LT5ohBI/x4Bym6Yr/2ckYD++CFggkmNlZjPtmvgXoLk3NM2khJQLwaeK9O3duFaF93uB
 GXXdwsUG2jvZbsgoofBomWf0vg2SIvh01XER3G2NzEslVMPBSCC9hXf+Dn8m0nyI4/c+
 VhrjsAVOmKd3o+Svj9c5OKLRX8jvGkxtCoz7MKFePedXXFUm34WyJpvGQjKzZOlrBjRj
 HA7DTlFcws+CGW6sZEUrh6V4mvNJw7XB05WSD5cMfHtpKRd75tRM6kDmYnaQBLcr+l2t
 EvQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM64r5A/x/ybvxDJW02e8IX1yb1HkuWWsHtJ6Xlcf2Y1RCeYJQBjeT+KZ/6ZV7bAiMUi3ocBkATCR0VmeGKdyJOSMLpypJBQ==
X-Gm-Message-State: AOJu0Yy/dWKAhsdlLvXoT4LIK8wxSyciVnmOhLcmY4+gPTcbuoxJxOJB
 JcXuRDSjTN2kzdBr4cTZGanWJecjOYL4MrjRCA8OS/FCtdjdS6EK2McfpQPfCYI=
X-Google-Smtp-Source: AGHT+IEHuYwnvdH/Bk+nEQFo+A4CBahQVUxztF28LLeS2MOu6AkfY5J2Cj6kJFmO3qMSdpmzAYoUpw==
X-Received: by 2002:a05:600c:1da1:b0:421:1d5:c0a3 with SMTP id
 5b1f17b1804b1-42156351b48mr30415045e9.28.1717622384854; 
 Wed, 05 Jun 2024 14:19:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421581020d2sm34641755e9.11.2024.06.05.14.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:19:44 -0700 (PDT)
Message-ID: <c3c98455-b08c-48c3-9e25-f2e2a8693310@mind.be>
Date: Wed, 5 Jun 2024 23:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240605181014.2250616-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240605181014.2250616-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717622385; x=1718227185; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbtHvClUW5s3yAYmFdQXRJz3EXgt7JLaotjwJe+8Z+g=;
 b=NCFhVyZeIuQvP50zwkghWYaiFmhoi8GJsYCKrnD4iqMMKsq+8gKp7EQmRkeLeIW8ym
 FvadMJe2xLXRgxmkf5rwETLAjCj+4tHJn9tmG4bouyPOArYWe1mgUKT6hxrqsh3O3Ouc
 HH+Xq0CJDheXXtyeJvofIn7i1/oY7X60J5krG0fajmorLSg2VS7N9xn7nszl6BEYgzuV
 SGfMrBE2A+Vnkie4y5L3jWRpcTdJvfFL7Z166YmE1LfCEuIRtvvoUReCMJsh0e6hxC3I
 apMvuGODNSRFZQAhjSsei7HoD1EB4xI3wCpDcHeutwcWRdbP/2VaajbDmEUi7B8QcwnW
 SSGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NCFhVyZe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version
 5.2.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 20:10, James Hilliard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/99c/99c28a0b0bf0fd20b02289d7a73c5c2f7664778e


  Applied to master, thanks.

  Peter, I tried to investigate a bit more what causes the build error. I think 
it's recent (host) GCC which is stricter in its -Wincompatible-pointer-types. It 
only happens on James' autobuilders. So I don't think it's for 2024.02.x (we 
don't expect host GCC to be updated during LTS).

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-lxml/python-lxml.hash | 2 +-
>   package/python-lxml/python-lxml.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
> index a23cdcec9e..3eb427a80d 100644
> --- a/package/python-lxml/python-lxml.hash
> +++ b/package/python-lxml/python-lxml.hash
> @@ -1,5 +1,5 @@
>   # From https://pypi.org/project/lxml/
> -sha256  3eea6ed6e6c918e468e693c41ef07f3c3acc310b70ddd9cc72d9ef84bc9564ca  lxml-5.1.0.tar.gz
> +sha256  bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87  lxml-5.2.2.tar.gz
>   # Locally computed
>   sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
>   sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 2da8b8056c..2a26c132a7 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_LXML_VERSION = 5.1.0
> -PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/2b/b4/bbccb250adbee490553b6a52712c46c20ea1ba533a643f1424b27ffc6845
> +PYTHON_LXML_VERSION = 5.2.2
> +PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/63/f7/ffbb6d2eb67b80a45b8a0834baa5557a14a5ffce0979439e7cd7f0c4055b
>   PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
>   
>   # Not including the GPL, because it is used only for the test scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
