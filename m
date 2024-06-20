Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60B8C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 16:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB94160627;
	Thu, 20 Jun 2024 16:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z4UoGupo4wX; Thu, 20 Jun 2024 16:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AC360724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3AC360724;
	Thu, 20 Jun 2024 16:04:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 111761BF3EA
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 16:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA64405A1
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 16:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKefd5YBI_nX for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 16:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8C4C40572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C4C40572
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8C4C40572
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 16:04:02 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so13016241fa.3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 09:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718899440; x=1719504240;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4dFNEMck72okzm9sIFr7+vFkzFVBf3dhaC35wkgJ/0=;
 b=kFRFyAS6XPuC9p+hnKoVPLF8RAkMSDd+XmSZPVWfjR7x/QGzlHMIO2J7DBMdLbsVS7
 rnfsf2Gdsnhe+qImPvsYd0sAx2Fp1f+yBc6oR1R4WNQhFm1vqG8amhuxj7Hxjqqogt49
 KPOB3RBc+rZuG+IPvlG+TocxAKmVFvsoVnP98BN3HVpL8cUlxyq3XbzXmNO66MfbgXsn
 gVJkNrIzhnEZvfsNPwQzFFBINGFJv2nmFD8iNL2AzPwVQ12ZSuoQrYqa9Sufv+EeTeTg
 eSdMiTERuEHFgqH2s/YKTpast51eYJcdqCj8JBMNp2eeSH5bOhQY5kIVfdbG7D2IwfO3
 sw5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwc2Qjxt036nXEyNwykFiL0qC35dTfVnbCnoUyg2/YGTYp8SLjPw7lYu9Bgyce111L/rwnlWGQozVr92TNeCWApJf9S31wQw==
X-Gm-Message-State: AOJu0YwQlX3ZQfOsGuZCX30NaQf3ul7Zp0xmR9vnqD2f1UEA73Y5Vg3p
 iyNCdtXx3J0ihSO5xArFsklR9p1FQ9cAWMEh32JYVrsEGvA59idr567HFdsyrwtZDvSM8wZm4NH
 5
X-Google-Smtp-Source: AGHT+IG7TBSGL/oz3/8hE3Wu5M89qR/JySkX/uCIQhSa5VQB6Hlo5KHQoTehIuN/cYw4KCEpHbeU/g==
X-Received: by 2002:a2e:2416:0:b0:2ea:e56c:f898 with SMTP id
 38308e7fff4ca-2ec3cfd666fmr42425151fa.33.1718899439752; 
 Thu, 20 Jun 2024 09:03:59 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-364a5b38996sm2273705f8f.3.2024.06.20.09.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 09:03:59 -0700 (PDT)
Message-ID: <7e24df50-3710-4700-a644-901528a1a939@mind.be>
Date: Thu, 20 Jun 2024 18:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michel Alex <Alex.Michel@wiedemann-group.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB060825741529F073326AA014A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <AS1P250MB060825741529F073326AA014A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718899440; x=1719504240; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U4dFNEMck72okzm9sIFr7+vFkzFVBf3dhaC35wkgJ/0=;
 b=CqGYSmLtkGrXBnI92CoICstBvYO5OtE7UIP/jnFcwamwzr8HHfGRcdbGuHGNDnjAyS
 rCdMM408X3ujZRtHo6sYd6JSkD5WE1MbC6MlA39DVTyUjAayRSSq6wbsdsh/7m3UrIBH
 Td1Qf/U1MjB8kLo3MddKiIsATZqtvu3K/hTF+afO0JUpvf6W71f0kS+WtfollEpYOmqy
 fVVSuKfVSIygioShyzFuLM5tVVd2VxvIA85IpDeYpLI6/moAlvOZokPTOkQL8Z+UTnXl
 Vtu5v3Ssm5XNUGZBJDUiFjsXGM5YM8ZAkFzVy5OiGUUJosmxi+cVHql9a2lqOf4W4tYU
 /qYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CqGYSmLt
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 0.11.0
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

  Hi Alex,

On 20/06/2024 11:25, Michel Alex wrote:
> https://github.com/eclipse-zenoh/zenoh-c/releases/tag/0.11.0
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>   package/libzenoh-c/libzenoh-c.hash | 2 +-
>   package/libzenoh-c/libzenoh-c.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
> index 559c9122ad..66bb5282f4 100644
> --- a/package/libzenoh-c/libzenoh-c.hash
> +++ b/package/libzenoh-c/libzenoh-c.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  c86e468527e573d92b01bf454333dda4dc1217f14d5d5f94c24311961313c234  libzenoh-c-0.11.0.3-cargo2.tar.gz
> +sha256  cf8ca9382a17564ceedadf8fe574cd7c73440cd298d2adfbe88fa452427f8526  libzenoh-c-0.11.0-cargo2.tar.gz
>   sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
> diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
> index 07c153e328..6dd79f3727 100644
> --- a/package/libzenoh-c/libzenoh-c.mk
> +++ b/package/libzenoh-c/libzenoh-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBZENOH_C_VERSION = 0.11.0.3
> +LIBZENOH_C_VERSION = 0.11.0

  Does 0.11.0 come _after_ 0.11.0.3? I.e. should the final .3 be interpreted as 
something like a -rc3? This is very counter-intuitive... And it breaks 
release-monitoring.org...

  Regards,
  Arnout


>   LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
>   LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
>   LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
