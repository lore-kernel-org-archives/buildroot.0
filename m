Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6CCD98D2
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7780D817A2;
	Thu, 11 Jun 2026 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLLgi4HJnXSp; Thu, 11 Jun 2026 19:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5E3817A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781205366;
	bh=x+ATvSqXyR7J1v2clxBHlAqpNA7LuRgiHz2yRdEDHvM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UU7uhY1iUVmnI/pul3upZgxCp+6jcbwmmONnQ8SVSasZgzdIVfBnBwai9o3S0M5RF
	 aZYEKOxTGzhFrrMNPAVCCPVbNjB+efLvhG4YAjVKJPzbiFoo+WPWR4FojclxmECS1D
	 TJzaAhBzjI8A2d4Xrr9nEr9EGMdVUrxajlt7+RtbewyPGt3UNGbtcXQrZxiMNPlYKc
	 fyg8j9WoRldRpog6rJB6BMhF5dDn6kYUkN6okKjwEAQE1cPDkAsXOe8bQvnICJkiLx
	 JfeJZtNGF3XQNNRJNNZ5YeDNyNhmYcjNycQBLycYL/i9zW8qJbCRzx5lwTU/BdQWo7
	 WP0oT0cM5yIzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A5E3817A3;
	Thu, 11 Jun 2026 19:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3030412F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12090817A1
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjNzh1MXyqv8 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B0F681585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0F681585
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B0F681585
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:16:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so2096815e9.1
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781205362; x=1781810162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o7jBQgbvNp1tFTgmydw+Uqqz+8E4Fx63eMA5301ITeM=;
 b=sygYfH7RBjBUcGy5rdKkhezEEt3kQj/XC95GrGoVThFI2y5rbCC3Zffow80YUGeWYA
 qt3kFPqPHqTdqNDL7/PeaLQXfdWrwCJB66BbWlH3EMXZlRZHy7azQ2GrpRer1/5HtU3Z
 Rau+DSu+v55S42xXIZwrq6bVNbD93F6qUMDBPGQ9KeP5IAFK2JIiLSNKIc1L8mM/OO2G
 4DMYiNIb2xZTC8JONH50qgAUXq+r6gPd2Sn031db/jiOXVDTNltavdVZdIbzDchzcVrv
 gD+J7sYjO8ZrTG8fDfHsgI5/2ck9IkMk78+ZsNnFRNlKshX/M6EA/+FKTU2o5YMWtdLw
 gg7A==
X-Gm-Message-State: AOJu0Ywtn7zQbxVVQBU/R8geUyLhX9OmaVlxRy1jyGRgXwNqRJqr94yJ
 8Mcw7N2+bLphoPDgvg1xGjKsTyIPt+DIYfcCdqd8NdezooBOZWLZqPTPlJv2ClFsqso=
X-Gm-Gg: Acq92OFsrhUoIc7ZymYrzfw5uQV7q/4Hmyc/JOopaf1wkjlA/72phFRCZrNxEiSw6kY
 XGT16ErWY2M5yGTjuz4SKQpQ+1+hFbJKs0eY3emIKDqJ9CpxqsEXhjp8e1wteCAtAEyGyqsvEop
 EZf+9Cu1cRqB8uj8QKqE+V7oGrAtT5kXpo8li6haWcsm7KeI5lCrfw5KUMRX0UXwcduGnCfhyWz
 G983LqTWawBuTDo2mHr9yrgxI5lrJMYoJslLLVxwQzqABmxb4aaHDUErXhbruSmYC19IEgt4WJi
 akYczLQ4PFRK/c0gjOx1/XKzUZmoNp4n0mMK8gX+gx6y6MveN7okzv65shyz9YWZkHGVqQ6QBF3
 eZSPc78O9fogGDrS1XHyGM0Cb9EDdBsCW3SlEQq4GqmGvsrg0Br6yv1th7KtKVeuYIEMmpmiKfw
 KHUjjsqLiJ4h+Sf+kss64BVWTGr2z9jk+l7KPRL5QRL/s=
X-Received: by 2002:a05:600c:1d26:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-490ea9faa03mr204805e9.14.1781205361582; 
 Thu, 11 Jun 2026 12:16:01 -0700 (PDT)
Received: from precialexwin ([37.168.152.136])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c9057bsm101513105e9.5.2026.06.11.12.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 12:16:01 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Cc: buildroot@bubu1.eu, james.hilliard1@gmail.com, thomas.petazzoni@bootlin.com
Date: Thu, 11 Jun 2026 14:15:51 -0500
Message-ID: <20260611191552.414-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <be29a7bb-f97e-49a2-96ca-8a4983c155af@bubu1.eu>
References: <be29a7bb-f97e-49a2-96ca-8a4983c155af@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781205362; x=1781810162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7jBQgbvNp1tFTgmydw+Uqqz+8E4Fx63eMA5301ITeM=;
 b=XbsjVHkE213hlvnlCwvDD5Cp9CfysXP8mHMkutZHifGphrQmU40LZ1UJZihRttQz0t
 bu1x8lNqZMnelnUvLI8p01UOtZrHsjtedJH2aSRUyK9+KtxQK72bb5VNKL8sKFgI+UtJ
 QHUAiX2Fi9lZMxcv71FoQIrsSF/wSdH4YGS4vGOKD/6pGUDyXk3UT1hOs7CuMXWrdB0O
 YM32M8UftbzP/2JrV6IO/xaq7vnPWUVJKZyVXbJi36eb6ysSIzYTVNjeITDWjK33ZbcI
 b881KMk+7GFOtRX4mqIUOOpw4CXUs6JVeHgX5sjqBEbATjzzBwGscOXtGJczLZPhoks/
 WyEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XbsjVHkE
Subject: Re: [Buildroot] [PATCH 06/13] package/python-nmcli: new package
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

Hi Marcus,

Thanks for the review. Updated patch attached:

- BR2_PACKAGE_NETWORK_MANAGER dependency and BR2_PACKAGE_NETWORK_MANAGER_CLI select
- trailing newlines in all package files
- runtime test exercising nmcli.general.status() with systemd + NetworkManager

Best regards,
Alexandre
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
