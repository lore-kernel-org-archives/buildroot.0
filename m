Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F0FC001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD58612B2;
	Wed, 26 Jul 2023 21:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD58612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzoBpeUrZav3; Wed, 26 Jul 2023 21:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93383612BD;
	Wed, 26 Jul 2023 21:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93383612BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A42201BF980
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC92831DA
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC92831DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQBmoR0-3ywH for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:42:27 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D63FE83180
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63FE83180
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-563643b2b4cso141680a12.1
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 14:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407746; x=1691012546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KC4kI1AZCkKPxoBzw2zcBXgkek+VBX03YTtCvkF5w8Y=;
 b=KFFyPDIq/Tj5YLHmaoFuWyWAgsdilW5uotXOKUcpLIZCUr6tkS2qM0HWGknvstfGm3
 St/RBPiDg7Kog+B9xMim5fF6650nn584q+pKcGHRY1VuT29Hfgf7gXeGPihGNIe0oZ93
 fArU/tQRUVE/9YZwkMs/CRH6PpG9SJqPWfVX54UUIv6gyY3Wfhmi1QQn0NqxkGUqcrlV
 muanHDvYDSWOxcUriZfuU0sPkDykrI4X4xpjhdOLT/G+LBbyVldSO1d768DjFEIWgYIf
 hPVE2Cvl3x244tqS6XbA6TFNwhs6I2p3OBXPwfk1D7MHfH2giL7tNIzG66TaAk52XW4l
 VqWw==
X-Gm-Message-State: ABy/qLajLLpbGVdv7KwAGeZs8286lAoBm/TqzQCiI9KGOGB2hYbjcA/o
 O0lUQtTuPb2ctKDlz2jmLTov1ipcMzbEhkLwdDc=
X-Google-Smtp-Source: APBJJlEElouB/431JkWcCLEB5a+2HgLpxj3Vhb5YbNwfp/1GodCyVvwl5Laxc3ZG3uCJJGoV3dRRhQ==
X-Received: by 2002:a17:90a:dd84:b0:268:4df5:8b29 with SMTP id
 l4-20020a17090add8400b002684df58b29mr2573642pjv.19.1690407746252; 
 Wed, 26 Jul 2023 14:42:26 -0700 (PDT)
Received: from [192.168.0.164] (d205-250-120-28.bchsia.telus.net.
 [205.250.120.28]) by smtp.gmail.com with ESMTPSA id
 p21-20020a17090adf9500b00263d3448141sm68468pjv.8.2023.07.26.14.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 14:42:25 -0700 (PDT)
Message-ID: <401c59f6-42c7-ecc8-c6a8-efe9b7c23070@threespeedlogic.com>
Date: Wed, 26 Jul 2023 14:42:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230726213726.20750-1-james.hilliard1@gmail.com>
 <20230726213726.20750-2-james.hilliard1@gmail.com>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20230726213726.20750-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20221208.gappssmtp.com; s=20221208; t=1690407746;
 x=1691012546; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KC4kI1AZCkKPxoBzw2zcBXgkek+VBX03YTtCvkF5w8Y=;
 b=cOPlrSl7dh8Kf8gM2NlbvaceKtnJcyZADlcrNFG+DOkFKC1Q6XyzsPJvg2/4+VKTWt
 WxwRNCC33qBYNnMlt5R9lkggAhlsUCaiykbBZUe5XFR7QEhQA3GQIBlWduXASTB+Hb09
 fKgYvJEuuHrVWFtxy8YQRTRrJwYA41LeE9D7/e/sm+b7nttnKaJyL9ahHGtzYP4pZ78M
 oFZeEwuB9rvB/bA+zd9Fd6KLRmWPhigI5I7zoQj9uiKhQvenUVFaU851teWA8m8Zi9hN
 uBHOMzUXiyplMi80AhoE0OuVURjEA6rJpuQBYOoxLilR+NjnB25k24LDh5jzFca0zZDN
 i36g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20221208.gappssmtp.com
 header.i=@threespeedlogic-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=cOPlrSl7
Subject: Re: [Buildroot] [PATCH 2/2] package/python-orjson: bump to version
 3.9.2
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

On 7/26/23 14:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks, James.

Acked-by: Graeme Smecher <gsmecher@threespeedlogic.com>

best,
Graeme

> ---
>   package/python-orjson/python-orjson.hash | 2 +-
>   package/python-orjson/python-orjson.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index f1298c05ce..773fb14568 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after vendoring
> -sha256  b932fc1e43598fb91022b1dc651afeaef650793a2a590ca4fbeef57a3808abf5  orjson-3.8.4.tar.gz
> +sha256  048938fd9153f37eaf7a08b748de94ff87b2488dd3bd9f96c3ae784527a961b3  orjson-3.9.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> index 8eeadecb3d..f5d4ad1046 100644
> --- a/package/python-orjson/python-orjson.mk
> +++ b/package/python-orjson/python-orjson.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ORJSON_VERSION = 3.8.4
> +PYTHON_ORJSON_VERSION = 3.9.2
>   PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> -PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8f/2d/ae31eddf7e097eec5e25c7da954ef6e944f4dbf79153676f94cea3dc5116
> +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/30/a4/96bcb52da0de9ccfcd99a60719b995c9b9c3aaa3a70701f0790ce856c10d
>   PYTHON_ORJSON_SETUP_TYPE = pep517
>   PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>   PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
