Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64896D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1D6813EA;
	Sun, 14 Dec 2025 17:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn6UVn168jti; Sun, 14 Dec 2025 17:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD86B813D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765732023;
	bh=RgaX17yCsyUFnYhZvlAL4bzBsOGqdaXfZbOjhpj2iMg=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=PQU7InNXLra3avEaorIbXfzrfHkTOM+msA9K2pIM5k3ozBJIvX8JdMSntNgPZ1Dbn
	 Dxlt1UW3TWpK24uYDlr9OIBuYhNQNmOVqz3l+iBgYT9387qyzd8L/FfagutOulEQBx
	 nuJnDkXgQNdAzxuEdxznfXFiAbPXMlcPlHLZDEwVvvu5TRLcglsRCaZQbYliBfBhPl
	 RzvMhUDz64cxfsVUpOeqddWk1NHor+kLNZfRol6bJu/cjKFkpLhxfVf8kbdD1pG6ki
	 Jq2GD2fMWTM8N1NuWOeOlZ9/EOXRTEXsxrH5s1c5dAqdWv/Wz8EBUg8SeR7+ThNet3
	 UnBkpUXkKurxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD86B813D0;
	Sun, 14 Dec 2025 17:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 310A42D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F2AB407EE
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHH2WSt2Kr-a for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 422864075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422864075D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 422864075D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso11864395e9.2
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 09:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765732019; x=1766336819;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pnzn2icJgZa/rWa90DRaj+4B1X/tOjOAlcItut1Qez4=;
 b=DJTJvAM2ueS8hyISAVEsvQElvnGnBmSCPCDAHVfXIVktD0skh/n9LD2TzIkgurWm9r
 JNwgEWMPJPfCqc0jIOzDcpO1hFMUePpvmOh8XH/FegndilIixbcubPFWmCbRjXDKQ39t
 ySujuWDg2+k+7LRxSX5QTzRewmi9l73UQjgtVoEx3q6+1JiRD/azmF+UwokTKrDulZft
 kiaVCCil/Hs9FGBZgB5ZrxgbQm7msvCWUDtZjiu1GeRjask8cCWovB86rNLFMHc8vol3
 apaYgHGW5iC9uKLTbIflKltT1/GnLiJiQnfO1dKhxdxDqz3QrGR02IXO/LVD7+6MozPi
 cdiw==
X-Gm-Message-State: AOJu0Yyb69oq5jjStn9RvGWAVIFX2kDLKSE1tO8J9KTqoiQugdLuY/Xq
 BKkrbAosPZdMvz02MMuatLxgLKJ1GLEWzfGso8Ndbsb+gkZuNZA/1Ueg
X-Gm-Gg: AY/fxX57w1D+4ZjMa5W8BAAe0ptjMuI+870zy4EyQh5roNqq9IdvSEug9OlSYeRMvUt
 rxjYpqVB9kgZ8PnYzPnhWwnLVb+4m5rpAaw/645wmucBcn1/j6SmC4a8T5KLqEzWmJo3Xx6K+Gz
 AiAF1vHpGJOJ3BMJddonsucA7EE/nnmfuSw5Ccx6WZLKTbToiLkIpUlBSA3hSrwdOm1rzcDT2ft
 XE/87xS3yLWjw3PxxGL3hAO6c4JeNq/iyS+3FTVxefQOYRqNOrbGwInZOW/TThrCoZKvLO6KPVz
 xNTN56KKtDKIo5JMwZxGItA9Migf7dMyh5tomliNiBN7t1a4PHXjo7j9R0R6SN1X+/9gfixZDMW
 AGYh2Ymkcwp1Vr3af1op7xkkbhQM3ynxyi3VTXWHEXcckAggZQ02SNrGZ8xr31QoocmJj/OCVsJ
 ua1eAPGSjmY4bGwmPPNMxno3e9tf/yud5vW640ZMg9i/d2tvL+5xzi1BT0nEU=
X-Google-Smtp-Source: AGHT+IHfVyuNo4C2RAljB/7vzSlpbuHeEACP06/SB82wC8K3oVSYOnX/UbC2L5TqRfu+XdH9jOne9g==
X-Received: by 2002:a05:600c:4e0e:b0:477:55c9:c3ea with SMTP id
 5b1f17b1804b1-47a8f915c3fmr91990385e9.35.1765732018970; 
 Sun, 14 Dec 2025 09:06:58 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb68866f3sm15743900f8f.36.2025.12.14.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 09:06:58 -0800 (PST)
Date: Sun, 14 Dec 2025 18:06:54 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251214170654.GD193459@pevik>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
 <20251213214107.1893921-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251213214107.1893921-3-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765732019; x=1766336819; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pnzn2icJgZa/rWa90DRaj+4B1X/tOjOAlcItut1Qez4=;
 b=kZ2vkh6y8iQF2x5r9OOmiOcSlwVvHwJEX+54enUkkbqvqidEIWhPZprj5JdZwLqMIn
 P0WY5D5aASmC9cD+ww6f+8I4RIwUA+3xvBGyhY5n73WAUktvMbRNDr6S+7cIdZYYn/dp
 wY0DlLxHL+VTVXHOmu7w8Yj52j/6bMSJVaLohUdg3l6OZGzG/AzEH0XPJdj7q1FiaP+W
 fijGkO4Yup/rPfORQch+XeqZaRfsR20FilSsX3tznWbTUi3NmG0I+zNfx5I0v/ch+bHx
 A0kVeKo/rthte+taKzSwLXWZKiAo6ySm8t3EiI7d93LUl5mJg+3jerFYo/2DGgFRrOpD
 LV+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kZ2vkh6y
Subject: Re: [Buildroot] [PATCH v3 3/3] package/rpcbind: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Hi Giulio,

> Package rpcbind requires libtirpc rpcdb option enabled. Package
> libtirpc with commit [1] disabled rpcdb functions by default so let's
> select it by default to enable rpcdb functions required.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
