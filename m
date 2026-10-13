Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94F2CC6B1F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D65A80CC5;
	Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co70CQKgxQqe; Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5BA7D80D50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934196;
	b=EbMdj7jGfdhnOVe4xEMtG7Z1scoZBrQzwuodsGTf+ZHWfHfJRW7j+BHT/pWDdXZd0PXJ
	 HuaXS5ER5wR/oqCsTL21JN9EixzJdruYbIPigPmwHMD/dJBsTQdZNNein82KNIyXomdTl
	 TFBHmu3wPK4r9QIzAPNZhVZ+cWjiVm6oct/yjGZ5qnT96heMOBqnQsLjAnPmz3AAOcRiW
	 3xAsSGm7Mg2c8xp//3hodxVxAP0W53Wa102EOswE1GNvHYMidbpofj6imyAJuWpsGjuEr
	 qPA4OL7CO+EuHYq4G6DlyIyP5JRznPILFgBfWDOsmtae/tgDD3RzSpew4h55c0VZVsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	b=mTME88eiRMLnHpaqBxitk+7Zf6JRzVEbDkLci1VOTH/p7O+zGVb/iyH6UipsIYWdYIxx
	 8XjU+GAFlkuax1xDsBb+l5cTph3MLbVaY/u1zyxLHBub5KBRJJ4tSf4jG6UMyXBMNXQtE
	 JPYV42fzNJVRRAwwPm+9Ibl/afP/FVcNbJC0BF3JGVQNaZOFotrx89+/aAjtqVDJDDFX7
	 HK11qqKI/30QsCBhUjq696QjOMCylId4iHSUsd01IYJqr9BDDAYOdwmITbAXcUxvpidYm
	 G9/KGxsZqm6MxXFY9hQK9FVL3SwCl8lTnkna+czucTNsV0+vdilJP9hLUNd0kaZ5C3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934196;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LNtzGxASn+V6xNg4lwhsSf10QrFFGIaRs6X+cVhHvVgOMyHwNfPCqtapqjcWboZne
	 q3pwX9E6oE7shn1sxazbfV+cNcaYw2tF0C2NBPj0D6hdw36afNOIB8V4XoKQ4WEk22
	 rmmv2D4qZ6AardXrbfUyHZPQOdRNVGogGqjZWTCDN4nfrpMP17xk7ZzVFzw0bHRzDK
	 uvRg/B8+8kcSqg3Ni/QUsK2R0WE4PUjAnXw9Qq569vUvP5Dfm3+e2Cm2+LjySa1Asy
	 WWv5vgH6WOoouiE8YDyUq5N28a2riCBdo+9OnvA/kvCBkItV+kdJI1VRjTnt3bmbRK
	 ncZaGwWKPfjOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA7D80D50;
	Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 428A6255
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2901A4070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc8lmkYi1jjj for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B12B406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934192;
 b=bFAqG2OnBnizMYgG61uz4X2lzG9Vv4wwjZdYcKcxcoKsb2D7mjK8KXkmNZ+uEE2HfOOy
 g2bdOyp2ejCQJJcG2jf1snpRNJXQphXvorWctIBxjVsZJMqYqLQtqc18NYZ+dF76BDaPo
 xN7l0ZartxWc9MBYQG6mzoOymaQy2OumhHocn7Ycc/N4Y+jDQM5qHqMthmZX2KEuCY6Km
 Q6ubOpU0J92qldljIAcm9XPNrzcPdrMKeExC6HusM9uM9ZpzkYofDnebdDTGRu45S6S9l
 W1KaBHUnOQgdAyoC8I6ImnNz4SDGebV8I0Kk26mJkJ8gQPWfcDL4t0bcUeTkHansU7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934192;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=VSHE9+U/fbFoC6owAuOfinca9zBxjhX+RhSRlopN18NssUyXURhGqIteSI+SD1uvSWzf
 1DzYn7scd8IkAGx1/OUuzMxlNHhewtj7aNpQqeiMVXbckaOstLgtsqb7zaGGvGOT9xvM8
 H6BPawJe1aRCQ5D2ErTPonh9dZ5UDbpOGDhSU6NY2h85cdNNLekImGhcgBbU/CxfTFzy7
 2sIiROShmCDnACTApSPkvBXoJXMjinvjS2IActGSBtjMVo926S/+EABf9pdR+s1ATtmNM
 aw/ajxEYywoGFl2WB3fYS4OXzFhlIp2rLQ4iF2nmX0YPFLT8Nmue/T3yYDhb0TRtx1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="AcXV/bMI"; 
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AcXV/bMI
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B12B406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-49e09a20082so1972857fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934191; x=1792538991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=AcXV/bMIAjYZdl7w78O/ScMA9AbxJ07L12QHEZKWsk7cwebuI1U4iEzRGJxRog1lnZ
 InHVmRmbT6dOCcfVJgnjxV3DZE06Vc/vZhc0a8Y/+6uenAEAgbS/8XFwE4v77W75TqTM
 MKZmzWN+JWxA3TYRAyZs7s5Yc1L+TwFSEaL4xPT9TLKhdHojSderQNaIk5u0ouq23e0W
 SJ7C/q7XbU3Bfu/YXPFUixflgOxRbT7yorHcJjljhmKtb6HXd3LHQz9un3t93fD6Ha18
 L+ekFADUh504a1d3RQ7pzVXqw58yPBtMtKYXOdE4fXEy1893BsHPWBqKYOmPW6i9I+kj
 W+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934191; x=1792538991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=LQ+s7ZS+cKihCJKoJKPyKsKmLP0NfIrzlPRgbXE3eQuBBAz16o3VxKjhm017nQs5vU
 9IYKanlBXSpevPA5Hz00dNwDS1rsJjBm714eyNaKsW3qV1cb7uMlYh6++rl1+vuR6nwH
 6DUb0iX68Y1MxeZui2d7KY9SEPD7jJHrpy9gBBJGhaF9s27I2FkkyoSsZsBn6SP+cxbu
 ausvv7DoJ5Gu8IBfFiA5qdWbnQmHOY2pW3YUIgEnVLRwkh1OIDDp74r2xItxlYrRn/77
 qdn3uDhinv6zaLffnYscCU5JxE3ittGfvlwnLWzEJrPO0KZx4I4qZQzyOJENPkuJF+1p
 PeIg==
