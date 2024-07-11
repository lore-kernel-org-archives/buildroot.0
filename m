Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB62C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE4741439;
	Fri, 12 Jul 2024 07:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnGzqohm4Gma; Fri, 12 Jul 2024 07:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3724D412C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3724D412C1;
	Fri, 12 Jul 2024 07:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D061BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14654129C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQmKpsYiGg3e for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F595411F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F595411F7
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F595411F7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:07:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so1903024e87.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768025; x=1721372825;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxDvUmGWJRUPOodsGRkv2xG/XbVhcuoYAgAVK46n8M4=;
 b=kK6+3tbewXjsBUhxBdq3EWNMWWINfFlqacwJBtfZxv1IBKFskUEVzi0Ss4dKO+X4u7
 KmNW98Z73JwRRtixP9SQRW1bVUEtRn7hFm8/IDyqfxxGz7xTA0T+NEIiWpztQXQ9zuqY
 /+nWZoxwDOIMnFcIwnu3XmYnOMVopfRsXTLxaQng6f+kAroVpIVQrDy9iNncPPWW5Al4
 Ph5qtyBpEYn2+2D6rI5BfiHX4qgiw1jr8g1NDBWOhlyQNKC5/oeoH0jt1yZuLOpVBNpG
 T0UzLQzCIadMY7JxCZ0DEgMj1uxB2eGWedER0cinkMTrDeFNwEHdMod65SrwNChOejUJ
 QHpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH7VZbu+Wpnvzs/jz6C468p3uEEyBAjUVsqPE/qdFngeDl/7HbPuZnkvFAOKsG8mbszfuIE9N3BhiluNE8hHmcjzSP5uwE4w==
X-Gm-Message-State: AOJu0Yy7lIeWLhNFXDvJySLPjsNpBtgEvQnlWSjBWRmOQ8sDb3zV8Yft
 uzWZahR5ttCyWIg+Z0TqBpI8nfccSpWqzgEqhQ2dnLMjbBG0szbYVUdk6edw3iQ=
X-Google-Smtp-Source: AGHT+IHh3R42QF3RaCq+YZKjYHs32/itLTRAL3YXuxJ/v9r1Y2rp+IOQJ7StYTlt7f4AQnbws/EfRQ==
X-Received: by 2002:a05:6512:1248:b0:52c:caa6:13b4 with SMTP id
 2adb3069b0e04-52eb9991010mr6828503e87.3.1720768025452; 
 Fri, 12 Jul 2024 00:07:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23981fsm12504345e9.4.2024.07.12.00.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:07:05 -0700 (PDT)
Message-ID: <b2a936a8-1372-4acd-a748-3e0b91561523@mind.be>
Date: Fri, 12 Jul 2024 00:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
 <20240611180207.2138847-7-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180207.2138847-7-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768025; x=1721372825; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxDvUmGWJRUPOodsGRkv2xG/XbVhcuoYAgAVK46n8M4=;
 b=cRnA1P0e4NRLA0tkxl1bHbGT4U+htwaxE6hvmmefzwqhmQ/2kuPDVQDvSWyMncHXJP
 vNHQ9kq+i9nwYGVQC0a4d78y3KA0FLsdfdbeSJ0ekjlZ28yt3miZGz68cq9Ih2/Xp6Ff
 ML1RNFSalIK8mfpvN+fWLNe+UXpHn8yi2S/ainKbVYKZI3/jTKA5L/ogDLSV528PaR/l
 agxxxaTom5kLOynPIQHbqkl7f6KuZ/pKOEa30bp93HZVUrQBjTPSRcS0Lt0wknj9lJgi
 BVPvK5TAkLoq1cN7vZ6Ob54/vHzM1U4sVr0ep4xdOTxhgjHSZB42FApyEzjpe2Ni1B8C
 CtIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cRnA1P0e
Subject: Re: [Buildroot] [PATCH 6/8] configs/nitrogen8mm_defconfig: add
 SMARC support
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2024 20:02, Chris Dimich wrote:
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>   configs/nitrogen8mm_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
> index 3a0cfbd8e5..5c2fde7828 100644
> --- a/configs/nitrogen8mm_defconfig
> +++ b/configs/nitrogen8mm_defconfig
> @@ -56,5 +56,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
>   BR2_LINUX_KERNEL_DEFCONFIG="boundary"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INSTALL_TARGET=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-nitrogen8mm freescale/imx8mm-nitrogen8mm-m4 freescale/imx8mm-nitrogen8mm_rev2 freescale/imx8mm-nitrogen8mm_rev2-m4 freescale/imx8mm-nitrogen8mm_som freescale/imx8mm-nitrogen8mm_som-m4"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-nitrogen8mm freescale/imx8mm-nitrogen8mm-m4 freescale/imx8mm-nitrogen8mm_rev2 freescale/imx8mm-nitrogen8mm_rev2-m4 freescale/imx8mm-nitrogen8mm_som freescale/imx8mm-nitrogen8mm_som-m4 freescale/imx8mm-nitrogen_smarc"
>   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

  I guess there should be an update of board/boundarydevices/common/readme.txt 
as well to add this board?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
