Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B756C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 12:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5132A60B20;
	Tue, 24 Jun 2025 12:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dmIhSAHMY4p; Tue, 24 Jun 2025 12:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C079F60BD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C079F60BD3;
	Tue, 24 Jun 2025 12:21:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 861EA43F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F135B60B53
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnPQ22tFCOaW for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 12:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BC5260B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC5260B20
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BC5260B20
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:21:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2698843f8f.3
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 05:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750767685; x=1751372485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DA4MWnGGJ3U0OIi+dKQb2lkED3BPHeiQcoRBmosOQh0=;
 b=jBEqV65kWRYfVvmCmllDuEUVnRJyKLm0HKdj7HpOWWtiT3/VYmk3SYZz/n6ck5o4F4
 tEPlWwz65iR1L2jdBRN/zUfqyQOmU71Gc/miDKQCnOkJV0dsPCzCSnCn+0tYMkNtndQV
 pOmECg7g74sESuBRi64OMjsogt+48psxfboFaUbyOFtjDVBDQNENRbgrPkEayUAUVzez
 wlUXkj1JwZTBFCpkmfPDN+Vq9OGrSdSykvD3deGVEjbnih4hnLw4Oo49k8DemIJvFnqv
 pm3dbqtVa0H6roVl+AdoH7ywBwOYJQBosfzBW5okM55Jkcj3n37Apz8L+omQHvI50mtL
 xpRA==
X-Gm-Message-State: AOJu0YxewyZTB5/ciDWK/vdFspX1il9Y5mVLFCt0i3alaKX5p30MTsXX
 HNLFMdNrOdLL2rC7QTt1BAu+tqZdOy0n4D4w6U7SOUqPX77wNNd+4el+Jynld8kvp53KfAmIKEe
 6/CT8
X-Gm-Gg: ASbGncu01LMrcoO1HClkl65qPZlVI4MTDe4wXiBNuEvCpt0kKuCJBfAMTUuLBt5/5IK
 8PcRjtxu3qyU5QPc4TDEDcaxF5gVM9eglC3rCFCZT/pZhT4i2GXjZ2vsBqfJu/D5x8l34sFAUQ5
 TvVc1oynRfxwXSd9PxoCE7W2x/gMqe7TdrTlob1yc5KYXMibYiNDBM7fNiCuYWlpIrfOE1fiiuM
 WK8EMwEdzoZ0de1+FeER16oKHaos9voNU4qUa3UllDSBpF1QivtQPmnRLM4v2uphdZ5pN/ZPcC7
 ehs7ZAfp9skdYM0uCUHnuM2ZMMtBI+N3LTgPg49Z9mma7Aokp96TCAmSR7TyzIUfUvbX3nUzNde
 osJNXMnJqWi4EiDu4l425hFDutST1U4E7fvyspfDx/PB/e0/nVe8AMFeZAClXn304dlg7
X-Google-Smtp-Source: AGHT+IHi0hnjipSHdM5ylhCERqEyEg1E38aKUvgPMmxcNWgEzpcnDmH4jxRXrPeh44brbJrhPVWVfg==
X-Received: by 2002:a5d:584d:0:b0:3a4:c8c1:aed8 with SMTP id
 ffacd0b85a97d-3a6d130d4bdmr13965503f8f.39.1750767685108; 
 Tue, 24 Jun 2025 05:21:25 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8bb6sm175456025e9.25.2025.06.24.05.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 05:21:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Frank Vanbever <frank.vanbever@mind.be>
Date: Tue, 24 Jun 2025 14:20:43 +0200
Message-ID: <20250624122048.946492-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750767685; x=1751372485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DA4MWnGGJ3U0OIi+dKQb2lkED3BPHeiQcoRBmosOQh0=;
 b=X1EkabMuonEjnONW4cz8VvYStbluIMdX/jD1pfazwc8WjKYt1pePzYQXhxBsfW4IPY
 E+gfj5J5Xw2k1qoLKTL3njvzi4sxTkgWbeMZRWLsfMTBDfW3PkqW0zaDmo8gu3vsBYMX
 HqOFYH6yjSHswO79pSTTHkHu4HzlYgh92dS2OK3UyxRrYrr2zLt16hWKnIbXJKy2jhwU
 bjux3dLq9MGxT1hGUm8mx0ciAZCa0vwka1kSOuOlOgAvQ0m3K4WoZ1b/y82/O2h93CZf
 UGsznRHSaPUzGd9nDrHmGuju+dkyeK6qg/Sw9RYic5mAspOn1V2Z9H04T0xAYEjC7BoV
 B1Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X1EkabMu
Subject: [Buildroot] [PATCH 1/2] package/nginx-modsecurity: update upstream
 URLs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

