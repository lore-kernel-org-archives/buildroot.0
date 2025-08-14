Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB3FCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D27D80F0B;
	Thu, 14 Aug 2025 20:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go60NQVydQPB; Thu, 14 Aug 2025 20:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF4280E77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF4280E77;
	Thu, 14 Aug 2025 20:32:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 181581BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EA8607D0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvKZLaMJ3NWi for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A8E460763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8E460763
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A8E460763
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b066b5eso6655585e9.1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203530; x=1755808330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UsGpPR3qWHaLPshNH+rppGn+0HnKiOhbFXvRZqyEUs=;
 b=JETW1Tg9WPAZVnlqvDU9hSuqgXytJyOIv4Q+ud2X9UwPNB9Ctjjz9OvxUPmxCzsHNc
 yxvKCNiwBlvgP+fFBaVpYCumk34hmHtWw5ZfmZCici1zlkLLStBoyykmQjCWyVqqdQWS
 Lobxn3/d2iHp/rlsXL+PK5KXkBz+v2MoDlJ35YKUy6InSbU9LtRGMfkqHFidkS2MvMgM
 W/cwXLFkN6sGJk5RNoi+vc8S1tke9osaYfD8NY0nN8B5XueHURSWV6CPWordoHr0ZtDc
 avkSpWcW4CO8ERllGsnT7kvbYalEVEDLxKnX4NSPLBd9x0J+k/d+0VxhSZvKgF4iN08A
 uUAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHdpu6LnWF0YpEdwOX1zPf6D7mFj1C+JBL2Fl9WkXO0IwVduaN6nEfmTP+v0uEbfA4a/2wcrXu5yY=@buildroot.org
X-Gm-Message-State: AOJu0YwG4QOYUGsYz/nmKeNqnvnh1kPUaWIsL3aiT5YCRjmJ/DPNV3JR
 933x1MUfo27tt1YnDpDGYvTUlqwA+6s/IJj9kvdIlTXZyxXl+fTQsbMc3i/VBKIcdjSN8hGKfEt
 9QE4HsXA=
X-Gm-Gg: ASbGncvVq9ciNN9pcT33+jcq0CK8qEZmDr9/GAhIk/1544DqvhCFHa+D4QZFEUWNHGS
 rfJN7zf8adCTBCu7dKYWR+6z3vFUIrGAvfrlLEYz8q3WrAA/WBtVm1qnP5yTuEQR63aRRzNwSrN
 Te29ezoMxyn25jvt4+myYxKsa+aEQGaDnsAMCitI5CyUkbjVfZB56zvOAsNOvCpul/EdI/LtiIN
 jHjtrv6eHJBN63VV/Y1yfKT+bEHL3pHbXA3W7y8YwVcsamihn5kgiRLVYHdcFALZEoZNNGdE9pP
 SJpcFC5M20aD3Lod8ho8OvrQsJub2iHBCVxeBbSpLZf5t8M8SpVNdNJjlHYdw2SR2afmpk+NNpN
 hqtoYfndZjIZFIw==
X-Google-Smtp-Source: AGHT+IFuz8WJFmUopx9cXCzVCigwZFO2HEGLRGyo7uUhl5JWMXMt/imJvQpgPTU3S7aGCljtJ4BRDg==
X-Received: by 2002:a05:600c:a06:b0:458:a559:a693 with SMTP id
 5b1f17b1804b1-45a20c0cb6cmr2414855e9.18.1755203530179; 
 Thu, 14 Aug 2025 13:32:10 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4a2187sm53681377f8f.70.2025.08.14.13.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:09 -0700 (PDT)
To: Neal Frager <neal.frager@amd.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:09 +0200
Message-ID: <20250814203209.2816548-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806082428.1044021-1-neal.frager@amd.com>
References: <20250806082428.1044021-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203530; x=1755808330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UsGpPR3qWHaLPshNH+rppGn+0HnKiOhbFXvRZqyEUs=;
 b=JKjOInzAp1x+BDUQRQ4AKFdeMuXe9ycoGvpowRcFHzl9OL1imyceYwrHkBGOqcjmbv
 zk51jef0spyYzqvEqYRNMAeA98K48LRfrFnFsDLzxAT1DgWP7wl6DF9j/l+Qi1QASs4g
 xRBbJQ3K3bx5BIM77TzxHUEE9PJeZ2W3bLkXJb1+9a+Yj5ye0NENm+ER6w5m+XUkrCwb
 KQikboAgLoxCxZHp/J1qBn3arlCtXwoPwAJOZJLV5aiqCzqfRMkkBKCDp+cidsmo4zTR
 +Sgm4s37ozWJm4w5SnO6rH3t1WzWfNehR1qAtTsGdFXdp4sT46Bi6PzNdwztESt6rB+7
 y1FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JKjOInzA
Subject: Re: [Buildroot] [PATCH v1 1/1] package/qemu: correct help menu
 spelling error
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
> This patch corrects the spelling of 'Xilinx' in the help menu for the
> qemu package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/qemu/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 2d15ab1ea9..ff7423bc4c 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -211,13 +211,13 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZE
>  	bool "microblaze"
>  	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
>  	help
> -	  Xilinix MicroBlaze soft processor.
> +	  Xilinx MicroBlaze soft processor.
>  
>  config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
>  	bool "microblazeel"
>  	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
>  	help
> -	  Xilinix MicroBlaze EL soft processor.
> +	  Xilinx MicroBlaze EL soft processor.
>  
>  config BR2_PACKAGE_QEMU_TARGET_MIPS
>  	bool "mips"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
