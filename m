Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65CECF887E
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6948481B69;
	Sat,  5 Oct 2024 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avtWnE0aSmLj; Sat,  5 Oct 2024 14:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A874E819F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A874E819F8;
	Sat,  5 Oct 2024 14:32:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A15D21BF588
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F75E4016B
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 14:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yra0gkXTl4tw for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 14:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BEFE40144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEFE40144
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BEFE40144
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 14:32:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cbbb1727eso30346995e9.2
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 07:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728138771; x=1728743571;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=encMXslXh4DTvR5FMTBsDwXZ2riuroeLIwIlFDlGA78=;
 b=QZQ7lV3gzd5RECIl5Sa53ml3rFdUfvREfmLkNvI+YwRW3MpUD1GtNnNbi4kcot3APc
 MhdYKtyyEnnpn0c1PPJu4Z/jOgNWOaym+mJ8xgyu3F4n8Ls8VvPpp4cFPoKZ7s9CeZUf
 Bx2+aXp0rSxeFPNh0dJVvH4rWYQwxukLYucJeD78RSONY8KcuPXh01jIaIKHjJktFP1o
 PFC9YUOk5Qrh8jnHEG2NGQXN1F+l5hxy9VhRNz3J7VddME2i/usMV1yC1JPdlqVyk3q4
 uguDBRa8ZB51KNR+03ftforJ9kcmPDaNBPnNeobYoS6+f4UuQK9ScynUpQnT/HK6oU83
 32Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKd/8z1T9DLxtRDxRW1nccTZgmrdnZBWD3mTjKWs3OGrdJ4CjieS6Qi3ffpm56l+/jMqCKry7aI6U=@buildroot.org
X-Gm-Message-State: AOJu0YwWXF6X6OhovZEQ/P1k7HtmanDk609eUVXk4WTsAhQQ+xEBx9P7
 D6y8dO4/ZVFElZeMsNMP7NAp4uv5cxVgScFNDUFHQgJqCOVrycCI0TxSvT5d0Ow=
X-Google-Smtp-Source: AGHT+IFmckX/VG4tM4O9iyyRX7qCATGS7iPS6hqz/isAfHNmzbxs3W2S9j7bHY1M0b9PUWWhYK9EGw==
X-Received: by 2002:a05:600c:34d4:b0:42c:b7e2:3bc3 with SMTP id
 5b1f17b1804b1-42f85ab9ec2mr48091465e9.19.1728138771117; 
 Sat, 05 Oct 2024 07:32:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86b445d2sm41894445e9.36.2024.10.05.07.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 07:32:50 -0700 (PDT)
Message-ID: <f9e4939a-7c83-49a7-aa37-0184766fec40@mind.be>
Date: Sat, 5 Oct 2024 16:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Erico Nunes <nunes.erico@gmail.com>, buildroot@buildroot.org
References: <20241003152523.1131434-1-nunes.erico@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241003152523.1131434-1-nunes.erico@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728138771; x=1728743571; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=encMXslXh4DTvR5FMTBsDwXZ2riuroeLIwIlFDlGA78=;
 b=S4JFgcKpXa62QlWrvM1jClxPkiDrQDTDNdiXM3BD7m1Ifj1VQ4wOPfYz6+d9IJFcjr
 MiyN67/Q0PIEPrdMrfX503f/mc7pdgcSZoxRCZz1mXV8kT5A/K5C/yWMmvQeI5fzjFs3
 ZRGuebf3FOLXyNkycSAEPMYbShAQQS1Y/lI82kyZjVjDipx9h+v7EtFGxRYZ0R6trAlL
 Df9wKof9nABmrq9d0uPFu3X4l2Da/HZ1yQGIdmdFzhhKSpsjbNYGORgsLSSR6Pjir6W8
 R1+rJHcRC6PNCTFNg0uUh+8ROGfAV58+BCmNPu3m0sxwhz/AceaG6ZSLdxX+EY0T3l+1
 6A5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S4JFgcKp
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop my packages
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

  Hi Erico,

On 03/10/2024 17:25, Erico Nunes wrote:
> I still follow Buildroot development and use it for some personal
> projects, but no longer have the time to be an active contributor.
> Some of these are important defconfigs and packages to have up-to-date
> in Buildroot, and mostly other developers have been doing that work, so
> I am dropping them so that someone from the active contributors can be
> the maintainer contact for them.

  You are of course free to drop yourself from the developers list. However, 
this list is not meant to make you a "maintainer" of those packages and 
defconfigs. The only effect is that you will be in Cc of patches that touch 
these. There is nothing stopping other people from adding themselves to the same 
packages.

  Of course, if you're no longer in a position where you can test any patches 
that affect these packages and defconfigs, it is indeed better to drop off them.

  Regards,
  Arnout

> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>   DEVELOPERS | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 44b1947487..174bc5e664 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -930,18 +930,6 @@ N:	Eric Limpens <limpens@gmail.com>
>   F:	package/pifmrds/
>   F:	package/ympd/
>   
> -N:	Erico Nunes <nunes.erico@gmail.com>
> -F:	board/aarch64-efi/
> -F:	configs/aarch64_efi_defconfig
> -F:	package/acpica/
> -F:	package/acpitool/
> -F:	package/efibootmgr/
> -F:	package/efivar/
> -F:	package/fwts/
> -F:	package/spi-tools/
> -F:	package/xdotool/
> -F:	configs/pc_x86_64_*
> -
>   N:	Erik Larsson <karl.erik.larsson@gmail.com>
>   F:	package/imx-mkimage/
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
