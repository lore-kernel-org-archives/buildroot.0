Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A644EC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA5E40256;
	Mon, 22 Jul 2024 08:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCbqUxGnp3g0; Mon, 22 Jul 2024 08:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003D8402CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003D8402CE;
	Mon, 22 Jul 2024 08:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65FAE1BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F70402CE
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfHxZBKWGmXH for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 110FE40256
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110FE40256
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 110FE40256
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:02:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-427cede1e86so27836525e9.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635361; x=1722240161;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t4W8FplMJE2KBeSK3NLdMdsjBJjlmNo86yDFrZv1ZZA=;
 b=mX5pOSp6lqYSC1p6MpKQ6Y7sHeooBGyYI7f03jozhj76lkvOKrONmXNqJVW5TvTNg2
 zuas5r4SC9g1ifqqu3aqCMVOWws6Nt+ZRdqEUduPhVEAjro4Z9bbUvYCyfu4iq07iI2T
 jIj3SZhromavqXrHvvhKSz6zrAoM/B03aWEQgJGk8hE/5VGPSpYmR49pT8Ekz74DqcZJ
 XhM6kF82aYWkMTxmI24tWtTAQWNui2L6q3+J1ySbqR2JEv2ul5ZEHAPmMgVMF7r06Rli
 wARJEF6Daek8I7yzYq0McdjQlsvZiLrSueGSJYW/npMb7WdtYgg0Inj1WCn/m6LLM51f
 Be/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL3703Bk+hgF80OcdHOTE9LiqjZRtKs9c7+RTewsaZYvceBWGId3fCMAAHHlRYOxxOwN90WPfNB9uSr5YIIZ/IXGMxcSm64A==
X-Gm-Message-State: AOJu0YwBdSwy6S0qaZoVAld+GT1tR4rVSBE3XflnAIKIOtCko8e3PXOi
 6gsfQH+yBEAKF75vGqSmY9PnruuEHtHxG/nyHL7+dG3jKl3a3flBhXskTi/DxqOQGINBnf+3YiA
 i
X-Google-Smtp-Source: AGHT+IGUFzoO55XXzALcu0obp+R5NkKBMChHPFCXbV6PAuU7IuH2bjdHNul/Sw5dQc4JRLr5WikjVQ==
X-Received: by 2002:a05:600c:3b03:b0:425:7bbf:fd07 with SMTP id
 5b1f17b1804b1-427dc515239mr40001635e9.5.1721635360910; 
 Mon, 22 Jul 2024 01:02:40 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6929827sm116833035e9.34.2024.07.22.01.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:02:40 -0700 (PDT)
Message-ID: <802d0ec5-87a7-4f13-8a87-19ced98fbb6d@mind.be>
Date: Mon, 22 Jul 2024 10:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240721191839.2757527-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240721191839.2757527-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635361; x=1722240161; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t4W8FplMJE2KBeSK3NLdMdsjBJjlmNo86yDFrZv1ZZA=;
 b=DAbponxY0n+MTeZyiN9j3972OBzzhXJjRjxes/i3v5V2LVp2uIuZD8B7BzH+tx9uTy
 10c8a7KFjrnnRqLSxovcrtqiqM3u0BHiVoQ94lsxPrX5K/SSjtyA95sdVg27MGEOFQJh
 dHL+qNPjbO4MJs0y+GM96ZAUwHbhimmX/XTEkv+eaJ2q5tfMHXjttkOa4SD+/wlHR53J
 qbweBVZ/cozATknguZv5N4HiR4EfK6odCBjy+ISpcnw+9WAjzGEjSDC7IcCd1WwKKZum
 oZf2ubuLSg+cgo8T4Mru4HLdLaXVBOX1prW5njrvjD6lXO+xITbqd7Zbg2gmrHbHIuSa
 nZGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DAbponxY
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2024 21:18, Fabrice Fontaine wrote:
> mtd ubifs unconditionally calls the (deprecated) ENGINE_* logic in
> libopenssl resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859:
> 
>    CCLD     mkfs.ubifs
> /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/13.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ubifs-utils/mkfs.ubifs/mkfs_ubifs-sign.o: in function `sign_superblock_node':
> sign.c:(.text+0x328): undefined reference to `ENGINE_load_builtin_engines'
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>   - http://autobuild.buildroot.org/results/1fd49b193a3623d244ace602c46f15914bfbcff4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mtd/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 57a562c108..0c95e3cc54 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
>   
>   config BR2_PACKAGE_MTD_UBIFS_UTILS
>   	bool
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_UTIL_LINUX
>   	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
