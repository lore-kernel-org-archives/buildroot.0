Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D32C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9BFD41BB4;
	Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo8Pu3JAscad; Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6133441B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6133441B8C;
	Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B6912C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23084026D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVGB1Ld9_vfP for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8215C401CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8215C401CB
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8215C401CB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so3474855f8f.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407096; x=1755011896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qqLIFn4sWlXA1/CBCOGzDWdeBWk7ErcCgVnUlGPgyyE=;
 b=IPo/HV0FkHkQEMaFPEXbywi6DwNyhKUO1HgHpMzQSAZgS9hQvfq+V927SNLRIoV+qu
 7u+io1u77kAZ4K7s1kIBAdNIO4hXW9XWLfjy7gULLZd19PrsByJDAgZDI68riK+l7+qA
 8taqH+bU88nk6IKXkYU4jDAQFL2fJz8EIoDnWP47/28hiqnVd2VPKL3Eq3nyiK4j7q+r
 2nTqdJk7PlHalBvGBAtsCprZ4vnrxGKoVnKLQ1BeYacXqk7geFGEmGmYCvQ6J53jdtt8
 HV2PB45t7xN0LvBu5QjSaMr/7Ox234W3Gf4gxWs6uAMpIqQsiIt8gz62G7TuA/Lee5bh
 8j/w==
X-Gm-Message-State: AOJu0YzMlWJMepm3CMEghPJO3E2NrrjdqTHcKug3pSqYo54GvB4Dp2N8
 nwrKugv6llm6jc8g79C8sKR/y5Mts6f7v5932yRUVhBmIClAMT5zwaSzsh8rpRbimj4C1zO7cPb
 JGDKw
X-Gm-Gg: ASbGncur9xvZ//5dSYHXzQzJLUhGQPL223/1Gup1LMwyY1igXtLmutld3+Oh4cJJxkl
 d88Q3+gA6FE//ItHD1SF1serh9J/GG85S4eOzpjFvYHnGI2eNnM6cnwHRwQjcf2OcQBGKlosUPh
 AlqYn+fJYnqqKSQOvf9onQcz4bHjBqssaBAsgyjaBJ9dlbFOMg5sSYNGSaCd8rkTxi62TMKeo/m
 8I5B5fFkp0H7KJQF22J2UKaeDjidUFZWGm/5dlynBYgPOksFYkbB+GWc21unjlhsD36LR/OfOHx
 nrclIuAJ0TAJfSNJzPeFVVp+MfcN6Weyr8QDGfKkTzSxlafdZ0Vlc1lj2KRkXvtJYky5XgBg+qg
 U/pGEELzcVDS1eM8HtSUNn5A=
X-Google-Smtp-Source: AGHT+IGSnrZ2xhkrgDAsmACoI0r74bmQN8W55KvHwjGgSUyr1/qYsNCXHx8xpAyjc/vrK1uoUP7D1g==
X-Received: by 2002:a05:6000:188e:b0:3aa:34f4:d437 with SMTP id
 ffacd0b85a97d-3b8d94c13b2mr9516498f8f.37.1754407095784; 
 Tue, 05 Aug 2025 08:18:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0bfc79fsm9457433f8f.56.2025.08.05.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1167C5F7E9;
 Tue, 05 Aug 2025 16:18:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:02 +0100
Message-ID: <20250805151814.1114414-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407096; x=1755011896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qqLIFn4sWlXA1/CBCOGzDWdeBWk7ErcCgVnUlGPgyyE=;
 b=QUC/DA5e14RBBLfEEng2TEFajQViavuBuOoA2aZYT4F1ziFs7sbf3WOsw08yKmLMh4
 UWExSEkpWdrmIkFcBx4XkmYly2ckgHf4awS2h2rZkjEdFLCD7HnoCEZfA/OkkDpnxSBl
 dcjOgUUQsjOffv5pj1EqwFNqn02USiQGf9+JwCamxALCpTb9ssAfZj8s5dr1/eyqTrBJ
 ZA28jtTiCT+T+A6S8DFQzJ/JXRGJ8DE5RRat0ENpms62HSQ3GaObtsxe+vTseQ2cCXJA
 uADH3iOu6ir82xs3uowx1Pe5+DEd11U0uxxH0OmJSnrndxpL748Erkrm5kGq4CJmZj19
 6kYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QUC/DA5e
Subject: [Buildroot] [PATCH v4 0/9] kvm-unit-tests: update deps and fine
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
aGUga3ZtLXVuaXQtdGVzdHMgcGFja2FnZS4KCkZvciB2NAogIC0gcmUtYmFzZQogIC0gdXBkYXRl
IGt2bS11bml0LXRlc3RzIHRvIHYyMDI1LTA3LTMxCgpGb3IgdjMKICAtIGFkZCByLWIgdGFncwog
IC0gdXBkYXRlIGt2bS11bml0LXRlc3RzIHRvIGN1cnJlbnQgbWFzdGVyCiAgLSB1cGRhdGUga3Zt
dG9vbAogIC0gZW5hYmxlIGt2bXRvb2wgYXMgYWx0ZXJuYXRpdmUgdG8gUUVNVQoKRm9yIHYyCiAg
LSBhZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzCiAgLSBhZGRlZCBleHRlcm5hbCBsaWJjIHV0aWwg
c3VwcG9ydAogIC0gYWRkZWQgdGVzdCBjYXNlCiAgLSByYW4gYW5kIGFkZHJlc3NlZCBsaW50ZXIg
d2FybmluZ3MKCkFsZXguCgpBbGV4IEJlbm7DqWUgKDkpOgogIHRvb2xjaGFpbi9leHRlcm5hbDog
YWxsb3cgaW5zdGFsbGluZyBvZiBsaWJjIHV0aWxzCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czog
YXNzdW1lIEFBcmNoNjQgc3VwcG9ydHMgS1ZNCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogdXBk
YXRlIGRlcGVuZGVuY2llcwogIHBhY2thZ2UvcWVtdTogaW50cm9kdWNlIGt2bSBhbmQgdGNnIHN5
c3RlbSBvcHRpb25zCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogYnVtcCB0byB2MjAyNS0wNy0z
MQogIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHM6IGhvbm91ciBCUjJfQVJNNjRfUEFHRV9TSVpFCiAg
c3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdCBmb3Iga3ZtLXVuaXQtdGVzdHMKICBwYWNrYWdlL2t2
bXRvb2w6IGJ1bXAgdG8gY3VycmVudCBIRUFECiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogYWxs
b3cga3ZtdG9vbCB0byBiZSB1c2VkCgogYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGludXguY29u
ZmlnICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gICAg
ICAgICAgICAgIHwgMzcgKysrKysrKysrLS0tLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVu
aXQtdGVzdHMubWsgICAgICB8IDE3ICsrKysrLQogLi4uZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1j
b21wYXRpYmlsaXR5LnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9rdm10
b29sL2t2bXRvb2wuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uva3ZtdG9v
bC9rdm10b29sLm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3FlbXUvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAyMyArKysrKystLQogcGFja2FnZS9xZW11
L3FlbXUubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKy0KIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5ICAgICB8IDQ3ICsrKysrKysrKysrKysrKysr
CiB0b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiAgICAgICAgfCAgNyArKysK
IC4uLi9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rICAgICAgICAgICAgICAgICB8IDI0ICsrKysr
KysrKwogMTIgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDczIGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva3ZtdG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6
ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKCi0tIAoyLjQ3
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
