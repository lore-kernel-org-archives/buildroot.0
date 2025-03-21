Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DFAC36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 16:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC4040926;
	Fri, 21 Mar 2025 16:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQ8ZbuYWj-fo; Fri, 21 Mar 2025 16:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E9EA410C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9EA410C0;
	Fri, 21 Mar 2025 16:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD4E31A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D83410C0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsYe4URGlFGu for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 16:20:41 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA78240926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA78240926
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA78240926
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:20:39 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2260c91576aso40076995ad.3
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 09:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742574039; x=1743178839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=or4FJZ9cz9WYiNdm8lJbo8TgcmfFjvgD1IVvGn9pRPA=;
 b=W4jRAkoXfj/7ArJSvYyURw05OldrucZcNh0/JufYCBFtvcM/jUpaVWdDgK0DdfXbWh
 kc7ZJMB7sU3GmbEjuDVofBMszMmvaA84FRTR5Ra3flRzkZM4namHVoJ7nj2bT+C38tJB
 gUBTXgorCnHOwLW5JDJryKqyiM7X5wxPVIjmuf9svZ+sp2VhamhJavIAYGUkl3Ld+RHI
 1dKK24Z0IIGJbVWPD4M+03K+JKVT9Px/IaYIOLb06/O3xvYYDKxQgC5IGRLZVGIE9G53
 5ym/aGgHlBYGAQDMngQcqDi9DFNTBCvf/a8CZbnES7LPthgcy9gKsYjZ7okwN+3ktpFR
 IzrQ==
X-Gm-Message-State: AOJu0YzqCn+c9m3+MFi4d3SQR8MaSGRr4A87QM02jeGI0rzkSi6FMAbX
 K1X6KeNMsKNZdSZLFuj03vBBEDHwmS9WErJbATFl9gFeOC3yrxoMK1IOlJVGkauWznjqAAfcPGv
 h
X-Gm-Gg: ASbGncv/IG6trteb8ujzCGSN0rAqNI71T2033N+aSvhs/oPldlklyMqL3MsGF8UU8R6
 NdJZLFN/zDq9jhW5wlkL6NGyXhQLI4Oe8tMRmJKAQxCOxkfVPqPahsdDNEK2KyFs8uvVpAJFAP6
 4mJRNEIg1QYcegO9WxfdBHGrDwyN/qHwcrZT9If/jHLF6GHIUiT+FXxkESYGmtwQfkjtnu/5hE/
 R2A/fZK76lvYY9cKUJ6WFD6wj6IBRyLPYKpAWzKHGR21ygAhKEgnbJhBr2rmtWW1HZN7nxkx/5J
 J9mu/SIlmwdxnNX5Q2FGmoStKdc31GPGYfZON6NB9wo9ZzR6qdVP1GuT9r+d1sTGBE0TF279YCw
 =
X-Google-Smtp-Source: AGHT+IFzkHNoaIaJNfsvhgCWKNKcBGUs6WHpWxxIJ22pQHszT6Hr4cxdpry7ZpHmqLhbJj+sIoN/gA==
X-Received: by 2002:a17:903:228c:b0:220:e924:99dd with SMTP id
 d9443c01a7336-22780e07b00mr59739265ad.34.1742574039089; 
 Fri, 21 Mar 2025 09:20:39 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811dcd47sm18872905ad.178.2025.03.21.09.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 09:20:38 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Fri, 21 Mar 2025 13:20:34 -0300
Message-ID: <20250321162034.1851757-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1742574039; x=1743178839;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=or4FJZ9cz9WYiNdm8lJbo8TgcmfFjvgD1IVvGn9pRPA=;
 b=bLH7SaLr/fPZOv4zZsYXgQ9Lb1pTvLDUR50rVPkjk2aT3YJlzudWWfWiDfa1IvKfYW
 HUum10/T/XqpkHLp5G6NcLYuaIi990xykEX5NXHZJQk/HiDxj2OhhV2U9o4V5Hxe2NlA
 VGyKur2U2SfS0iafK9PpXDZcAbzY8mn7ntTCHlMmTSni90kEt18e5lPFX/MIGpCyzpiL
 DpiUmsfFhuDjP6FycBb0Yv3r5jEmSPxbOWk6zzNU0nPziOTnaJ8E1kSYkeYfYM2z/Txz
 RPFqCogOuCSywD4uymYdc1LFTwCVBqewvck3TonvL/2KJZkIir3/u3du3Vsfj4Q4vBUn
 tpkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=bLH7SaLr
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2502.0
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

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCBiZDc4M2E2OWI2Li4x
NTdjYmUzMGJkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICA4Y2RmYTVhMDc3Y2JhNTc2YmRkNmIxODQxY2MyODQ4Yjc3NGU2NjNiMmU0NGEzOTUxMmJiODIw
MTc0MTc0ODAyICByc3lzbG9nLTguMjQxMi4wLnRhci5negorc2hhMjU2ICAwMmZhMTk3ZDIxZDUx
OWY1YTI1YTkyOGRlYjkzOTdjZDM4N2JhNzM4MmI5YjQ0OTc4MmJhMzFkOGYzMTE4MjA2ICByc3lz
bG9nLTguMjUwMi4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IGY3MmUxOWVlMGQuLjRmODZiYjY4ZGEgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yNDEyLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjUwMi4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
