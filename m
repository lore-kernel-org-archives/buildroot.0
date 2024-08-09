Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C08C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A65412A4;
	Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTrJFYRkTpiU; Fri,  9 Aug 2024 11:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D701E412C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D701E412C0;
	Fri,  9 Aug 2024 11:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39BBC1BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 351CF612EE
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciG5iMUCLe_w for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4554060F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4554060F3E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4554060F3E
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:27:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-428243f928cso13082635e9.3
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 04:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723202870; x=1723807670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBfPO+ZmWeaEDGmTXQhG/1QXbgCaYoj5M4e6+bHrYA0=;
 b=j7hJXFVoSdm/zbJxaNlccNLBOIM+TJNj19SkiqbewBZ6yy/2A1Dx8mNaGe8jw1yA/o
 XO6rrMP1DmrOO6vzUpEk9s4s8qo9w9ZaOE5qIB6DOgkAZVb/WaK4XtbH/4fbvCCC+Rdd
 UKHzEfHGIIeilRn4HEoqt2iyZliujx4nhmsvuhOEZ5KUSlDqpoR9Y2DzDlRlEA/tX5ZQ
 bft74mRvGoN/lvrKxiWgMZIYWq5Guj14aNaG3hnnkiYcBhqklvjINsYh14HmUPDQIWi+
 FHlecN6mN3nH5sZGYLGdjxTMWE1XKu9dJ4SRWyeIgfPQO0ZrPdgdeiayl4vspCmiyFDE
 AMIA==
X-Gm-Message-State: AOJu0YzPG1TBKh0+x5TrVUmhnE9mSEKZ16AjWB829bYCnfd5ljzhQSnw
 cJo0jth6v+MmggimPy799AW4Ryd34zWk6RhEqY3hBFFx4Ie01GS4HwQnS2bwTw3eMA==
X-Google-Smtp-Source: AGHT+IEvwYmPwtZNwgHmTM0dAsvIcVD/XGzs9rQHShZyENeNVjnJrh5dGixeFdHnQwIz1DS7DduCOg==
X-Received: by 2002:adf:b1de:0:b0:366:ee9b:847 with SMTP id
 ffacd0b85a97d-36d5f9a2738mr981250f8f.14.1723202869464; 
 Fri, 09 Aug 2024 04:27:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d272291c9sm4989102f8f.97.2024.08.09.04.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 04:27:49 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:27:36 +0200
Message-ID: <20240809112739.690823-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723202870; x=1723807670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBfPO+ZmWeaEDGmTXQhG/1QXbgCaYoj5M4e6+bHrYA0=;
 b=ZRZPGutgqAodjr8upsM/1WNXc2RsmKXKwRKxAewDoiZ8wv164brOwoZvltqBLuq8co
 0PNePKB6Tj6tZe+JkJ72dPuSECoWAsuL9uc1nMjzlWkwX6IeGIZui/Oc3L0EadDckpDi
 VHx4zRm3Bg0u20GZwUhSazms5rV4VhuhA41xAoIg7f+j/6FVSjbNqRGiNx+cNlVcl5/f
 Q8IpLgliYmQ2KdvieoRhHWslONnL2qrX+msuptP0y91ctwzEknca1vZgS4gXe+wR/Uql
 cEpvstQGw4umKYc+lkwFr7v3ITAxy1A2zR1BW+C1tHBllKUQW/90s2xjUQ8/p4id4NQa
 k/Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZRZPGutg
