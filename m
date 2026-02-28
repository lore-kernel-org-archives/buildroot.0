Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC9FEE4D9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 09:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A8E418D9;
	Sat, 28 Feb 2026 09:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr5PeveysqYF; Sat, 28 Feb 2026 09:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C2D418E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772269419;
	bh=63m7oqnddpM8kMaxxdA5QOXpToV5ZBUZnDlwkUxUZXw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WrkkwHS2vJADQ1CLChA+5AQSMEisbQx+cfOq/KgMoZ+16N8e3B0c6mnZ58HaXEc0Z
	 pDc8pnXo2z0KPjXWNneHdV+ZJanVrY7mwPMb6tMtGg5f0epcocb8xoacgp/RMHWHqE
	 eNuuxGWL8kYgmT0q1eCHw04MOLTT9I44H7BvnXE2Z55qLeicNP8cPCmKf4DHm9Zm6q
	 ivfdxWlOXmw98OjO8mGtBLeeX7J+6l+0DVnVpSN85HcDHtL8mI3+JdKE3f2kgJBkeO
	 4EW8FRyVReGuWCJ3g7GoNMSq/HWAE7atyUKxRoG7zTAVcfwgSNOgekrAwnE570A4xy
	 mm6rT4SI4Rufg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C2D418E0;
	Sat, 28 Feb 2026 09:03:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A59131D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9760E83C4E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJoKqiNvie1O for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 09:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 741AF83BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741AF83BBC
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 741AF83BBC
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 09:03:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-389fa352b0eso21458631fa.1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 01:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772269415; x=1772874215;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HpCMulZeyPG97+r607WXnRyJenaZKu0qKKxsnlhXVpw=;
 b=RSqhdcKzYDlgUKVdMIivrxcBTC+QBk6lieCcYGKeNujdpi3IV8B16tREuPwThwB9Lu
 b9emaKAHPkwkS71Q/9yoqzrzoBxjcYB9ANqP5bze0yVKFYZ6oH2BwJJ/mdFxM7sO3kCh
 vzBY4dGpIwxqDlheHToVUivX/DvXTTYbUw9fTYbDcwDmyqLGKjS0GGwOYtbfrX6aPI3a
 ENg+zhmknHb1nhSQplCqhItMUPCJS0//pPbIMIdhltd8twlqnq7sdzBez96I2haJ5LHX
 S6CB1Hb0Vzj0orI0Wlayr2OW+0uz2LlkyTamiE/QRt1jAAK/5lWcrdrim/G7plluyEDw
 FL/A==
X-Gm-Message-State: AOJu0YzaXM9Ani3zBD4RDm4dcAjgfHALUM6aqH4aII8adJxDqxvbNQV/
 k8+Yach21RRkkXN6D0H7/1ZStWMx8XjvA51oGAOUjZzTpUm5ib8ZqJPE8WhzvA==
X-Gm-Gg: ATEYQzwt2WN1ppXznxW3qr9Gw27My+MNwNiv0o1a5rc8diCd65FyiojgfB/FjpXiJaZ
 UI+OPRWJvDnM8E1dXZQzH7FnDfG+Zlx6DXNwJKm+UdGB4Wv6rQ3PkD/A1v62tZIAWJ6G9DnuRFS
 KrcvpnIM/2V7iW8MBjUkr3RrC/dQpof1BTEOcPqzplewFoEA9R9KiUlkD+g3g9B4qHMoFzgFgT2
 iB1Y7JUKjv8tIPhiPxUeFjmPuZn85FmqjP5/3nqpjNr98uuRx6D2cvzHOZ8Dz4DQ1YNb++IgIZ+
 uzzathlNhvE5OldQaowEjkDnBUhsh1z/P+R2DlkAL9r7B3S+9udqYiJzIhrVHYdmq0y5u3wWW5b
 WeLRkB82gpD/getRDIqcLczSQOmnLuiCLIzRCQQD7EdqQux11VPEl2Qf2BP5OEnxLh7GnlMSXyl
 d96y5XhaJh9fhrJFQkqgQ8iqUgHPFYgmT7HmsTSiDeni/luBN7v6PuGY0qMXfvuA==
X-Received: by 2002:a05:651c:b21:b0:389:f13f:8082 with SMTP id
 38308e7fff4ca-389ff365862mr38363151fa.37.1772269414268; 
 Sat, 28 Feb 2026 01:03:34 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-37-74.A259.priv.bahnhof.se.
 [79.136.37.74]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f70aa8sm19452061fa.19.2026.02.28.01.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 01:03:32 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 28 Feb 2026 10:03:27 +0100
Message-ID: <20260228090327.1810619-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772269415; x=1772874215; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HpCMulZeyPG97+r607WXnRyJenaZKu0qKKxsnlhXVpw=;
 b=N2nR1v9VUfohXpKEa3DdDnlNiIBJP3/N2BV/eHBtkYfbyJGm5u90Dgah+ameBC/ZeE
 V30wXW2XXZeDycjLuvpF7WneEED3EUI15QLWtsLycNzatT64SZEtHYMJS5Zxrnk3lX3+
 h/TY3m61mM2gqr2Q4GAPpgQGgo30ZM2S3qrYMFwQcExdIFDk97PYiWiEvV5wXLR7cm6k
 87k3MQn8NMhdpLuiRihTqegXfW04A8p50QBq3mKHxaUw9B6A3ur0as9i3p3D3jnZdbc3
 C5VcsuBzlPzWVsB/LapoFZgssJDoaFkW88fmUy6ANLNAj4cXUBbOXPCdjgw0biNmwssW
 U3hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N2nR1v9V
