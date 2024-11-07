Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8CFD59F7C
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 00:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D1686069A;
	Thu,  7 Nov 2024 00:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJtsoxnqqJx4; Thu,  7 Nov 2024 00:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6DD606C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6DD606C6;
	Thu,  7 Nov 2024 00:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CE42807
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 00:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B60DD40713
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 00:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cumF369fY19d for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 00:26:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4894B40712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4894B40712
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4894B40712
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 00:26:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a139be16dso4943166b.3
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 16:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730939158; x=1731543958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFi4t7G7Vm0wqrcSY5SmlzKo3WUiy9p/uOjOKET3hF4=;
 b=ZHc9NKvUrHR4fL/r3FtsUBfzTdPA8jETyhvnfPU9BnkhJYc9HEkXGp5RSrc8oD6Cza
 RiVTervtUFq1Xi5iq5fJoV09CPo3MjmaS2n1Jl6IOtutxgRij1J0QBuUFIbxBCFRX/DE
 4vWbuUU6cUig7Gqe5lTdSh8x+WGT2xCtAAIchegBjLQ/Sn7OT3FMbJ9HYI1FCD/Xyz6z
 PkD2j4lNgRll67/g9IC7KNueL1CyypfPv2O5nG+wH4BNngEOOt9WfdHQ4+Gj+mC/q2nA
 z5JpkA2/MvHtWMwrRrR8cq5hEcBbLiob52En6lbNs4cYiB4M/BTVoGR+SRjDgP9ICYQD
 hK5w==
X-Gm-Message-State: AOJu0Ywfc0U9MWz8IM/IhZUjQgcTBzb6mEeASjTxQCX4c4328eeCJTAD
 4VJrjQDXefVtyMBolnL4lZybKRf0E07urE1Gjz3DOid46qzPBIzW1Fi0NuEg
X-Google-Smtp-Source: AGHT+IGOeiTBwAhd1A/7RVZi0wFOm61Dc7mzdqOBneTYm0sPgaHiYsSGCiXXHNkwlHH8+ZZdoA0wNg==
X-Received: by 2002:a17:907:1c14:b0:a99:fbb6:4956 with SMTP id
 a640c23a62f3a-a9ed3b641f9mr53870066b.10.1730939157298; 
 Wed, 06 Nov 2024 16:25:57 -0800 (PST)
Received: from skbuf ([188.25.106.17]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0ad2f76sm10441266b.89.2024.11.06.16.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 16:25:55 -0800 (PST)
Date: Thu, 7 Nov 2024 02:25:52 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Message-ID: <20241107002552.k6owquxxbxp3qhct@skbuf>
References: <20241102152106.2153747-1-olteanv@gmail.com>
 <20241102152106.2153747-2-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241102152106.2153747-2-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730939158; x=1731543958; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TFi4t7G7Vm0wqrcSY5SmlzKo3WUiy9p/uOjOKET3hF4=;
 b=FI/bdsJJewUsmkKRE9LJW7NMqM1FahdIJdhFoccSnxPS9JI9/tAcPNA0vFGL6/IkL+
 NCOxzNYP9FrS39I8cuVVaQIo7s5ur3GLs8UPV2gH2YgaMck2q8BThkoFnqI30ONQzpxp
 TEBttxoR+eu0TsMkCzTK3SbJBTVbK8iiI91PwqTTA/1E1jLbVenres5zzVxpLK7kQ+p+
 UQspOoBXXTnoevlQLQ7TVCwYF2VFIAuwaXNDpasJmo+VjSTck/oXbp2djEQDBPzsPd34
 DhrntUH50JbcPaOy9I6228fpRf8JXThU6afUs+bJNrNvbd2c7xJrztdXbk2u03kqsHhT
 +X6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FI/bdsJJ
Subject: Re: [Buildroot] [PATCH 1/7] platform/layerscape: bump Linux Factory
 tag to lf-6.6.36-2.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 02, 2024 at 05:21:00PM +0200, Vladimir Oltean wrote:
> diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
> index 4d1e0e1dcd9c..3e7390daa6be 100644
> --- a/board/freescale/ls1046a-frwy/readme.txt
> +++ b/board/freescale/ls1046a-frwy/readme.txt
> @@ -9,15 +9,18 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
>    - https://www.nxp.com/FRWY-LS1046A
>    - https://www.nxp.com/docs/en/quick-reference-guide/FRWY-LS1046AGSG.pdf
>  
> -for the software NXP LSDK (Layerscape Software Development Kit), see
> -  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
> +for the software Layerscape Linux Distribution PoC (LLDP), the latest public
> +user guide lags several revisions behind:
> +  - https://docs.nxp.com/bundle/LLDPUG_L6.1.36_2.1.0/page/topics/about_this_document.html

Actually, I've found newer documentation, this will need updating.
https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
https://www.nxp.com/docs/en/user-guide/UG10143.pdf

I've noticed patch 6/7 "board/lx2160acex7: new platform" didn't reach
the mailing lists. I got a message it was moderated by the email server
due to its large size. Is there something actionable for me?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
