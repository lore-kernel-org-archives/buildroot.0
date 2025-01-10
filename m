Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2328DE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 13:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA81408B6;
	Fri, 10 Jan 2025 13:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_YJLhvkREY3; Fri, 10 Jan 2025 13:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 790AA408B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790AA408B0;
	Fri, 10 Jan 2025 13:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD33E940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 13:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A58D980E81
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 13:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptN4WdXi3RZH for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 13:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=david.laight.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C46D180D28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46D180D28
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C46D180D28
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 13:06:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43635796b48so13313365e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 05:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736514387; x=1737119187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ErOrYe5q1M2N5KuMbbsco+GFuY1jvUVU7hGamM+BKk=;
 b=ot1VHd/LB8je8uTG/GyW0cZpCGaqZghp/H9LkAGIyDHfC+kMHDyw0BWf8wsuobgnOr
 HetAQ3dh3wiu4x2r7mcvb36MFP3kiZMbbFDkFDcdquabd/P2W2D+v7+tx2U9Bh9BCT+F
 WzjfhDeJHWiwsXk/hnr7XW5Y+EExwyvS+mi1COeZVmIrPjUg3r0i06uaxsmUM6avtHzQ
 nMAa/WZ7FgjbPk3KIFEpn8D0nReLGbH1Y1RKfxZiBJc8qLTeVQRKabw7ogQ93Rg5wT38
 //sCrrwxUi22BUMkaKsMIGmht5z7cxDd2UfiCer+gxxcmUQSSztpmZunhW5Hx0YjeCK7
 BkOQ==
X-Gm-Message-State: AOJu0YxZG4EICnavlyKxgQuMB5VzDHqgep5G4s2sZad/FtpzWHhiJLv2
 E+1lWrZsPD/4PD08QFWJPQpkgMGYnG8UNgkISQkfCuxwLmm3keqW5usSYQ==
X-Gm-Gg: ASbGncvwOocByxs46BqvvkzollYu7ohnL3dBnO3Atl9TlHgPUuF5wJjSOSxQGUPvief
 0ETt3NBk3abtxTfq4whfMIAWcApT570/th/OUOnLg9VJtDlC0Ut3JBpNMbbOpwkCwJUXi/B1qHy
 4HFchOjQu768kzVr0GG6aGOS4B/ndSa13JOF+MW6XyvHtIn4WqV+C5V40RZXzoRSXvcmkW+bMdW
 V0eLaqGjEUzkpKhjf1Y79XVkiYugZ3QHbTqK5/+ASD41eHHPAz0v4H+dhlsqOzCJd8cl7emGg+P
 MMmTwg/LjLrfSYI1+AI=
X-Google-Smtp-Source: AGHT+IHKnieET4BZStcuhZ/928HY48yaLeikmi1yiEMA5Zz1GJkzoeXesEt90S2n97DndaDfs09wtg==
X-Received: by 2002:a05:600c:3ba5:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-436e884a59amr64233855e9.15.1736514386585; 
 Fri, 10 Jan 2025 05:06:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d8fc67sm52286175e9.8.2025.01.10.05.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:06:26 -0800 (PST)
Date: Fri, 10 Jan 2025 13:06:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250110130625.245ef276@pumpkin>
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736514387; x=1737119187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ErOrYe5q1M2N5KuMbbsco+GFuY1jvUVU7hGamM+BKk=;
 b=hCIjw0o1ovCjHOgvr+vYUC5zd4EZZar+XGaH1L7OObQNqjB3gAbZLiAcLcs9OThOky
 nOKBs1PZqEck3TJ8HsAQrDBTB5r7wPaORJ6SG2jYCUVdlmkpgPMoBggnBBTgPORMs/XW
 9vWaPIDr9K+FLeEodF17NzvdZti4Oif6fLyGdCz4fVmilbIsBlpZUXGengePJd5+ELOz
 Rd7chfT/LQaIP0BL7s27bsphf8okRtDdfdfS+ymsCRnIrFiyxRWanRPUNebR8Rsm4TS5
 TGFkzPXpyuWwW5lUC7I/UkASR44uv6pjXsL9s3VW8OyGZbdYc/fMAQus3rI2FKXoNJQC
 oq6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hCIjw0o1
Subject: Re: [Buildroot] [PATCH 01/12] support/config-fragments: remove
 nios2 toolchain
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

On Thu,  9 Jan 2025 00:05:10 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> The nios2 architecture was deprecated in gcc-14 and has been removed
> in the upcoming gcc-15 [1][2].
> 
> Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
> removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].
...

Interesting, I've not seen an indication that nios2 support is being removed
from the Linux kernel.
Not that I've ever considered running Linux on nios2 a sane idea.
(Better to get an fpga with a 'proper' cpu in it.)

I know Intel deprecated nios2 in quartus 23.04 (suggesting that RISC-V was a
suitable alternative), but I suspect that some major telco hardware supplies
objected (I believe they use a lot of nios2 for embedded control code in
mobile base stations - they'll be running with a few kB of code and data).
We certainly found it possible to get a free nios2 licence for our fpga builds
(after being told earlier it wasn't possible to get one).

In any case I spent a few weeks writing a compatible cpu we can use for
our embedded hardware.
(We also use the first gcc that supported it - good enough for the code
we have, especially after some local patches.)

	David

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
