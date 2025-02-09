Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561E7C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 18:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F2D81FA6;
	Sun,  9 Feb 2025 18:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxWfz52kOkrz; Sun,  9 Feb 2025 18:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDED781FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDED781FA8;
	Sun,  9 Feb 2025 18:19:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3F4199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE7184123D
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp0YV2NO8Mvk for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 18:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.170;
 helo=mail-lj1-f170.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C312541273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C312541273
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C312541273
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:19:19 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-307e4e72ef3so25984681fa.0
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 10:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739125157; x=1739729957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iH2ft7r7KHRRwVeMhhirFxkO0IvRMIHMcs+9BoZih7E=;
 b=kamaz2qXT+5au2lQEpsChY/9YoRI8BFlgf0JZeAiBrJdRzoISH654/F3qGIPNn/8zB
 S5fWEjU3Yd8aQdgf5sEQ07cLkPxghBxHgXkzDFmEGy3+F+Bqhn3r13CmZ7QYDYegP3VH
 n7u9QbrBv+FQwdYmvtfxbOGE8nxnXEn/xVhRhY4yGneGCOAyr2agjKld8itOFz7CDRIs
 E+w7zhGayaz7kjLrFYr6jY7gSfGTDK2+WZf/J20e2/TD93/Bsx7aAwHxbz/aHMuu2MCP
 bshhjDtZFDLWjRG2v5NK3Ce0V30xZ1nzCXFbuOhVV35a5UoMhzp1LMYbNcqu9LrAGQjI
 d2Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0RLR0whE/JtdlcviEHT5L648lz46V1gtN1llVDDqzOyELyeq9S8eFzHAJUzaN3EDnxLeqFehWXJQ=@buildroot.org
X-Gm-Message-State: AOJu0YwF+MzkunkAeJXp4OCtkNjCt916SUgt4zoMJmZh8dFcPSCmfCEq
 ODWshv3yPqbri7RRNVP8w59nfgvOU5JxsULXUpKEUkzNQac0JmonPDJPvQ==
X-Gm-Gg: ASbGncublEFgdbU3w1N9msZoQN9mx+U/NN379nIHY4nTgSy0+rpFw5eSvgW04Pl4Dvf
 IXjcNQY48E56A1Z9z7RxBvIsHQ+jtzz3pNXxsVyg52W9790ZqZs1tIV6DlgISyu2TU4I/c3Nbo9
 SSx6ua9rxHWKDQLLbo9AwZRvxn6me2A16SXAP34B7NbxYS/RwQVVJ4m0ABgAbIUSN39fRDRqFu8
 ylml8Ml9iEugtWgEthycMFEKNYhJwavhL90n696l9Pv4BzpkLiUmNg4ug6/LnRn0gp1TSk+7YXY
 xEbxYF5V4Mzf2NIMk5+0GNgJS3qf5NdtxBJB/YHV3fvUs48Npj/Hw2z/
X-Google-Smtp-Source: AGHT+IHeyDjKGjkshnA9HLuajFU8RG6RbM1p7WCx3aqL8wMAK4HrAcvz+kCPP+2sz17TZjQb5YvcVA==
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e88 with SMTP id
 2adb3069b0e04-54414b01b82mr4270770e87.32.1739125156779; 
 Sun, 09 Feb 2025 10:19:16 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450d491087sm38817e87.15.2025.02.09.10.19.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 10:19:16 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so38639611fa.3
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 10:19:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVV1vCn4KxTww+X4EdfK1lmbhfWZlIGHRqLcu1KBiHyO5O7rt4PeA6InGdmt/HKpi2ekJ8EU/Sj+qU=@buildroot.org
X-Received: by 2002:a05:6512:2316:b0:543:e406:6363 with SMTP id
 2adb3069b0e04-54414aae262mr4176182e87.3.1739125156395; Sun, 09 Feb 2025
 10:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20250206070910.1423800-1-eagle.alexander923@gmail.com>
 <20250207120300.112124-1-thomas@devoogdt.com>
 <CAP1tNvRcjwyCJ=zdV0ug84NWGBVWC7L4F-FkrQZNQvnOHkp7_g@mail.gmail.com>
In-Reply-To: <CAP1tNvRcjwyCJ=zdV0ug84NWGBVWC7L4F-FkrQZNQvnOHkp7_g@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 9 Feb 2025 19:19:03 +0100
X-Gmail-Original-Message-ID: <CACXRmJhdoryRjgzQfDYhP=-B+4nQoF=5EseP-FFF76scFhK_iw@mail.gmail.com>
X-Gm-Features: AWEUYZnxZA_h4TQDqTT5vJHNF0gXPtPW4FVk1w9NfnEvJnmwZdvuNck6SC08sh8
Message-ID: <CACXRmJhdoryRjgzQfDYhP=-B+4nQoF=5EseP-FFF76scFhK_iw@mail.gmail.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: thomas@devoogdt.com, buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/sdl2: Add wayland support
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

Hi,

> Hello Thomas.
>
> Unfortunately I don't have that letter to which I could reply with a tag.
> If you post the v2 (it's been a long time since the patch publication, I think
> it got lost), you can add a tag from me:
>
> Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>

I've posted a v2, see
https://patchwork.ozlabs.org/project/buildroot/patch/20250209181625.87351-1-thomas@devoogdt.com/.

> Thanks!

Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
