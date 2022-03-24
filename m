Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2BB260BAD;
	Thu, 24 Mar 2022 20:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bgagMQ3pVDV; Thu, 24 Mar 2022 20:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A88060B5E;
	Thu, 24 Mar 2022 20:42:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76AE51BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71D1740250
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3OTSMluD2GG for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 809E441CB2
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:42:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bi12so11578218ejb.3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oRG8H274mxF5jUCphHY4ld0Lwb/omSc35TTq2vn4xjI=;
 b=Xw5yt7Tiq80L5ZeHWzJAp74FAF68lVQBL416t24AzEb+fNzhApSmJIPEOFHJhdZm7p
 0I4bnek7I3UMmqRzV98Uq+T1IXe+dzzI3/saCuAasShDm5wPLM9dTcn3eza1wpORfo78
 FFaSk+ZCKScmkkqesG8DGvlC9fs7gcoPWIzag2Nnqf6+UziIjUUiwmpTnW60onI4gOGd
 kLzHzb9U7d5X+klCXoyM6i4HzPuMriMdx90IrKe0B1hPLi4LNNGNAtfOn9PwhacWr2Zi
 Q90zy1dZCYGbDnTPuiqOEdxv9Qk8LY2+jXJyxNEqQm65DtEA8v5XqygqfrLYk4H97uSv
 RIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oRG8H274mxF5jUCphHY4ld0Lwb/omSc35TTq2vn4xjI=;
 b=EgImu8jdXoIcXmaNAgoyq/GcFmxAWm4DOx2GdXcCvlOOdXUnNgYT3aWVD42NJ44GK3
 2rYJxRdRe1PbzVuV0Eia2Mu+oD07Q+FTcnxMVGX9L70itjDkAUOQja7l8MaTWMr3VYrP
 8copZtzPY0zHDJRSKCI0TapZHfl+BsByIPCQWrCkgD9vsJ+Qbot8KyrhUNKhjeWsTikr
 y774fGFM7RqGcGqkpDBwG9+ZkiEQOU5WSbk8yFBr2zJto3wEwbhfPxpO9MCoshSirv6e
 hIXctvWMgSJct41dt91q4eiXAFviQTF17IyPxDesDWDzfiwO3he+P9jLhFt7R7JXXjDC
 sWAA==
X-Gm-Message-State: AOAM530jDyfyPnvvMKnpKVeL8Ap1kieC65jINT5o/ycbSLxSDKUGGTZl
 OGuC9WH3lomceZG4bBJpI0Ta8w==
X-Google-Smtp-Source: ABdhPJzJvVobT+vsLLQQ8MB224D9fu8xowL5dEjvxPE25oMBDtY0CtLtItvaFIZ98b3n6rUn81dTdw==
X-Received: by 2002:a17:906:7d52:b0:6df:a6c7:2c5 with SMTP id
 l18-20020a1709067d5200b006dfa6c702c5mr8141674ejp.540.1648154553783; 
 Thu, 24 Mar 2022 13:42:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a170906338400b006d5aca9fc80sm1529078eja.106.2022.03.24.13.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:42:33 -0700 (PDT)
Message-ID: <1a211258-0573-2218-c4a2-7a658e0f61b6@mind.be>
Date: Thu, 24 Mar 2022 21:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220314183234.2174325-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314183234.2174325-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to
 version 0.4.1
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



On 14/03/2022 19:32, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aioconsole/python-aioconsole.hash | 4 ++--
>   package/python-aioconsole/python-aioconsole.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
> index 39ce16f8b2..af8b5c4de9 100644
> --- a/package/python-aioconsole/python-aioconsole.hash
> +++ b/package/python-aioconsole/python-aioconsole.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aioconsole/json
> -md5  56a1e6542ea3627bdbc67f24abcaa341  aioconsole-0.4.0.tar.gz
> -sha256  a30ad5276b85dd20a48d235111d0bd26c6bedf7b56d605ffc10ae27124b4b0b4  aioconsole-0.4.0.tar.gz
> +md5  105adca78033ef1f0b62d8e81d3efcac  aioconsole-0.4.1.tar.gz
> +sha256  0c0acb66b4e72d6606c9fa14ac9eb001a222c37c885b8fbdf65f41824cfa855f  aioconsole-0.4.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
> diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
> index 44857054d4..a58fd33a61 100644
> --- a/package/python-aioconsole/python-aioconsole.mk
> +++ b/package/python-aioconsole/python-aioconsole.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOCONSOLE_VERSION = 0.4.0
> +PYTHON_AIOCONSOLE_VERSION = 0.4.1
>   PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
> -PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/f2/7a/7628ec23f140ffca532c7f630e179503727b755849b5eab15576bbf7d3df
> +PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c5/16/a9de89d859eeaa0f9fdf5675a97ea1416265e1ebc039c7b9ea2c9e5433ac
>   PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
>   PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
>   PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
