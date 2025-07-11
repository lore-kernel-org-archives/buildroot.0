Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DEC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF3183C49;
	Fri, 11 Jul 2025 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE3KmVUmKgLU; Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7F483C51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7F483C51;
	Fri, 11 Jul 2025 10:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3939199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E7E40251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqMzzimO4-0a for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D955D40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D955D40094
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D955D40094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so10909755e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230698; x=1752835498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xHPJzgsl2+N5CHPdmbIea2bRgZBmT1mks0IIe1O57s=;
 b=E6xhYOkc+XMdiy7gccrflQagDU2UEgGBYUF0dYivUK79hVNbE+ThXY20stO+u65eKc
 P0xMt1r3ZyMlxQiLqSQ8JRGo+bjASEF5M1kCCe+5tLyvKjnZA+4hpyuD2NB+VUySZ5Kh
 e8+JdGukdBcgkX2a0iY18nGLrY37ZUIXfgH44Gh4HaaNG4fN/8vgnxbz5+fl2Oled8MY
 xYeFGtmAz8Ofg7WRu45YJZwAeJYgnDIVyyFEua9F+J25Yx6QFRk8fHGE7hj+FJ5KUmku
 VS8PQB6JK+CUqxrUwxo7oKTvvevd2vH6fcF8jOEN4VPCcZHLfmciiYybZgnSyvUeFCm/
 tVww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDxCTf3O/PkZngqelxAgeX3oBsVf707Lk1g2Dz3juhZTWZMjgDHqEKZugiJo8p59OC0S2NfgPTKn4=@buildroot.org
X-Gm-Message-State: AOJu0Yyf1TdI9TD8d51x+OflF8jgdyVWGM8ja3H5Kml/qE8jGRqXXLtI
 NrmHWoM3GO5PdDiMyi4Li6a6QGJHm4c4WjUs28uzZUDiDOsFpZLCMRJk9RCuRETZa2k=
X-Gm-Gg: ASbGncvdVzl0dD//H7bFULUiH/GbBKwTvoaTuhZB88M9TboaMHjSyuyTlThyJ/Da6bZ
 FYPFNH36RUeq6diJMHjwn8bS/VQR5NmXljbdNjHfouLYozMIm+vqescPCo30dBvSy0FZeSQIRWE
 hvSrmdbm0/6RAEXbvSIXTyvhN0k3xgF78X9xz0b15G4Eq5qLU/kjajiBWEtmjcTF9WT/VwAZC4g
 dNRlVCD4OKvF9FQ/hHr81Dnw6Oj0ilJx8+6Fdq5t1hbbaKtF0J8aMUoKKBm89m1Sx9yIjnpda3G
 eXqfpTFDBsN5jX20uYI9mbINnc3KGpbPdDizHRwBv8hfb49Ouo78BhQas7+VIdX9S7YgNp2AQqQ
 7jJj3T+f+6Bxucw==
X-Google-Smtp-Source: AGHT+IFsSFk542IdIjvD4X9cWRmNjjAafVebtFL1ZM7d2B1xIXQ0b41bCmIySj6mv6PCtLCuG36SHw==
X-Received: by 2002:a05:600c:8b75:b0:450:cf46:5510 with SMTP id
 5b1f17b1804b1-454f426190amr21261575e9.29.1752230697716; 
 Fri, 11 Jul 2025 03:44:57 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50fb874sm83524665e9.28.2025.07.11.03.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:57 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:56 +0200
Message-ID: <20250711104456.824198-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703091134.1716980-1-titouan.christophe@mind.be>
References: <20250703091134.1716980-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230698; x=1752835498; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xHPJzgsl2+N5CHPdmbIea2bRgZBmT1mks0IIe1O57s=;
 b=bx4Oin9Vl6CIASTA7IZotiSbw45XtHpRoe0Zzbxfeddw/0JZsbQdZnwoxp0Kn+XDZn
 GJutWagZdDeI0d7uDUvkqNsKoImdTKJwud3lSibuwDC6hEfyLtktRA/3DRh0w6nCTbB/
 nTVDnFI9zzlJeWGZJ+Y+LspdrwCKu6W3eRlOBDB8n2Es+zl84Yq8+hM4Ykd7k8+7mVeB
 Ow5pCHcfOlx/MuRYh99qvcGVkWSXR305OaRCpq/Bkmrnqopb7d2T3YKntnBYIQkSrCW4
 I0tVMGVF7akr1rpAfy2HrE3y7E4exvAGkiDze+BZzmYFnLL8TzKY5LmURc1RsR6WstMX
 E22Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bx4Oin9V
Subject: Re: [Buildroot] [PATCH] package/php: ignore CVE-2024-3566 that only
 affects Windows
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/php/php.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 01166bae64..a049d90fde 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -15,6 +15,9 @@ PHP_LICENSE = PHP-3.01
>  PHP_LICENSE_FILES = LICENSE
>  PHP_CPE_ID_VENDOR = php
>  
> +# Only affects the Windows operating system
> +PHP_IGNORE_CVES += CVE-2024-3566
> +
>  PHP_CONF_OPTS = \
>  	--mandir=/usr/share/man \
>  	--infodir=/usr/share/info \
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
