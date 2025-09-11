Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E4ECAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF8684D71;
	Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sM3q1U2dDRV; Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5582B84D63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5582B84D63;
	Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC1812D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7624404E8
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqlcEwTUxHrQ for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F222A40186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F222A40186
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F222A40186
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so11276835e9.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626074; x=1758230874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzJL5YcVj5fC2H7NNCDykHi2Rc4GSmJfuKNu1YMMWDo=;
 b=GE/kxE7+2WHN/hRFFJko5fdv7d/lW+g8tnIE0LILZMv1yw1RBfs4MDjeb54lLEbcny
 MWFqIvVP8NZ8fFxOPzcFP4cP+E1hJK01hM2cY+ldIbDG8qMhTsZySaZ9lZh20vBFWQxE
 KXhw83i0QqWpUKNJyjr4/521nEwTxScznvIP82g5WQqUcZB2j/H+5xLnbrawl196LCFB
 kUYm1a/XDBtbl1b/2pdCJTlwsXn6N1eWHNRaF9du/HIvMz6WNapsMEY51TUHJoUlwTLt
 VY2c3Kp4bd8f5Yp+o0l4BIQeoxaAMSzzeqjepQXZSQGbmLDxU0sD5Vx/TDfoIPpO/zjn
 rzcQ==
X-Gm-Message-State: AOJu0YxhyLHpnLr2IzPttJW66OGCzQUj9N43h3re1CoNqzd8O9FQQQ2k
 c8Bmsl2ZqyXU7VtLhRZsW7SFIIe5ubZqIhJmVI5/zE+LHdAbe1zL+4CSUhaEUqJv5AWLROzpk+J
 MaQO3ZnA=
X-Gm-Gg: ASbGnctksnzwSKoATDbIkL+MLNyhgYrbTFFbjdUMQRHUrLCi3C8W+6jMXOLJy2GUcIR
 OoIfuK/s7frIsPN0Ymt5qh72KMECHs8O5kyUonTGwSUVnV7PklNkZD4aEwR7abxFRvG1Ya/LDEd
 vNXr3m5o7ywM2+ID/ad3zwXJ5qHRIw/teasxJpUYqRtfSZlZAmKt2pZnzounOfx5TH/+uebSC5h
 CmzLYQCttUJ/I+mWq+0rjLw3WKxpHgj5qj4EnSrz8hnHyNB2GDIfpqKV1PGQontNVHRn0EYgvsi
 H/R0jV9vsh1wGyp3k95pHWELsw4graZcNnFjZO0Rf/Z6AQebrVHMFp2UMtYeqkzZm1W9ViFZcVc
 clv4kQ8qB0W2VaoDvWIkdHx1/OQe1Uvqjgg==
X-Google-Smtp-Source: AGHT+IHi8iU/RRT2Y5iREoiSMSZH2plyIEhRvioyCHPab71uszereNziTagLWGsPl2lF/IgUArO7wA==
X-Received: by 2002:a05:600c:26d2:b0:45d:e326:96ef with SMTP id
 5b1f17b1804b1-45f211cff73mr5480365e9.15.1757626073767; 
 Thu, 11 Sep 2025 14:27:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e016b5a2esm40360635e9.13.2025.09.11.14.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1E16E5F832;
 Thu, 11 Sep 2025 22:27:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:40 +0100
Message-ID: <20250911212752.266940-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626074; x=1758230874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzJL5YcVj5fC2H7NNCDykHi2Rc4GSmJfuKNu1YMMWDo=;
 b=i5dPagsmK7U8Sz8sYVrwpDBBGuOt5z5jQ2/sFlD1B6Wv9f8rZpbcOaq5LeGFrdTbVN
 QRkj56uCWqVLmgocaJVH2IbEhjrs4vC2b5xOJwm+0PJPf4FGzseKhBjgr2edfUVuRXRF
 aEGjzsli5/lhPDFb+gYE6bDEClxNqNfRAdaiKQDDrHSQPAGa+8LdQKPJzR2Hkh9UFln/
 ZOVvSe+cskHpMQpiiAymH6hx5jO2fM8BHotSvq7sk0P3a21t+a13zmpxWjpFhzrxor0z
 g4F/0yd4bqUaN+U8vuO0HIjrBp0qesBuYMc73wEBbCpTGo8yOoRiL3DH8kZVZVEU6y3N
 jLTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i5dPagsm
Subject: [Buildroot] [PATCH v5 0/9] kvm-unit-tests: update deps and fine
 tune qemu
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

