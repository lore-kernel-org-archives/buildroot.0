Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE8C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F415810AD;
	Sun, 30 Jun 2024 14:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtgJ28XsRw93; Sun, 30 Jun 2024 14:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8816781099
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8816781099;
	Sun, 30 Jun 2024 14:42:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18FAD1BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D17405DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Un34DLjVuTDt for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EBD340541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EBD340541
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EBD340541
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:42:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36740e64749so1383967f8f.0
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758560; x=1720363360;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3NK7BAkN8y6MCBMUcfVAJcQBMmUvNmHE2m9lWkwzF0=;
 b=lOClCoSHHb3sSkW57yy+gUT0uW2KXxogMTGEgLwnadei/8n77LKPow5m8ypmHX7WZP
 hPDluhdN/HlqNoTUD6qxFdSYviiIDbaCkpbQXddu/v16uqFT4w359Ms769EAz+uWxhgj
 z/S+YsLEFgYOsaL7ZRjqNNPAOg+OA5p4B6SbKTp8oFqzyPbijHh50wKvG0i3e4d89pvb
 f9WOcflvWtfaqmZfI0F81huBbEk3/f1OMcNNDMEux8tPxnMr+S9Ify8G2xnZBknregm9
 xGbZPnyNVVrTUCtMChuT222HU4tqVEKgQDb0DKxqiyTipXM7fYwZCblnPBzPI8WEDBgq
 1wmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4DTOygTk6f5wMu2yRK/rNr+PyAFUGenx9S3bo1Jnyi+cVIWKbs30FfX0c3gQ1SljLSBRRQKmombWBObY797jZ0N4I2npCUg==
X-Gm-Message-State: AOJu0Yw6YSzBn8pGcBEIwo2lajBimIUew51Q7JtiomeaBkC7Pd1/VueD
 B/9IbIoMjzwx8YutwYH66NjLFePUcMhQaK76NSpzbNKaLrxV8hga3Xb/G2ftD8Y=
X-Google-Smtp-Source: AGHT+IFJywLOZ0IdcGL0bR2toeBEu5qcny9qGhyE/R/OgTebWdInkpyUUbNsdPTPi22YUpvPTUq5TA==
X-Received: by 2002:adf:f303:0:b0:367:5264:2315 with SMTP id
 ffacd0b85a97d-3677569d7f1mr1879684f8f.12.1719758560200; 
 Sun, 30 Jun 2024 07:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e146bsm7590023f8f.57.2024.06.30.07.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:42:39 -0700 (PDT)
Message-ID: <acbeea31-6da3-437a-ba4c-0be96a33f91a@mind.be>
Date: Sun, 30 Jun 2024 16:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240628164632.11078-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240628164632.11078-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758560; x=1720363360; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3NK7BAkN8y6MCBMUcfVAJcQBMmUvNmHE2m9lWkwzF0=;
 b=eOZEC868jSK8NQ4ZD+iAk1ZrxOd9YBYDhK3EubIoK9TFPoqLAQT5Cf/QMU9Ihg1pj1
 5Ng/+h1HRWSiFc0Mm5YrCsdwMZqB3J+XGRp17PaS6FQ4V8txig+jCov/GkBwQ/+b20S6
 s4/D6s+lsiCiS1WhyAPgMsvQcnAO1YoFB/odfj0Jhe2TXEuXbHFXZAE+R+txPy3EaDow
 /d86Kp4F7F2LZAmQe8rjdwakDQzqxtHq6T7YjhnikiZZKzndNcUU22eFLVNrGIY++Fos
 HkTYgn35FpD0fOwftV2bkQdwKVL+iLfSp001fd6/VMjQ9/ep/or5hLvfslCdWeZS+eZW
 BkjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eOZEC868
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 3.0.21
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/06/2024 18:46, Bernd Kuhls wrote:
> Fixes http://www.videolan.org/security/sb-vlc3021.html
> 
> Release notes:
> https://code.videolan.org/videolan/vlc/-/blob/3.0.21/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vlc/vlc.hash | 8 ++++----
>   package/vlc/vlc.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
> index 40529bd664..b3d9a083b9 100644
> --- a/package/vlc/vlc.hash
> +++ b/package/vlc/vlc.hash
> @@ -1,7 +1,7 @@
> -# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha256
> -sha256  adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5  vlc-3.0.20.tar.xz
> -# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha1
> -sha1  b834516ab701bf6311980ed5d67b77c834fdebe7  vlc-3.0.20.tar.xz
> +# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
> +sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
> +# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
> +sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index d0fc1744c0..a597616470 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VLC_VERSION = 3.0.20
> +VLC_VERSION = 3.0.21
>   VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
>   VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
>   VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
