Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F9CCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E50581692;
	Fri, 16 Oct 2026 15:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiVVfDZcK9yB; Fri, 16 Oct 2026 15:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 67D3D8168B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163077;
	b=h4ZxeWgJ2jP6TqkIWOgrZrRm67Zw79ztCSfzuPYYe8NEOp+P64kycI0CGO3fWBIUXjdU
	 Buqibqm+Yicz70G2xrwG2G3nwT36QgHDGXarsfX57OUBQN9lptUdCAAi4RZrfZTsMHnbJ
	 5bqv3SEUeNZEmcoB0IbLGAMmt9y28ZDVapFcPB0o6tL0I04UH5KqAmxqjSlUEADGErVlq
	 hyMTnMK2tWlzjM9a74Bfdy7+wTsz98d232XKPyoeWWFn/VR5ec+EPVtK3p8YjsX0Eemcp
	 uIIu7kuMd/Ad8NkiUFmbzLXgahvs6ngTO1Ig2wvzLLbdIMvsBGhPb/yWe15Nl+jqpHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZC0uxi/f4Qm8cTQHqxix9amn+yNdXHaW8RPEXbEsOgY=;
	b=anyJjBmHaIumUJ7rSjbDp7hQi9CO5lJOKjnjEqb4jT/feeYASMXH1kqzwEgrF9w8OwjO
	 k8xIH3iJVRDneUUSzxFeJWuOhrReyJfMC6vwnBKEUIbpv0dtXFiwfAFiZjBRwF7AB8x0e
	 YPLm3NZt0aK61/dnlSK6fIK/ioVDrOJBu/PeuGSDdscEASF4A2PEbybXaCrn8r6wn9gc8
	 LOkgkkgfG01f3bl5hyoe7w0RjUPv3L2yaU3JwC5Br1DFqnUbsF8V0AMs2OrtfXdzORf0/
	 +g8nTlYkvZcBeeNEKK2p5A77Qg/InRg7Z9hJ+C+5r2NbL/1U96ybqyBz2c76ACtVgDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163077;
	bh=ZC0uxi/f4Qm8cTQHqxix9amn+yNdXHaW8RPEXbEsOgY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xt/YEaqlqa2MNv33K2zbwGRz5GhppHS2XnKyMRhWL1vDm0kTD3+Fp4jGrI44FKpL4
	 bKLA5JTz+53uqxB6j796a5f5R2Nbgvk+IzgL0mH3fSW++ejwxjnKuhJfJ/ZXqoUO4/
	 J7pHEdVGIBWocl50g1zp3I8NEo9DZw5dEnPQqxrRn/okdFPUdMJdL1fvpv6nq7A0Ou
	 V2vZRe6VWWO64FAnhvRo7/mgV6ajsUet9+fKrH6jPSaP4uiJPFRudQk9NpX0AAxma0
	 GzQjycIdt7cy15ndRmtPmG6NMArgbcUCYjKeLK/OhZQw8FbqsQ9vH53iVukphSC44w
	 vPafOBwvlCTXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D3D8168B;
	Fri, 16 Oct 2026 15:04:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAEC37AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C11A7606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxbK2s-2X29D for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9284460671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163072;
 b=ETPShqH9V0QliY8SEPlob3y3J1zv0XYsuiSG9CZj9Fakr6dciK2MTSTrLnOVkh7NZIJy
 R3RcH5bdk5TnfsM9a/mVBDqcxSW/GEywpEp9OP+P5aB4anPCfmsUOGmb6WlNmVMG9xg9O
 rdnuioO9Ib+UVdoqi7Euvyy1EDIGUJHI0oO1oQdxdaY5tF2WK81e64/xDsmhl+BUrx6XP
 1oYzOykp3edxzLm/OiWAXguyGbVQFMfO71nl7hbRslKmd5+hNXAhPZEdNldTU5JKvDI3t
 TIRY6ggZIWFzThO5uA3qIcvpuqEQ67gPajuP/aVDFsZ1F4L6wqw1jUK6mQQ0zRChsaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163072;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=k7LAGvBqJm3VdFaURzrAbwifcv3o5/pCvh/0Wqn1sL0=;
 b=aqwbnTJ65fxleEEuwvHwQbRN5TZwveGrUHILfAtaO6pJyNV/AnEkWPvrKe4pXmQBsExC
 GDXeQz4yzIc2qCd61wDlfuOH94pWq4KN0zP/KclS66xb4ff+KPhjFi94ZPLutFMeXu5Xr
 D1Qfa9ArnaIdTnObfy47/+D+Uew70og2/RLjha2OO9wYuo5m1ULH/qo71vwNQIKDEiHQ+
 lEkApk3uNjxn2Pon+QfMs35XWbg4ih8sHooz3qogxMJxqwgxRWs1DSXJcI9pA1RA/ebLM
 4HZZe+LTPRY0r4CByhFz7HFvwbfHo1gtZqE63HFZRsaOaY47KrWbFXXsKNpsOxcUOiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N6pTglas; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9284460671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so419515e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163069; x=1792767869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k7LAGvBqJm3VdFaURzrAbwifcv3o5/pCvh/0Wqn1sL0=;
 b=dqCPBkVALOChYO4yOfSG4ey4CqgI85TVBdAm94aeoyqx/Aj6lEHARcACUdqKr2fJao
 JJbc9etlLCd7KAhEQnXf9IyjNVz1TVThxsOG0sHolDg83V2NewRU82zmH/IhtO/HWVhh
 /P+tNauPORH9XjyxEqUCXnPDcknqjiAUAgw6RYjPDWdaA/tXzcjiahfrkTTldsTAiyIk
 Se8sIJmHCMpvEqLhul9nzEYvVVb4/Iz8tHoJtd9vqm/69sW/0NsZQE0odOpM52UUE+MD
 7geOZPxrOmS1MggzOr8uuB2sYy4PibxDvtHiDi1jB6wpzFHZwsk2ysdFaOyVlNicI1Bo
 u+YA==
