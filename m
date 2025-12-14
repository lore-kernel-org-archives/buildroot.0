Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113AAD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C167160D98;
	Sun, 14 Dec 2025 17:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxsxkCMPfwLG; Sun, 14 Dec 2025 17:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766AC60D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765731968;
	bh=EEIGv70V+c9o8wzSXDGqYnKkrND+pUBgFOrcapDVjRI=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=NjTovSIxk8Ah+vsNXIp6fi4ndyDCcVkEyy/2q9pyi9/ZqSniHB/ABaXT+aJ57ALGV
	 JxMJTteV3LQlaxVDgiuv1B6Zny/Vr7ADQO5KQMcCuryDmJbHSy0iZW/+aaLAdCmCdk
	 y8yo19YMdpyL0wAMpPPZtE6vKdqJGEDTRt5IAhEMUHIMBkDgk3PR1vJ3MtoVjAQaKx
	 TgUCSIMc5/pRHFkch7hToI9etzK91IYiWDgo8+VuGiwQDFSJ872eTsN4uPCv8k+O0n
	 AG/yV3zWKHc/6CDYNwgL2cwC1pNeJXqh2cqj94RZsp5gF8Mj99HLh5R5Xd0GDsbSSU
	 18F7V2HKkZXcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766AC60D8C;
	Sun, 14 Dec 2025 17:06:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79D4F2C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BC618130D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fgans-Q1rSmu for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A84278130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84278130C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A84278130C
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:06:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso10658385e9.0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 09:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765731965; x=1766336765;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OKyrRrR7wh7QCiAZ+FXbbjPYn4vOL/Qx5i4CLVheV+Y=;
 b=UBtCrLEOyR6C7gb/zJqtlR5SRY1FMwKf45qJp3yTuoIwxn3ka+NLCRXeXVLgbZ8aHB
 KPMmbHQ9MC5GrykCe6ZcGNctuWT1/rM97fSuSBCnwxXHJe88yFIdL8JZycxO0SA3IlOJ
 zT2kTqgluA0aarzjDrlJsBUCUHtXLjf14As2HKWUEMEfhUuGt6gIiNu9BIgWFHu05hiJ
 W4VRl80j+NL2v31NE8JfyeBDTP4mZPJnKsQxockrT3pCvWadTcn1NQHzvi5in8hcOVgb
 uw6l5wSW5DEhJGCISrtWF9STfRLnaabaxNC1Gh8UBq5H5DdNieMEGYg0MRCH11N4CZev
 RNKg==
X-Gm-Message-State: AOJu0Ywl1N0YEBwKOwZZqv/nR3w/Hg9BIxe6KwajX9YaipeSJZARfU0o
 DxnWkslGh7QxDUKCgvQ5/CS6pLyqBP8wTi2MGVP0jS6upqwXXeN92B2M
X-Gm-Gg: AY/fxX6dG5oim7tBA3YjZpoBw1jZK01F1/Z8JM1zPh4GCbedCEJ+JsBe0ZCn9wGLfng
 zg2gomXt9V3HlQgc2f/fYK23bE5GIWDI05JFTmp2+/xfACe/qAgYxqBjqr4Kus3qu2qjQSwUKdZ
 AmmtsyI+YUzJlS4hr3QcW/9rIe5DomGiZ7gXoQF5TP/aLkV2n9iB2jMmiLPoXm4EGtxBGiFMEcU
 Yzl+Wf9c4mwkgv/W/ATEgD0/0XGDOyKygsjSIRApKKnzXbHg9Q09v62m5S6EPOM7iJLnpLGgPpQ
 Fv1PKfFSbORy5KThp3337o66maroQ4j8llfEbe7tvqPoMImIfPQFIfQNoQPjyJ0ua0pVgCiERlV
 muj6U1JNhHrtrJo/2PkKzYCWO38PawGgjpNx+w/f7pVrA8pfn6jLUyx/pzYWmOiCtOFjB6LRKYg
 D9YHvEQBVKG/QwtgZ5b13A8p5NBKqZGQd3Pfi3w5D+5wvyDsNhbL3RLCnauE0=
X-Google-Smtp-Source: AGHT+IE0G2wH2HIiC5cvrmdxxpy5AtkiLUiqSQI82ukcxiwJ5X2QpPIlX7j8un7mFCX05OuNHKzWZw==
X-Received: by 2002:a05:600c:3495:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-47a8f90f364mr86807285e9.29.1765731964595; 
 Sun, 14 Dec 2025 09:06:04 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f49da20sm139462975e9.5.2025.12.14.09.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 09:06:03 -0800 (PST)
Date: Sun, 14 Dec 2025 18:06:00 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251214170600.GC193459@pevik>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
 <20251213214107.1893921-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251213214107.1893921-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765731965; x=1766336765; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKyrRrR7wh7QCiAZ+FXbbjPYn4vOL/Qx5i4CLVheV+Y=;
 b=JvoWGz0FoZUT/0DiSa/eblgRSzzOFc17QoFVsuksMz4BsnU4AuSmpn0C1soRl8qJAJ
 sRcczVf+P8VSlmg43lVl4DtZ2osC6iocB0iVj5PJUe+K+m3Mpp/bWcTv/6CNrLRVZKYT
 lI8omm6u4ek1ZWWkrn+biZNRQ1VnMsgwo5abQCYOfar8AJEAyieG2Ce11/1e0DvS9i5s
 auw2gXNFWvCssO2n47zXtV6lPKMCPXAUBBcGwfSmIViAJH+E5/hMxjd8l+FfQSvb1gxm
 q/d0vov9c7ay66XvgANfat9PlKi2dqUPC9f7UwXg0f4r8LQhjBuA/lRuLULAlIPpBL7m
 FE6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JvoWGz0F
Subject: Re: [Buildroot] [PATCH v3 2/3] package/nfs-utils: fix build failure
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

> Package nfs-utils requires libtirpc rpcdb option enabled. Package
> libtirpc with commit [1] disabled rpcdb functions by default so let's
> select it by default to enable rpcdb functions required.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
