Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F8EC02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 21:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D704E417DA;
	Wed, 12 Feb 2025 21:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNN5Wv-eSuN1; Wed, 12 Feb 2025 21:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EDB0424D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EDB0424D9;
	Wed, 12 Feb 2025 21:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D872F1C9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 21:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7AF1846E6;
 Wed, 12 Feb 2025 21:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-3pfu9khsNv; Wed, 12 Feb 2025 21:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.214.170;
 helo=mail-pl1-f170.google.com; envelope-from=kidovate@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3D18846D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D18846D8
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3D18846D8
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 21:23:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-220c92c857aso2916675ad.0
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739395406; x=1740000206;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qzimFIFNZhkFcHcMNH5hlVwYbzPSi9oOqmi7feMVQuw=;
 b=ofTbBIA7A4fgg4wXTitqzBJRucpmAzR5dR4qvWTDtCtI9bGnW4O2tADuFRe7QjbR/b
 UjL9WyrcTvlZAoxLAVjAaIWxghvmmb5UN7oMPcQXjO6Gpcz0BfDFpkOKrXP4El8LlbTx
 lJ1KheVn7+fxGKirrTYKcC9d3nFWT5Gohe6K0s2ATbG6vBYuy2p7fHRzZK6RGEQlhhgT
 97JYqc8tLu1EbSctWEsZojzNGSYDVWRQT54m7YeogIiv9ixziq6bboCVUEtJAGvN0z/o
 7a2qWRGoSPve8qThZ9+15Kidxzxx6jqi4S8JTvigA+PjMqEQYQ++xGXXGnoeysp0Kuit
 upXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkIeg7p07q+QKUROxtp6NOoconRAnLM0wgxIqTFwkEW0tR0JihQ9UuilsHT0cPt1ZxBZgcjS0aCzA=@buildroot.org
X-Gm-Message-State: AOJu0YxVuj/HpAwHL2GIownce8DKXZaHrGsv+QnLlDocyLcLOscj03Fr
 Od5PQVRT288gHwM8tPypaocuQiZ1XKqfFDnyLFaGaXSNX4U1QPlqI8AbIg==
X-Gm-Gg: ASbGncv5rmalmunwHDVdCl0o5g7vtFUutFcZhbsgIKliMYRvK9/MXD4ebDiKhY8JB2j
 YNwWdJxIiOi57AZPzvC1QVveaBwKgXE+D3GNqKYVlvsYAxFKtDetebmYWcziO545Bbm1wH9SoJz
 M6ZAqls96Em+2NOw/gosFbklq3qnRCtyDswjpEeg9nidTOBFg8I/tDX+3hPRhCai79dl5sECYlI
 yOR7mYqr03wf8kGzeWZHPlo8ddrHCX/+MuztxwS3oghCTdlEJrz4eoup+g183p3Wg5LFeXJYw8s
 y6QbeZ4gevYCOLX+lP6CtAP7D0D/dQ==
X-Google-Smtp-Source: AGHT+IGgIZVCsn2fo7m+cWv+17CVO32s+Jkpl6AOeiPk/eAjIoYW6PGzFo36MfNWkdYZT9Vzbm3zqQ==
X-Received: by 2002:a17:902:d4c5:b0:215:a56f:1e50 with SMTP id
 d9443c01a7336-220d36d40a8mr5363185ad.8.1739395406066; 
 Wed, 12 Feb 2025 13:23:26 -0800 (PST)
Received: from flame.local ([192.145.118.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556d6d2sm19995ad.177.2025.02.12.13.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 13:23:25 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org,  "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <96b69abb843dc7292777c64f6787f134@free.fr> (Julien Olivain's
 message of "Mon, 10 Feb 2025 20:33:55 +0100")
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
 <96b69abb843dc7292777c64f6787f134@free.fr>
Date: Wed, 12 Feb 2025 13:23:19 -0800
Message-ID: <m24j0yuabc.fsf@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=reject dis=none)
 header.from=aperture.us
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Julien, Dario,

Julien Olivain <ju.o@free.fr> writes:
> I don't think this is the right fix for this issue.
>
> U-Boot Makefile is using the "SCP" variable here:
> https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/Makefile#L1411
>
> According the the "binman" documentation:
> https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/tools/binman/entries.rst#L1727
>
> This SCP is the "System Control Processor firmware blob".
>
> Buildroot exports a SCP variable here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/package/pkg-download.mk#L18
>
> The value is set here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/Config.in#L134
>
> BR2_SCP corresponds to the SSH Secure File Copy command:
> https://man.openbsd.org/scp
>
> which has nothing to do with the System Control Processor firmware
> binman is expecting. So this is an unfortunate name clash.
>
> There is few defconfigs using BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to
> workaround this. See for example:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/configs/orangepi_zero_plus2_defconfig#L45

This worked to fix the issue for me on bananapi m3:

# https://lore.kernel.org/buildroot/96b69abb843dc7292777c64f6787f134@free.fr/
# https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/configs/orangepi_zero_plus2_defconfig#L45
# https://github.com/skiffos/SkiffOS/issues/325
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
