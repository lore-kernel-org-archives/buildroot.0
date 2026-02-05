Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD800EC1E94
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 10:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A454117E;
	Thu,  5 Feb 2026 10:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG0xPU-FcAnz; Thu,  5 Feb 2026 10:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD4C40D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770287162;
	bh=u/4C/eOEPX8mUkYsRwNe9My4VX8Wf+b0pgoOpobkMPs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xi4xoJOnWhI6Z4sWcctwHDGu6ZOk74njvuAWe6r3KntZVRNlxcb8x/rEqfbj9eOe6
	 pWc1zu33WOpKDdFpTKkwtRozOydiLvkvrH+bGocwAW/xZSaaG7vB1ql7/cl3Tixkam
	 U69QddYDgqfjoUWlmY9cMzUlOApwWo4CN1n3Htm+lgaVVaK5V0ykCy9gKVocyMw3W9
	 AdUEkl/p7Cr8QWVpqlARRm0YfEWd0IrQjYJosty53UFwUKF91rOpDKoPjVTHSu8gjG
	 Wfz62CBAI2lbElfMpu4YEhJd7ohHU6SFI0klBid2bYxsqvU0utusHrHWVhrzJ7uMcd
	 fNv9p5hi9WpvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD4C40D2E;
	Thu,  5 Feb 2026 10:26:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9362D17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84C8940CC7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1TiZa5xnmvF for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 10:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0FBC40D2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0FBC40D2E
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0FBC40D2E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:26:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59b710d46ceso798759e87.3
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 02:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770287158; x=1770891958;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TJnFMWXm5XkvGwyZOyiuvI7OTuSQJ9nvpeBfm9AKTmM=;
 b=Z5/cVev++UmGrmAKmlB9RhBwvOHjDRvFVMG7DWAHsye4O21BoAzIXiD73MTTgXbH9O
 uiiy/rePE5ZKBC+IFPzUe3xAjoYrIwOYso5+0np4kpqrELqG/sGhy3wQtNpTz9bESAgV
 YwhJuOmtwuZb0/K6dtlJPMljgAJTukJkAJPdfulAQuBvuW9HiuXiM3xWk1yK3U78O73B
 YGiqMXLNqaCNwQAtrFU25SgZvzQL92dv2b6ew8CPTsei6yk2Hl/ekfKG2e+pM8EBJ8hT
 4b4I8qzl13yd6grb0ImNyf1trDaLjRrJkK18tK1DC/jauKHwdmAgzYIMhNIgZSqQVRc9
 /H6Q==
X-Gm-Message-State: AOJu0YxZkzZbQVJcjsOFzXg4k7ZerjamMItZhdxZa7awqcE5IGSXUclu
 uQJ/LcG/HffPUszMZtcFr7DvnyXSbTk8I+uvBzW7J8vPvKcmPUDuglbw4vKkXA==
X-Gm-Gg: AZuq6aJN5DhB4Pmz3O3oIvBAi/Cj506v2OeCI+WOm9ajstvVky3Vntzd7YuzWnkS7Ze
 DIzpKAHsJ+6fIBvGXITUuFPty+cZu9dFijnf0ZWdNmqvFMO8564Xu0w+bwDhEec1cICwt70m6PV
 5FFH2keSDYIbSWS9pH3xQ6jmdyVgswFe8BAFZffXl/gORGunQood/Ba82wKH46Pmkf4v73t2CZM
 Wpz98dZuIFK0+aFXxNuxEu+vBrlqi7bvi1DHZfLyc1vs8Q0jxs8psENmJq4KD6yKvS4DIC2gggH
 JNEARsx+6SVfGGgeNIJDIye3jqY+TRlRB4UTrYPb8HmsAZxpI4J1JCuXN4bq0IK8BToR4A6lYiI
 P62CJ+ULohPNlmGr7ZWGhoj9co9G/O/Aquvn1jFAzOIltpsh0JwI49bvzSfXSyhsz4nxKrwmmr9
 CskBHXynj8zVBi2UcufBf7XIxkr0SACKXbHOMM5DVdEmVG+w==
