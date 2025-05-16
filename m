Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B898EC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71BD283126;
	Fri, 16 May 2025 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Od3zVzuiyBMF; Fri, 16 May 2025 17:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC468832C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC468832C2;
	Fri, 16 May 2025 17:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DB041AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EFCA83145
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3M5-jvRxdEB for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F183583126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F183583126
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F183583126
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so17948085e9.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747415541; x=1748020341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ApN95YX6R0KFrl4xs9m+6KekDzBVo6f+3WhquVUSCHA=;
 b=sZUZ3lhEMCnZ7uX0DJpOYW0bgsXhGMp5E7EBp+dQ7r9XzWOk0VWwfkV04DQ6K7p6xO
 IXag9hF/RN97KsfWPTchkeL/zqBTVd2tn6A20ddnimeesLEDCATpNZbRizSZX8Dz0Vi6
 62osurrw4FB8jMfzOO9nm3mVQOii9RsWXUupZDikuN+3JtqcqorhetSSgz8EEkLt4zY/
 2QUAeKZsihFMnaKN0/sxzDaLBfDW8gq8/xL3tXGOxfMAg4Dt+5gIMgnrS8YMsXXBl03Q
 1i5BRZeWIw5sWVFefk0EzA8QRWJBaUuB7yUwhYbTqc3lr6ZVYNlMwhb2zRV3TZ2DHM/L
 FETQ==
X-Gm-Message-State: AOJu0YyJoZY0ye+YoJT6HOI4g0yZvHr/8vUpDZvvTFRSB1IlDQrNoQKB
 dj2UnaJOZBAvDMpAvPaxF3OWVQvFqpYaRRWtgl4TyOLcvDabQtlziL1tZL8J9tfgbAo6Q5u8STk
 nYnyL
X-Gm-Gg: ASbGncubxtZ18ESEntyi4oaoPGsglIVUprYrkxs4YmT9OGpuCrKh4zsEDJenVx4bEMo
 uwN4QcXULghn2bjoE0ay1Ig5j8oHfDFkAaMWjcRZXmfjhQ6bu6t5HfpTmrj50iJKFCoJWiQD1lF
 AXVYMOMxy4PT/0LOua5aRlPsHHbaJEWivLS3eIFjv4yeQePE3PsWhq4XmW+58hFADBndV9xHEoU
 ANxdnhcuhPZ8xyYhD2r44MQHvHSmskY0AwNJN41x+19hE7sWXvHjgsA1F6HEy2FanraA4kbcPbX
 uUeRBkm9B0glqSU/zmV5+PTt4nHFjCF2Hrgm9L4IAgGYhnH9O0mv8Tcrs9UiKMs49FqAmllnI9k
 Zg7txudHW7M7gxT438Z4tKh7ulUHlPxf7oUhrbMo=
X-Google-Smtp-Source: AGHT+IGBuqB4K5idTSsHnbKJBi8XGXJFFZX0LDVCRKGa/jlw5aNpsnklKz9jRo1UQX14LvVdsVsgkg==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id
 5b1f17b1804b1-442fd64dfccmr43380145e9.19.1747415541383; 
 Fri, 16 May 2025 10:12:21 -0700 (PDT)