Subject: [Buildroot] [PATCH 1/1] package/libssh: Security bump to 0.11.4
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

Q1ZFLTIwMjUtMTQ4MjE6IGxpYnNzaCBsb2FkcyBjb25maWd1cmF0aW9uIGZpbGVzIGZyb20gdGhl
IEM6XGV0YyBkaXJlY3RvcnkKb24gV2luZG93cwpDVkUtMjAyNi0wOTY0OiBTQ1AgUHJvdG9jb2wg
UGF0aCBUcmF2ZXJzYWwgaW4gc3NoX3NjcF9wdWxsX3JlcXVlc3QoKQpDVkUtMjAyNi0wOTY1OiBQ
b3NzaWJsZSBEZW5pYWwgb2YgU2VydmljZSB3aGVuIHBhcnNpbmcgdW5leHBlY3RlZApjb25maWd1
cmF0aW9uIGZpbGVzCkNWRS0yMDI2LTA5NjY6IEJ1ZmZlciB1bmRlcmZsb3cgaW4gc3NoX2dldF9o
ZXhhKCkgb24gaW52YWxpZCBpbnB1dApDVkUtMjAyNi0wOTY3OiBTcGVjaWFsbHkgY3JhZnRlZCBw
YXR0ZXJucyBjb3VsZCBjYXVzZSBEb1MKQ1ZFLTIwMjYtMDk2ODogT09CIFJlYWQgaW4gc2Z0cF9w
YXJzZV9sb25nbmFtZSgpCmxpYnNzaC0yMDI2LXNmdHAtZXh0ZW5zaW9uczogUmVhZCBidWZmZXIg
b3ZlcnJ1biB3aGVuIGhhbmRsaW5nIFNGVFAKZXh0ZW5zaW9ucwoKU2lnbmVkLW9mZi1ieTogTWF0
dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9saWJzc2gvbGli
c3NoLmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYnNzaC9saWJzc2gubWsgICB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlic3NoL2xpYnNzaC5oYXNoIGIvcGFja2FnZS9saWJzc2gvbGlic3NoLmhhc2gK
aW5kZXggMWMxNWQ3N2E0NS4uZjI1OTI2MTQ0NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJzc2gv
bGlic3NoLmhhc2gKKysrIGIvcGFja2FnZS9saWJzc2gvbGlic3NoLmhhc2gKQEAgLTEsNSArMSw1
IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCiAj
IGh0dHBzOi8vd3d3LmxpYnNzaC5vcmcvZmlsZXMvMC4xMS9saWJzc2gtMC4xMS4zLnRhci54ei5h
c2MKICMgd2l0aCBrZXkgODhBMjI4RDg5QjA3QzJDNzdEMEM3ODA5MDNENURGOENGREQzRThFNwot
c2hhMjU2ICA3ZDhhMTM2MWJiMDk0ZWMzZjUxMTk2NGU3OGE1YTRkYmE2ODliNTk4NmUxMTJhZmFi
ZTRmNGQwZDZjNjEyNWMzICBsaWJzc2gtMC4xMS4zLnRhci54egorc2hhMjU2ICAwMDJhYzMyMGUz
ZDY2YzllMTAwZWM2NTc2ZTNlODRhYTBjNDg5NDllZmRlM2JmNWI0MGEyODAyOTkyMjk3NzAxICBs
aWJzc2gtMC4xMS40LnRhci54egogc2hhMjU2ICAxNjU2MTg2ZTk1MWRiMWMwMTBhODQ4NTQ4MWZh
OTQ1ODdmN2U1M2EyNmQyNDk3NmJlZjk3OTQ1YWQwYzRkZjVhICBDT1BZSU5HCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNzaC9saWJzc2gubWsgYi9wYWNrYWdlL2xpYnNzaC9saWJzc2gubWsKaW5k
ZXggM2M3ZTc3YTIwNi4uNTZkZTY2ZDZlYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJzc2gvbGli
c3NoLm1rCisrKyBiL3BhY2thZ2UvbGlic3NoL2xpYnNzaC5tawpAQCAtNSw3ICs1LDcgQEAKICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKIExJQlNTSF9WRVJTSU9OX01BSk9SID0gMC4xMQotTElC
U1NIX1ZFUlNJT04gPSAkKExJQlNTSF9WRVJTSU9OX01BSk9SKS4zCitMSUJTU0hfVkVSU0lPTiA9
ICQoTElCU1NIX1ZFUlNJT05fTUFKT1IpLjQKIExJQlNTSF9TT1VSQ0UgPSBsaWJzc2gtJChMSUJT
U0hfVkVSU0lPTikudGFyLnh6CiBMSUJTU0hfU0lURSA9IGh0dHBzOi8vd3d3LmxpYnNzaC5vcmcv
ZmlsZXMvJChMSUJTU0hfVkVSU0lPTl9NQUpPUikKIExJQlNTSF9MSUNFTlNFID0gTEdQTC0yLjEK
LS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
