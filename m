Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79815EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44563611B7;
	Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXfzE-pM9TnE; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E67E6123E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365531;
	bh=qQmT5VRYC+8eG2sQqOjmVl2o9k9iyHS20dmFfzJ758I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ER2w0NGn83FIAki3IikoIj2t0C/P0YBnSccPiIhYrndQsCBq/1zY3IxGXBH8lA/XP
	 Nb3JorneEgkr4jsAVmuAC5CmWakNbdYIKt0dCFfCZsIpuPJySobkTLNoRLgAR87e8D
	 yY0A8MKFXR5TAOJvTQetoH0RnRFMMvwsbdXt8AxVmS4zr8RyPrgoQITYx2SqUU9T2Q
	 H1MhMEEgAAyhne1r9R61HZ+do/DWxWZROpKzMrxiSvo/MNOSe//SI74A4yGj/BClsl
	 xpJ+MRiuQ7qkEfv4S/u0qTvciP5qrhutIDKUCHiabcup5vicKpQt5IzpyCJxR6XXCj
	 0+f5Y82K8LM7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E67E6123E;
	Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8602E173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80775408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njeZgvApFf1k for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5734C4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5734C4018D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5734C4018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48069a48629so16563265e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365518; x=1770970318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/p1irftzHhDHj4j5Py28yXbPFon2yZqSPp3TEMvkNFw=;
 b=b2xk7cRaKlP/k1IP2F8fzeHccdqyLotuTpHV0byETXRLwVWihtE6YgraG2cm7s5Ton
 xDwh5HMZZr/JNElefcGOHzhF0JpNNS/1CxOvvmu24HT871XVn7Pq+Ab/utbGuksHAiQ5
 OF/tMBhiFDT7CJTiyVkOq+QkNb3Khv/rGEQYhsBa00PxmQXoe9FaqgXwrmU3IVbfqInJ
 Ehxpmh7vvC7a6aYiFE0K13WuFdEdvuIn/qujW5Ogk7p3peV61ZeEHDcbKOU2PoMYnYpY
 qFNbFmCWTdYs0QgOiZXGq93pNASVahSRj09G59+3eVeVNnumK52J/rWNktD5pUjt7AML
 ECxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmh4LzZXfMUd6W8eD8K5onITcLiQx6Ghlk9Xf4uT71hC48NpfU7JQa+benrYUxhghKRnVNkBGAqdM=@buildroot.org
X-Gm-Message-State: AOJu0YytW5Lmpfjw7M/2onuyoJM9ZSUac7awnh+mL2myYcYQ5npYOkm6
 CHPevmEJ+Le8/UMvBl8ylg8EiamiNXQSBsMtseX4PQiugCE7RGiYOFmFdIW2fOaD7l4=
X-Gm-Gg: AZuq6aJR5tJz1wHQm+9cg76z1QHnVr/4I9+z0f0krsNACbUD//GP218JGch94uxTT06
 Q99W28vMaeU04m2QuQwSQm4l8DJULLLXqDR2NnhRPl/J3wefA+nvgW3w1h4n3aXiaHjIGijb9nH
 DnvPBmpGi0ctMYW5kjxO1bADkgd5YocoMcL8IPSZtUG9c9uHzutPoStCv53SmtPkuyKYGrdHwKD
 ElFAzXjnndOq9zkNEimViDIq7qA8+7oLDPBPbjkBJxfXd76CIYiNH1qAf3VPNOIJsK1kROrI8wd
 4vhZsB7SBrIRAKg7DZ1rX1egyhapNA/sfvwsjhXSdM+a4zk8HkT3cR1BZkLkMUE8fCAcX2yxCe2
 VnGJWkqDyMxVIvjb7JpvEZ7S5FFg7aAsJkXLRr4KMJJ+gt7eU/4JZMERIVy7mb2msykGhhCaP7B
 x8Wdg=
X-Received: by 2002:a05:600c:1d14:b0:47d:4047:f377 with SMTP id
 5b1f17b1804b1-4832022a4cdmr26383785e9.36.1770365518146; 
 Fri, 06 Feb 2026 00:11:58 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd1c9sm3863548f8f.15.2026.02.06.00.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:57 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:57 +0100
Message-ID: <20260206081157.32577-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124154406.1093087-1-dario.binacchi@amarulasolutions.com>
References: <20260124154406.1093087-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365518; x=1770970318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/p1irftzHhDHj4j5Py28yXbPFon2yZqSPp3TEMvkNFw=;
 b=WswOw4LMBDaumdF702bCjUjbtfXviPvu0dNl/eiY1HwXOy4n6xH1ocjztjTZ0j9Joe
 yuW43ptx67fDxuFikC1W4Tq1Azzx6GWKbQyU6l/hyKCeYaBAkr+sS44HvwVuJxdx58Il
 8fd4FwKIQhy8iDapi7OpFk7MdiJfw2nuxPhdVSKSGGDxG4S3hfeHxQ0HVbb+yGJ6FO4E
 Yvq9KzuIN5rwNZ4HC+nzBG92HH3bsHPGJYsluWNdZQW0sgvnRBFA9gFMrs6g7rtbdJZi
 rTYx+2H6Ti+nu66dPOEQIw1Pp4RZSB3dAC3lUKSz1HKuP39+FsqQJdSlR4RRmeUohNNl
 AykQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WswOw4LM
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx6ulz-bsh-smm-m2: exit
 post-build.sh on error
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
>  board/bsh/imx6ulz-bsh-smm-m2/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
> index eac82cc22af5..4a9bc1cfd50f 100755
> --- a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
> +++ b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname "$0")"
>  
>  cp "${BOARD_DIR}/nand-full.lst" "${BINARIES_DIR}"
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
