Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B1C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2755881441;
	Mon,  1 Jul 2024 07:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8TUrATwCY_d; Mon,  1 Jul 2024 07:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399178145A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399178145A;
	Mon,  1 Jul 2024 07:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 252601BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC7F6069B
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QUDJTG27aa2 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 162A0600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 162A0600C9
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 162A0600C9
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:15:56 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so26675551fa.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 00:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719818155; x=1720422955;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5t3sh3Qb1RwiaBVwW7WSgEiXbwyg7ZF2/Moua8iIzIk=;
 b=uzkWiIZz5yX0dVlhF7IXGgn1zRMcBsCQvQwnTB4EM67SVEcDPYhOEp0U7jU6tXQrGF
 hew+3nhAPXRhXMNP96Hw7QiFpqIwv65bdgM4ax4xpbRyqIwxKH8QNmWaDOrIZ63vmj5y
 oZlvBXVLeogrBMe5dHwGulCjkfMEtmMpZ3wGBxQI4YBnSIwZ3ClgMGm24xE0GB+j1iML
 EnSaupEqw2Htubx3jM8d3KlnA8CxVbPyhaaI9tzzKobhufTR/P2Xs/9h1LUo3Ck3bd4g
 hgnoFSqurORyP+obksVfWvFo1UzQGQOyuGVjFVfYwdik+YQlMG38hJlSuPnUDmRPeM17
 oquA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb+EDTuL5SHGPeol7zfPau5GtgKWrOpCZ+2g3+55WX6LQQyZFo4IV3BqMYBw3Lcy6GGabgDEyNtHSvYmIK6JroM6qx3aACmQ==
X-Gm-Message-State: AOJu0YzlFu7hyXWYLkUGUWTR1Wy8R+e4OU1izyWYNovvzWDcf/+ELwDD
 vKGLlqMycHS5G35J3hCOC2AowkGlBfkc98UKRbxWroBoDwPmkY48OufpwCv5fe0=
X-Google-Smtp-Source: AGHT+IEonFunaMAopWGqDFTtrPOhsTvI6Dot1h8Tn/9x2htABzzAmTVS/grLFkDgo0yzzamL4bUGUw==
X-Received: by 2002:a2e:b889:0:b0:2ec:57c7:c72c with SMTP id
 38308e7fff4ca-2ee5e6ba661mr34420311fa.35.1719818154608; 
 Mon, 01 Jul 2024 00:15:54 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b098b4dsm140633315e9.29.2024.07.01.00.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:15:54 -0700 (PDT)
Message-ID: <a3caf5f6-ff43-4f25-abc1-4ac278535adc@mind.be>
Date: Mon, 1 Jul 2024 09:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
References: <20240609100425.10701-1-raphael.pavlidis@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240609100425.10701-1-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719818155; x=1720422955; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5t3sh3Qb1RwiaBVwW7WSgEiXbwyg7ZF2/Moua8iIzIk=;
 b=e+S/1ShtmqbaZ18jcPt3OIUiwMyCjlpNZWsoAPU2RkVSxj+xxuD/MAr5a7hlCbAox3
 1gxsyVJA6N3X70sDVpQItA0fVw3A9hBkBRHFlswTH2Qiutatnl7amIsqHXERzC17BELt
 WaphVvvGM8QijcmwytLeLJKiBSkTCYakywBMyMGdKa3IND9Hy1cZTKHBnYuow/Sy40gQ
 rA6Pnfse6cBC6zVzDWtgNDZQTFGHODHolbQSIckJHkyS2ouzK7GcCw9wvW9EtTctzQQo
 bD2yO5Rb1Ws9vcwRFU/OZnWZO49CbNGUMvhwVNIK10qf7GQYKa9zVwsTfUxjWwIN2sLK
 lMjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e+S/1Sht
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version
 4.15.1
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



On 09/06/2024 12:04, Raphael Pavlidis wrote:
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/shadow/shadow.hash | 4 ++--
>   package/shadow/shadow.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
> index 23c292d659..1d83272cec 100644
> --- a/package/shadow/shadow.hash
> +++ b/package/shadow/shadow.hash
> @@ -1,4 +1,4 @@
>   # Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
> -# with key A9348594CE31283A826FBDD8D57633D441E25BB5
> -sha256  cba74bc7b05d89c015afe23131f9159ece38779d40a8af4cf162852e6e85ca23  shadow-4.14.5.tar.xz
> +# with key 66D0387DB85D320F8408166DB175CFA98F192AF2
> +sha256  bb5f70639a0581f9d626f227ce45b31ac137daa7c451c0f672ce14f2731a96ee  shadow-4.15.1.tar.xz
>   sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index e4d8b67b8a..59771b9182 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SHADOW_VERSION = 4.14.5
> +SHADOW_VERSION = 4.15.1
>   SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
>   SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
>   SHADOW_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
