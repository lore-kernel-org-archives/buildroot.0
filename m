Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0499AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6A042438;
	Sat, 23 Jul 2022 16:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6A042438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uo3E5WKM27Z0; Sat, 23 Jul 2022 16:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4904242A;
	Sat, 23 Jul 2022 16:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4904242A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4591BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B3460F90
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B3460F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5vGY844JOKT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCB060ECE
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BCB060ECE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso4048311wms.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OCUHzDBP5bjx8TzwKxb9WMRtQKtV01+bW5VpDvJ+w0I=;
 b=DZsSZ42EkKZjmuyx3VVpDWBDI1Decp7hi7CXKfClrUU0mfuiuDkq5+jn3Zgyci/Y7g
 g10KqhI6u2k3ROYZZO36P6YZfXg8rc0iZj0VlHvBkUYJwV2EfBHkle1+NsNrkPeMJRj3
 hMn1qfa9JNd/LMkj0dpvT6+VK9tHNpZ97AjVByiLhnWAWxmXpCtLhCqwDoKOac5XS/PC
 CkBjcAin7mJqRSAXrSKZw7BmxHk8rZZ28UGkThwwkSXayTY8WVDjyopGrATTbSOVaddY
 +cIvmrldJasIuKrlzk/VLXF3WysF5vIb+/9aRqXK5Cr1M3WgkMDinfzGB6uuWjt11Kcc
 uN/A==
X-Gm-Message-State: AJIora9iuenU8/w7AJ7aPUCN3dbiuDmYxg1w0Cf3D8ZdEiYZqIV835RN
 UL1sjUJR9pRqTCAkCfwAIDAhHxos9UYnzA==
X-Google-Smtp-Source: AGRyM1s03GoRe+Oy1/3GI5ZJokw2P4nEp0GisCwTUHgWJafgMvb3nP79yEwE0rPJXjiSYD2Z2lqrKA==
X-Received: by 2002:a05:600c:1083:b0:3a3:1964:fb14 with SMTP id
 e3-20020a05600c108300b003a31964fb14mr3345020wmd.203.1658595437279; 
 Sat, 23 Jul 2022 09:57:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm7309666wrl.44.2022.07.23.09.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:57:16 -0700 (PDT)
Message-ID: <6fdbe9b3-58d9-4e70-b7b3-e991569d31d0@mind.be>
Date: Sat, 23 Jul 2022 18:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220615211751.121459-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220615211751.121459-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OCUHzDBP5bjx8TzwKxb9WMRtQKtV01+bW5VpDvJ+w0I=;
 b=UaXv5Gdwp/Ok9Y0LRkS62bTYTbsgAUGEbaBZnLQLy77rmN0fAGxMPZIyZs8KuiQd9J
 65vPMiGlwvdiEFRZ9/R9qC5hysQFGt8j02nUBIZB2BkEPHWs3KAGsI/gdvdC0F9iHqKj
 vB3oNAuKIfDPBHohtueEv7pDv5BVfH/Ep3xq0/xv54DVcKYRa7YYeXFDmURY09SgpKYW
 xOPZ0RYyWWtCoMzWZQl3MOuRYllVa5xl1xif1+gqZqAOj6fHZOPkaDhWQNgqPR1Vde8y
 1zl1rVtcQdIZJsX5UT4nadaTFZ2J3YHu9gIFdRb6LQAGNbFgguyhCr8q+7ABrEQfU+bo
 BqGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UaXv5Gdw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-xmltodict: bump to
 version 0.13.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/06/2022 23:17, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/martinblech/xmltodict/blob/v0.13.0/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-xmltodict/python-xmltodict.hash | 6 +++---
>   package/python-xmltodict/python-xmltodict.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
> index 16422d78c9..48fb5265f6 100644
> --- a/package/python-xmltodict/python-xmltodict.hash
> +++ b/package/python-xmltodict/python-xmltodict.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/xmltodict/json
> -md5	ddb2bd078cef4f7e3021a578034ad941  xmltodict-0.12.0.tar.gz
> -sha256	50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21  xmltodict-0.12.0.tar.gz
> +md5  1ece0a5bbd494bac414058405606475e  xmltodict-0.13.0.tar.gz
> +sha256  341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56  xmltodict-0.13.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256	d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
> +sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
> diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
> index 05be4b3c6c..9201bc1507 100644
> --- a/package/python-xmltodict/python-xmltodict.mk
> +++ b/package/python-xmltodict/python-xmltodict.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_XMLTODICT_VERSION = 0.12.0
> +PYTHON_XMLTODICT_VERSION = 0.13.0
>   PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
> -PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49
> +PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/39/0d/40df5be1e684bbaecdb9d1e0e40d5d482465de6b00cbb92b84ee5d243c7f
>   PYTHON_XMLTODICT_SETUP_TYPE = setuptools
>   PYTHON_XMLTODICT_LICENSE = MIT
>   PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
