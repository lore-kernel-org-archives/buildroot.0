Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C8CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9946164B;
	Fri, 15 May 2026 13:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGH-XvCAM8Qv; Fri, 15 May 2026 13:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E71986163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852057;
	bh=Yjvq/ygD/13zKmn5u7le66S5FTChc6pzQF53772JVRI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rqdyVQWO/+NgPo/2ZOSUZOmSm1neTNrpw0/Ltx6Zgs81dFrVjcarYtA7foh/3t5uz
	 whUiutnjdmkVmqefaluPWPS5w2Z+XCuxwGPn6jXGuprI1MsdUegIb0YnoNPiZc1DuI
	 8Kd/i4MiZOtQXDTBhr4YN3nvzus5pkPo7YofLqIpNBEhuRblCI22O20yPLgQi3RQIl
	 FxQsJy+9GjzcABEq/pzYptThtxsTLKaQO2uHcHEOICBD99aMrea/K9ouo/4B2rpYQm
	 3lRnGH814a42oGUNMSJOir62Meq8o/c8b5pKbtmNI/oFln3iV38qjoOAhv20EKB8bE
	 BBk+/S3tEIgOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E71986163E;
	Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C85FA36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B856084352
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozP2985N7YI6 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97BF88434F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97BF88434F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97BF88434F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so101962445e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852052; x=1779456852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZhfEKZF3nwLAWkZhgnI9f+LNIHpSgGZQgXq4m3pON94=;
 b=F4F1iYOHETzxgKhXPrpu2b/sT3/Um06qKMLSGgjourXdoVvFi96LBRQkYTB03UZdpF
 k4KIHe7D2IeYkvyMs25VV4jb+HcqsG4wq3+1qS3clglDIPcL/JXBW1rVLNwznUtNvKMF
 n/2e7IDV2NU/tPAvG+8PbdNtEU/P0A8ZyQUDejEoZCQP2pguieg6IrnoJz+HzRGAjZKu
 ZEVS5qCEIecJlJzYUY79DZjN7q550QR9yz2zqDt27nf6nnyQ3R7+yu57xNqLHphQxyCS
 MBLe2BZ4FAFxtQ3xNRpWqxrSqjpL1Lu5XIYeXCBTaDhh84D02aHfyrVLQRcqo46isOtG
 n2+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3axSzKzKnWbY7pyr9f4JWEaxkigtzvzhpOQE4fxJdXUJp+3wl/YlnOCV+Xo/YJPXQgdpjcNhGfp8=@buildroot.org
X-Gm-Message-State: AOJu0YypJ+LTLxYgljPG2ocUbyKDMGJG3xFgonKM7osTCE0FOthNT5i+
 dsnXI0jc0qTp+KedIVu0bqIfVlfnCAQg8YFJ3L5rb8maoSb1DvPZUt3YSU/IHhloDQUqdIqmmSw
 5/Ty6
X-Gm-Gg: Acq92OEZwh8kuVp20z9hNH5EcbNdn2XCju3//o+4XeBlhRDoyQnlHztCuurA5kUH9e8
 pIiwftJBf4gCAnc4rW724ulk4FKO8ZGHzClEvTuwLY4G8giot0qwmm2csAVgA7OadHqqH/F4EXa
 eekN15iQIfPWoVp24y1k2eFicA6teyO8Xi5EARaSfI3Zb6hp2CQfl9b5B4ZeDMJIdcSVJTZ9yog
 Nf9T3WC3WviU2/MuiFNYFQYBcHrZXL2fr3SLLtdtkA26a9ZKD3Vb793ap292OK6OLZgyJI3pupl
 AugLjzknVCabsvdZJdpEZbDVYnGeCvuNtCrxSBQNQkoNgzfxEL02dSh/CmpVrcyDYQFri8BQhAL
 2s3Mn610brarsRJ95JGs/vpHBKTZ6SzgcE0SYWjDnFsSfQ/rPJSPsDkiLNpnv8Jd4YgnQNdXAQX
 QZVXFoKbMx+F/k95tWanSV4aFj45SyJ/0KNdxQ7orTn9se
X-Received: by 2002:a05:600c:8184:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-48fe60e1451mr54376415e9.4.1778852051686; 
 Fri, 15 May 2026 06:34:11 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe83ba2sm13342185e9.35.2026.05.15.06.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:11 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:10 +0200
Message-ID: <20260515133410.316446-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430145244.1804343-1-giulio.benetti@benettiengineering.com>
References: <20260430145244.1804343-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852052; x=1779456852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhfEKZF3nwLAWkZhgnI9f+LNIHpSgGZQgXq4m3pON94=;
 b=beJQcru1S8d4HJC00BRtAEldSJ0yapP9y6hpMJD6hDN/BSSw3E5tMD8hH5HTTMHXIg
 I+pDfUOa+b3TZzulC527nlf9L2wB1iDm0FVdTx+E5WRXKzIdkpKUcfSmKcfcpmNZfZUj
 D2I6BtD84HqtGsGwgw9RyK2jo+W7fPjyZhnDhTTYJNB4BZ6bdpHsXH/AiCM9Vg1LJaUA
 v9zp63kg6vvfJ76SiQ0mwg0CY1gOIoCs9pd6n4zzEQUIAP9L7Dh0YaM78Clln3cA8D9b
 vXSgbo0hL255lsa5QFMIH7J9ZR2klEMt19PBYjX5/i5xYR8T+spXw4ZnvC7MadZVpXeK
 ++gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=beJQcru1
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to wireshark
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 039fe6604a..e5bc6ba19a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1339,6 +1339,7 @@ F:	package/udisks/
>  F:	package/util-linux/
>  F:	package/vim/
>  F:	package/wilc-driver/
> +F:	package/wireshark/
>  F:	package/zlib-ng/
>  F:	toolchain/
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
