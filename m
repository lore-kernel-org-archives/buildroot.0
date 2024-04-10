Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CECFCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC9B14054B;
	Wed, 10 Apr 2024 20:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_xQ5umaMkNi; Wed, 10 Apr 2024 20:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A9941759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00A9941759;
	Wed, 10 Apr 2024 20:00:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0678D1BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E725960E82
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abM-E13McLkQ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57AE8608D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AE8608D1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57AE8608D1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:00:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-415515178ceso46725395e9.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 13:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712779199; x=1713383999;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gzvvfx5UinrLgUb7oWBVb3Jfk6Zn/cXX0T/GuzgP7S0=;
 b=giZndzMYwjaJAozF3UooCD27c/BYfsdCGFB2W0/dbX5WFyzWGFkEvALcnvGqUmT54f
 z4xp75vpja1KQQGBRMjnYOd2+0n/1vsqch7pS3DEPloCKaEpGMMN4xsUCMhlFRTPXGrx
 +E2O5Zdi6vOh99jVoPAaOn+GVw7h/0gyHwSD5GT967zXVSZyNkLvltreDK/HWWiHVJfv
 7CELD3Dvapcwxm/H3MfMBHeflRI2Xzx/+PkqPceAfEyzmbPfPj106bH5hLcEAVNJgBmL
 +vskh2rr3HQiRhQ0NpWEsR9tvvc8Bl6UBuBuJSLLsmfVHSF/0S9krI0gyyGXlmgxI8q5
 9PSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq7KzyRPzndJblZh/drvRPfoVQ4uwhix7yHJvN4nplFRDYg0FrUxuWebsRbSvHTdVJaVTwPiEcje3XsD2h0myeFimPLSE3RQ==
X-Gm-Message-State: AOJu0YwOdgiVpqan1C1zc5uynJe1CbHv3GTNsbQMVrz+7E6rhsw4gx3y
 NcAtQZ3KYfCd4NwbEDjdgdy8xvm7Fh5EK1pdcdemdwDhFUfCvWvvua/4AS3/g9i8dIfgnoeW7Ly
 +
X-Google-Smtp-Source: AGHT+IGbnHt3ugQPBgkr/4BKzCpMPIpNjzEHMBqHEuIJrHngG7gO3YY91QYwLgJJiaplJQB0PZ3RhQ==
X-Received: by 2002:a05:600c:458d:b0:414:8e02:e432 with SMTP id
 r13-20020a05600c458d00b004148e02e432mr2672158wmo.7.1712779198778; 
 Wed, 10 Apr 2024 12:59:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b004149536479esm82218wms.12.2024.04.10.12.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:59:58 -0700 (PDT)
Message-ID: <46d8a74a-75ff-4f21-a32e-6d7207fb7d9c@mind.be>
Date: Wed, 10 Apr 2024 21:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240324180130.1590984-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240324180130.1590984-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712779199; x=1713383999; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gzvvfx5UinrLgUb7oWBVb3Jfk6Zn/cXX0T/GuzgP7S0=;
 b=gE2oScScb3gYuqKxJyM93ZhwWjjxASNEMBQ4AHG6QIshDTrW6I5JyFHvF1w761QOAB
 scMxTL+HSvuUmbK21EQuEPX+4zVwrfokMjVZBQdMaSTLz37OHf69zy95IS5XztUD5dpx
 UycXu2/F3hsA7NbfXW0OgnSAJMQRsubFlNjEyrKIAbJCh1lyxXUZL81C4X5I6gXgzUr6
 i6mEqVBoAG5RSbG/eAIH650uzVEY9RCkHFqbrqzwk11EfD2fRCXchNasDDoz22Uty5QM
 3P43Tk3Z+7ObmoRopV4iMa96Ewi2jAFHFl7UMRIz1vBqW3/4i9yX8/qrn0VO1FowyZzW
 lCHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gE2oScSc
Subject: Re: [Buildroot] [PATCH 1/4] configs/nezha_defconfig: use OpenSBI 1.4
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



On 24/03/2024 19:01, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied all 4 to master, thanks.

  Regards,
  Arnout

> ---
>   configs/nezha_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
> index dd94707905..2ab278318f 100644
> --- a/configs/nezha_defconfig
> +++ b/configs/nezha_defconfig
> @@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_OPENSBI=y
>   BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
>   BR2_TARGET_OPENSBI_PLAT="generic"
>   # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>   BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
