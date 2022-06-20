Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D85EC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A862A83E3F;
	Mon, 20 Jun 2022 19:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A862A83E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIoB6r9Piwqg; Mon, 20 Jun 2022 19:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD86D83E1D;
	Mon, 20 Jun 2022 19:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD86D83E1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4B271BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDC760E1D
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEDC760E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM8KUYHyiOTq for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA3C60BDA
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEA3C60BDA
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:41:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n20so16308803ejz.10
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1rG9D2Jj6jm+adZIbHrejWbrj5HkGA9HV5AzHGF0o+c=;
 b=X89cqC9f+FpGRVl3I0VqVo5foXCFiQ8Ypu7dobd6txd5Xs/104VZaaTu90MbYmU5nI
 OcI7r8iK9sbrH0Siw8T4Xox/m6qn8rEdNA6P9znTLG3dDcUSFqBP08e0nkd2DtR2AZ/R
 jRFQwby1gi6fEo2+GXaQVEDlKJFdHL/4zFHHLvNPKdCTwnqQ9f4eve4KRHK5OGxBakAi
 quGJ3NvJK7lpOvYtlYxcM09aN5dMqJf5YGLZ+3Q3ut7IPHtlKUX57L7v1W552gxSE94B
 muc8aOPpBXygqXQu+Pv89vdmWn+M7Sve6N639O4y7d+XBK+CQt09vZ368fzmdg5S2j+4
 vcXg==
X-Gm-Message-State: AJIora/Hq4ceNEi3lQXYgPWD/uEpYMtXrZrJ4V5tkRgBbUm47ZD5rdZa
 ihevxMy3C2XeLWVbZlAAuu/Fg1higw4Zlw==
X-Google-Smtp-Source: AGRyM1s/dJjb2X2+I/Op3EkNUWjmgl3f1K7hqokOMfu4bjvzCWEaY6qH8G3wk0oSDlPD8fMrfQA1Fw==
X-Received: by 2002:a17:907:7f8f:b0:711:623e:b344 with SMTP id
 qk15-20020a1709077f8f00b00711623eb344mr22840982ejc.230.1655754096103; 
 Mon, 20 Jun 2022 12:41:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a1709064a0f00b00703671ebe65sm6362051eju.198.2022.06.20.12.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:41:35 -0700 (PDT)
Message-ID: <156e8291-d30a-86cb-0063-0fbf05369cd5@mind.be>
Date: Mon, 20 Jun 2022 21:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: vsvoboda@forkoder.eu, buildroot@buildroot.org
References: <20220531125152.135227-1-vsvoboda@forkoder.eu>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220531125152.135227-1-vsvoboda@forkoder.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1rG9D2Jj6jm+adZIbHrejWbrj5HkGA9HV5AzHGF0o+c=;
 b=Zfrea0Y5MUEETuwpL+hxY9SGPINksvGQK06iei+Ym/XOhek0YBqJNMOOCIQjOLG2tm
 k327cqzX8gGhVatmlz7PAacloNdbAnnlE6svVkibEC5RDL4jViPLs7Zo3QdlvA3VgJWu
 JjPoR3kvQUE/FQ40NOIyMCnZ6QnacGoAhVa7WJopk5Gv6meniK3TJOaHVA8uPEu4mPGy
 vN3ApNA8+uT/htuItTnikqQV1HFgjKncCDFDZ+vyQANNTTrqBMCq6Js+W6GSJQrS53LE
 zx8r+90M4RPQ8y6TrVW24c03h6ALntK/cNge4dhj1Alac3PhJ17nOqKHwrmVthltIFRA
 iEEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zfrea0Y5
Subject: Re: [Buildroot] [PATCH 1/2] fs/ext2: add option for zstd compression
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

  Hi Vladimir

On 31/05/2022 14:51, vsvoboda@forkoder.eu wrote:
> From: Vladimir Svoboda <vsvoboda@forkoder.eu>

Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See [1] for more details. Without this, we can't apply the
patch.

  Regards,
  Arnout

[1] http://elinux.org/Developer_Certificate_Of_Origin

> 
> ---
>   fs/ext2/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 333ead95fe..705446df57 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ
>   	help
>   	  Do compress the ext2 filesystem with xz.
>   
> +config BR2_TARGET_ROOTFS_EXT2_ZSTD
> +	bool "zstd"
> +	help
> +	  Do compress the ext2 filesystem with zstd.
> +
>   endchoice
>   
>   endif # BR2_TARGET_ROOTFS_EXT2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
