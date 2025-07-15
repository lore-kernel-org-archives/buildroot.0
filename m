Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41405C83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 16:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EC6816F1;
	Tue, 15 Jul 2025 16:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5v3k_ag3pfEC; Tue, 15 Jul 2025 16:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 308CE80F58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 308CE80F58;
	Tue, 15 Jul 2025 16:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C4211AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CEEA80F32
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjhM4J861WUz for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 16:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=gero.schwaericke@sevenlab.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ABB0816F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABB0816F1
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ABB0816F1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:03:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so10228708a12.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752595411; x=1753200211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Le5qGT+jWBfQNaxmbRbpAXQnlCiFqbSIDorP1YNkVs8=;
 b=WS2EyCN79Wu1hRNjujiL94LQhtTwtB6yQd/r/Qj22NpZXw9INOQ5dWXO8cjDTN1n4n
 LxL7de87QyY+HkB2GQ5MTeL8xOuJlvSBctRqxwLZELZvUQBBhFED8z4WgGs8vbDhP4/+
 ImVhs8sX9zzR3tD53kmUKAvnBpjrgDyYTKlImgptyA3wo++02iJ6Fg8mdWxv00O+2yg/
 4gFdAUzB2nUN5Sd0+Y9iMAqbpDvEbPnFCQC7WM0N0igHC9ki48rOW8NahpZAF9/nDth6
 wnQkh+S64FDBBRfiIx3pArP6hOBMBLHIbQLZkSJ8C6fku/4NLfUG8sae1oSV8k2KlnDE
 hPrw==
X-Gm-Message-State: AOJu0YwIzvebHC45cW+Tn77QHhIUoSzTsFUOuLSLZUpzQLAYQ/DEFwmQ
 sGBV8Ks9h99Ku6a/k79vBzb60s9TA2sNDUKTCkT1xH8UR+nsNIQE2mzU/+O1uJnS0gELA6LjSj/
 Py9UQ
X-Gm-Gg: ASbGncuN/+yyyi1c2DB9jLoGgfrfOydi306MAGjG0RBFknuc2+VLN4Yyqbiby2FX8Cc
 kATMIrvqnp1tC/K2mQ7zX/fpU+KLWu7NQEzJ4Czz5+LkD7z31/qRKhFIeJpFqjaMqDGtzy3asiK
 2P8n2UCjqp89AEUJ0m54miWQI0MIfLhSeeVZtZLJN7R3qYIyO0M6A/rwQzT5BgOV3PxPWZQF/lH
 1eUK/bNE0YID5pUOepgqZktOjAam9poLmSuGGT25anmvQYAHctjok2TgUVLMQFl21uXBDGzfUfW
 rYsvTETl91GQnVw6WSAD4NgQwK7DmIO89Bf3pNmG3HS+G5oxhg/pvz+JazdviNyrKz66Pcv7GAQ
 gHQsgDbec+usHq32J+yCINydJI2zHO9HemuyrA5Nqd8g=
X-Google-Smtp-Source: AGHT+IHMeTmaREJhZ26JqkYZhNQfc1WOcqrIbDip588Yn1q1QOH1ha7pJZSRQW0kKly2JUt9u3iQ8g==
X-Received: by 2002:a17:907:3c89:b0:adb:2bee:53c9 with SMTP id
 a640c23a62f3a-ae9c9987eebmr3942166b.3.1752595409299; 
 Tue, 15 Jul 2025 09:03:29 -0700 (PDT)
Received: from Theia.fritz.box ([2a02:8109:8a91:de00:4fe5:1cbb:82c8:b7ca])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294042sm1022628766b.119.2025.07.15.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 09:03:29 -0700 (PDT)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>,
 Colin Foster <colin.foster@in-advantage.com>
