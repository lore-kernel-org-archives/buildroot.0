Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9858FC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 07:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D931419A0;
	Fri,  7 Jun 2024 07:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDjyPxlh2VHq; Fri,  7 Jun 2024 07:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A75F416F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A75F416F7;
	Fri,  7 Jun 2024 07:14:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 106D51BF4D6
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F02BD8126A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_zruBmvacMh for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 07:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B057C811A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B057C811A3
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B057C811A3
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 07:14:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52bbf73f334so154018e87.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 00:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717744456; x=1718349256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9ZouVRC51woR8s/bX3MAc7bMkLWKxzcD3oYCKAM8GU=;
 b=F4bIR4yz2B8d0LzI6XzpSlp+1T+DdAVIk2FUAm5pg3UHStqL+s21m0gYL9xqlupXMa
 lOADB4j7AAmH5zZJz127bPAcxp6lsOMA6SOnGd2ZlLrjY9syu1eKHY3o4MN7NZbyoeJZ
 cqSR9CXmPo2wI/1wyiFXy3LKzJ4G103Nj6PnGhRDCjKM/3NdfpPsUBETH8ctGq07sTyV
 1KYEFLmHJAyLpU9THSmrcW8mpKW791IoDSivc+hI5029vePU5cGk24hbLngRcC3Yl1PS
 WfbXdfpRTBGKIMdkiETL5Wa9CpVstrSxGHKe1MACx0CoUh3uPAxoBoPPqkqKms5TwMcN
 bi4A==
X-Gm-Message-State: AOJu0Yw2Kyj0LDlpQs+wT/tElCsw+rwza2b7u5GCnkOs9qjxbHLmXf87
 GLNMQoyc0aVxQL+0oHf2mYgZIadN2UisNtVRmQKr4uaxlg6v4N1TT2arSxB61sCQiTIWh4zibRk
 loBY=
X-Google-Smtp-Source: AGHT+IHC8INEdDaDuVrhU6wwBzPu1ak/CztXjXmZkfBBh4PXnleOPGIzBmqNnK882jDwXpYgMsTVAQ==
X-Received: by 2002:a05:6512:3ca3:b0:529:593f:3f3c with SMTP id
 2adb3069b0e04-52bb9fc5791mr1323732e87.53.1717744455832; 
 Fri, 07 Jun 2024 00:14:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc12e0sm3324083f8f.100.2024.06.07.00.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 00:14:15 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 09:13:57 +0200
Message-ID: <20240607071359.767329-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1717744456; x=1718349256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9ZouVRC51woR8s/bX3MAc7bMkLWKxzcD3oYCKAM8GU=;
 b=KrK4tn0XCto099ehra3ha6TBg2VEccjU01vJXPQ0zfouircPwcf5jUFwsiCAJN99gS
 bRZOnOiMEt1I8lFW4ZkjGheW3tVcVflacNJOsSx+P6qF2Zx/7ItuQrHOc6bFlk5uENQ5
 WJ7yq7Wm0Cp/IzI4LngAda5s0VG2HEM5rB90c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=KrK4tn0X
Subject: [Buildroot] [next v2 0/2] raspberrypi*: bumps to kernel 6.6.28 and
 rpi-firmware
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
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGJ1bXBzIHRoZSBrZXJuZWwgdmVyc2lvbiB0byA2LjYu
MjggYW5kIHRoZSBycGktZmlybXdhcmUKKGZvciB0aGUgZGV2aWNlLXRyZWUgYmxvYiBvdmVybGF5
cykuCgpUaGUgZmlyc3QgcGF0Y2ggYnVtcHMgdGhlIGtlcm5lbCBhbmQgdXBkYXRlcyB0aGUgcGF0
aCB0byB0aGUgaW4tdHJlZSBkdHMKbmFtZXMgb2YgdGhlIDMyLWJpdCBkZWZjb25maWdzIGFzIHRo
ZSBkdHMgZmlsZXMgbW92ZWQgdG8gYSBwZXItdmVuZG9yCnN1Yi1kaXJlY3RvcnkpLgoKVGhlIHNl
Y29uZCBwYXRjaCBidW1wcyB0aGUgcnBpLWZpcm13YXJlIHNvIHRoZSBkdGJvIGZpbGVzIHN0YXkg
c3luY2VkCndpdGggdGhlIGtlcm5lbC4KCk5vdGU6IEkgaGF2ZSB0ZXN0ZWQgdGhlIGNvbmZpZ3Vy
YXRpb24gb24gcGksIHBpMywgcGkzXzY0LCBwaTQsIHBpNF82NCwKcGkwLCBwaTB3IGFuZCBldmVu
IG9uIHBpNS4gSWYgc29tZW9uZSBoYXZlIHBpMiwgcGl6ZXJvMncgYW5kIGNtNGlvCmhhcmR3YXJl
cywgSSB3b3VsZCBiZSB0aGFua2Z1bCBpZiB0aGVzZSBjb25maWd1cmF0aW9uIGFyZSB0ZXN0ZWQu
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBSZWJhc2Ugb24gdG9wIG9mIG5leHQKIC0gVXBkYXRlIGRl
ZmNvbmZpZyB0byBuZXcgcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwoKS2luZCBSZWdhcmRzLApHYcOr
bCBQT1JUQVkgKDIpOgogIGNvbmZpZ3MvcmFzcGJlcnJ5cGkqOiBidW1wIGtlcm5lbCB2ZXJzaW9u
IHRvIDE3ZjEzNWIgKDYuNi4yOCkKICBwYWNrYWdlL3JwaS1maXJtd2FyZTogYnVtcCB2ZXJzaW9u
IHRvIDU0NzY3MjAKCiBjb25maWdzL3Jhc3BiZXJyeXBpMF9kZWZjb25maWcgICAgICAgICB8IDgg
KysrKy0tLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwd19kZWZjb25maWcgICAgICAgIHwgOCArKysr
LS0tLQogY29uZmlncy9yYXNwYmVycnlwaTJfZGVmY29uZmlnICAgICAgICAgfCA4ICsrKystLS0t
CiBjb25maWdzL3Jhc3BiZXJyeXBpM182NF9kZWZjb25maWcgICAgICB8IDYgKysrLS0tCiBjb25m
aWdzL3Jhc3BiZXJyeXBpM19kZWZjb25maWcgICAgICAgICB8IDggKysrKy0tLS0KIGNvbmZpZ3Mv
cmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZyAgIHwgNiArKystLS0KIGNvbmZpZ3MvcmFzcGJl
cnJ5cGk0XzY0X2RlZmNvbmZpZyAgICAgIHwgNiArKystLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGk0
X2RlZmNvbmZpZyAgICAgICAgIHwgOCArKysrLS0tLQogY29uZmlncy9yYXNwYmVycnlwaTVfZGVm
Y29uZmlnICAgICAgICAgfCA2ICsrKy0tLQogY29uZmlncy9yYXNwYmVycnlwaV9kZWZjb25maWcg
ICAgICAgICAgfCA4ICsrKystLS0tCiBjb25maWdzL3Jhc3BiZXJyeXBpY200aW9fNjRfZGVmY29u
ZmlnICB8IDYgKysrLS0tCiBjb25maWdzL3Jhc3BiZXJyeXBpY200aW9fZGVmY29uZmlnICAgICB8
IDggKysrKy0tLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnICAgIHwgOCAr
KysrLS0tLQogcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2ggfCAyICstCiBw
YWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgICB8IDIgKy0KIDE1IGZpbGVzIGNo
YW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQoKLS0gCjIuNDUuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
