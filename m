Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E8DCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E2860D64;
	Fri,  2 Oct 2026 10:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8nDI9-TL9Qk; Fri,  2 Oct 2026 10:34:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 75F2260B35
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937256;
	b=DZ72el9d3AsMVcbk6Y0EQMRyXoz+sqGhju0+cGSZ0Aavtw2jYfmBu/rXwqhpe7/Ouynu
	 qmfrEYtAcNQZ9Za0moszj9dIdf7ZEnpcEuEROaf2tUIY3ssEnpAKA8Xk0hBszY+hzd6p6
	 t5AChpc5p69nebWpNOTLkMvTNXoEbpGy7GN5C6usfXhksXLi87ArXKyP6Io+xD9b1C4Sg
	 n5C2mhrXLPPJdeTmnjj3cIdtCVqrYVsxXJgq9cAGudspnjlLKAazWbOLotnyEfStfuLbd
	 WclGdQkXFjEz1XL0tOnAyqQj/0ciNZmy44rOibjHNDzzNJEXGDlECtpYvrf7b5Zh6Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=O+Encv0XFr4c67IEMXpevKarhKA+q4BwiS3KFdfNjRQ=;
	b=rBRz39mtPdjcyMpcAEdhftD7MN6/pnAECRj6z1JCTDMgSkknLI6Dq1A5Va3Sp+2cecCf
	 uK+TlwKS+pAoflfRdFBp84HztXjBc7EH3YxiX3V2mp9b/o2RaPTtxlRuIgXUeLbabuIFu
	 Ef0HT+/pVVIZdVvps+xk90B7O2jBPSk/HpxVjKEPh52uuzbUtfz/N6dTTS5zbHnWZ+QcG
	 8yhSvj0ZW1fcXIspYz9KXV5pgWVUA1Ar8PWEneRsLvb21AUcGPiUL8+IKwFlBQ2thGX6r
	 kTfDh9aIv1n0HnUUZQoOtk8F48OY2DeYVUodVrpz9itzvtvTLWo7/7xHBra8NEWsx/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937256;
	bh=O+Encv0XFr4c67IEMXpevKarhKA+q4BwiS3KFdfNjRQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O+nyox1n42tjo70wnaXfij92AtA76SJJNPkxmAuynjEn4PKEI3T9a/Q3d/8fMUZjD
	 QtxnRHVPdX+LKDN2qFvWnZV62jwJyNTy/QZ4vCiMQHsy0o3L5JluPM8XgHfVxNO0gw
	 ETWol9BMHmYA6GVk2ryj/ncrkNy7aUA9vndGM84+rbOSgW5DbGEhhl8dzRbq7b0wB/
	 dQOw+DTMhgLe6XMN8c/DyJxp13ywOgcvtsRVAq8mmiEDMjRt5R865xOgw9GTAS9bUx
	 e0se/P5DW2mcUJK1crFyjZ7GhJIKnEMwUQp7WVkfkIsGdGPD2HO31L6CzrkExe+cYB
	 V9cBmaYs+/tLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F2260B35;
	Fri,  2 Oct 2026 10:34:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A0834D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE635812A0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAL5CEeox1S0 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:34:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A31A98125E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937253;
 b=cX9rculZjuOUQVkTToP7mvOKRoQwSdHfo573fRY422+ySCJIEr2eO0MlrbcjvY4zMjfi
 RWnfihuQp1Opy5hFLbDhVcQXnQ6QLHsggcuIzWP/N0yeV/Wr2d66KAlBlFgVZ/IT+w2IO
 F6RQcptGbgUyOtVdYPiFGJpWMPXeBljGiTaj8LQvJCk8QIyIhYm/ORgUVW5xChi1pel3p
 1aX4SxfmnrPHa69ZQwXe8zMILVt1X/qrPPxU/pvzcQhTYHmX0drC7+8mMPIlyRKZ8NYYB
 N8KUqcPK4cIs9CME5rvBdDG47+u/tauApnt61U37r4EGisutoNIWrq/ukiiLqitZt0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937253;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZhlzoYM4g1Yg4Vs84SwaxzZr3etcQnoHl8IAdYQVTp8=;
 b=glP34SBFpR7vzyrY+kajn8fPaBO3tDOXKBBNiArzzWNCNm6P4WhqzX6TRkEGYb5MwigY
 sB8nJ0BtvMbfoFf8rNMa4ZSGxt2uG0xaipQvQ8xn6tPAQCA4f7yVY3hxJ5mqu66hJexBE
 NuhbgT6cyQTHPBvRog97eB13KFBji+CzgW4ZAvGjMdT85ldw+H0ACxYBxQ/sD/eC69DNR
 3pFizqOP4RH23lynr36UcIQh5H4ZH4n/OFLfnUhakp7IBekBMT9sD9Se1U20yKqrsrt3c
 TW4lEfy4A1B5axmacmNFum1Guu4uVFlZRGRVvwW4tLcEfczwNLoWvljbVTEtrQgrN2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aPWkUBaP; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::e;
 helo=mail-wr2-x0e.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0e.google.com (mail-wr2-x0e.google.com
 [IPv6:2a00:1450:4864:30::e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A31A98125E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:12 +0000 (UTC)
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48b00a0ac65so1704583f8f.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937250; x=1791542050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZhlzoYM4g1Yg4Vs84SwaxzZr3etcQnoHl8IAdYQVTp8=;
 b=h+635EMEjJR/Bf7Un7dgiFg3dzQ8DEWWmY/c8JmputMMa9/tlhouIF/fOVVz/nOG7H
 SAjbL69aBXwsceoJjqTB17SzQ7xbXgS/tfHiTRlKctjM7v0aYEB8by3Tf2AbbcZ5Kr2G
 W6nzzTuTLzR6SRpXXHUROZcs3jh4q2LGm91pFWPGV3zogM9ImrIdrERHzz1XiYdO/5eu
 3IdVohXLxANvUW74NTnTewM7peLLDi39lt/bsfpR8rJjrZCR+JSROQQLJw/jj+QzBNnR
 Q3uM2VPHfXe7IAAen/haAKEj7+bY3QSBTvSiVrex6N+3W8trErGKHXxWfz6S/ip3O0Cn
 6/nw==
X-Gm-Message-State: AFq9FYJEnd6KzEsiJDe78aZ0uFksl1vBcOpX1zPDhQh8XnwWJL3svl0V
 NDiY8lxhywEvYvgTkZYUOLxXZ2Vj+PkVOdVWwydxNZE9XFFDmwEVnFNHmphCZ2ZHB1tkG3LNmjf
 K/L+pGtY=
X-Gm-Gg: AYBFou2p5mO0WfnqrAzL65gScb3Ixb3iav3W79yL2U2RR+QFtY5V2V37XsyLjf87Xca
 l2ve19YbrVjPmf1i5MNwLIBfEV3ye/DzEn5AKKFV0EaYWCRdtHTnPQATGChLgGt3H8L1TVJZdRv
 nKhv/Tw9xZjt1GidGqZ5mm7pykwDiYnWlfJcbIXyDSl8L1WWEH3O1T5j/atGM2C83wO6i0ttI+F
 hlS6KgKE5CTO+U87eWrwgKwcsylbO7CUp63wiMA+6bKRDj4AYqmMp6yLvN7Dy8SHI/cX6riBNy2
 cTi1ye6gufuG97EBbog6xKR7iWpzv5QI77Q/yIJOc0nOE9C1Q5x9mqTtwlejazINO6oLMvFa10P
 YnN0EnbfFSJSRSAmbAl1m2QzPBaKSpYSidI7sLmS2oeerIMdhKrbpTnH6OrcPRqXRTlVEkDO8y+
 l6xGd2lKPzthm26xD8w9TQ0SJ7hUSx1MJToZI6cfAqdupvjmU48XapnHwxOX1+8AuelKVroXcu2
 hYnYdOdevPKMY9lycVYDjlHODNmOM6s6/wEtR2OlA==
X-Received: by 2002:a05:6000:981:b0:487:40a:5ba8 with SMTP id
 ffacd0b85a97d-48b12739890mr4141980f8f.15.1790937250378; 
 Fri, 02 Oct 2026 03:34:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f98ffsm4897108f8f.38.2026.10.02.03.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:34:09 -0700 (PDT)
To: buildroot@buildroot.org,
	yann.morin@orange.com
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:34:07 +0200
Message-ID: <20261002103408.77583-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e08ef449d915444978f2bc784c9fdb7438d11c98.1789971481.git.yann.morin@orange.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/skopeo: security bump
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
> This releases brings in a fix for:
> * CVE-2025-11395
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2026.08.x. Thanks

> ---
>  package/skopeo/skopeo.hash | 2 +-
>  package/skopeo/skopeo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
> index 8a9fb22133..e496eb4410 100644
> --- a/package/skopeo/skopeo.hash
> +++ b/package/skopeo/skopeo.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
> +sha256  6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  skopeo-1.24.1-go2.tar.gz
>  sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
> diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
> index 354998b175..5a22658611 100644
> --- a/package/skopeo/skopeo.mk
> +++ b/package/skopeo/skopeo.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SKOPEO_VERSION = 1.24.0
> +SKOPEO_VERSION = 1.24.1
>  SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
>  
>  SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
