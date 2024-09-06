Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D384CE7AFB
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 09:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9391605F9;
	Fri,  6 Sep 2024 09:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SbUK2UQZGVi; Fri,  6 Sep 2024 09:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF1FB60BB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF1FB60BB2;
	Fri,  6 Sep 2024 09:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC1DD1BF41A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 09:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C3060D6C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 09:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTxTx0ByMXja for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 09:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D42BD60D87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42BD60D87
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D42BD60D87
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 09:44:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5365aec6fc1so308007e87.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 02:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725615841; x=1726220641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWCNCCTO19r6tg8SZaONxyFBg7PKKme04ZmM07w6Kj0=;
 b=G8gtTyeAsCUF7iVCxgLl5B8r0Pzx8XXPbg6DjGpMmxWuqShWSwiFYsV0qCoIIhFP2o
 9WAsy19h4brAYeeeCnGgbPH4YD3L8zl3RHSTexdSGGfKp1RmANK7dbXL9nFzPcIgUETh
 k4ciDvVJXSc1uaQqaai2h6UjutxJnvbS8A6EE4Nyg/V/ML8rKJ/T9dwB5QmqXBcM6okt
 HvenV2u0jWu1GITPvzfcdPzottYPZSbNtpUdpIniKl4zKtXLroAs9BLmG2/yr1ujMPrd
 M/DXQbJETS/XaxgveggOwzXoYMssQow3KbVgfqsKC6BtJw1JwtyYepS2tDNov5nA+bsX
 vmUA==
X-Gm-Message-State: AOJu0YySzXWaN957eVHYleBRK+3DbIjum4m6p6BHoUh/RJfrAJJ+RYX6
 2pR8W+H9uL8PktBRUen1uYVf0x3Y7J54DKp1m5OmfVgX7gRoccoUOQsS2+J/FiV115j2E60Gg87
 Z
X-Google-Smtp-Source: AGHT+IGxvsH2cyEemc6e1rhpjP6IXtQtmQFGf91ZoMxUkEl6K6bA7hmxHPnEeHqGTxO09bb928y3tg==
X-Received: by 2002:a05:6512:318c:b0:52e:9b4f:dd8c with SMTP id
 2adb3069b0e04-536587c5fdamr1282125e87.35.1725615840771; 
 Fri, 06 Sep 2024 02:44:00 -0700 (PDT)
Received: from nola.getinternet.no ([2a02:fe1:3375:e000::4])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535698c7508sm594327e87.138.2024.09.06.02.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:44:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 11:43:56 +0200
Message-Id: <20240906094356.565951-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1725615841; x=1726220641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IWCNCCTO19r6tg8SZaONxyFBg7PKKme04ZmM07w6Kj0=;
 b=d9zn2ZmrlsJ4pNsYVVIEBBE5zFyi+Oj1tmQwZWMuI7KIKmlmj9bKzjVuYZqyPx6JbQ
 Y8au0gAiHj+1gAk8oFrBDsXfe5AGd1l4Cql8YV20cqk1f2garMvnG82TEDH4tbQYpVc3
 WEOttobkV+T/WOulSrQ6yrrBlJXCBYk8BJpv0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=d9zn2Zmr
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2024.36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggOWJlNjQyZWY2Zi4uMTU2ZjkxMWE2ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMWY3NzQ0
MjE4NmYyOWZhN2EwYmRmMTM4MjMzNGNiMDVmNDhhZjNmMWI2MDZlNjJiMzE2ZjBhOTk2MThiNWE5
ZiAgcWJlZS1hZ2VudC0yMDI0LjIzLWdvMi50YXIuZ3oKK3NoYTI1NiAgNmRjYTNkMDIwYmM5ZjBm
ODBmNGM4YzViODVjMDc5YTY1NzA3ZmI3OTQ4NWIzOWM4NWQ5YmQxY2ZhZGFmY2Y5ZiAgcWJlZS1h
Z2VudC0yMDI0LjM2LWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCBhYmE5ZWRiODI0Li4xYTk2NTNlZTdmIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4yMworUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4z
NgogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IDMyMTljMTc3MzBlYWI0YzgwNTk4NDk0NzMyYjRiZWQ0YzRjMThiNTEKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gZDUyZmI1ZTY5YjQ3OTU1MDYzNjU3MGEyZGI2Y2ViZTA2ZjVmMTI5YgogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
