Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E56C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8FB1605E0;
	Sun, 14 Jul 2024 13:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBG2ZzM95vjS; Sun, 14 Jul 2024 13:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8C760610
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8C760610;
	Sun, 14 Jul 2024 13:55:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7A11BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 417C84008C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrOul3eUhyLY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 217FA40083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217FA40083
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217FA40083
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:54:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so48563951fa.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 06:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720965296; x=1721570096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJV07am6dM94h4guIGrLcR/ohfBiqYm/s/Jhdoqqf+U=;
 b=F6MskW8tP/Ti5jpryM3xbdagLEd43C/cZXxYwxYEiFAIRpmoHqW2hm/Fv9XQ54loyr
 r5jtE1mZ0ESWZ3FLa3QhCL0KSWZHf+bOB2++Dbgm33Qujg78yMdEcTQrFSVhe8AuVF9n
 gqc8agbvkujQLRpUne1ZOsLIPAzGNq16Kh0qIeRxUExoXZ5tHONa25uMpw1iJ8BSo/hO
 nJA7uSD5mru2boLdftNSMI6Th9+kaBgfzZYIPXjekyrpN0EsuTmdQL9A96gTUcxG0ZDO
 dl8YnKE1Cv5Kb8IjOYKGLqC5E/sVR6a4atbrIaphkbl/0FJ2+s+biAXjAqoVj5+LauzW
 8IaA==
X-Gm-Message-State: AOJu0Yxe7K9dF/+jHkRbafCg26KaJrlwIgd2LqSl7zGqNza/taUwCRnm
 a85qk+brcpf1xiMlhgFSCjlvMZTv5GRhQ9nkjx6GTwEUB7Tnlu+send7cy0S
X-Google-Smtp-Source: AGHT+IGO08+B4a5DIYaA7aIpT3fyC2xmJMsO5k/qgDeVh73Dce6N165jWd4wUQ6wqJGAwNTMP38BmQ==
X-Received: by 2002:a2e:91d3:0:b0:2ee:7bed:2cff with SMTP id
 38308e7fff4ca-2eeb30dc158mr120103531fa.13.1720965295728; 
 Sun, 14 Jul 2024 06:54:55 -0700 (PDT)
Received: from localhost.localdomain (91-163-59-203.subs.proxad.net.
 [91.163.59.203]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db04841sm3879172f8f.101.2024.07.14.06.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 06:54:55 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 15:54:42 +0200
Message-ID: <20240714135442.857934-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720965296; x=1721570096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iJV07am6dM94h4guIGrLcR/ohfBiqYm/s/Jhdoqqf+U=;
 b=g0UKoLUC/ZYDqrzS00mrW6VLweX6n12uRyL25aOqtgsFVxXQLxnU/BrNgj5ZoE4ICA
 E+HzQLhPq/hoWsGUWeeduH85iQ1MKVczXHShWOhye7x+1zmcvgE6FHTMW8rdDvtIi2s4
 M2XMeLsVOSgHMjV4oGZ2zYV4OpHKp/Rr+hPKXNYHsWvwXn6ZdbxpOa/CK4Aatdy/ibLy
 QGgXFotlKvAUAPL2rAN2PVj7OCjGOcgEGsFrTBMGXvM89qY3m+HhrPbzXpGz5lqhcVxS
 9WpAzau2oz0rC+Ys04ezFKGnLqgR0oOvqdMV/fnzBS4CXOn8IrZQ4iO7af/3CDC+HCfh
 ijOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g0UKoLUC
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi3_qt5we: fix path to
 in-tree device-tree blob
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBmaXhlcyBjb21taXQgNTFiNDQyMTc1OCAoY29uZmlncy9yYXNwYmVycnlwaSo6IGJ1bXAg
a2VybmVsIHZlcnNpb24KdG8gMTdmMTM1YiAoNi42LjI4KSkuCgpGaXhlczoKCgltYWtlWzNdOiAq
KiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjcxMC1ycGkt
My1iLmR0YicuICBTdG9wLgoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRh
eUBydG9uZS5mcj4KLS0tCkhlbGxvLAoKSSB3YXMgZG9pbmcgc29tZSBkaWZmIGJldHdlZW4gdGhl
IGFsbCB0aGUgZGlmZmVyZW50IHJhc3BiZXJyeXBpCmRlZmNvbmZpZ3MgdG8gZG8gc29tZSBjbGVh
bmluZyBhbmQgSSBmaWd1cmVkIG91dCB0aGF0IG15IGNvbW1pdAo1MWI0NDIxNzU4IChjb25maWdz
L3Jhc3BiZXJyeXBpKjogYnVtcCBrZXJuZWwgdmVyc2lvbiB0byAxN2YxMzViCig2LjYuMjgpKSB3
YXMgbWlzc2luZyB0aGF0IGRpZmYuCgpNeSBhcG9sb2dpZXMgZm9yIHRoYXQgb21pdGlvbi4KClJl
Z2FyZHMsCkdhw6tsCgogY29uZmlncy9yYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvY29uZmlncy9yYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnIGIvY29uZmlncy9yYXNw
YmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnCmluZGV4IDM4ZjQxZjQ1YTYuLjQ1MGE4MmY4ZjMgMTAw
NjQ0Ci0tLSBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZworKysgYi9jb25m
aWdzL3Jhc3BiZXJyeXBpM19xdDV3ZV9kZWZjb25maWcKQEAgLTIxLDcgKzIxLDcgQEAgQlIyX0xJ
TlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MDkiCiAKICMgQnVpbGQgdGhlIERUQiBmcm9tIHRo
ZSBrZXJuZWwgc291cmNlcwogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Ci1CUjJfTElO
VVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYmNtMjcxMC1ycGktMy1iIGJjbTI3MTAtcnBpLTMt
Yi1wbHVzIGJjbTI3MTAtcnBpLWNtMyIKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1F
PSJicm9hZGNvbS9iY20yNzEwLXJwaS0zLWIgYnJvYWRjb20vYmNtMjcxMC1ycGktMy1iLXBsdXMg
YnJvYWRjb20vYmNtMjcxMC1ycGktY20zIgogCiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1Rf
T1BFTlNTTD15CiAKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
