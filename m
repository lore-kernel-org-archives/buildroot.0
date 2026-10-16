Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88958CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 22:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43D5F40986;
	Fri, 16 Oct 2026 22:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UhOWg8b56Fn; Fri, 16 Oct 2026 22:25:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63A7840980
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792189539;
	b=O1qnqBK9jGlev1Bi2tXeAXyQi66M9WBso3D9tCNO0m1OxctkiaP/tCa7rVziBOWDpbMa
	 jLLYdjII7ZpbVHC/ZEscZp+GEhnZxhsOZj8H2Ay0sVNozLW6iIo/alEmTZIZdR7627A4C
	 KPyTJrj2MayjzuqMiUm5niuUpcnpN/fRvuZWgHKmzv7rjcTwUNxBp+7/XL9s5ISYF35ZK
	 SLCXRfZYDC/mj+ONv6whIITvKvVY+35Rpa7P0pW0yGfClDenmaSkGVi2mhALgStD4lRrh
	 GRBTHEZymoteyhhMH1/hqhr3cewZYmRZTSqV4NDno7MA8XLWe0jOtOZ039EeXZO1r6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792189539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ECsitl5TqJrC+HC/YLYa//7V0M79fcO9Gxmvlvm7Mb4=;
	b=NgwL409KkpOpryGv+QQL83P/oV13K4RsvSWmJAZqZrypa4MvF2Bq22ZrrXecElB0mx/D
	 vzvrpj0hIty7j7KzIyKtUa8R+J2VPKNJkQDgG4WoYz0l7kElI46EZHbuuJ7ybUK4M7YIe
	 Z+0UCFLg5JgXluAHDIg/GDASTPv/M1xzvq6XjpLUYGM6h0GpRAr6gIiHzWH+AWpgA9KUg
	 0iiTJWrKWyYpwqgdloX3Hw/W9cDTNXgxs6XziNMtHmogIvOU5baduP2UHf5pEYMbR/wje
	 ACxL7r4ehIOeLuPDuI8EjcV6HFsUL+KwYdZV5SqsrochZ+DHL/7hGKkhcRqSGn5CO3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792189539;
	bh=ECsitl5TqJrC+HC/YLYa//7V0M79fcO9Gxmvlvm7Mb4=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=D73owLu4GiGq9+835f3v5qAdb5Lp6ewBFSMk4aerXuTgTep2q9gItfOBpKeZRoh5e
	 BqcdnEH3o7I8rGbxC4MFDxdRPdqwWLoMC6474KqID4FnfTMN6N67r0zjs7zmCu1CDI
	 gGo5HzL2kexfVFTvfikxn/jsJKbJA9ub+IJk6Q5QxtZAudd+m5RcEloHa3R9whd34p
	 YLsNWlP4l+99CbRIeeJbI2Wz7q5yYMtrXnAB0amX4vjgq2I4w1VKTChWy6xZKOHKyl
	 quclYOfoMVWdIRX5vlNz42dRtPVzfy8hekSQTjDJBxZlGrD7XnIrsDw0aJdGpepj7Y
	 wxUL/x+w/ShmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A7840980;
	Fri, 16 Oct 2026 22:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC73879D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27AD60B07
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgArW0b-jowV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 22:25:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B344260AB1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792189537;
 b=mtl81fldOMBKs1Z/bDsCIKSbgqZwgnwedtM7bGi7Hm0HrJ/6BYf5lagsfu/3bs3+y73D
 Nc0bKJiQzWog1S5RIv9Of8gjZCgbvlYsimLwdnLXkFJBA+MDJCWEiVLwr15obC3Ioizvk
 8SnPFgGFMkW9hayDMIo4AdLUf7BouJvXlliYNP1OUozLIFLzMTVUWpl2jJ/3rvPK0Zs90
 XTCBp0YEBpHO7Noj1vAUq+ZedskC1JrYfQsSPUq8ijHWNTlE7lgREdim0n5Ab7bvG26sb
 D1SpT0ErdAtFXkaOzwNqKnr4M6ELVl4+6yz5wpFlpSFI6QUGSt2AL4xJaTawskGMO0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792189537;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=NsivzVb4sVVxgaA0x6jMaW37sNyIaae48HniVsdhFBA=;
 b=hAR7qgBRHgnsdo/TIrt7oE8pYAHFWgdEq0v0tvsBgfQD336YsX3Mqj3PXk0WywueKDLp
 JnnNCMFwbyzo6Wu1Ijj3Lw8XD5qPRLt082PFRzNRdxt5P+R3G5rkBVTvg60/qoArZCQfj
 boZLu0H58y3Hony2bcL5Cbimc7HTdGKhSkvaVBJI9KxScMAaZ+14kr070W4h4KyQaQ5TL
 zX2zeeRNV1nxaOIfdSwDo6GpwYKwi9bXnNRT85jaREARqA+NC+c8nS3xNQQiJOvknFfpd
 B5OxG6xOfEcpyB0e0udZuaCCvmcPVc8Pb0JVadBe2agy9I1vkdFhJmSNFoHqyNNNn0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jbKHZaZ4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jbKHZaZ4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B344260AB1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:25:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso4436505e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792189534; x=1792794334; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NsivzVb4sVVxgaA0x6jMaW37sNyIaae48HniVsdhFBA=;
 b=jbKHZaZ4gquMWihzcagSPrP21BAOCjdgunszwmh8mhcRwjJRBQI2j+2X615acxpsbe
 uffaq5TFgftG7ApZ5HmDBU789aKoBlv3NZKH5r/S8zHxZTh5F4QCvrNXVcw37YtznVZ+
 vrngpwpttP9U1UQHj/GZfrajupvOoWwlik1jj9V7ghZcgnZ/BmLyvh+D7Q3QBMYf60nO
 0FxXfRA6PIwz20HMFv+UYMf07/BtqGZ4UDsnhxmW90wWxGEg29hv1TWjzKEeWIRoqFUj
 4JMAexc5vT2yIF7KGecOjmq7FmSQSfoq5s+zBoAT8ivQsud/FoZiV213Zv1W2mBgNBKX
 2Elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792189534; x=1792794334;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NsivzVb4sVVxgaA0x6jMaW37sNyIaae48HniVsdhFBA=;
 b=JJzdl61OGIDp3d6Fz5B59eh6H0Y9o5pdk2/4y2avM9j7wu+UAHBjYUjiqwSjg+OmeQ
 Pib/dCd95SF4LrfvVCRDFlWmdE1d96pJZK3k09TTfH2V4kov4M46Qq6ru316F9bV6xTI
 hs+Pb7Qp2K1jCoHihUAbqcSGSD5grDULfSvQSEkswWIlG+dvOBE0QUgoUk41NugRpLJ3
 pdvKvbOdN61uTeeg954w1t/cGwR61ompWMwbyFprK52r2XdyaSqjcOnR1vhazDoaJkcq
 z1Ef4ZPlZoPtQmlKuSLjiXYQTlKPDKZ3PJPulR5XEEZDNtSs9yzHVzXxpR4ngxcoLeIF
 SY/g==