Received: from P-NAN-ABRICOT.numericable.fr (185.137.153.77.rev.sfr.net.
 [77.153.137.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm105479675e9.14.2025.05.16.10.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 10:12:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 16 May 2025 19:11:29 +0200
Message-ID: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747415541; x=1748020341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ApN95YX6R0KFrl4xs9m+6KekDzBVo6f+3WhquVUSCHA=;
 b=iePQ0LXqKPRb9Nc2XmCCaiFMyMzBLlro9w+3FWsPadJzQ1WLgixMicybHE75qDa/XM
 OEKoG9y1oOVBESjBVHHU75j8f3T59fpVr5ijMFWTSlOiZfc09tN785WnMh/8UWSrb6wN
 diREZJuu0C09Qflrezuh0G4Z1Z4ULsO2ZuGjs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=iePQ0LXq
Subject: [Buildroot] [PATCH 0/5] package/llvm-project: upgrade to version
 20.1.3
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBmaXJzdCBiZXN0LWVmZm9ydCBhdHRl
bXB0IHRvIHVwZGF0ZQpsbHZtLXByb2plY3QgdG8gdmVyc2lvbiAyMC4xLjMuCkR1cmluZyB0aGlz
IHdvcmssIEkgaGF2ZSBhcHBsaWVkIG11bHRpcGxlIGNoYW5nZXMsIGluY2x1ZGluZzoKCkJ1aWxk
IGZpeGVzIHNwZWNpZmljIHRvIHRoZSBuZXcgTExWTSBzdHJ1Y3R1cmUsCgpBZGFwdGF0aW9ucyBh
bmQgY2xlYW51cHMgYmFzZWQgb24gY29tbWl0cyBhbmQgdXBzdHJlYW0KY2hhbmdlcyBvYnNlcnZl
ZCBiZXR3ZWVuIHZlcnNpb25zIDE1LnggYW5kIDIwLjEuMywKCkFkanVzdG1lbnRzIHRvIEJ1aWxk
cm9vdCBpbmZyYXN0cnVjdHVyZSB0byBzdXBwb3J0IHRoZXNlIGNoYW5nZXMgY2xlYW5seS4KClRv
IHZhbGlkYXRlIHRoZSB1cGRhdGUsIEkgcGVyZm9ybWVkOgoKUnVudGltZSB0ZXN0aW5nIHdpdGgg
dGhlIGNsYW5nIGNvbXBpbGVyLXJ0IHRlc3QgdG8gZW5zdXJlIGJhc2ljIGZ1bmN0aW9uYWxpdHks
CgpCdWlsZCB0ZXN0aW5nIGZvciBvdGhlciBjb21wb25lbnRzIGJ5IGVuYWJsaW5nIHRoZW0gaW4g
Cm1lbnVjb25maWcgKHNhbWUgdGVzdCBzZXR1cCkg4oCUIGV2ZXJ5dGhpbmcgYnVpbGRzIHN1Y2Nl
c3NmdWxseSBmb3Igbm93LgoKVGhpcyBwYXRjaHNldCByZXByZXNlbnRzIGEgdmVyc2lvbiAxICh2
MSkgb2YgdGhlIHdvcmsgSeKAmXZlIGRvbmUgc28gZmFyLgpBZGRpdGlvbmFsIHByb2JsZW1zIG1h
eSBhcmlzZSB3aXRoIGJyb2FkZXIgdGVzdGluZyBhbmQgcmV2aWV3LApzbyBJ4oCZbSBzaGFyaW5n
IHRoaXMgd29yayB3aXRoIHRoZSBjb21tdW5pdHkgdG8gZ2F0aGVyIGZlZWRiYWNrLgpJZiBhbnlv
bmUgZW5jb3VudGVycyByZWdyZXNzaW9ucyBvciBpcyBhd2FyZSBvZiBvdGhlciByZWxldmFudCB1
cHN0cmVhbQpjaGFuZ2VzIHRoYXQgc2hvdWxkIGJlIGNvbnNpZGVyZWQsIHlvdXIgaW5wdXQgaXMg
dmVyeSB3ZWxjb21lLgoKTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgY29tbWVudHMgYW5kIHN1Z2dl
c3Rpb25zLgoKQmVzdCByZWdhcmRzLApFbCBNZWhkaSBZT1VORVMKCgpFbCBNZWhkaSBZT1VORVMg
KDUpOgogIHN1cHBvcnQvdGVzdGluZzogVGVzdENsYW5nQ29tcGlsZXJSVDogQWRkIGEga2VybmVs
IGZyYWdtZW50IGZvciA0OAogICAgYml0cyB2aXJ0dWFsIGFkcmVzcwogIHBhY2thZ2UvbGx2bS1w
cm9qZWN0OiBhZGQgbGx2bS1ydW50aW1lcyBwYWNrYWdlCiAgcGFja2FnZS9zcGlydi1sbHZtLXRy
YW5zbGF0b3I6IGJ1bXAgdmVyc2lvbiB0byAyMC4xLjIKICBwYWNrYWdlL3NwaXJ2LWhlYWRlcnMg
c3BpcnYtdG9vbHM6IGJ1bXAgdG8gdmVyc2lvbiAxLjQuMzA5LjAKICBwYWNrYWdlL2xsdm0tcHJv
amVjdDogYnVtcCB0byB2ZXJzaW9uIDIwLjEuMwoKIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyIC0KIC4uLmhhaW5zLUdudS1Vc2UtR0NDX0lOU1RBTExf
UFJFRklYLWluLS5wYXRjaCB8IDc4IC0tLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvbGx2bS1w
cm9qZWN0L2NsYW5nL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbGx2bS1wcm9q
ZWN0L2NsYW5nL2NsYW5nLmhhc2ggICAgICAgICB8ICAyICstCiBwYWNrYWdlL2xsdm0tcHJvamVj
dC9jbGFuZy9jbGFuZy5tayAgICAgICAgICAgfCAyNyArKysrKystCiBwYWNrYWdlL2xsdm0tcHJv
amVjdC9jb21waWxlci1ydC9Db25maWcuaW4gICAgfCAgMSArCiAuLi4vbGx2bS1wcm9qZWN0L2Nv
bXBpbGVyLXJ0L2NvbXBpbGVyLXJ0Lmhhc2ggfCAgMiArLQogLi4uL2xsdm0tcHJvamVjdC9jb21w
aWxlci1ydC9jb21waWxlci1ydC5tayAgIHwgIDkgKystCiAuLi4vMDAwMS1zdXBwb3J0LW91dC1v
Zi10cmVlLWJ1aWxkLnBhdGNoICAgICAgfCA3NyArKysrKy0tLS0tLS0tLS0tLS0KIHBhY2thZ2Uv
bGx2bS1wcm9qZWN0L2xpYmNsYy9Db25maWcuaW4gICAgICAgICB8ICAxICsKIHBhY2thZ2UvbGx2
bS1wcm9qZWN0L2xpYmNsYy9saWJjbGMuaGFzaCAgICAgICB8ICAyICstCiBwYWNrYWdlL2xsdm0t
cHJvamVjdC9saWJjbGMvbGliY2xjLm1rICAgICAgICAgfCAgNSArLQogcGFja2FnZS9sbHZtLXBy
b2plY3QvbGxkL0NvbmZpZy5pbi5ob3N0ICAgICAgIHwgIDEgKwogcGFja2FnZS9sbHZtLXByb2pl
Y3QvbGxkL2xsZC5oYXNoICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvbGx2bS1wcm9qZWN0
L2xsZC9sbGQubWsgICAgICAgICAgICAgICB8ICAyICsKIC4uLi9sbHZtLXByb2plY3QvbGx2bS1j
bWFrZS9sbHZtLWNtYWtlLmhhc2ggICB8ICAyICstCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZt
LWNtYWtlL2xsdm0tY21ha2UubWsgfCAgNSArLQogLi4uL2xsdm0tbGlidW53aW5kL2xsdm0tbGli
dW53aW5kLmhhc2ggICAgICAgIHwgIDIgKy0KIC4uLi9sbHZtLWxpYnVud2luZC9sbHZtLWxpYnVu
d2luZC5tayAgICAgICAgICB8ICA1ICstCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLXByb2pl
Y3QubWsgICAgICAgICAgfCAgNCArLQogLi4uL2xsdm0tcnVudGltZXMvbGx2bS1ydW50aW1lcy5o
YXNoICAgICAgICAgIHwgIDEgKwogLi4uL2xsdm0tcnVudGltZXMvbGx2bS1ydW50aW1lcy5tayAg
ICAgICAgICAgIHwgMTcgKysrKwogLi4uLzAwMDEtRml4LXN0YW5kYWxvbmUtYnVpbGQtZm9yLWxs
dm0ucGF0Y2ggIHwgNDkgKysrKysrKysrKysrCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0Nv
bmZpZy5pbiAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0u
aGFzaCAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1r
ICAgICAgICAgICAgIHwgMTQgKysrLQogcGFja2FnZS9zcGlydi1oZWFkZXJzL3NwaXJ2LWhlYWRl
cnMuaGFzaCAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvc3BpcnYtaGVhZGVycy9zcGlydi1oZWFkZXJz
Lm1rICAgICAgICB8ICA0ICstCiAuLi4vc3BpcnYtbGx2bS10cmFuc2xhdG9yLmhhc2ggICAgICAg
ICAgICAgICAgfCAgMiArLQogLi4uL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci5tayAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvc3BpcnYtdG9vbHMvc3BpcnYtdG9vbHMuaGFzaCAgICAg
ICAgICB8ICAyICstCiBwYWNrYWdlL3NwaXJ2LXRvb2xzL3NwaXJ2LXRvb2xzLm1rICAgICAgICAg
ICAgfCAgNCArLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9jbGFuZy5weSAg
IHwgIDUgKy0KIC4uLi90ZXN0X2NsYW5nL2xpbnV4LWFybTY0LXZhNDguZnJhZ21lbnQgICAgICB8
ICAxICsKIHRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jICAgICAgICAgICAgICAgICB8ICAz
ICsKIDM1IGZpbGVzIGNoYW5nZWQsIDE2NSBpbnNlcnRpb25zKCspLCAxNzQgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvMDAwMS1saWIt
RHJpdmVyLVRvb2xDaGFpbnMtR251LVVzZS1HQ0NfSU5TVEFMTF9QUkVGSVgtaW4tLnBhdGNoCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1ydW50aW1lcy9sbHZt
LXJ1bnRpbWVzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xsdm0tcHJvamVjdC9s
bHZtLXJ1bnRpbWVzL2xsdm0tcnVudGltZXMubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xsdm0tcHJvamVjdC9sbHZtLzAwMDEtRml4LXN0YW5kYWxvbmUtYnVpbGQtZm9yLWxsdm0ucGF0
Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X2NsYW5nL2xpbnV4LWFybTY0LXZhNDguZnJhZ21lbnQKCi0tIAoyLjQzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
