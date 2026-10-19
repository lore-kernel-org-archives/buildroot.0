Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C92ECCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2394460724;
	Mon, 19 Oct 2026 07:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-YsgF9S6SZG; Mon, 19 Oct 2026 07:48:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6149360606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792396094;
	b=ZzUeC2pzFNQRdMSRlLTUz25joBzQ+NiE5s+4OjdqGgEZmDTdL3vDqKxzyvX7EB/3Kr6u
	 2pRnR4YXi5qhknk3TQt3Q34oap7WTLuRpf89ChEt+PK4Gr7jax5yOppS88e1PpgRhqeMJ
	 3sT3JcyCIa6pVRdnzH2GZu1G1nmmMrzizs0PViuips/UNeA37BdfaB3nOQPiVDth0taL7
	 wAnlp5xU2v8gHN/fhLXlK5LOI5IZtbLWYZDGj8YVhFHu93hF1Lym0VEcaBq9mfmq+eYC1
	 P9ozuN/2DeGJPTXD1QbNxRricQTMY5oL4T6ZnwWV3CSAHIyUmELo57xR12yXDzEqdvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792396094;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/rkg3FOfJt98QV0b4LgcnN0wcKApmt0dMz4himixDJU=;
	b=L4sVDp7+KNVnPje1BQUDe/JDWpA6/2dLxZoNnNtaRv+SiTRmzjeotO+pCVavrnOp2OU+
	 9CLRwExFWicboQDun739zoqNo7Lz3E8tBp9Nzn+sJiOfKXuSsK+s7o2JczXUnVzFFF+ui
	 Vjx6fA4QINj4ms4w+UGxDV7jsijecN67sTGZsDwjOc8zuGOdwfVdrb2CQagh+N2p2p4uT
	 cQMwKMgp23FjpfD1DcF1juPmzLrR2CiUa0KyIkPSD+18jpnpCfXZe8mBD43VgCY9ZP+iq
	 JOOCcHZF+90BOcyW63/i/Tq+s9DKhSN7WaqQonAiCMDQ0sL9mXfWw25Z3gaNPAgXIpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792396094;
	bh=/rkg3FOfJt98QV0b4LgcnN0wcKApmt0dMz4himixDJU=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbiHFol+UudQph32AGNz8Sq1YoROYvGEg4TcnMF5vM2oPgn2SicVSMYhwt8ZrRTl/
	 tgJqvwlYC0tJIao+G/0rLNsr3HbaHH8f59NDezQUXjqvilQW9UBvhVrtAqxf4KmdRn
	 Mogo+ANoDV6AbjyhJkMG7zbwpCb/MVC3IksfCppgwMZGUybHMXpjGwuBOY+IJFd9bj
	 25tNC3rJETWnpvhq7DLe900tyy9ewO8vuL/RLM+ON3UAdOXnF2A/9ft1NW6In7xCbM
	 UN7navnRSlFvxHhud6C6KM6EZe6zsm4H9DASeCoOQqVgNI6c0Jn6dhdyyTW8m1ucu8
	 U0/WCwC5BKouA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6149360606;
	Mon, 19 Oct 2026 07:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F162A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A8A80F5F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypVJSSD-ccYr for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:48:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 73FC880DE4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792396092;
 b=Pd5qk1hPlYU5t3/X2DJQeycF6K+fCuUaeQhuRvzxE8cq2thH6QgHigY8AWbchUpjgiVJ
 tRoeWqLGpIcY4KQK//j8YsjJepxtsvuNX9grsAY5KmIiGS7yapvKTxVdcVqyIJzqzKRUW
 FdNky2dupqlCpATpv97Ju3adEVRxChsXgGmSdkfNK4a6Z4SYG+5zJHZNx0VHKXMMO5x0U
 j3BjB06erlYXIgD7FayTbu5hDhIEo7ePN3DNR5OGFA4vTcPlV8KBLUvqXdHSjGmsvnk8m
 INroaB3BiCAxLoSBfgI6h5GO2MUqBPS/8K/T/b/udgnJPcMjs1ktsFY8ZcsbtUEn8Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792396092;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=wTb64Ro0Sv0+r47dV0XYaCZ2EcG9HZFda1eUjrQmD+Q=;
 b=nLalp8hHN8nxyyT23MyzcRKkRtE6Mx4VL0oIpi51nGqkbzXlBnaAG6+vtzbU5xSwWoKh
 jVhauhFK6DEIOv9FjwMn3wIOc8CmS4Cb9SmX8ASDJ43L7LGMdsjzAZ32XCD/flpc/Sg7q
 gozKRohg26dM3v8sS6pnPmOR9mA56bkQNYsjokwu/gugRVSbkzI61b6mPIh6axQ+E2b+x
 Fn9kiBXaBuhkDyGcZgZDOKAINfehVwmB/o9F6ULX6F0212qSzcX00t+sNGTkFnzAuy6fO
 mQSN996bqhqgIcEvNogggQFUtT8kTSkGasAzcitxHQaBH2qpkRbMRZ8zZSPoJgPIZuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Rjz7NWnB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Rjz7NWnB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73FC880DE4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:48:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so13590285e9.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792396090; x=1793000890; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wTb64Ro0Sv0+r47dV0XYaCZ2EcG9HZFda1eUjrQmD+Q=;
 b=Rjz7NWnBZlazd+T2yUOIKmx+ico0L95KV1glt1Zt+f0WSPkxPsW4M3BgUCnC9zAftG
 uJzVWqqPPkJgfRp0y1hUyyXWmojV7bGdbO2F0rU3wdqvs6Vb25tnO0v4KCQ/A0I1rk/2
 rz8hcJ6L3N2V1xljiV5IyR415mewth/siylHVV4Hh/Bccp/tUl6RWAmD/aPg/0hWCsK+
 ga2X9B7CnsijEhe2ubRiEWohLJKZvjPDwk6pNQnWYkXD0jYslheVLwYHmENT0UnxpdPT
 RKpr9NI7macpmx1xMWmMTV915/NNJXS2MkXmJxaPe99uniqQbqG9XJPdUT6lKilPs9Mc
 Csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792396090; x=1793000890;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wTb64Ro0Sv0+r47dV0XYaCZ2EcG9HZFda1eUjrQmD+Q=;
 b=LpBgAJob6VToHJddjyeg2/eWHfPVwfFdwqIa2Vh1/YEBscMbMSrbRxXr//xbOpvvYa
 0s3zJDx8zWhx4g89g1jCzmJJEDKgtGlo63hrsey2EG9OfUs5rZiw81VVWblTXHD13Isp
 MOOfrWm2BoMlalaPK/wzxOoAlc545+sUgVOGN84CHqBzRtDDhLaXmt5LEuuTiCV3wLGE
 0MFFi0waZN4/k73GtCuBpZXlczECcPeWH9FDI1EbxsiF7/Em3r8AmsK1SWQ4vyMl4S7k
 SCxqQTzUDlt5x+PjZFNALzXnyY/65aA3Plg64W1LI8yecy35MRiXw6QeNCghXmclhRaF
 4CVA==