Subject: [Buildroot] [PATCH v2 0/3] configs: add Raspberry Pi Zero 2 W
 64-bit defconfig
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGFkZHMgdGhlIGRlZmNvbmZpZyB0byBidWlsZCBhbiBp
bWFnZSBmb3IgdGhlIFJhc3BiZXJyeQpQaSBaZXJvIDIgVyAoNjQtYml0KS4KClRoZSBmaXJzdCBw
YXRjaCByZW1vdmVzIHRoZSB1bm5lY2Vzc2FyeSBzeW1saW5rcyAoaW4gdGhlIGhvcGUgaXQgd2ls
bApub3QgYnJlYWsgdGhlIGJyMi1leHRlcm5hbCB0cnVzdGluZyB0aGVzZSBzeW1saW5rcyB0byBl
eGlzdDsgYW5kIEkgaG9wZQpJIGhhdmUgbm90IG1pc3NlZCBzb21ldGhpbmcpLgoKVGhlIHNlY29u
ZCBwYXRjaCBhZGRzIG15c2VsZiBhcyBkZXZlbG9wZXIgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpCmRl
ZmNvbmZpZ3MuCgpUaGUgbGFzdCBwYXRjaCBhZGRzIHRoZSBkZWZjb25maWcuCgpDaGFuZ2VzIHNp
bmNlIHYxOgogLSBBZGQgcGF0Y2ggdG8gcmVtb3ZlIHVubmVjZXNzYXJ5IHN5bWxpbmtzCiAtIEFk
ZCBwYXRjaCB0byBhZGQgbXlzZWxmIGFzIGRldmVsb3BlciBmb3IgZXZlcnkgcmFzcGJlcnJ5cGkK
IC0gUmVtb3ZlIG1lcmdlZCBwYXRjaCByZXdvcmRpbmcgY29uc29sZSBjb21tZW50CiAtIFJldGl0
bGUgY29tbWl0IG1lc3NhZ2UgY29ycmVjdGx5CgpSZWdhcmRzLApHYcOrbCBQT1JUQVkgKDMpOgog
IGJvYXJkL3Jhc3BiZXJyeXBpKjogcmVtb3ZlIHVubmVjZXNzYXJ5IHN5bWxpbmtzCiAgREVWRUxP
UEVSUzogYWRkIG15c2VsZiBhcyBkZXZlbG9wZXIgZm9yIHJhc3BiZXJyeXBpCiAgY29uZmlncy9y
YXNwYmVycnlwaXplcm8yd182NDogbmV3IGRlZmNvbmZpZwoKIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysKIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196
ZXJvMndfNjRiaXQudHh0IHwgMzIgKysrKysrKysrKysrKysrCiBib2FyZC9yYXNwYmVycnlwaTAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGJvYXJkL3Jhc3BiZXJyeXBpMHcgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgLQogYm9hcmQvcmFzcGJlcnJ5cGkyICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSAtCiBib2FyZC9yYXNwYmVycnlwaTMgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxIC0KIGJvYXJkL3Jhc3BiZXJyeXBpMy02NCAgICAgICAgICAgICAgICAgICAgIHwgIDEg
LQogYm9hcmQvcmFzcGJlcnJ5cGk0ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBib2Fy
ZC9yYXNwYmVycnlwaTQtNjQgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGJvYXJkL3Jhc3Bi
ZXJyeXBpNSAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQogYm9hcmQvcmFzcGJlcnJ5cGlj
bTRpbyAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBib2FyZC9yYXNwYmVycnlwaWNtNGlvLTY0
ICAgICAgICAgICAgICAgICB8ICAxIC0KIGJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3ICAgICAgICAg
ICAgICAgICAgIHwgIDEgLQogY29uZmlncy9yYXNwYmVycnlwaTBfZGVmY29uZmlnICAgICAgICAg
ICAgfCAgNiArLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwd19kZWZjb25maWcgICAgICAgICAgIHwg
IDYgKy0tCiBjb25maWdzL3Jhc3BiZXJyeXBpMl9kZWZjb25maWcgICAgICAgICAgICB8ICA0ICst
CiBjb25maWdzL3Jhc3BiZXJyeXBpM182NF9kZWZjb25maWcgICAgICAgICB8ICA2ICstLQogY29u
Zmlncy9yYXNwYmVycnlwaTNfZGVmY29uZmlnICAgICAgICAgICAgfCAgNiArLS0KIGNvbmZpZ3Mv
cmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZyAgICAgIHwgIDYgKy0tCiBjb25maWdzL3Jhc3Bi
ZXJyeXBpNF82NF9kZWZjb25maWcgICAgICAgICB8ICA2ICstLQogY29uZmlncy9yYXNwYmVycnlw
aTRfZGVmY29uZmlnICAgICAgICAgICAgfCAgNiArLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGk1X2Rl
ZmNvbmZpZyAgICAgICAgICAgIHwgIDggKystLQogY29uZmlncy9yYXNwYmVycnlwaWNtNGlvXzY0
X2RlZmNvbmZpZyAgICAgfCAgNiArLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGljbTRpb19kZWZjb25m
aWcgICAgICAgIHwgIDYgKy0tCiBjb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3XzY0X2RlZmNvbmZp
ZyAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrCiBjb25maWdzL3Jhc3BiZXJyeXBpemVy
bzJ3X2RlZmNvbmZpZyAgICAgICB8ICA2ICstLQogMjYgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2Vy
dGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Jhc3Bi
ZXJyeXBpL2NvbmZpZ196ZXJvMndfNjRiaXQudHh0CiBkZWxldGUgbW9kZSAxMjAwMDAgYm9hcmQv
cmFzcGJlcnJ5cGkwCiBkZWxldGUgbW9kZSAxMjAwMDAgYm9hcmQvcmFzcGJlcnJ5cGkwdwogZGVs
ZXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpMgogZGVsZXRlIG1vZGUgMTIwMDAwIGJv
YXJkL3Jhc3BiZXJyeXBpMwogZGVsZXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpMy02
NAogZGVsZXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpNAogZGVsZXRlIG1vZGUgMTIw
MDAwIGJvYXJkL3Jhc3BiZXJyeXBpNC02NAogZGVsZXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3Bi
ZXJyeXBpNQogZGVsZXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpY200aW8KIGRlbGV0
ZSBtb2RlIDEyMDAwMCBib2FyZC9yYXNwYmVycnlwaWNtNGlvLTY0CiBkZWxldGUgbW9kZSAxMjAw
MDAgYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMncKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3Jh
c3BiZXJyeXBpemVybzJ3XzY0X2RlZmNvbmZpZwoKLS0gCjIuNDYuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
