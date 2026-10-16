Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1064CCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EDA815C1;
	Fri, 16 Oct 2026 15:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKFB6YwAiA0h; Fri, 16 Oct 2026 15:03:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0CB9815C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162995;
	b=gm4a5d5hNEy0mgOjPoyk0G7+syuIepkdwSrMtgJvGCuc6Nt+XdLLwtpCNgg5TpYOuat4
	 IpkXnMnYMgK27fj8q0B3nc4RlZsrXz1g4JLrzwkpkBmLCuLkssrwGcukrPsVMrMsofRO6
	 yRrCRzN2d9Y1z0S4vD78gHacbwCCnWuYEmP7+9CjII5DVzY+0EVs8+6iog3IlQM4xyUwQ
	 odlNgtr96fcnnLivOvODc901cnHbzkdKD+Y3+iatnfqCI2Hq26icNkYtnbQ2XCZT2RHIV
	 z9sAinMsAQxyKsyNE/eD9iw/OJwOpfb70xnQB+yq0D1WnCa/BCYqmwO64wrZ7n11T9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JzHlXv/K1VKCUYkXVzhOQLeBFtJByaXxGufwFU3i9lY=;
	b=AlMHlHjCE6cXoHf9aUw4CYOrqauPl0PX0sO99z1bSYkqnplyKs8MU/x9ZVPGMG5vpw9u
	 PZHJUeQgMvfZSJ9KTuLAoEw1qRLt1k2dy76gFnL/mf+kn5CZsbMTLMq6B6vZ//K9bfxuV
	 yapJKI1H8Hgb5i+cfbfWvq0VZHxKCu2Q8NFV+tZyYrNSsYym/1VjZLhMxBz/sw1qhCtZS
	 CIHg58EsHqdNBg5kjle4wElSrTaF/Qiw9jsmJ6u79rQ582YexmuVBKMX5ZH6XeuJP7uJA
	 wQs0THysxylcRJGlnwaIJPlHofSideLB/5nuZ/77kbDO76M6MV0auEJfe6WzCr1vbCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162995;
	bh=JzHlXv/K1VKCUYkXVzhOQLeBFtJByaXxGufwFU3i9lY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mqVjJMAV+HZv1jVFZwke+jaOxIBqg+xKiPNYJ9OILpos5J2+1M8lPBXycw3OPId8+
	 6Z+FoxTwmilloE9KFTesNLZQbPnC84+28vMDGYcStitcJ3XQ3BEj34SUbiIJ3Zqnw5
	 uUgsPR3juzzq9hRodySjrGnA4z/+yAIdbokPvYd/DnQS4YuK12ohOTFTAZn5AWi2xd
	 2PwVWTza/FlvzggOt0+Ef1MJfWA34aLGAHVBSDNgohkJHeEXwXTQdWugZVvO5YTkB0
	 PRpugIch2tLpLY6whXaTnSdZZ34Wy4IaV5PX1vHOdYbWx/1JCz7vS94tRRjgcE9+Rx
	 dFnRnjgD2s/yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CB9815C5;
	Fri, 16 Oct 2026 15:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 411AB255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2724760B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teuyVfHDwZLZ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26B4660B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162992;
 b=Pxmdun0Z4b97uO3U0eSJLREK5kAIs1UosEre2jHrm6Lua5M7d56RScmKM7/mpDp9Tq74
 nTfM7UAeHUO4hKy2OhETLJaPm8dnrsmhPSTYw5Z2XqUmlwHFM2JV0d7oPLEieQYVmE19a
 OZWvEWS0AkQg0e111WS1PEk7c/ujNpPw9Bh5djFTJp3NQJlECDx9qC16okNDeK/pj3Y/o
 fQ2VflBgIzYhkjz848R5gjOgYFX3z6gFhhtnPahJ5BZmV1g633z8pz5VP7KllhQYw1OCj
 sJc9jBveXrphDpZxo1cp9dnBnvilizXYEo4DOZ9KUKxg5VG+w25YlsB48xneuyJjwfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162992;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=H9/YX/ARxXP+OXCvDuSI4jj2U6V22q9yqw+m2XC/CsM=;
 b=WmPn3zD3Lq8D0F+D5zCT4IevnBWs0Ht0uXtD/ihEb7tPTjYjnRCL9u1SPPAp6JUH9HSe
 l0tgDsk1PPvEYenB2KExtpgeVZtVFcVuAjl8wv+cRgNb8yxgGGwfsB0nuqvk+SD7oCCgB
 3z0x2S5wPoqYCbC+RIo+qZ7Q7MsiKAMRCZV+OjxfCW62OlZhP3NyYhE70bN2bQT4XY3z9
 0VRtXFm4tuqNkEZVWI2+2VSvEqmE9l2ZIFDR8gIJD5q3uWlJ7N2IFzEbjzFtGBlZzWx6h
 LNxD6cVDT5rS4ZIR+O2RXHjD9RPI+Acc4Sr6Iv9awza4/LArIbRLDeiFrhp/b5pttfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U0AMG8Jb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B4660B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso3726327f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162990; x=1792767790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H9/YX/ARxXP+OXCvDuSI4jj2U6V22q9yqw+m2XC/CsM=;
 b=rtbh/3M9Xdd85YnmTmOhP2vsSA8gvj1/IKBwVar1mJAxiAC0E4PEj/ytWlDCG5dPJr
 on2qJMaSIIqjAs9FtOgZhaYRUOwFD1e73iQAcI/Q+oxIBxpfPfCimVKw93mmmHkjx1b/
 Y+5BsFyuHUq1gXgiEfxd7EHYdXYtVluQ8xaCPRnWkc9YvEJpSlbq4wtuJH2AIfy8JDPf
 Lp/uxeeauxe6cut1VUwMt+2+3A6OEgvnB4V6L1MmeR1A8qUZY5nk0s63YuU6f1Lp1Fp2
 x0VHQ7WLXzmYA809/uhsAOlyWTmc4PYTrDrn5bHIaRAYubXefIQMLV+Rvziii0Gt/X0t
 NxyA==