X-Gm-Message-State: AFq9FYKwNBtiH9JnK51tmbQXeI/UPLe/u0ABNdVsKaA0LOzqiQkzj3C0
 1i8XjFBG1GF9mwSSK80NlPELJnyxDQRxtMrPkuQv7eeK8JKcUyhp4mS8YsFnR3XP
X-Gm-Gg: AYBFou3WemLQ5NZ6QDVtb+KP81P/d20sBoVyB1mOZyl7aoQ2XThRghp8VuuK3z/Bcfy
 PVcEqkSaSkoEw6Aym4WSIlDtP3e28/FFrP+IqqNdlFCTEmZMLc5mDg6CPhKjUAPr+oEY5YHIvhu
 4JanGlVW8TCxGFsC/Z9bjQQCqUwSniC1qaxY5PLisUim519kdzfhz5zGZvWIOC+cgJTRbQPMGNM
 FpshQAHv+XcX2y1p2xLQWEuz9FSlEij7WYAxuzFqKMpP2Lcbq3PRq3eqFve63PHBE2vDjD5VPPC
 J1nNSHdKPjsRm0fz2GHWRPFlrU+PZq64az8f6EAdN+2r9AM6qxVSvELTExmEWbBpOOQy5GgvJEj
 ErAtyKDcltq3wWmJcZfwtso/N2QjRZZ28Za9KC5BaYp8Og5Vki73p8QgDBGO4mxWfX2w9ADb6Te
 AS4vlwd9V7ksO5DxVjHlDyYqCmmZ015t9fAk0RHGPnGrIi3ftcrGpgXHuu7bFqWj7MkjWdm5U93
 eK8MReS7pyWhj+zxP2YcKdCEWDLIIxbsBh5VgbRUEX22sfbCCdpcNgp3tG/7bAOAucePxVr58Eb
 Oc8aKNEsgypr9gbOHAMrsBX9E+gZgtrcXrTrU1HdPGoL5NwRRhcfzdVWXKWBuzO9iifdqnoxGO/
 DAZJkAtdeIrdXNqHzmLtt67LvRqcXGbco8bVTg4j2N4A=
X-Received: by 2002:a05:6871:8a5:b0:49e:45d7:f3c with SMTP id
 586e51a60fabf-4a2a89e7eedmr12127070fac.28.1791934190921; 
 Tue, 13 Oct 2026 16:29:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:36 -0600
Message-ID: <20261013232940.2690456-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/9] package/python-jaraco-functools: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-text. Include more-itertools
as a runtime dependency in addition to the build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-functools/python-jaraco-functools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 2e144f0191..62f9e1945e 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -13,5 +13,10 @@ PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
 PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
