Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B76CA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 08:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB3040808;
	Thu,  8 Oct 2026 08:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mcbHErxpxnV; Thu,  8 Oct 2026 08:59:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 420D740809
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791449957;
	b=NH5Vhq5sX8ULu8Kdrtg6h1Xot9LXm+llwOWu9ctBqptJehEPvVc3JHHYAs4cLnM6X/9y
	 /3/pYfMEUf3cW2IF65d9yw0cA+nR6VJ1GPJSH3zul8EAeXVPBIirZWSFiSP67LLiZ+p5O
	 zNq/iuftoAjYx4CP+Gjk5Ae2ryT3IiTdkD93k2dPdJ+/gsxMFuonrXwiq6DHXicZHBysP
	 jxbxbngn5SwrsrilEqt24zlZOUZ9gcCs3oViFqVKoTRgwvp9i1ahrHOzvvh2BQsojtVTo
	 AUXHCTCrI7dLKoV2ghQg2djy7YJC1cNQyqrOWWKDEUlhlKe29XrJVSFiTg7wUHlkUug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791449957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C5bsQHnpdq3mOPKOV4Nmqyb7Xqd9mCy9KfI84VuE5Jo=;
	b=dkTwiqvIV26d1a+MBExlorTJNDn+wkcHL2TTVJ/Pn7DBpWMZee820U4C1wSYcHhWwjWi
	 mYxb7F4tBW71qiKb14NFHgFmma4k1wMgXxJVSqvANQ/LIwzsD3CewNzD+dO2bX8hPS9Za
	 ybIy+OdZqODBC2fES8Fy/Ot9sRU6cUL2oiEo04Tvd2gnLt1yv5OoCEnXDRo30x1XuCTz8
	 LwP+lfe9Tt0Qvc/7xzki2qioznIfzTO/Sca2PmhDepZnsQmIMu2tQFFQ1IRfll3b5O06p
	 fW5TqSdXcsmaeOCWBuHqoldiHFTiUw9zKbJy0ET5f0f82jaBhIuDgKv2V8Go/Lq3MAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791449957;
	bh=C5bsQHnpdq3mOPKOV4Nmqyb7Xqd9mCy9KfI84VuE5Jo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyYwKMV0CCwEICYOLRyBR0ntu8CTcEFcnY3EJSnjaRrGDsBD59FQmdwfzlMKxYxIE
	 ak8WxvMWBscNnr3b7Th8od+uYK2ywKaTuOGo3y1zG34XUGmpkTtW0nGzddIKl13Xb9
	 xbb1bS9cR8t6yz9YpRWD0dslEM5V5uhz9zDSgf/cpsN/jpecGs9ZqJkI3HoTp7ygZD
	 5TqFLcvtOKUjwwz9NBkSxIEfMC8lmv9RAlVGtD+vhqvciVpCfllO7gkRo0en6GxQmq
	 GmRp1rPPQq6MgrnRFSnwz/UmyV/c/Pz+MmuaTHfx+gBsY1pswFRGm/YfZIs57rmgXB
	 NE8Prtp1rdvPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420D740809;
	Thu,  8 Oct 2026 08:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA70075
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA51381198
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXmN19XrsTih for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 08:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6FCC48119B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791449953;
 b=tX83Z4OK9g9wRu3YwsNwi9L5xyMh9EqnfMtFwQ85pHfoelBGfV+DlUgNNesWDANTjPHi
 juNqoiVTjUI1EbJC4TOv6dmdiPvIWh5fWv7VtzIRStu5nsuCdTk0ghCM9x6nfMkHNeX+U
 yZXa56Ke+JcsRwIQ3xdsSGYHbkDQL1WVDPlwPJbLPCyqn3eGSoy/Qdbz7Lu/Po34kPvyZ
 ws4HZ6b5uSApBGY3VQZRNTVlTLNWIG8/H/TH8Mi1YzfzgOux0Y92aWto4t6igSxq2OTgy
 p00Qr+1dD2CCjM0a1VO9XqaiewWevg5sOvMMd57v5u3tqlQ6RKqc1eOl0/+LGX7jPAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791449953;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=IyBWlsBroak053/m4gx7V91t2M9eikTvR0xA2/pOJyM=;
 b=kggcNuDjoKK5ZlB6BgjC1IQZ8fZhjUxgwMhK3nqncbwK7qVhkn5+tek41KWDwy/g1O+X
 1IAvf3nwtTtncSv3BXSQtcw40Ioe4ucjdylVyPPab+rIIhdoJ7eixkzlX7bAvqWkTaxhP
 bB0QcfH+GL58JEaTwfEdIGJWpn7OuUxlvaaotrVoZutEJT1/dyMjwCxqNDEG+XsrWRVGl
 6IAthTNCuYdx3LHG1ZNx7Q/BYS0NLRO4WV4L4GHa2Dgk679sKV8ZMS+8ErACrCoZdWiQI
 oPc/SRbiH3wo68WVrGl6UYI8acAWn7uxeczgWXanx6aN58aFnzYMkbhRHX0GxaZPASA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=saO7DuhC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=saO7DuhC
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FCC48119B
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:12 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c2533d83e3bso429138166b.2
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791449951; x=1792054751; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IyBWlsBroak053/m4gx7V91t2M9eikTvR0xA2/pOJyM=;
 b=saO7DuhCqapCusDpaKkKaIXdbdi7JoZzt7hqHk4Zojgx/iuVNcOMjAzxXPaaJOS5J4
 Ie3MsRl1kwNlDoUDkn/JqzuxjHT0pczevzMvHTCQYxK0mK/oNhsZT3cpZshhaei9wMzK
 99I2s+2gT7mnLQq6zKxPg+1r5oTxRzegC+dWTkrXYscOprAyp+Qq1ZyQlAdFNNL/yH7M
 LvsSVx4YYZ4FbZ91LJIlauwCJNl1zXz0mg+WgdkkYTIoe1aGLUpC+aD4rmFBOb8wCldg
 AUMqBiZ1T70gkdYYIhiYnRVZUVj2MDipmk52xAoJ/oijZd9HLiQjUhzoObsb6pSrkIXJ
 zhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791449951; x=1792054751;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IyBWlsBroak053/m4gx7V91t2M9eikTvR0xA2/pOJyM=;
 b=qAktGi/NwkDV4ECqwJGOgeemg7SttOqCos3WykR9s2q/WAUgOM8A3ylL5OUaBZ3AfJ
 lOlJ+/37TFaXY6s9Yv/OBot7OA9+PZUE5chr2JqSAFMQhH6jv3wRT8+nvCGX3aHUF2XY
 Xe5K14tCNRGFAZau5vvRZivT6imyv+PhdYqHYwG+0uXmyflwU2jS21RNV7s2JBKxYg3K
 4CMZeKP/EXwQtjxO76A1YnV2rsuegqRZRPeIXTIU5cajinmMVvBPWQycYw8U0QEVoifk
 McSsoHLw0pQMTQNj13sOnlShVg3O/R+8k7KhaE+LFXe9zbr+zxaI5nQJoUFBk8lkMqTw
 IL5w==
