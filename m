Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8C8C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 19:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897AC83CC8;
	Thu, 31 Jul 2025 19:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY5r2HpFsQ4Q; Thu, 31 Jul 2025 19:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35BC83C0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35BC83C0B;
	Thu, 31 Jul 2025 19:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC457160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9ACC8347D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb2loMtlBHQi for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 19:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12F668336F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F668336F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12F668336F
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:19:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b7910123a0so1270569f8f.1
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753989587; x=1754594387;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMKdcBQ4CVMCTsLRSywRyVz2vTsErcogXE+qHuJuBbE=;
 b=mxZ3fmPwcbfh30Xv2zOlEKZ3oi7Cwe1vp0lWrV+gcyuMl1GtVs3WV8LVLtihptXRJL
 N1YT4gztib6b49r/sPLrWR8wiUmaKgFsNmnHAPeBlDVxkBK3LVASAG3HNod6drvWT8hu
 yCqFadieiSTXfy2isutvXQb4iOaPNhZanRS6R3s4JxUEMltLqHr58w+lPwr8EAJ0hSHx
 /SMW/+6P7tdnN/N2HRE2pgvHBcQdH9ckCm4K4xqUSl+CTg3MC7bYezyXM0ZF+O0ehAZi
 ZQyFiu0nmpTizct19hTJ+Ogenq1f26pnulroPCX/xOd+7ik/uo75FRuOVMFh3lG7I4xv
 /Hhg==
X-Gm-Message-State: AOJu0YxiWB4i0F0KD/HnTt4JtoZhu4jk1ZQRsN2RY7HH1N9L1oqOjHDz
 dH11XsM+69jDqqY3ShfQpA/EhkqV5o4+ZX1lTo4Blqm9W7MOHSLpNkMT
X-Gm-Gg: ASbGncuow9jOrAH1lVh71SVA4X6nBJq1fhCc6vfi+6x9fVotaWUrgfuZP4usEV1CMBq
 jT81Tm/tmRy4qAnpSFYiq07MAGThrWCQ0R4VArSYOnEU4MGqg3n2xPldkJ+3szw2oPQvIRM0lrK
 MR0bS74kRhwIRxVqi2N7qgtwI9AQY7zwX+TwA6J6/WOXhm8rtNBFwY729BoQ0pXlZlEVtt2UyZp
 UOuN64B2VVNddexsB6y8zjJ1oW3O9qLxFVw0MlPlJw0DxHo0cwbG+/9vagSY0SlUVI/SnErHrFk
 d+Tsx2Wt2dlcvSoUOSEdtZ40FTKIUxOIs3xHa4U7G+9A2jVHf9ZkO+FFT1pD2tNDbZ/ui7ngSWb
 6aoCej7KUBW75sQe2sI4yF5LQOa0bG4lLYUmCEQ==
X-Google-Smtp-Source: AGHT+IEWkcLEGV7e1zjkTuU4eMco+5STaRDyFFrchqnDW4z36EFLdZqMMeBPoKiRDspTz2eBPFfPgQ==
X-Received: by 2002:adf:f749:0:b0:3b7:8146:463c with SMTP id
 ffacd0b85a97d-3b79503d1c2mr5667854f8f.59.1753989586699; 
 Thu, 31 Jul 2025 12:19:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9074sm3222782f8f.17.2025.07.31.12.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 12:19:45 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:19:41 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20250731191941.GA780832@pevik>
References: <20250731172810.2935094-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250731172810.2935094-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753989587; x=1754594387; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMKdcBQ4CVMCTsLRSywRyVz2vTsErcogXE+qHuJuBbE=;
 b=QmjxuhKsAkBdRLTstX2lyHLpfzf0IZVRvL0VupRtkvI1xRCmhZRCrj9vLFdl5/pnAl
 D8+uN5skSl6Qf1fz9lj3nZKvJRNB7snB54JY+ASngZ4xb/jpRv0oZf/nmphYCChd+Q7G
 0jNoq2WI0qiBO9VYeDAfuVjScHRWTcQz38+TXwmpma/d6c+mKb7mQRbrxfczWjROttJo
 YamoyCWdfgslaIbJsjBlsoTovC6U+1iWhUWWPGL9QRYO2xnhBYwPyStcqEjno/I01Alo
 fUx8eSRodx+lJXFiYWoCBKtgdV2VQN17QNd3uzMS37drNlguBR7XSr24sTX+rrjD/wTR
 mYJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QmjxuhKs
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix build with
 glibc-2.42
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

> Add upstream patch to fix build with glibc-2.42.

Thank you for backporting this fix!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