X-Received: by 2002:a05:6512:695:b0:59e:239c:93a with SMTP id
 2adb3069b0e04-59e38c088a9mr2279057e87.13.1770287157808; 
 Thu, 05 Feb 2026 02:25:57 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38692050f59sm10144471fa.37.2026.02.05.02.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 02:25:57 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Thu,  5 Feb 2026 11:25:54 +0100
Message-ID: <20260205102554.1028552-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770287158; x=1770891958; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TJnFMWXm5XkvGwyZOyiuvI7OTuSQJ9nvpeBfm9AKTmM=;
 b=OmyjrBIsxvEw4mO1i5n/PZrljTRV016UW5cjaiQBDSxP2chVCPfz0HevB4lkAMmFDW
 5mSjEaj0OPSIvB22IHYrELYajODzni5ax7vPJwhYaKHH4KiQL6n6+27cccSeAlRxkoQ+
 VAU6viD4y+UGSGBVEZjVxH8mAD28q0LqfPvhdGKC6kKhx3QbSdqpXCODkOnAbHJsmD41
 pXFNsShKIRoLYYZM+u0+D1+tVXzVTnDT3FB4gPLuP2MKqbk4CAmXP4y9puCAoKiHT4UZ
 hT74FeCLalYXNDTc8MrqaHrWXsZnIbspzdUSk5rmzlWAM62rNuP+8gMplvwfQTVD3eJh
 m8Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OmyjrBIs
Subject: [Buildroot] [PATCH 1/1] package/frr: Bump version to 10.5.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9mcnIvZnJyLmhhc2ggfCAyICstCiBwYWNrYWdlL2Zyci9mcnIubWsgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZnJyL2Zyci5oYXNoIGIvcGFja2FnZS9mcnIvZnJyLmhhc2gKaW5kZXgg
M2JhMDM0NjA2ZC4uZTg5YjUwNDJhOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcnIvZnJyLmhhc2gK
KysrIGIvcGFja2FnZS9mcnIvZnJyLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICBhODRiOTczZTcxMzM0OWRjYTA5ZTIwMDlmMzNkYzQ5OTU2NGYyZTlm
YWJhMDFjMGQzY2JhOTIwNDgwMmIwY2Q1ICBmcnItMTAuNS4wLnRhci5negorc2hhMjU2ICBmY2Rk
MWQzMjZiMmViZDFjYzRiNjA3ZmUxNjgxZDQ3Njg2NTM3MWFjMDAyOGZjNTU5NWE3NWMwMGYzNzAx
ODllICBmcnItMTAuNS4xLnRhci5negogc2hhMjU2ICA3YmYwNTM5NTdkNmMzOGUzOWEwNmExMTJj
NjBmZjM1YjIyOGQzYmQwM2VkYmU4YzlhMDM1MDhiMDUxMTI4ZDE2ICBDT1BZSU5HCiBzaGEyNTYg
IGY5ZTBjMjFmYWY3MzhkYTU4NjI4MWMwYmVhYWQzY2Q1NjIwNGMxOTA4NWExMGZlMDVlNGQzZDdm
OGI1ODYzZDIgIGRvYy9saWNlbnNlcy9CU0QtMi1DbGF1c2UKIHNoYTI1NiAgYWNhMjk3YjhmZDNh
NDNlM2JiMjAwZjFlMmUwNDNjMGRiNmM4OTczMjVmNWZmN2YyM2Y3NTMwMzAyYTZiZjcxMyAgZG9j
L2xpY2Vuc2VzL0JTRC0zLUNsYXVzZQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIv
cGFja2FnZS9mcnIvZnJyLm1rCmluZGV4IGFmOTQ3OTNiZDEuLjQ4ODY4MzcyNDUgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvZnJyL2Zyci5taworKysgYi9wYWNrYWdlL2Zyci9mcnIubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1GUlJfVkVSU0lPTiA9IDEwLjUu
MAorRlJSX1ZFUlNJT04gPSAxMC41LjEKIEZSUl9TSVRFID0gJChjYWxsIGdpdGh1YixGUlJvdXRp
bmcsZnJyLGZyci0kKEZSUl9WRVJTSU9OKSkKIEZSUl9MSUNFTlNFID0gR1BMLTIuMCsKIEZSUl9M
SUNFTlNFX0ZJTEVTID0gXAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