X-Gm-Message-State: AFq9FYL88JgTGBCNvkYAEPNm/iS9WhFIlLWxHUpIaOb8uNepdOQJKcBG
 KzZMAv44M/PUSMCkbQx3t8d+RX5bcFxyIMR69jSX6Niv8aPigBWmEp9lR82zFw==
X-Gm-Gg: AYBFou38evcJo3Mgcs6S8BUz2bs+iVyIBk6ipKETWU6k7Eezoaqa8sHupAwhyXkPMZA
 kaOdiSxCyDFBiinoIaAip1LOTd6jCLTwJ962oz2FyB54X4sdZjMi9+XhZMg6gnjNoH/MUok/nhA
 fkTBFhK2S4sACr1diQlrX5mYaWleYJQIVpxsw9aNMHM5ccSULTGVz/tuBiAT8BgutJnwiAhoamA
 FHhYijRdZxL/MTG2IsmDoHPS4MRFl9L3poLr60USyE8O7TJMJOrXMXWqWSRemdPKe4woY46i/Q0
 U6K+A2HNSWNOF5wgbrvOl79MLwfqsWF3Jp2yZNskd8X4wf7FG7p6N1nEhefW6v0TL65LxSPBLdd
 z7q4GZNolELwFTqwXW/UD2sGc7ZhV3Lz9WZiv4XczRoyEz9SAc/y53v/ajPRdHkB+jT8bakDdg7
 4JSv7v0EEfmpnfugHHxURP0C4Kp0strBulwlDtE/+GeBe7xK99sI8dvpzAOWMgrFTUJhDK2B5LV
 PO0RWyq8UHm3CmKjZMwDKlgZY1mhKa1kGM=
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id
 5b1f17b1804b1-4a1d75ab363mr24736415e9.4.1792189534070; 
 Fri, 16 Oct 2026 15:25:34 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d7659805sm29264125e9.7.2026.10.16.15.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:25:33 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:25:31 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016222531.GE331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-4-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-4-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 3/7] */Config.in: replace bool entries with
 prompt within all choices
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
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> Since Linux commit bea2c5ef78 [1], first released in v6.13, the prompt of a
> choice must be given with "prompt" instead of "bool".

> [1] bea2c5ef78: kconfig: remove support for "bool" prompt for choice entries

nit. git commit is usually referenced as hash ("..."):

[1] bea2c5ef78 ("kconfig: remove support for "bool" prompt for choice > entries")
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bea2c5ef789a37bace99f2f45eeef3be4559b228

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