X-Gm-Message-State: AFuF++n8hwmh1MP2jeuFskDv0Tn4yo8LBzc9A5Tz/S2ZOKTKwQUL4us5
 qLdatBDJ9zTiBBAgSRdZdouALZ8YkH1EeYXiBhLS9CUkLMO8BZoEyzRG5Kg5HTXv
X-Gm-Gg: AYBFou1jGWaPwBetTMHrWkn2toxA4CgNdz2lmSD4IUylCowVFR558jMzV+N9CY2DGjW
 rwIAe4T+u8LAVsNl09UyKsZmdnRN4HZWIeAjQ8Tt6zIPcRSQlQG0SYQZugfer0vKYBsHqyM5/YO
 n/rvRkXXh7utedJDpw8q4E5Yhx63hTZenZTHQ7Ky6XCH1Qx8O0pou6FRKOTuHJf/D4CzxZ15cKY
 dk6c+VN2YBrxUSPbNGRu+6iMX60E7epP3oWQULBY+6Txn1YWyPsY2ljokldDP01nvPjO5IsaRZd
 e+IochckHF2eykZ+hJxPFibfRNXFhnvOIunjJ9jKE0XFqSIDUZ68YOGjm5sunuJWli+qSbfjYXv
 E1KU0ntujIgRjhuwOpZ0AeBIoFfjzMNIhGTfTso/VSGQDrTUEVudK6vxkVvW9qRNxqH98Sp3c7I
 eEyWDiiaz8guMMLmFJgBKUc0bf4beoAEITlXSSMAKypejZ0P+ngUBkTh8BsFSk1D8rQKrKqGhSc
 nBjCLQrR7ibUVQqeHxl8xxkt6V4QZHjZNKL
X-Received: by 2002:a17:907:7b81:b0:c2e:3ed7:7da6 with SMTP id
 a640c23a62f3a-c317be48594mr465711766b.25.1791449950427; 
 Thu, 08 Oct 2026 01:59:10 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c33ff6bsm197171066b.73.2026.10.08.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 01:59:09 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Thu,  8 Oct 2026 10:59:00 +0200
Message-ID: <20261008085901.2692162-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008085901.2692162-1-troglobit@gmail.com>
References: <20261008085901.2692162-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 2/3] package/firewalld: minor cleanup
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

The iptables-less configure option was spelled -without-iptables, with
a single dash.  Autoconf accepts it, but it stands out from the other
options as a typo.  The Config.in comment also listed BR2_STATIC_LIBS
twice.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/firewalld/Config.in    | 2 +-
 package/firewalld/firewalld.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index 407f57c604..6e460910cf 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -38,4 +38,4 @@ comment "firewalld needs a glibc toolchain w/ wchar, dynamic library, headers >=
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_8 || BR2_STATIC_LIBS
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 8a390c0fe6..ad1c21b970 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -50,7 +50,7 @@ FIREWALLD_CONF_OPTS += \
 	--with-iptables-restore=/usr/sbin/iptables-restore \
 	--with-iptables=/usr/sbin/iptables
 else
-FIREWALLD_CONF_OPTS += -without-iptables
+FIREWALLD_CONF_OPTS += --without-iptables
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
