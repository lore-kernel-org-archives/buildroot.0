Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E67C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 01:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07D7D40065;
	Sat, 27 Apr 2024 01:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPWETF4rTBFs; Sat, 27 Apr 2024 01:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1524941D27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1524941D27;
	Sat, 27 Apr 2024 01:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C880A1BF59E
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B49C783BCD
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eidf6I1Lc3x for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 01:41:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C04F683BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04F683BCC
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C04F683BCC
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 01:41:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34665dd7744so1968342f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 18:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714182089; x=1714786889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMWRKNp3/TfVRx7r593vNkmvPdytbHgGbpOrufmlHyQ=;
 b=GB3w7mv+z7eKCRc8tjOpS11dtbfFS9woGFKHdDYUed7iPVXl2AtGSK22ywBuNIKyce
 9TwImBFOyqNut3VUemdBE4iiriB0HDVehgFC5Prc8W4P67s0Fe1lJcvZR63iK6qCiF1m
 3IPeQDR7jZzjJjVtt/Mv2ApsFzP6dmloh9IHEgGdKV6S1wjzD3K5iZUqmxIS5j6x4k3y
 gKV9nVLpQb+94S65ACU17Se5WLGv3lgZ8kbZZk1RWZpKub7afSV7a8/T2+EbZgncvwDK
 jUipN5kQPge+LwyWsKg2ANRA8prdqMe+GXnur47J6R1Jn5lQn6YLP/Bn75vC6kuZ3cei
 SB5A==
X-Gm-Message-State: AOJu0YyQCZV8zz25X+d4a+LqhJu7CuVCLlOjkzuUqxxU7hVo5oOeWWtH
 B7zCsTcCuM1yQuTRkJnQRlSlPZ7LEnnMoyWCsf2z6Nwu/dnwQOARuGt6hIm+NMF0EAavGbO/NRT
 QFU8=
X-Google-Smtp-Source: AGHT+IFPRTrF1iUv3JswtMo8NiGl5w8v4v5Jpsz4nfGJpmRcQmPXXLz+tMDi6e0azILjUe8DNvtlfQ==
X-Received: by 2002:adf:efc2:0:b0:347:adba:a3b0 with SMTP id
 i2-20020adfefc2000000b00347adbaa3b0mr2721858wrp.7.1714182088822; 
 Fri, 26 Apr 2024 18:41:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm23975689wri.84.2024.04.26.18.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 18:41:28 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 03:40:53 +0200
Message-ID: <20240427014053.410789-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427014053.410789-1-gael.portay@rtone.fr>
References: <20240427014053.410789-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1714182089; x=1714786889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMWRKNp3/TfVRx7r593vNkmvPdytbHgGbpOrufmlHyQ=;
 b=Sy4+UDpTrNeEg87/PN+qwdd9W6kiVi9YXjL+z14APqRzRIaBl1qE5zX8ND8Q2/nhEf
 /OwGF99sUPfKHmiwpRr7+uiXcDBJfbe5pF14r9eDG3aKYzIVvcwIyuEcexg+DwT73F0M
 aKSjZ2JYmalg1AAZrjmQUWkxF+fSqpKU3NMBo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=Sy4+UDpT
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmVyc2lvbiA1NDc2NzIwIG1hdGNoIHRoZSB3aXRoIGtlcm5lbCA2LjYuMjguCgpTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIHBhY2thZ2UvcnBp
LWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoIHwgMiArLQogcGFja2FnZS9ycGktZmlybXdhcmUv
cnBpLWZpcm13YXJlLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGkt
ZmlybXdhcmUuaGFzaCBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoCmlu
ZGV4IDMzZTA1YTJmNGEuLjQ1MDFkYjczOWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLWZpcm13
YXJlL3JwaS1maXJtd2FyZS5oYXNoCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGRk
NDNlNzdjYTFhODk2OWNkYjdmMDVkZDcyYTU3ZjkwODYyMDcxZDVhOTNiZGQ2YWVhODI0NmFiYTg1
Njg5Y2YgIHJwaS1maXJtd2FyZS04M2RhZmJjOTJjMGU2M2Y3NmNhMmVjZGQ0MjQ2MmQ1NjQ4OWQx
Yzc3LnRhci5negorc2hhMjU2ICAwMGZlNTQ4NzM3NmU5ZDVlZDE0Y2JjNzJhOWI3YTViZDhkNjkw
MGM4NGFlZTEwZjZkNjU2ZjE5MmEyNmQxNjFjICBycGktZmlybXdhcmUtNTQ3NjcyMGQ1MmNmNTc5
ZGMxNjI3NzE1MjYyYjMwYmExMjQyNTI1ZS50YXIuZ3oKIHNoYTI1NiAgYzcyODNmZjUxZjg2M2Q5
M2EyNzVjNjZlM2I0Y2IwODAyMWE1ZGQ0ZDhjMWU3YWNjNDdkODcyZmJlNTJkM2Q2YiAgYm9vdC9M
SUNFTkNFLmJyb2FkY29tCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmly
bXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKaW5kZXggMTEx
NzdhZWUwMi4uN2FlOWZmNmMyOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBp
LWZpcm13YXJlLm1rCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVJQSV9GSVJNV0FS
RV9WRVJTSU9OID0gODNkYWZiYzkyYzBlNjNmNzZjYTJlY2RkNDI0NjJkNTY0ODlkMWM3NworUlBJ
X0ZJUk1XQVJFX1ZFUlNJT04gPSA1NDc2NzIwZDUyY2Y1NzlkYzE2Mjc3MTUyNjJiMzBiYTEyNDI1
MjVlCiBSUElfRklSTVdBUkVfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksZmlybXdh
cmUsJChSUElfRklSTVdBUkVfVkVSU0lPTikpCiBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0z
LUNsYXVzZQogUlBJX0ZJUk1XQVJFX0xJQ0VOU0VfRklMRVMgPSBib290L0xJQ0VOQ0UuYnJvYWRj
b20KLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
