Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385C9CF6C04
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 08:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD9B960D4F;
	Wed,  7 Jan 2026 08:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD_Sf7PnHHCe; Wed,  7 Jan 2026 08:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B8160625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767775858;
	bh=9fMPVFhWz9KYC/TlwE5NwtjfnEL6tCsnQgo6ftyPZKM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BChC0QRem/zglns8NS6k/SZpYd1RGnwMbNnLxQve6HUGF6a5l9fFudEd329yfd6Be
	 fgsrqRYu7rslQV+yRdWB7LM7YeQ1RJvYdAPcTIs+LQGoSKWYDKjIcIezuH9wWel+fE
	 TdkB/KwP0PEIJByaIH6Tp3uA0RpKL2ckDPFem3VmhS0gP4mhUbSc6xJQeh5T6Soflr
	 Pgsw5zsadUpxXyJGWwpISpvtzxjA31BGgEWZkpPvAQVF6QzSuP5wmzL4Vi+B6JI/IW
	 1FOaZNKcVSuwSzXw5lJuCIuqB+y4CJ8/sBCvxBAdcvYtGxQqGXDmObDrwO9LL8qfTN
	 OFClSqWu1ix7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38B8160625;
	Wed,  7 Jan 2026 08:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA75E70B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D8BA809EA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OZ1MeEQmJCl for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 08:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EEB2809C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EEB2809C7
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EEB2809C7
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 08:50:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6503b561daeso2718205a12.1
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 00:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767775853; x=1768380653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pQqGf6K1iV/heAQve0RrxUjrOpEy5/UzMRpMVrNg2cA=;
 b=ERz5vOJTEfZ2THVEP7oF9atZNQu5+O2cfuTHwmkpWr3ixB47pgvtFeMkiWv1msrJqu
 1HeJC5nt12o/3W/ng0L+2gxsFdWqEA+KEhRVdZCEZLrVXiNd9P30Ne6z05V6qkJZp1yd
 6CBYuL+q6eo4M3YwNtiSQhrV+FiZ5ASl5unhUV9aIheZQgeeqqOs2UZQTHwT6vaVlABt
 nN6Zxvh5ltVwKZNLkwa6sECwk9oBQMDtt8HlOrr9XbWI6T7vgti+G6Ctu3fA9kMszko2
 TobxZmHTkM8QGHn2MSdbwwHd9q5aBGkOraVB6yNG9zGSi5AXBlSpswJ/f8D+UBxhEbv1
 6Rzg==
X-Gm-Message-State: AOJu0YxFHwgoR2CMrqB+4Db5Euguud4YUGcFOkOLf+Mu9o5qOtNj6DWv
 pjlgfvj2HzOHi84MCTpqN6VxNsCDpylCQQni6gR2C6w8F+RrF4iP9NR5GsTa
X-Gm-Gg: AY/fxX51JYolV+IyJGgsaWS0QkC9Il2bxb4yN+qvTGuf17GxbQCq2x3EyM+IdqOwlui
 wApCw2EiSVpOr0L8V7bWPQ/nmhD0VV+f7MC3C1qoY+6mw9zE8/ahNakv1niPDD+DH9y52pkcALH
 C78Zcd55NUIae6UnBbbR4d9BmTJFok/9YuAk1+KsO847sm4LXrtNMcBiJ26OZqqL30N2cgSL+0j
 yRsLT4lQSmI61fVe6q8cUreJy20PPFYV6UHePzY0D686xtPGoOm4N9vQQs7L5vTCwwpnxtnbADV
 +F7R98rDEyTUWcsnSW9LNQcRFxIEqG5z0AhpAf7At7UFhloW5QlXJ6BIux/lO4c06ZshB+Qc7Sn
 qFK34l5sSYTQ4o+jjX3KrIWzYNY+WOli2m6tpdFHqb0vtSS3Kr9lbRXdT8Pb7UqND1FKX9vyBV9
 P5SbHqG6xsfJxWdc2Ru62b2cXY7A==
X-Google-Smtp-Source: AGHT+IHhKm0wD9EQ4ZsSputRula4us1BMcaG1iHS31WmFXlPaJ5B5Vd8fQ4XgYFQG0WGPEvUFh9brw==
X-Received: by 2002:a05:6402:3551:b0:64d:1f6b:f594 with SMTP id
 4fb4d7f45d1cf-65097dfc572mr1823411a12.15.1767775853079; 
 Wed, 07 Jan 2026 00:50:53 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c446esm4173197a12.6.2026.01.07.00.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 00:50:52 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	shirokovalexs@gmail.com
Date: Wed,  7 Jan 2026 09:50:47 +0100
Message-ID: <20260107085047.248907-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106231110.991548-1-ju.o@free.fr>
References: <20260106231110.991548-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767775853; x=1768380653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQqGf6K1iV/heAQve0RrxUjrOpEy5/UzMRpMVrNg2cA=;
 b=mJ562shd2hEh8HXM3Tq3dNZ7v7SiMcfPdzA++bbM70uh51ZPPrCltHSzLABUeSL9do
 VfVHGq9hfiEN1VxvFQ8N4Jmn9Zt8bcbZV3VgcbvUCNgnNy0GK2lOgkS9r9Fhvy33/Tvf
 C9YelYCMV3iCKgrO1zi0pgXJZ2IrOVxx2kvoQZI8BX9Iym0LOHSV2amc6yXgYadzH61S
 Bz56tprwQ3JcTevV/sHRTeKD+qHVxn50Djx/WuMcr+N6fiWDjOwWcHnWrsYwcHqfjj5K
 OTnnaKb6F2YXoyj0NpHDIvWtXMmS8eit8BlI/n79E4hMIlhRJPXBKZmNps9iaZLLC+KI
 rtjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJ562shd
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add aichat runtime test
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

Hello Julien,

Thank you for adding the tests. I reviewed them and ran on my side. Everything
works fine.

Tested-by: Alexander Shirokov <shirokovalexs@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