X-Gm-Message-State: AFq9FYK0N049E4eVRk+I3s2H8lGoxjEF+pS9cFiaMtMpNbqPohsVpNI2
 sXslc6Mr9wsf8bJHhUkN6tTaNyfGyauZwTU3CGj3XAP7lemVVrxmCsfJmyTZW+js
X-Gm-Gg: AYBFou2Wy0DnnWI8GEA+eKWSx4BAzSmG6dXzw3BU7GEZTiY+mLDPZc0LAUNxCdBV3pV
 ToXYCdwrO/u2uGKcZUnqATY4R3ZDNReCQQA+S4nL6INf3qWYtzkf9pVnhyHFffsKpNg/HWmS4z7
 iWTI1NgXcTCTWMkZUoWS2XW7NnvULn7SQLo5PnlOAsoPf7Sa/YfnJuFnobm3NjoU/PcGNzhisb4
 ddfu7yXIbjnNXXsJmAjCDpzwcPg/FLuGswGQ7OiGV9uG7+0O1UZQyjvMIJ1vQdSV8V3w6tStvbq
 KbHNeUnJyeV795JgS1YeygDzz3KfWUcx3zlaCdkKYqOX+BY5l0wINxOHkZuULRcqktvC0zUJ6a+
 plnw0fqUgU0n5wq0HW/xMFUKjhGfHgeVEVMev5AhzSGc0xprE9Va5CCkU/jN7nv3y91yysUSMOY
 x+m8XL50HifBkWzfPiFNoaMv5vk7xPdC0YFwa9RC15ExdUEqgwQNXN1eRy9oXzxZfUGTf+0+e5T
 r1iDaUKjVv96SfwkuY91Dy4XKdXPu0o7QlL+Ba8c2zpEtArW8rPNQEoLTwjaX5k77RGbvMsWpQf
 yUS71YFdxhYP
X-Received: by 2002:a05:600c:1394:b0:4a1:7bd4:d07d with SMTP id
 5b1f17b1804b1-4a1d7628895mr145571465e9.34.1792396089799; 
 Mon, 19 Oct 2026 00:48:09 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1dea678cdsm173386095e9.1.2026.10.19.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 00:48:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:48:08 +0200
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vladimir Oltean <olteanv@gmail.com>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <e3d482d50e74c272cd88dca16aef47b4b4e0a57b.1792395346.git.ldenieul@iliad-free.fr>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1792395346.git.ldenieul@iliad-free.fr>
Subject: [Buildroot] [PATCH v7 1/3] package/qoriq-restool: add runtime
 dependencies
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

From: Maxime Leroy <maxime@leroys.fr>

The scripts shipped with restool require:
- bash: they use #!/bin/bash shebang and bash-specific
  features (shopt, declare -A)

The ls-append-dpl script also requires:
- dtc programs: the script uses dtc and fdtget commands

Since dtc needs dynamic libraries, add the corresponding dependency.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/qoriq-restool/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
index 600c2c958d..46330e8cac 100644
--- a/package/qoriq-restool/Config.in
+++ b/package/qoriq-restool/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_QORIQ_RESTOOL
 	bool "qoriq-restool"
 	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
 	help
 	  The DPAA2 architecture in Layerscape SoCs consists of
 	  networking resources that can be assembled into various
@@ -19,3 +24,7 @@ config BR2_PACKAGE_QORIQ_RESTOOL
 	  that specified in the boot-time DPL file.
 
 	  https://github.com/nxp-qoriq/restool
+
+comment "qoriq-restool needs a toolchain w/ dynamic library"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_STATIC_LIBS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