X-Gm-Message-State: AFq9FYIiNM7omHKdeQlXc5ycmJu/Z83PbqjLdNMN9TGoM2CZzRzLYfRs
 0o0iYdR5QkbP+WsD4SE8AFRoOmklspNKpNQoAQzXyV9Lr5G6HNSq2orDxBAW2Kn/iTaXR/NBUfV
 NFsl4GpQ=
X-Gm-Gg: AYBFou3WrsCjINt02/8BDRDrT7XjzB1XxGxMspXzSpZ6OIrMHrDjDBN9KlFNa88KbUU
 PCQGp4ZW0qFPpTysY4yrWxx4fEXIDcQ6gF/Jruj8ShOLAUbOK42lveG/p0TLBfOsPZNRWsNEw0v
 ZevB53pIhvcUVURvMPbiJ4ngVgnpn7ioKCLjtLpnEVvdL0zk3Kd++N5WEfGgWQtztJs0tA9OhTh
 oW22AKjj/zMcCHWRK2lSHJvcJYb3s8FpgNMwxzDrPAX+ddkUMzNf2J0Ki5SlamjgNkZZD53HlH1
 qIU2L/o/AZXdWiSsOpvQJR2Bb1PO9+W+cLt2lb4KvThCxL6bT7sPxCaNkLZMCflKckH6IsOEZRy
 gvO9sJrDnJ3paljhLmHSfaCmocPBBNDlrjw6s7FlDiKWUidJZxS2OoNEq+iMxXtgQc2qn1qXog+
 wqS4krmg8if7Q1ZIMOW9CwR9iS19qiSJ/vyRUBP1K+C8bOSEJXdb2fPCz9RfZUTbnrqti9jQxXY
 s9kQYMAFd5gDxaE7n2rYn2cS5sls1SWCqJd4b9dOQ==
X-Received: by 2002:a05:6000:4a0b:b0:48b:11e1:8bc8 with SMTP id
 ffacd0b85a97d-48dbace678emr45891022f8f.39.1792162989927; 
 Fri, 16 Oct 2026 08:03:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd510d60sm5326425f8f.58.2026.10.16.08.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:05 +0200
Message-ID: <20261016150307.64311-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904163304.119934-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.411
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
> https://github.com/vcrhonek/hwdata/releases/tag/v0.411
> https://github.com/vcrhonek/hwdata/releases/tag/v0.410
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/hwdata/hwdata.hash | 2 +-
>  package/hwdata/hwdata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 74a7f5e7e7..0046b56c75 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
> +sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 7300b908b1..20ecd799b8 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HWDATA_VERSION = 0.409
> +HWDATA_VERSION = 0.411
>  HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>  HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>  HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
