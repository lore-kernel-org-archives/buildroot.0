Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39539EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BBA61222;
	Fri,  6 Feb 2026 08:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RctATT0VIHsC; Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338C661186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365526;
	bh=JVFY/LbAMWMfeoyf9uCCgeX2Gvm0zc8WmDnEk/a5A18=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rBGxDRZRB4tsuCP5pD6zENCaSY7aeG+izgEN56/5IJnYR6NlCmfzPKtzH4r43kaIa
	 Riz/uOqu5+JYJKtnp6k2PuUa5Iu/W+KvoNnKaTtGmyA4F3f5nLITXIhpOZWLXcK+DR
	 Jga+6MbOnJihmSBhklzR0R5L7/Ny0NHH//XrpAhIO37Iq08S3N7OcXqTQ0MTVIlviM
	 K2D+NvXn5yb0ZTy6YJ3kYLj7g4m6myZKqlr+5IXvJ3DYrOexGJxzP1NWJ/A2AeP8J3
	 fvuR3d7sQwrVLdPRx5YNZT8u/jYFYpAGfMzeLBvmAFUJjSU59PV0m5Xbak9Qh426gE
	 frJznirNUo8WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338C661186;
	Fri,  6 Feb 2026 08:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 816A2219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63339408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcyulUyuxMoN for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55DF44018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55DF44018D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55DF44018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso11405335e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365515; x=1770970315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s+xOeJemnpRsZ54pVwroYYTpE+vhEdYqgwesNNmlzBw=;
 b=YAfhv4sMDqH7vnNA88oFCN573mh0Ac2j0PB+kaoRbB5+UJab0csk2SXqGOasIQJA2r
 ePkXmZ16NR1VLkSAvnyaLE8usLHhxvxT1sR4U4ZGETiXKmnKogMDsYVCul1WaASo/otS
 0QgUIWJojg0HZYITlxBJFKKQMxzlLtCZ6A1TRAirmwmY58FJypKnRkwEycnIccw3tN4D
 /OB8dOxkDm2YiEm9dY42eJrIkhySBcU5/ZaNJdE+2o1Vh7IWjgJtr/sU/MrVfY5G0vdh
 3re4dE56GXDKngoXSfYw2I0RyiS5QN/kV7jXxGmWdFk48vGWDiHG3oKau6HZsxMocrgA
 cf3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH4nKFjWgaJOXwbqO23WUGwNCC4IY3qKWl6cPZ25KB6Mh955bZVNwL/WXcwHBzMQs3E8C7mxYwGNg=@buildroot.org
X-Gm-Message-State: AOJu0YyZlzOO1KAjOZZh4MIEYV3axym00Dn0bQ8/KCmoOUM7ibQhQ7YT
 aogPyMGZg4paDaE3LuVNgJbwi3NmUex20FU97WZLH21EC/IYZ8sFBtTB7U0yryN8XKE=
X-Gm-Gg: AZuq6aKnTUSeXWJ4QNyq32R2dmjnXBai3tv54xTmlwZSOuBK3aV4tU6x66HlCjbax2F
 3ln1Ov2734x5wc0bUHsyxgk79uYrIqR3rQSRwCFDiMw8JoHqCNcfrK+CdHyAZtJh4L+pKYnFPtO
 mRcBy3xQLAVFJCew35jOVxl04ZsJwBCUYJF19hlMHDv5nJHKQI57hmzFQ5cALT48wHznY/nlWAM
 YQUJZ1b7g7kF0956cwLoib4cQNDcUrF1AyeGIjE0xW4/tM4Ype7fVwnvWcHm6QDUA9+SDi0qRcD
 VSUNihUNP55hreWJSLIw0n0cPtDRR36dycFKwJtvwuy7VwhAKsPJitghUNBwcJG2jkprh5nXpA2
 xxneztU+XCp+1fl0+fMlN5MloodaMuNOYooOpPVMoE1FVOxV8ib379H8HO9r8HjIcOXHcjq+3HP
 vLqNY=
X-Received: by 2002:a05:600c:828e:b0:477:abea:9028 with SMTP id
 5b1f17b1804b1-483201dadc1mr28703735e9.6.1770365515405; 
 Fri, 06 Feb 2026 00:11:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d299bfsm101946815e9.2.2026.02.06.00.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:55 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:54 +0100
Message-ID: <20260206081154.32405-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122183550.475600-1-dario.binacchi@amarulasolutions.com>
References: <20260122183550.475600-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365515; x=1770970315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+xOeJemnpRsZ54pVwroYYTpE+vhEdYqgwesNNmlzBw=;
 b=LOsgmC/0ExRgfrMcDpsK1CHmAfakO58eXMMPurl8bUkfGmOl77KJ/EeMY1CRaJq8ul
 nv+bSkS/NbQaWM4YROlQ0XGpTfzrfLjUiMhPNs9B6WP/ITe3jm4tndEM8ZF/31enYYBd
 IRLr5+vj0Qxc2H+hIUgh1kB2ehW/n8bL2oydJ+r55vLrErJNZyl1QFpCpj5mQ1yzjo2Z
 IdE7w0f0wav29sKryepCCdtYmyMZ+LYJlCbK3VeyJCrY7SPBGk8qQwlJkMa+WO7ODhSf
 mu5CBzcdtbmDvdQgVaTE08HpKhjbZDYfxtKsiGIllhuM8naJlwuEgxbuB8SeNIfRHxsO
 YKLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LOsgmC/0
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f469-disco: fix typo in readme.txt
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
> Add a missing space in the "Creating SD card" section of the
> documentation.
> 
> Fixes: 04a0094f0ef0778d1f3c4056ac0005218126147e ("configs/stm32f469_disco: fix kernel bootup")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/stm32f469-disco/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
> index 99d26ccb66fb..6d46f7c31aed 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> @@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
>  Creating SD card
>  ----------------
>  
> -Buildroot prepares an"sdcard.img" image in the output/images/ directory,
> +Buildroot prepares an "sdcard.img" image in the output/images/ directory,
>  ready to be dumped on a SD card. Launch the following command as root:
>  
>    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
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
