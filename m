Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE3BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD1A41A52;
	Mon, 25 Jul 2022 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD1A41A52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znjKQyCBLBML; Mon, 25 Jul 2022 22:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EEC41A4C;
	Mon, 25 Jul 2022 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EEC41A4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392C41BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1250083DF1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1250083DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCvlW4gH9Jak for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB31383DB7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB31383DB7
 for <buildroot@busybox.net>; Mon, 25 Jul 2022 22:26:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so7163138wmj.1
 for <buildroot@busybox.net>; Mon, 25 Jul 2022 15:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TsvGE10nzENOJ/lNpX+Y/pnKt8i9lDxFtzYHoaGf4wA=;
 b=0uUZAy3J7FO7yCTZp9q3fg7bosfG3ViXFG6b81NrkivktI1J8hSYkwaJP0Iybdatoq
 Txtzled+DV7kTxHfs1hiavzljNxQGFkrW6P3Fvjh/3syGPAXctu+0h7siYNtEpSLVbXD
 1bMC667go8hQ60GaOKAFVfiTXVykhN4I6Ov7y2H2wQ3FmihgzgfuFaP/LhHnYTrQsTnj
 rU2AsTLFzR7rfD0mSWc2HOf2Rrv9OzQp4zLMs+ckLcFz0z58WXyoOWIZgi0H23grv3dK
 9Cn9ob+T1SnF5XWetSZEcPtmfgyD7NZIjdYYsNG5p8dJstlVal4tcowTLoCaV4il+pXE
 zW+A==
X-Gm-Message-State: AJIora8kP2DMaKPufA1IDMJIUIVMZznM0J1quuDSLeQIIGFeC8P5r63f
 kjsCqzfuqYqonQ1Umq76Vd28yQ==
X-Google-Smtp-Source: AGRyM1tO61R2RRgVqV9xK83xf+/JjvVZQauSUHEYV/SsIeXqKPwVscb4r0xNsh811TUaDxiiNTcGMA==
X-Received: by 2002:a05:600c:4251:b0:3a3:10a0:cc83 with SMTP id
 r17-20020a05600c425100b003a310a0cc83mr9731455wmm.205.1658787959689; 
 Mon, 25 Jul 2022 15:25:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b003a2fc754313sm17246936wms.10.2022.07.25.15.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:25:59 -0700 (PDT)
Message-ID: <943406c7-99ad-cb84-63d3-271e095c1a0e@mind.be>
Date: Tue, 26 Jul 2022 00:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220725182918.28371-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725182918.28371-1-guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TsvGE10nzENOJ/lNpX+Y/pnKt8i9lDxFtzYHoaGf4wA=;
 b=DpS6YkPp6lN/T5TiXBQp9wPAJrQalP3/w+fAGOPnTaPtFjmCpT+g2634EO7b+A7ImM
 vyBbAAfKaP64TRV7sdGCweUV8sKCtYnO7QgNyGxo0giCoqpxcF4hi7GihP/f7P/QwoiT
 kJh9fXPG9doXi8a0wi4FLV/tkIfscVNXGVj1FYk9lWANAe/ezgTKANAaC2qyyQ/DY+3I
 pbLuw3tfsoXRxGDUq0Ndx3iqPWNKfXsWL1SUXLdAW8rOQQj72ClGdgZsMomurVK5f0xa
 /6ZpZgCVUlNgdyApEsFm64anWdD4kP6DppOR4f/y9sE0VwV4pFSwuVleuujrKq7g/Ksp
 6sEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DpS6YkPp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: bump version to
 2.10.0
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
Cc: yann.morin.1998@free.fr, gwen@trabucayre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 20:29, Guillaume W. Bres wrote:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>   ...nd11-commands.py-support-STAGING_DIR.patch | 20 +++++++++----------
>   package/python-pybind/python-pybind.hash      |  2 +-
>   package/python-pybind/python-pybind.mk        |  2 +-
>   3 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> index 021321a9b7..1f1fede128 100644
> --- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> +++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
> @@ -1,7 +1,7 @@
> -From bf9f0d619e2e0a424e471a2f9235d26ece5b348c Mon Sep 17 00:00:00 2001
> -From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> -Date: Fri, 7 Jan 2022 19:32:18 +0100
> -Subject: [PATCH] pybind11/commands.py: support STAGING_DIR
> +From 65ea1a8e1b5fe30c61a3f936a3116c3ce6c3a686 Mon Sep 17 00:00:00 2001
> +From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> +Date: Mon, 25 Jul 2022 10:55:27 +0200
> +Subject: [PATCH] pybind11 commands.py support STAGING_DIR

  Please don't change the author when you refresh a patch.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   
>   In Buildroot, we install build-time python scripts in the host directory
>   (otherwise they can't be run with host python), but when running
> @@ -10,18 +10,16 @@ pybind11 --includes it should return the staging directory.
>   Patch commands.py to use the STAGING_DIR environment variable instead of
>   the current directory, if it is set.
>   
> -Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> -Upstream-Status: N/A, Buildroot specific
> +Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>   ---
>    pybind11/commands.py | 3 ++-
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/pybind11/commands.py b/pybind11/commands.py
> -index 11f81d2..8c4876d 100644
> +index a29c8ca..de8a27c 100644
>   --- a/pybind11/commands.py
>   +++ b/pybind11/commands.py
> -@@ -1,7 +1,8 @@
> - # -*- coding: utf-8 -*-
> +@@ -1,6 +1,7 @@
>    import os
>    
>   -DIR = os.path.abspath(os.path.dirname(__file__))
> @@ -29,7 +27,7 @@ index 11f81d2..8c4876d 100644
>   +    os.path.abspath(os.path.dirname(__file__))
>    
>    
> - def get_include(user=False):
> + def get_include(user: bool = False) -> str:  # pylint: disable=unused-argument
>   --
> -2.31.1
> +1.8.3.1
>   
> diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
> index d5b4b4829e..b4b3ff94d0 100644
> --- a/package/python-pybind/python-pybind.hash
> +++ b/package/python-pybind/python-pybind.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  057fb68dafd972bc13afb855f3b0d8cf0fa1a78ef053e815d9af79be7ff567cb  python-pybind-2.9.0.tar.gz
> +sha256  eacf582fa8f696227988d08cfc46121770823839fe9e301a20fbce67e7cd70ec  python-pybind-2.10.0.tar.gz
>   # License files, locally calculated
>   sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
> diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
> index 05fc593346..c5bee3d0a7 100644
> --- a/package/python-pybind/python-pybind.mk
> +++ b/package/python-pybind/python-pybind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYBIND_VERSION = 2.9.0
> +PYTHON_PYBIND_VERSION = 2.10.0
>   PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>   PYTHON_PYBIND_LICENSE = BSD-3-Clause
>   PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
