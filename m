Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CA6C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1988B60F2F;
	Mon,  5 Feb 2024 13:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1988B60F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN_d6ScPWkrC; Mon,  5 Feb 2024 13:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB3A60F76;
	Mon,  5 Feb 2024 13:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB3A60F76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B70A1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72860409C4
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72860409C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlVP1wJ4Sklx for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:26:52 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F86540111
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F86540111
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fdc500bb2so6171245e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139611; x=1707744411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/dqLEUazecsyH4nRDxfxay52uAWCXiX16XWl0FSDAw=;
 b=NS/vzQQnTvrByqrAI9nBsEHRYK6mmEHsNkUDW1rYmQi5642etMruLyVB9XAmDDExrP
 gJs6Ovimd2z3tXiZPFtg+eNwAqKpl740d48ysO9pJh3V/NtoHMZ7eiihsQjcyZsu/tLu
 Z7QU27GtqjvTheViFlTWzbKe/xM/+48e2UXFkHILgfM5zLfuggNtmhQubri3BjMM2FVg
 PjSt21y+8k2QJqrLiyGXPjUFV9HsB5E+TgHMXQ3YCHtgaeycaToeIcpDcjWnbOtOO75t
 uxchfR2Qc/PkFiFOwocGRVe0ScBolfXyHdHNvJSL5SrcmzSVBx3DWYrdd+zXiJYkUaob
 voOQ==
X-Gm-Message-State: AOJu0YwvOXidjDyEZYBGJAn1Q8e+7XlAch3UvrGilR2P0rbutzpFmTDL
 F796COHnAxAQ9yAcPYIRKKVRPNfdmCJrUm54EamTJYPOFbBdyV0enw1cwL0jMLo=
X-Google-Smtp-Source: AGHT+IHE/vnXrDnXMw/usEn9z50y6mHoTdxA88TApcVUo49qSzAB6YT0C/yyn1Bxq4iA4zT17FV7WQ==
X-Received: by 2002:a05:600c:56c2:b0:40e:d30b:6129 with SMTP id
 ju2-20020a05600c56c200b0040ed30b6129mr4801228wmb.13.1707139610778; 
 Mon, 05 Feb 2024 05:26:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU7siAmYARn61hFSeDfas8e8NcgQpT+AAuAlPwyFIaZ4fiEhwLqvplG7N70p1ftL0X8NabWONdC7vplCms6ymyDbzeMxsYoCmh7mrz17yWbKGaILEV0j5cJj64=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b0040efb445698sm8658543wmq.5.2024.02.05.05.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:26:50 -0800 (PST)
Message-ID: <275220a4-24b2-4f21-b8bb-fae239a56d37@mind.be>
Date: Mon, 5 Feb 2024 14:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240107114345.2795252-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240107114345.2795252-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139611; x=1707744411; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/dqLEUazecsyH4nRDxfxay52uAWCXiX16XWl0FSDAw=;
 b=Z2SUFDdRhcPjB8Q3iccU30BEy0IhVPgLfP3m4Vl3WmTxce2SWtOSqb4IRUF7JDSMzI
 VWDUZgw/dOHEZSp6nTzxw+0gamfC/oltLu3dKYUaIcNXtJgP221/bWGnVK3kWCB6/CKy
 dH26ki0eWru5SXPCe/ZRRVmZPpNWPODydnzkI+LaN0g6wheoMIdia0wKygsk9arwLk35
 strlX04AsDbhyJoGrQ0o1fKNXpfjtLjsjQTMyYVnopd3VTYGNGjWMG19P+c2bLtld5n8
 Z9pdlzF+pGVdC1eslQj3zLV6lZeVqicH8aEcqEjVxNJMxVLb0iOZjPNEdXJjsETfghny
 3Dzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z2SUFDdR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 4.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/01/2024 12:43, Fabrice Fontaine wrote:
> This bump will fix the following build failure raised since bump to
> version 4.1.2 in commit ce2bf7b96b9dba57bb31aca583283736af27afcc:
> 
> *** Error compiling '/home/buildroot/autobuild/instance-0/output-1/target/usr/lib/python3.11/site-packages/bitstring/plugin_test.py'...
> Sorry: IndentationError: expected an indented block after function definition on line 6 (plugin_test.py, line 8)
> 
> https://github.com/scott-griffiths/bitstring/blob/bitstring-4.1.4/release_notes.txt
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e6fac4cac16de94862e3b4697dd88e856bc9a398
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-bitstring/python-bitstring.hash | 4 ++--
>   package/python-bitstring/python-bitstring.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
> index c2ff9a69d5..1889983f47 100644
> --- a/package/python-bitstring/python-bitstring.hash
> +++ b/package/python-bitstring/python-bitstring.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/bitstring/json
> -md5  1750c35e8e45f597725037d35eed9ba1  bitstring-4.1.2.tar.gz
> -sha256  c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf  bitstring-4.1.2.tar.gz
> +md5  3909415d89586edabd577b62b0d0c1be  bitstring-4.1.4.tar.gz
> +sha256  94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213  bitstring-4.1.4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
> diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
> index 9a5d8dfe84..983491303d 100644
> --- a/package/python-bitstring/python-bitstring.mk
> +++ b/package/python-bitstring/python-bitstring.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BITSTRING_VERSION = 4.1.2
> +PYTHON_BITSTRING_VERSION = 4.1.4
>   PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
> -PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/23/fc/b5ace4f51fea5bcc7f8cca8859748ea5eb941680b82a5b3687c980d9589b
> +PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/7f/07/0fd502a29127b968bada3d1824a8af997546d2b9ff73f00e800b3d9888cb
>   PYTHON_BITSTRING_SETUP_TYPE = setuptools
>   PYTHON_BITSTRING_LICENSE = MIT
>   PYTHON_BITSTRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