VGhlIGt2bS11bml0LXRlc3RzIHJlY2lwZSBpcyBhIGxpdHRsZSBvdXQgb2YgZGF0ZSB3aXRoIHRo
ZQpkZXBlbmRlbmNpZXMgaXQgbmVlZHMuIFdpdGggdGhhdCBhbmQgc29tZSB0d2Vha2luZyBvZiB0
aGUgb2YgcHJvY2Vzc29yCmRlcGVuZGVuY2llcyB3ZSBjYW4gbm93IGJ1aWxkIGt2bS11bml0LXRl
c3RzIGZvciBhcm02NC4KCkFzIGt2bS11bml0LXRlc3RzIG5lZWQgdGhlIGxpYmMgdXRpbHMgYW5k
IEkgdXNlIGV4dGVybmFsIHRvb2xpbmcgSQphZGRlZCBzdXBwb3J0IGZvciB0aGF0LgoKT24gdGhl
IHdheSBJJ3ZlIGFkZGVkIHNvbWUgbmV3IGNvbmZpZyBvcHRpb25zIGZvciBRRU1VIHNvIHlvdSBj
YW4ganVzdApzZWxlY3QgeW91ciBuYXRpdmUsIGt2bS1vbmx5IFFFTVUgYnVpbGQuCgpGb3IgQXJt
IHdlIGNhbiBhbHNvIHJ1biB3aXRoIGt2bXRvb2wgc28gSSd2ZSBhZGRlZCBhbiBvcHRpb24gdG8g
ZW5hYmxlCnRoYXQuCgpGaW5hbGx5IEkndmUgYWRkZWQgYSBzaW1wbGUgdGVzdCBjYXNlIGZvciB0
aGUga3ZtLXVuaXQtdGVzdHMgcGFja2FnZS4KCkZvciB2NQogIC0gbW9yZSByLWIgdGFncwogIC0g
YWRkcmVzc2VkIGNvbW1lbnRzIChzZWUgY29tbWl0cykKCkZvciB2NAogIC0gcmUtYmFzZQogIC0g
dXBkYXRlIGt2bS11bml0LXRlc3RzIHRvIHYyMDI1LTA3LTMxCgpGb3IgdjMKICAtIGFkZCByLWIg
dGFncwogIC0gdXBkYXRlIGt2bS11bml0LXRlc3RzIHRvIGN1cnJlbnQgbWFzdGVyCiAgLSB1cGRh
dGUga3ZtdG9vbAogIC0gZW5hYmxlIGt2bXRvb2wgYXMgYWx0ZXJuYXRpdmUgdG8gUUVNVQoKRm9y
IHYyCiAgLSBhZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzCiAgLSBhZGRlZCBleHRlcm5hbCBsaWJj
IHV0aWwgc3VwcG9ydAogIC0gYWRkZWQgdGVzdCBjYXNlCiAgLSByYW4gYW5kIGFkZHJlc3NlZCBs
aW50ZXIgd2FybmluZ3MKCkFsZXguCgpBbGV4IEJlbm7DqWUgKDkpOgogIHRvb2xjaGFpbi9leHRl
cm5hbDogYWxsb3cgaW5zdGFsbGluZyBvZiBsaWJjIHV0aWxzCiAgcGFja2FnZS9rdm0tdW5pdC10
ZXN0czogYXNzdW1lIEFBcmNoNjQgc3VwcG9ydHMgS1ZNCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0
czogdXBkYXRlIGRlcGVuZGVuY2llcwogIHBhY2thZ2UvcWVtdTogaW50cm9kdWNlIGt2bSBhbmQg
dGNnIHN5c3RlbSBvcHRpb25zCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogYnVtcCB0byB2MjAy
NS0wNy0zMQogIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHM6IGhvbm91ciBCUjJfQVJNNjRfUEFHRV9T
SVpFCiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdCBmb3Iga3ZtLXVuaXQtdGVzdHMKICBwYWNr
YWdlL2t2bXRvb2w6IGJ1bXAgdG8gY3VycmVudCBIRUFECiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0
czogYWxsb3cga3ZtdG9vbCB0byBiZSB1c2VkCgogYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGlu
dXguY29uZmlnICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcu
aW4gICAgICAgICAgICAgIHwgMzcgKysrKysrKysrLS0tLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0
cy9rdm0tdW5pdC10ZXN0cy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
a3ZtLXVuaXQtdGVzdHMubWsgICAgICB8IDIxICsrKysrKystCiAuLi5lLWgtaW5jbHVzaW9uLWZv
ci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2ggfCA1MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNr
YWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2Fn
ZS9rdm10b29sL2t2bXRvb2wubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uv
cWVtdS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICB8IDIzICsrKysrKy0tCiBwYWNr
YWdlL3FlbXUvcWVtdS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrLQogc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkgICAgIHwgNDcgKysrKysrKysr
KysrKysrKysKIHRvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluICAgICAgICB8
ICA3ICsrKwogLi4uL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgICAgICAgICAgICAgICAgIHwg
MjQgKysrKysrKysrCiAxMiBmaWxlcyBjaGFuZ2VkLCAxNjIgaW5zZXJ0aW9ucygrKSwgNzEgZGVs
ZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3Zl
LXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2t2bS5weQoK
LS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
