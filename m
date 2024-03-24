Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E5DC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A705405D4;
	Sun, 24 Mar 2024 14:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiCiq9ItpRig; Sun, 24 Mar 2024 14:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0CB405DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB0CB405DF;
	Sun, 24 Mar 2024 14:58:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF9D1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 669CD81E04
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvi0VfoAij4g for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6842A81DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6842A81DF4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6842A81DF4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341cce3e5f0so193880f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292280; x=1711897080;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Gf/yxBbvIvEcfv12n9MC1UzCej5A9lF/8f14+RKbkw=;
 b=Vc8mmunV6j0QeUO0Ow7DOZ3LgLWw6h4kyf3xBHOOTVpg1Et6BsGatEuwK06opNiYh8
 dogTEQnqtGglBweaC9RaR0yI5shS6kDGZTWKUs97YnYUQy7Ql615fUH0YORhufLhosQU
 RNV/aCyMnAyFS6MJmC/ytlfhHV5FvjrRl+zhnhIxhaD6EzDJCyfojGCUl5hA8WP4ZLov
 oMH00BVznr6xdctajK8bgp/q5X8h8a70HOOapd57i44xgFx+JKyfD4ks8hadLFnMIHP1
 FQHXUdZUKDhOt4E0zbzBMZiQC9k+yi3TT/vyZ7RqAx9PY/iZdgMsqq8GODQqbyc0blMR
 tYCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUodoV9xqvEmAXKe/E/4Cqw853KIda8ArPHjBpLD8iWSTLwJSnwgHTlBZeNF+Nk5JKJ3DzQIwxIqbYyvcOx0nw42cLs9cc8Vg==
X-Gm-Message-State: AOJu0YzXZ6kq9DIRe9/7CzbB5iiO6SLSapwNThZOUsQoERHkl0Mg5TUY
 GC12dLL9PG+QJIlIPinEkfR1AKWxWjC1ynJp4pMq296UY1AvbtF0GjG/Xbmvk8jHOhIFSP9XLpD
 A
X-Google-Smtp-Source: AGHT+IGjW+hPd1Vj/5bTxYLpP32Kj5JsMGItf8Y7BhIGwK5RfD+8P0C6OBQIQo/NlXsdg49Qh14LHA==
X-Received: by 2002:a5d:6d42:0:b0:341:b8ae:4cba with SMTP id
 k2-20020a5d6d42000000b00341b8ae4cbamr3310542wri.21.1711292280346; 
 Sun, 24 Mar 2024 07:58:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:58:00 -0700 (PDT)
Message-ID: <8b592e67-cab7-4473-a213-df7ea4d465ac@mind.be>
Date: Sun, 24 Mar 2024 15:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324094934.414459-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324094934.414459-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292280; x=1711897080; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Gf/yxBbvIvEcfv12n9MC1UzCej5A9lF/8f14+RKbkw=;
 b=K0OQd9Fa9r71cGrqB9OlInmbz4Pvxxo4+atratY01OZzhclsgaAAswrQYRTfbDgbzA
 Y5zBucsPGRNvE3Fmz4/fQ5EWAFh3d6eIeW5DzUE7oWaAPzfDC1c5Kl+UXteTGKGDWA8n
 YaDWjHUIF6JbCrD1WgOKlUWhK/edKZplyLH2ySXA96kW22Oo3M8t2KiQIHGkpvAJOR2C
 JObAb2DX1Xesai6/ZQRe36Cv5gwXSG32e2abj9PtPMUAdMJeT8IstsdHQrKYJgzFBrcM
 x9Y35JZ3yngCa1seR7eoOnlIFGV5qPvM5HmPrIaUXSFih47JGYlo0epb7L4GnaFiPpva
 MfpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K0OQd9Fa
Subject: Re: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.6.5
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



On 24/03/2024 10:49, Fabrice Fontaine wrote:
> https://github.com/vdr-projects/vdr/blob/2.6.5/HISTORY
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vdr/vdr.hash | 2 +-
>   package/vdr/vdr.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
> index 1b7ced0b77..47179a9907 100644
> --- a/package/vdr/vdr.hash
> +++ b/package/vdr/vdr.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  70352c7558d627202c02e80d88c83d25d9df4c5e49a010f7d1d9ae631bd54ad0  vdr-2.6.3.tar.gz
> +sha256  293e355b2cc22e6152dae9c315d5b8903f3e647a2e60b6217d306ff4bceb83e1  vdr-2.6.5.tar.gz
>   sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
> diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
> index a44e1ff512..c717d40e02 100644
> --- a/package/vdr/vdr.mk
> +++ b/package/vdr/vdr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VDR_VERSION = 2.6.3
> +VDR_VERSION = 2.6.5
>   VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
>   VDR_LICENSE = GPL-2.0+
>   VDR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