Date: Tue, 15 Jul 2025 18:00:31 +0200
Message-ID: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1752595411; x=1753200211;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Le5qGT+jWBfQNaxmbRbpAXQnlCiFqbSIDorP1YNkVs8=;
 b=2sgPLk6zRtSAzOiZhUFegCO5WOKwywutk6nRp+6/fd4B4sgNwat/lHIefQ2MlDuU+G
 lAtAi5Uskb5aQ7Ks1gTUeRdVDP3PcqsToDrafD5B2bU0zhG+rAXWNTVgbOBYQn/pP7WG
 ROmukznRJFm4+3jhRjTF/KAq0KdiOXq+xwe2h43NhSe3iUvgY5dBx1KqJziI4pJ7uLzD
 cTyMXexyhtn3+dOPKhfPYf1bVVpQNyORghUN5RAapqt0N+UG5KvDfu6PId8zoOafoozI
 MEhLAnXuaeeYCmhelwQZY2QlKQnX/iMUe81qhq+vqRKnm+q9YepamhI89uLOSRTfN3hZ
 VSww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sevenlab.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sevenlab-de.20230601.gappssmtp.com
 header.i=@sevenlab-de.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2sgPLk6z
Subject: [Buildroot] [PATCH] package/rauc-hawkbit-updater: fix missing user
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

U3lzdGVtZCBzdXBwb3J0IGZvciB0aGUgUkFVQyBoYXdrYml0IHVwZGF0ZXIgd2FzIGFkZGVkIGlu
CgogIDRhYTdhNGFkOGEgKHBhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXI6IGFkZCBzeXN0ZW1k
IG9wdGlvbmFsIGRlcGVuZGVuY3ksIDIwMjQtMDctMTApCgpUaGlzIGluc3RhbGxzIHRoZSBSQVVD
IGhhd2tiaXQgdXBkYXRlciBzZXJ2aWNlLCB3aGljaCBleGVjdXRlcyBhcyB1c2VyCiJyYXVjLWhh
d2tiaXQiIFsxXSwgd2hpY2ggZG9lc24ndCBleGlzdCBieSBkZWZhdWx0LgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXVjL3JhdWMtaGF3a2JpdC11cGRhdGVyL2Jsb2IvMjcxMWMwZTAyNzgxZWI5
ZDk3Mjg1Yzg3MTk3ZjFiYWZlZjc1ZDBkMS9zY3JpcHQvcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2Vy
dmljZQoKU2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBz
ZXZlbmxhYi5kZT4KLS0tCiBwYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2Jp
dC11cGRhdGVyLm1rIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBk
YXRlci5tayBiL3BhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXIvcmF1Yy1oYXdrYml0LXVwZGF0
ZXIubWsKaW5kZXggZGExYzAyMGJiNi4uNWVlODQxNGI5MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9y
YXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRlci5taworKysgYi9wYWNrYWdl
L3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRhdGVyLm1rCkBAIC0xNSw2ICsx
NSwxMCBAQCBSQVVDX0hBV0tCSVRfVVBEQVRFUl9DRkxBR1MgPSAkKFRBUkdFVF9DRkxBR1MpIC1z
dGQ9Yzk5CiBpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTUQpLHkpCiBSQVVDX0hBV0tCSVRfVVBE
QVRFUl9ERVBFTkRFTkNJRVMgKz0gc3lzdGVtZAogUkFVQ19IQVdLQklUX1VQREFURVJfQ09ORl9P
UFRTICs9IC1Ec3lzdGVtZD1lbmFibGVkCisjIHJhdWMtaGF3a2JpdC11cGRhdGVyLnNlcnZpY2Ug
dXNlcyB0aGlzIHVzZXIgYW5kIGdyb3VwCitkZWZpbmUgUkFVQ19IQVdLQklUX1VQREFURVJfVVNF
UlMKKwlyYXVjLWhhd2tiaXQgLTEgcmF1Yy1oYXdrYml0IC0xICEgLSAtIC0gUkFVQyBIYXdrYml0
IFVwZGF0ZXIKK2VuZGVmCiBlbHNlCiBSQVVDX0hBV0tCSVRfVVBEQVRFUl9DT05GX09QVFMgKz0g
LURzeXN0ZW1kPWRpc2FibGVkCiBlbmRpZgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
