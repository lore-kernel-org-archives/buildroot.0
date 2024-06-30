Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123CAC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAE5281091;
	Sun, 30 Jun 2024 14:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrNRvU9u18K1; Sun, 30 Jun 2024 14:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CED81099
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CED81099;
	Sun, 30 Jun 2024 14:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69E571BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F4F40602
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ASxjwaA3I8F for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 185BA40541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 185BA40541
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 185BA40541
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:42:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so16164825e9.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758566; x=1720363366;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OIYpiNbA/wdhtor/gTTjfnNjszlD19obrrLmrycCz0=;
 b=Ku7teYxwFm4oLyi6dodX44Q2CMozL4Pv5MMs3/STpNrfWBrs8LzGrPWl6dI89yRFHw
 qheXwOZxJbdIrcCijizOuQTU5BgAr8XYfPiEvs8iPf81DH+YS2qgNw1lP9qfZ2TLAURl
 FwNNeurUqOGF1OwtApR1SKxsWgdpa6O3H+D1RvB5IhWAcfJ/d0Mz4ayzHzfbv1ZLmQsR
 Vy2Diy+f5vhAfKJ8KVrkecFE1S3wl8ioAGk2S2BfnGb5L8UPPTa07GNAeOXJ3x2k0pwv
 d9uuRv1KpftOOl5oW2Dck7snDQN1mBv+Y+p/pxiRQItfYTxpQTJnDyRMo6wOAQAakudF
 3EiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6uW0FEk4k5x32gp5aG3TMYjUhDF9LCFkf75N1EV9hWKZ9BlAkeuv1b2cnNpLPNsLvio3m53NSGW0BrgoNr/jgjoQji9vk+w==
X-Gm-Message-State: AOJu0YzWdgUffrvdcx15p5PsP9HxEeWaZwudOSkkFcmjvrqJZSrOsfPp
 PiEY6O5qY40tnD6A3pL+4FupeMcYWAr0zA3JFF638h/JX0OvVmFmus1bICfjzgz5kWzSV3rbLfa
 8
X-Google-Smtp-Source: AGHT+IF5EbbT5XpbKoFcLyfxqY69hqi/YCLu9On91J0cIVxa5226QrUgYCRfQt3rGNlCCeMNVLMs3g==
X-Received: by 2002:adf:ec8d:0:b0:367:47e6:c7ce with SMTP id
 ffacd0b85a97d-367756a357amr1787846f8f.6.1719758565984; 
 Sun, 30 Jun 2024 07:42:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e146bsm7590023f8f.57.2024.06.30.07.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:42:45 -0700 (PDT)
Message-ID: <843ea8e4-234b-4b1c-a4a1-d6dc3badf3db@mind.be>
Date: Sun, 30 Jun 2024 16:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240628164704.11159-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240628164704.11159-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758566; x=1720363366; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1OIYpiNbA/wdhtor/gTTjfnNjszlD19obrrLmrycCz0=;
 b=P2vkz3Nonj1bFLWeh5+8x7JjvkVhb3uQMmdYg4BK/tyBUvXKcOZFzO3+FgwOgCziZM
 /uS0jGR5QSwpoh4E0WUK3l/hHV9cisrIta0LFlbCN53H4VIOtGvD6+C5tLvUTF2cNutR
 7rACmAgY5UH/RKYKTvG9vmYwWzSD2irofG86iheoaIDRVyT62FbppPzZLNha2RdEG5jV
 Pad7M0aTEKFIpGufKVuHW5FLmr0LcfAohGN5k3OxuMi6yj8N6hE72x1PB4hRmwYIdmdM
 vZjgkymVPhx9iMngh9mWOvYm5H1m7VB62z+3ccQEyg4y7g+prK7aLe/PDQ/UVVuiOavb
 4n3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P2vkz3No
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.21.3
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



On 28/06/2024 18:47, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 116855fdba..d7fdbe0d0b 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  68b4be51e99687bad15d5bf4ac9eed79a080ba89141f7363457a957ce9304e4d  xmrig-6.21.2.tar.gz
> +sha256  5d76fb19190956c564b405119315bc93db4ed8062b251d5e96bed70c5fa8033c  xmrig-6.21.3.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 45538fa77e..d01b001817 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.21.2
> +XMRIG_VERSION = 6.21.3
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