X-Gm-Message-State: AFq9FYJMfsk7zcUfwX4oq5IUewalX/NM+eNqzgxCCU5+jUeFUU4OpM0Z
 G3mkwuICbLCVrtXRKqigloXcrM46qjsRQIdYzrugzbZQhnV1XrCO+vLqktC/17VvakgdlBVuhcM
 uwRa8iBQ=
X-Gm-Gg: AYBFou2NurnW1VdFlm6vMAlyVNBDAn+5LNOwJ1d9oEH5q51WddEWG2whPoloBO+2g5E
 0MRZJzDXp5cFQqCubK9xAMXBCZdsNJ6+J6t6HsZHMVkdsfLu/x79ChXhVqqU11KUXbjG+295N9L
 tkskrxT32UMoS5RAqf5Zs4GLQJC/v6X4gWHGA0ETyxdidwRP1FkrqEP19na7kUTVSDrjEnorn49
 hcnKETmxdcs54aDTErckyNtPhWlUAGw3PK2l0+8UY0c+t3Q5eYrBC0W2vEAmJPfHuHt8Ew8wg/F
 Az86Gp/GOiKWqVLa/08s5VI2zxmLekj6/4XN7wrRmf7SUShg0wFZw67Upjj8IPqSb8ZXSHiq07p
 QeSViJXGAHyIwOMJZCgdsq3egkIX5jgBE6YtzUnIbpybLqtzKsH1Kt2VOa+kw/5wqrKXS+2f2j3
 I/1AOyLMaLjhZTempcY7WC/+1PlK6Lj0gAHslSo+lroP3e4xg0O7shUhMG6qeBuu0JdezXcUs9f
 PO02SgNAZ2B9lNrDL1dMTMgrtUkV19ooKrmiWeJ6GZ4Xp2/ChNh
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id
 5b1f17b1804b1-4a1d75ab235mr2448235e9.4.1792163069224; 
 Fri, 16 Oct 2026 08:04:29 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6252sm91327105e9.5.2026.10.16.08.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:28 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:26 +0200
Message-ID: <20261016150427.68550-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002075640.2350126-4-buildroot@heine.tech>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/4] package/sqlitecpp: needs threads
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> SQLiteCpp has an unconditional dependency on threads.
> 
> fixes:
> br-test-pkg/br-arm-full-nothread
> https://gitlab.com/heinemml/buildroot/-/jobs/16865965420
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/sqlitecpp/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
> index 31de9a3904..614c46cb54 100644
> --- a/package/sqlitecpp/Config.in
> +++ b/package/sqlitecpp/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SQLITECPP
>  	bool "sqlitecpp"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
> @@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
>  
>  	  https://github.com/SRombauts/SQLiteCpp
>  
> -comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
