Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0CEB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC566126F;
	Fri,  6 Feb 2026 08:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1o7_cTQg7LPJ; Fri,  6 Feb 2026 08:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB1161272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365539;
	bh=1fpFJ5sHTXnz0U7sZKspJ5rNE8JSaVm0xb1J1PUbaFM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I3X9F6sSfeBvnPq9S/2ixZWK4jP2vWYGKQ25LRE5NkkzNRstES4xAeEIghbjmYrWe
	 fljepnHvIO9dHF5C+/lWeNcigvf+TzdOeKZrHYO20olU4jqj9EMU9yREXPK15+M15f
	 PW2FjayH3SM0ZePyGdITz75MEPvvxmMvKlVYzUHkjKOxV3PqGJnGBJaqk1PS+RHr9C
	 a0qus8AXL2cJTwq0vije87oOcSjdlZQ5LZ0A6aQBicIk/IZfmpQ499Dv8GevocwmRP
	 PX1Hfpm1H0FPp7NhrAmBozcOvlJ1SKwUm5c/AJBt2tfa34HpcsRLG+vIF/jJEA2qhn
	 7Ph1aVpqitOZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB1161272;
	Fri,  6 Feb 2026 08:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2746219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC272408C6
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Un2kieYdX-Sz for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0DB7408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0DB7408AF
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0DB7408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so17077325e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365523; x=1770970323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=saBI5LvSvlZr7gHdivIszxLm1uS8AcTvjYsZ8+jUUp0=;
 b=fjAl6cngP1O3NzfSGsMIiZtHOoylW5eGzx8bCPPiFnx2O8CzVEDp18lTDeXfPWeXKz
 q7Gt50YS602tmhRjLCSyl615elBfM6RSspU+DhmqWHoBpYoXKKX1lS+0Q7Tz15X4lG5s
 KGSgjM4o7Pvmi4lAyPIwk2eaKr6aP97r76xb8Npdxt9islD0I1U2ly8Xa8nHTwfHelav
 mdALIcM3xQwxP/S34DSrzntkkgq3QJ2tKuOolI99Tgx6ZRzp2o9Fw27izdtljBEgE/r6
 OD96czPxXkczaRZQhuaGZZf0cX6+0kxsaktzTH7REgkqIgp9sx7u+dNn6sVdC3vGnxql
 89yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSUuPnFP2GBlk6VQCEOdjdjbu4PSpqOxkucZQN5d5hqA+xCZGXhIjbMvEvUR4GbFXPP8EYn3K/WM=@buildroot.org
X-Gm-Message-State: AOJu0YyXhlVBgHM5UDJcggBYWVfAsBsZ0GM/07JeXzNXCbGUVJ1LWfzu
 YyH5lBmBuMaTb4UD1r6reWoSf7Cfm3aBbMKCmfxWn2N7ss+SSFTFVnIINGkdMwxzSes=
X-Gm-Gg: AZuq6aL41FpxpEkuNSnHanoNEib6hWbpK0S8bnH1vZ8wVXzHGnJAWeYEga3Fu80RrOS
 eMgTIiHW0Hxsr58iZH8wcFg+V0fWUWi7kGKoY46rE3Lh1la+RAX4K3aIRqHM1Yhl8M3V7+DqcEO
 EEbfCGhcGOoxh8e5KXYHCSGQSGfVdRaMaFm2Y2Yf3hlwZTrsKqFBZjdkbp2PchG7h8dKjEVKgvU
 SSRfyHrw+LxDyyWgGlVQC5IMeLKwJPvbOiLEQNmlgjLBCL9VKQkunCBhDmarNq1jvu7ucBrR9a5
 k0L4BmocAzsHgfzv70dUbwurfQQ/z3n6I5VIqhjnZM+ZCz24M1vl9ZwD5K8ZOZGAWVc7Ms+3IOB
 DmjAEaW+Yt7bhELZH6Zl/kHK8WJruqUIvVqBMfpmAu58I6BWENE/r16ZPkERKBF1WyeBCbyJOnU
 8corg=
X-Received: by 2002:a05:600c:3e14:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-483203db77emr24268605e9.16.1770365522768; 
 Fri, 06 Feb 2026 00:12:02 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832040a3cesm23245445e9.3.2026.02.06.00.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:02 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:02 +0100
Message-ID: <20260206081202.32847-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124153325.1060846-1-dario.binacchi@amarulasolutions.com>
References: <20260124153325.1060846-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365523; x=1770970323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saBI5LvSvlZr7gHdivIszxLm1uS8AcTvjYsZ8+jUUp0=;
 b=FtqJxuaTqO6lf+9HEASP9ho2npE6QmjZgUy/n1o1rXQH1AYjoEd2S+THi7vSfxmm2i
 9F5a4nO8ODzuAmlqP80w/K/VDpmuy54F1Rdj4+0Xr7sojJa2nM5gQARQwVlGCVThgE4k
 hcztEUQza1d+5eVJmxU6tjEGD3t//feI3qC1uimwvbGwfBmtTqzyeSGmpxprK2vRRjAf
 nAyRuBTpaI+Oaap0G/51UF9WEawpcm+ZWSad32nBHwWoI/JrkQWMeOTPOxg/Dpw+bRHY
 2GDEMaYGG7V8UHQihSXqOqAB89aqKWr0CdS8FKCK5Otl9RtBCX/dgkYDk+8fDsOfEQZg
 BEbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FtqJxuaT
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f746-disco: exit post-build.sh on error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/stm32f746-disco/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
> index 03e9dcae8215..74c59fdb72dd 100755
> --- a/board/stmicroelectronics/stm32f746-disco/post-build.sh
> +++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname "$0")"
>  
>  install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
