Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E08C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BBA811F8;
	Tue,  2 Jul 2024 07:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKFBuIwn85_Q; Tue,  2 Jul 2024 07:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C53018136F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C53018136F;
	Tue,  2 Jul 2024 07:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABE251BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99AB981B01
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hCy6Lwslpkj for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87FA881AF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FA881AF3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87FA881AF3
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:44:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4256eec963eso27135425e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906297; x=1720511097;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BaD+19Ry39alGU6us8ijj16EUoEkNJY2Ygtam9YcVjs=;
 b=tdrLkD9mEOE149R4jY973ArS4kqTXrKg7tApMpWQEvQd3vI8bQWQ4CXvoZsoMGDiLs
 9wVhjPZc3m+4OUG3W1/wAgw3OK9znH/OUM7TpiezaBrhE5g5tLH+6jEqWZHo4BLydmlu
 STS5kS6R6KOtmOAS6lwMjcXvLRnxxP3XRUjk/X8yj/HxNDNcMLxJKMnppas0wCl7NYEC
 uXMF1NijyXTRIXtCl34f280KeEDmacwoNW29onLQf1kgkUDw/nozATAclw5whBrmBQ+j
 2ey153luF4Ci6bfYLnNK7xQTTIyH32DkKXJdFWDfJxi4Abo6FzF1cdEBz0QoFW+i7mgd
 k/1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCz4W0xiU3zb8fPFnXmeuOs/znkf+22LXRLVDPyWaLSbZFUcrnA+sd+2H1CiVaLtak1BKRyPdkURidZ/xKhm/f85C03TJZ+Q==
X-Gm-Message-State: AOJu0YzHRwA6YiHvP33ZEtnZGjD/9CXyPEoMm5AA09bucYHj5gtrCADe
 aApdd7Jqv4ZVwJp9sGoKuaYC88fJl6o3++pkzuW4b/K9F4BKo/VYCLRj5xi+YG0=
X-Google-Smtp-Source: AGHT+IE+iQ7qiqmqt9V2VxCoROfCSaNUqhWkJM4b4SadobLTX8JhKTBEI4dZkOIg7wzmw/h8zC1J2A==
X-Received: by 2002:a7b:c3d9:0:b0:425:66fa:c7cc with SMTP id
 5b1f17b1804b1-4257a0793acmr54393465e9.37.1719906297547; 
 Tue, 02 Jul 2024 00:44:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36787db4d12sm1022230f8f.110.2024.07.02.00.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:44:57 -0700 (PDT)
Message-ID: <dc8e8737-6242-414e-8960-02d5852ce943@mind.be>
Date: Tue, 2 Jul 2024 09:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701192252.1769658-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701192252.1769658-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906297; x=1720511097; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BaD+19Ry39alGU6us8ijj16EUoEkNJY2Ygtam9YcVjs=;
 b=CZs6aUQ423+cLpuhtfASLNcFDyWs54tRek5axJSxTciCQLuDp/7WlgbzTX3SMPuXbs
 ZgeYV4ZlAHUIq1uNkfTbsKQMqjPVdde3tr0NvYyzCLAqjiurBRB4gffq6ufEWwtwg1J+
 DqBZWwFOC519HJVQ2UwnCYFpXZQugbyt+9TMNVEMBi7J0xNXOA2pJZPtJnz03C4GTXIj
 qQ6ECJqp3cVPvse5dAumYvwIFNYNO5uEujmu5wIUg2M42Iyn6VCkan+oYxKidfVY0g7y
 KF/ecBmQocugXPjMCvNABBkEvdu47VIjXLL7pdxcJUrV6mVDvE0bjycfVeuPf5KwsZOz
 7Tow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CZs6aUQ4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.13.1
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 21:22, James Hilliard wrote:
> Fix patch to apply against 2.13.1.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-pybind11-commands.py-support-STAGING_DIR.patch      | 5 +++--
>   package/python-pybind/python-pybind.hash                     | 2 +-
>   package/python-pybind/python-pybind.mk                       | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> index 009f43cdbc..255c484099 100644
> --- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> +++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> @@ -21,7 +21,8 @@ diff --git a/pybind11/commands.py b/pybind11/commands.py
>   index a29c8ca..de8a27c 100644
>   --- a/pybind11/commands.py
>   +++ b/pybind11/commands.py
> -@@ -1,6 +1,7 @@
> +@@ -2,7 +2,8 @@ from __future__ import annotations
> +
>    import os
>    
>   -DIR = os.path.abspath(os.path.dirname(__file__))
> @@ -29,7 +30,7 @@ index a29c8ca..de8a27c 100644
>   +    os.path.abspath(os.path.dirname(__file__))
>    
>    
> - def get_include(user: bool = False) -> str:  # pylint: disable=unused-argument
> + def get_include(user: bool = False) -> str:  # noqa: ARG001
>   --
>   2.31.1
>   
> diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
> index 9d2f43ce0d..c831007d4d 100644
> --- a/package/python-pybind/python-pybind.hash
> +++ b/package/python-pybind/python-pybind.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c  python-pybind-2.11.1.tar.gz
> +sha256  51631e88960a8856f9c497027f55c9f2f9115cafb08c0005439838a05ba17bfc  python-pybind-2.13.1.tar.gz
>   # License files, locally calculated
>   sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
> diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
> index 5a5d120321..a1cc02ee04 100644
> --- a/package/python-pybind/python-pybind.mk
> +++ b/package/python-pybind/python-pybind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYBIND_VERSION = 2.11.1
> +PYTHON_PYBIND_VERSION = 2.13.1
>   PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>   PYTHON_PYBIND_LICENSE = BSD-3-Clause
>   PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
