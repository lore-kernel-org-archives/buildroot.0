Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E81C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4638C40650;
	Sun, 24 Mar 2024 15:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB5rECMsyvVN; Sun, 24 Mar 2024 15:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C66E40620
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C66E40620;
	Sun, 24 Mar 2024 15:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7994A1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67B438197D
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEOwStEu8lf1 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B82A818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B82A818AC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B82A818AC
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:10:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso1365132f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711293025; x=1711897825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d23FYIGRQwIdTbER/1/UYbgqonFRtFTCWgWGch6seAE=;
 b=cjJsyNgxtzzRKmd+kYMuIXaw481UOeYRxy/nNQL4Wc9yLnfekHIgP5/MQd2PYu8Zau
 7Xr7ZEqPRiTFZyUJSwdJ+SCcgqh4gwNc1LA/1iLnV1mfS4d+D5kYt5VVbGvZaD9cCOeD
 gcMltR6yYc4bwbedHHcID5A1ZHwaqAMOuxxYD/g4r8ePlztrKkw+2R1Pbh0lioHkrCp3
 eRND8i/R5IWptsfDaEIDfb0wAccpzWijEazM6rXBrWfwBbAz9RqdlnryDQAViS88mhF5
 x0yE/OFYbwP8mF1h2BT8w6/VGL9VXeCwM7GD4EQk9tJmZZgkUm3z8TM//a7eEgz0uHpE
 9Dfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHsHkaOUDlNpcHMjQLXdZF8XxQ8WQXXXy2D7o14+68L1wqi0cStbFPwtrdCYc2xc7gWfNgHV3aMW2cOVgER3okvJIIFL103A==
X-Gm-Message-State: AOJu0Ywf2E4WNtyrPl4xQuGca+cflw+8iMGcPLVdapNcVTJcjz4545Ke
 xKedUFt9CnW9ZmjpKZv0OJJ6YOo1v7kkNFklTKAF7ZgC045Mjpy1SwxZslbwnH0=
X-Google-Smtp-Source: AGHT+IE/2A8SuHIE4rO3YPz5pOsLEKExpDHSxrDQIVqHuWgS5XONt0DmmRHcrppqFDxwGisx0wCsFQ==
X-Received: by 2002:adf:ea0a:0:b0:33e:89ad:efbe with SMTP id
 q10-20020adfea0a000000b0033e89adefbemr3483699wrm.45.1711293024633; 
 Sun, 24 Mar 2024 08:10:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:10:24 -0700 (PDT)
Message-ID: <0621f0f7-95f5-4025-9c2f-47c47d4f150a@mind.be>
Date: Sun, 24 Mar 2024 16:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240323214951.6628-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240323214951.6628-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711293025; x=1711897825; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d23FYIGRQwIdTbER/1/UYbgqonFRtFTCWgWGch6seAE=;
 b=Ff14rM02akmtlX/bsq9C+MFzyqdI4/9NSiPaaBx2IVdwB8Y3hhfiKFbRta//P+GQYc
 nT7+M97tpzxvdG637KH/dWxEcyG65J3QgCQucgeW+bS9dReHL7pKzjKu4B/VWzBppWqK
 i8qM+7NgkOlOPBsH2Si4pzvsohXfS5VJLEx58X3PDsoWLp6CMWFDMFZr4IWp2A3GoWeC
 83FqivaiaEnQWeSNXR7GAgvZkh1+VZtYIz+B20tYmW7bD0D8gNYsn+Zj9ZSzZSY0dzy5
 lyfAV1+kijUThZzStD6vfcDPkh9/6z/TW6I90CDy8PVwc8WMYYGG/DQWqrmQh72y4aHi
 ixrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ff14rM02
Subject: Re: [Buildroot] [PATCH 1/1] package/fdk-aac: enable on s390x
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2024 22:49, Fabrice Fontaine wrote:
> s390x is supported since bump to version 2.0.3 in commit
> 38a20a0998117f3debb4de06e209ba5d82bb7a9d and
> https://github.com/mstorsjo/fdk-aac/commit/c16d5d72c99a77c8bcb788a922323b0b59035803
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fdk-aac/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
> index 26e060b93d..831db13b21 100644
> --- a/package/fdk-aac/Config.in
> +++ b/package/fdk-aac/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
>   	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>   	default y if BR2_powerpc
>   	default y if BR2_sh
> +	default y if BR2_s390x
>   
>   config BR2_PACKAGE_FDK_AAC
>   	bool "fdk-aac"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
