Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66941C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 01:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A920641D11;
	Sat, 27 Apr 2024 01:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrfnkqqp0xQ7; Sat, 27 Apr 2024 01:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB42B40116
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB42B40116;
	Sat, 27 Apr 2024 01:41:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 851AB1BF59E
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EABA614C7
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 01:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YXZ8hOp7V5n for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 01:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27AA86149A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AA86149A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27AA86149A
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 01:41:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41bd202f0b7so1456645e9.3
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 18:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714182087; x=1714786887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I0MXsIPUZ4a1OXqmnlMyS54aRCdzyJjbw5W8+nH2Fx4=;
 b=bbQHkDp7fjHVWDGKFywW7u7mJ/qXAJTAWe4GQRrN+BS2Wuh5ph76bq93y9iy29/l9i
 m7Pm/EeMkEE8Zk05SGBg9ubaRsXLxQIGfKhN5Ll3VUUVogXeIhDUqD7Uxa7+J0PLDKvg
 LuxEM1oIzhHlGmE4WsMXimPrSQO70ydSsF60Hl2XaobVqchP1acqOT7gCrAQDZ3qD4cm
 vUJwsPG3a0UJofvqLIUCBxUSCJfHHyAJVaqIb/SWclppeMW6DXKQatNmAqJgJAUIjCUY
 OauKkznELrSRCzalUovL+7mOa3ArBjPr8uT8b6sbqY4HddKU0Hyay8rhepII48k1WC7h
 WpaQ==
X-Gm-Message-State: AOJu0YxXAvGnQ9ECMeSzpZjfdUhNcWLkx4OiSWHgvB1m4FPC2bJdlsUF
 2PRzcvdmzZ9ap5x09AjNJFrAAJAABe027f1pvNlTX4W/Toy0QPz1PNoXqIbGRoN1/bWYVss930b
 Q1ws=
X-Google-Smtp-Source: AGHT+IG0ROpOT5fu20Tur8F1IXybqRWiSEywBqULnjPQk72gVyK3f7T2Nb96N6VpwepHvlMDVebBKA==
X-Received: by 2002:a05:600c:a01:b0:41a:225f:becc with SMTP id
 z1-20020a05600c0a0100b0041a225fbeccmr4389507wmp.21.1714182087024; 
 Fri, 26 Apr 2024 18:41:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm23975689wri.84.2024.04.26.18.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 18:41:26 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 03:40:51 +0200
Message-ID: <20240427014053.410789-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1714182087; x=1714786887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I0MXsIPUZ4a1OXqmnlMyS54aRCdzyJjbw5W8+nH2Fx4=;
 b=Sk89P/UzucehUyLw0DsO+Y6mPIBmQFrV803nETMrHVjrh6UOB7XWYJijhh0izZa1rB
 gw03cMlKjx7FHHoHdF400AFlUik9AyNhAc4hFf4l1Ijc9a1K3R0Fc2fEetA6QQhXq2FP
 f1r6ok+vZJBnACWwJcRI+IiDSdNY5GpSdMOqs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=Sk89P/Uz
Subject: [Buildroot] [PATCH 0/2] raspberrypi*: bumps to kernel 6.6.28 and
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
 Martin Bark <martin@barkynet.com>
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
CgpLaW5kIFJlZ2FyZHMsCkdhw6tsIFBPUlRBWSAoMik6CiAgY29uZmlncy9yYXNwYmVycnlwaSo6
IGJ1bXAga2VybmVsIHZlcnNpb24gdG8gMTdmMTM1YiAoNi42LjI4KQogIHBhY2thZ2UvcnBpLWZp
cm13YXJlOiBidW1wIHZlcnNpb24gdG8gNTQ3NjcyMAoKIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwX2Rl
ZmNvbmZpZyAgICAgICAgIHwgOCArKysrLS0tLQogY29uZmlncy9yYXNwYmVycnlwaTB3X2RlZmNv
bmZpZyAgICAgICAgfCA4ICsrKystLS0tCiBjb25maWdzL3Jhc3BiZXJyeXBpMl9kZWZjb25maWcg
ICAgICAgICB8IDggKysrKy0tLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyAg
ICAgIHwgNiArKystLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkzX2RlZmNvbmZpZyAgICAgICAgIHwg
OCArKysrLS0tLQogY29uZmlncy9yYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnICAgfCA2ICsr
Ky0tLQogY29uZmlncy9yYXNwYmVycnlwaTRfNjRfZGVmY29uZmlnICAgICAgfCA2ICsrKy0tLQog
Y29uZmlncy9yYXNwYmVycnlwaTRfZGVmY29uZmlnICAgICAgICAgfCA4ICsrKystLS0tCiBjb25m
aWdzL3Jhc3BiZXJyeXBpX2RlZmNvbmZpZyAgICAgICAgICB8IDggKysrKy0tLS0KIGNvbmZpZ3Mv
cmFzcGJlcnJ5cGljbTRpb182NF9kZWZjb25maWcgIHwgNiArKystLS0KIGNvbmZpZ3MvcmFzcGJl
cnJ5cGljbTRpb19kZWZjb25maWcgICAgIHwgOCArKysrLS0tLQogY29uZmlncy9yYXNwYmVycnlw
aXplcm8yd19kZWZjb25maWcgICAgfCA4ICsrKystLS0tCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9y
cGktZmlybXdhcmUuaGFzaCB8IDIgKy0KIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2Fy
ZS5tayAgIHwgMiArLQogMTQgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDYgZGVs
ZXRpb25zKC0pCgotLQoyLjQ0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
