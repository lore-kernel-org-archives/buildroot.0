Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997A5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503AD83E42;
	Wed, 16 Feb 2022 19:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NFjMg1WQ9i7; Wed, 16 Feb 2022 19:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D9C83E3E;
	Wed, 16 Feb 2022 19:52:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C67551BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AE060F64
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3B4y7fJc7dR for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:52:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCBBA60BE5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:52:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x5so5746310edd.11
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nvzcHyuAJLb9NERPpuTFrGPAOOJoj3FemEsHvwf79yg=;
 b=GMqf8bYkdFOZyiKS+iaNjyCnIeuDamComuaEdNhwdMXFo6luRQXrUxNcg4UB5y4U8n
 sns6XSPCIOYVp4aKf6xHpy1AGRnlKDqhGhSat0CumIPI4XQ4+XZc19YRgIUoHgrA3DW+
 A02LLf2fkSYyr+6l5H2F8Ns9TSn7eA9e4WW9Dd3GYDYwwJteaJAMCNk16UytA5nr/xXu
 m751F1YteqZGLcHbyPG9Kq7+aKhYFpBKP/bazxSTp6uHoiDKcIMwgLUkbQa0ZzfKTZAb
 ph1bOSwhxnBym0lT/eOUvET+X179907HSQImXRwlLUP4Wl7QFWZMnGmw8g2dKBtnotKj
 eetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nvzcHyuAJLb9NERPpuTFrGPAOOJoj3FemEsHvwf79yg=;
 b=pg/08cqg8RWIodO27MZzEAhUqSoow/dPOR2V2YcOzRJ13s1k3WrO0msnYnlyvmDqh3
 Y1BGapIN/U5DHE+pe9KNCtVWSOk5wDs3RBty6k9N4z/36zyvX4aDMprnj73y4DX1X6fh
 9WCx1Vgq69A+5SDTKlTn/cSECKwFL8jiEzPEEBxVQud++y236P8ghTaGZyimjlIQ1vS0
 ztFZBi/a4+PgNEoy412MHuIsOrE9vgQBsmd8F+zJ50gV4JMja60Fb8rM3z1JR5DIfjiO
 4WNo+cvkWJT+Bb+TLGUTJkwLDblkMzTT7tzA/UfP0tl7C/wQSQGVwNy8yGssDrSC8KHn
 T4Fw==
X-Gm-Message-State: AOAM532S7ctYZZ4CDPs2tMsysDspsZAcpSH/aMC2dUwsQfqQnkpNqz8H
 4S9ShWD+v6QlzQdBRRD6V9+ZeQ==
X-Google-Smtp-Source: ABdhPJwqu6PiX7qyGRFCwjpRXej0xT5lp42dyMG2U0MqbhzbhZ6I654WwClf6y4K6xIOSCBLp7P8+w==
X-Received: by 2002:a50:9e2e:0:b0:410:d1b6:4d2e with SMTP id
 z43-20020a509e2e000000b00410d1b64d2emr4712652ede.201.1645041163054; 
 Wed, 16 Feb 2022 11:52:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 18sm257840ejj.31.2022.02.16.11.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:52:42 -0800 (PST)
Message-ID: <70a734bc-47f2-e4b5-fc90-45d7793a5757@mind.be>
Date: Wed, 16 Feb 2022 20:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220213161107.3138320-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213161107.3138320-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: reintroduce package at
 version 0.10.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 17:11, Julien Olivain wrote:
> The ola package (Open Lighting Architecture) version 0.10.2 was
> removed in commit e692e1f2b2285c18057e2c70cc1d9d0cfdb15d5e due to an
> incompatibility with the protobuf version 3.2.0 present in Buildroot
> at that time.
> 
> ola was fixed to support newer protobuf version in:
> https://github.com/OpenLightingProject/ola/pull/1630
> 
> This commit reintroduce this package at version 0.10.8.
> For changelogs since its removal at 0.10.2, see:
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.3
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.4
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.5
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.6
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.7
> - https://github.com/OpenLightingProject/ola/releases/tag/0.10.8
> 
> This commit is based on the previously removed ola package, with the
> following rework:
> - Remove the dependency on BR2_HOST_GCC_AT_LEAST_4_5 as host gcc is
>    now guaranteed to be at least 4.8.
> - Update target gcc dependency to >= 4.8 to reflect protobuf
>    requirement.
> - Remove the BR2_PACKAGE_OLA_SLP option, which was removed in
>    ola 0.9.4.
> - Change the "DMX4Linux" plugin option name to "Open DMX" to better
>    reflect the ola option (DMX4Linux is a legacy plugin for 2.6
>    Kernels).
> - Update Python support to version 3.x only
> - Remove patches, as they are no longer needed
> - Add options for ola plugins: ftdidmx, gpio, karate,
>    openpixelcontrol, renard, spi, uartdmx, usbdmx
> - Reorder options alphabetically
> - Update project URL
> - Add license hashes
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to next, thanks. What an absolutely marvelous commit!

  Regards,
  Arnout

> ---
> Package tested with:
> 
> make check-package
> [...]
> 0 warnings generated
> 
> ./utils/test-pkg -a --package ola
> [...]
> 45 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