J2h0dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5LW5naW54JyBub3cgcmVk
aXJlY3RzIHRvCidodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJp
dHktbmdpbngnLCBzbyB1cGRhdGUgb3VyClVSTHMgYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2Fn
ZS9uZ2lueC1tb2RzZWN1cml0eS9Db25maWcuaW4gICAgICAgICAgICAgIHwgMiArLQogcGFja2Fn
ZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoIHwgMiArLQogcGFja2Fn
ZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5tayAgIHwgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9Db25maWcuaW4gYi9wYWNrYWdlL25naW54LW1vZHNl
Y3VyaXR5L0NvbmZpZy5pbgppbmRleCAwYmJmMDVmYWQ5Li45NGYwZmYwYTQ1IDEwMDY0NAotLS0g
YS9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL25naW54
LW1vZHNlY3VyaXR5L0NvbmZpZy5pbgpAQCAtMTAsNyArMTAsNyBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfTkdJTlhfTU9EU0VDVVJJVFkKIAkgIHBvaW50IGJldHdlZW4gbmdpbnggYW5kIGxpYm1vZHNl
Y3VyaXR5CiAJICAoTW9kU2VjdXJpdHkgdjMpLgogCi0JICBodHRwczovL2dpdGh1Yi5jb20vU3Bp
ZGVyTGFicy9Nb2RTZWN1cml0eS1uZ2lueAorCSAgaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1v
ZHNlY3VyaXR5L01vZFNlY3VyaXR5LW5naW54CiAKIGNvbW1lbnQgIm5naW54LW1vZHNlY3VyaXR5
IG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5IgogCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfTkdJTlhfSFRUUApkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZ2lu
eC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoIGIvcGFja2FnZS9uZ2lueC1tb2Rz
ZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoCmluZGV4IDY5OGRiYzdkYTYuLjM0ZTdiODdm
NDEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2VjdXJp
dHkuaGFzaAorKysgYi9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L25naW54LW1vZHNlY3VyaXR5
Lmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL1NwaWRlckxh
YnMvTW9kU2VjdXJpdHktbmdpbngvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC4zL21vZHNlY3VyaXR5
LW5naW54LXYxLjAuMy50YXIuZ3ouc2hhMjU2CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293
YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5LW5naW54L3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAu
My9tb2RzZWN1cml0eS1uZ2lueC12MS4wLjMudGFyLmd6LnNoYTI1Ngogc2hhMjU2ICBhZTgxMWM3
MjA4YWMwMjljYjdhOTlkNmY2M2UwM2QzOTcxNzk3NjA3NTE3MTg3ZjQ3NjIwZGYzOWMxZjc4YWRk
ICBtb2RzZWN1cml0eS1uZ2lueC12MS4wLjMudGFyLmd6CiAjIExvY2FsbHkgY2FsY3VsYXRlZAog
c2hhMjU2ICBjNzFkMjM5ZGY5MTcyNmZjNTE5YzZlYjcyZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYy
MTllODdkY2YzNWQwYWI0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LW1vZHNl
Y3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rIGIvcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9u
Z2lueC1tb2RzZWN1cml0eS5tawppbmRleCBhMDBjMjAwNDY5Li40MmE1MGNhMzlmIDEwMDY0NAot
LS0gYS9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rCisrKyBi
L3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2VjdXJpdHkubWsKQEAgLTYsNyAr
Niw3IEBACiAKIE5HSU5YX01PRFNFQ1VSSVRZX1ZFUlNJT04gPSAxLjAuMwogTkdJTlhfTU9EU0VD
VVJJVFlfU09VUkNFID0gbW9kc2VjdXJpdHktbmdpbngtdiQoTkdJTlhfTU9EU0VDVVJJVFlfVkVS
U0lPTikudGFyLmd6Ci1OR0lOWF9NT0RTRUNVUklUWV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L1NwaWRlckxhYnMvTW9kU2VjdXJpdHktbmdpbngvcmVsZWFzZXMvZG93bmxvYWQvdiQoTkdJTlhf
TU9EU0VDVVJJVFlfVkVSU0lPTikKK05HSU5YX01PRFNFQ1VSSVRZX1NJVEUgPSBodHRwczovL2dp
dGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHktbmdpbngvcmVsZWFzZXMvZG93
bmxvYWQvdiQoTkdJTlhfTU9EU0VDVVJJVFlfVkVSU0lPTikKIE5HSU5YX01PRFNFQ1VSSVRZX0xJ
Q0VOU0UgPSBBcGFjaGUtMi4wCiBOR0lOWF9NT0RTRUNVUklUWV9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRQogTkdJTlhfTU9EU0VDVVJJVFlfREVQRU5ERU5DSUVTID0gbGlibW9kc2VjdXJpdHkKLS0g
CjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
