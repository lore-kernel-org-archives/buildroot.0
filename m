Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41411C197A0
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 01:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBBFD4151F;
	Sat, 18 Nov 2023 01:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBFD4151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bT28q_dfRiLT; Sat, 18 Nov 2023 01:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7AB841939;
	Sat, 18 Nov 2023 01:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7AB841939
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7C41BF329
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E8761343
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 01:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E8761343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKWsqB_0OXTv for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 01:55:07 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8733C60C15
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 01:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8733C60C15
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6d67d32adc2so1461385a34.2
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 17:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700272505; x=1700877305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vU/I1upHvZcVqVU5oZUZPsZkFTnVS6IPy7Rp3vSaRsY=;
 b=F7f7dm/Z6WeHZuwB1SU1XDfZdqw+JCDNew19N5uFH9c21JbuR69FMIG/A1B0b9emx+
 UooV6UudJSycqFhUUGPV6LmoxizlBfcRyPuKeyctF9dljm4RF9YRswxCY2MoURH3geLs
 +TnGily6sOgOFFmVxZuVMa4//7i9OSc0CZD8rP7H2OW5xo0IbUy8Z9uNDkLbfK268Nwx
 6Yq7kcuwZRq+8c7g8A59++crTkZzAEv0s17ZfHeiec6gBw5ESqzdV8GHxOItYTM3qQia
 XupbScPeQJnN3cOq0KYKE4If7wRvSCsYjLMFs0MBwoXtyf1cKONLe2GK5tvNlzdfWVBu
 wUWA==
X-Gm-Message-State: AOJu0YzQR6/9NAUcSsTaTfAcIekffAgaXox2zQ0m/bx+jJltuQ0EOrrD
 74fWJf6aZ0Fr9565LWzLa9jkZpoPlSyFJJgyv9RCAw==
X-Google-Smtp-Source: AGHT+IGPtBSNSncr6Rt9hcVL7OYBcUDaalW/Tz5x+2ScowYOj15JNheGCaAJkz9tsfxO9XXa3qvAJw==
X-Received: by 2002:a05:6830:4799:b0:6d3:19bf:2d24 with SMTP id
 df25-20020a056830479900b006d319bf2d24mr1150151otb.12.1700272505607; 
 Fri, 17 Nov 2023 17:55:05 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a63e64e000000b005bd3d6e270dsm2025704pgj.68.2023.11.17.17.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 17:55:05 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 18:54:50 -0700
Message-ID: <20231118015456.2629144-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700272505; x=1700877305;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vU/I1upHvZcVqVU5oZUZPsZkFTnVS6IPy7Rp3vSaRsY=;
 b=QZ5PvVZDG+klYVWc0cbCidTNLBoDqn8qKGhecnAqu3NyWirwndKMb8HjYqscslyAYU
 JCsNCBsv6uLKxbNsTR2XLOOeopqn5gsnKEv/eFpTng6moo45rz1gbe5bweRA8owQBdx/
 8fYC0pkLTor4De4HuY+/rOTpvi6YqxVaaNP6c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QZ5PvVZD
Subject: [Buildroot] [PATCH/next 2/7] package/flutter-engine: Add runtime
 mode choice
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlcmUgYXJlIG9ubHkgdHdvIHBvc3NpYmxlIG1vZGVzIGZvciBGbHV0dGVyOiBEZWJ1ZyBhbmQg
cmVsZWFzZS4gSG93ZXZlciwKdGhlcmUgaXMgYSB0aGlyZCBtb2RlIGF2YWlsYWJsZSB0byB1c2Vy
czogcHJvZmlsZS4KCkFzIEZsdXR0ZXIgcHJvamVjdHMgY2FuIGJlIHByZXR0eSBoZWF2eSBhbmQg
Y29uc3VtZSBhIGxvdCBvZiByZXNvdXJjZXMsIGl0IGlzCm5lY2Vzc2FyeSB0byBhbGxvdyB1c2Vy
cyB0byBwcm9maWxlIHRoZWlyIEZsdXR0ZXIgYXBwbGljYXRpb24gZHVyaW5nCmRldmVsb3BtZW50
LgoKQWRkIHRocmVlIG5ldyBjaG9pY2VzOiBGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREVfe0RF
QlVHLFBST0ZJTEUsUkVMRUFTRX0KYW5kIHNldCByZWxlYXNlIGFzIHRoZSBkZWZhdWx0LgoKU2ln
bmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Ci0tLQogcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9Db25maWcuaW4gICAgICAgICB8IDU3ICsr
KysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVu
Z2luZS5tayB8ICA0ICstCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbiBi
L3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29uZmlnLmluCmluZGV4IDJlYzViOTBmZmQuLjU2MjZl
MzE3NTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29uZmlnLmluCisrKyBi
L3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29uZmlnLmluCkBAIC0zOSw2ICszOSw2MyBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfRkxVVFRFUl9FTkdJTkUKIAogCSAgaHR0cHM6Ly9naXRodWIuY29tL2Zs
dXR0ZXIvZW5naW5lCiAKK2lmIEJSMl9QQUNLQUdFX0ZMVVRURVJfRU5HSU5FCisKK2Nob2ljZQor
CXByb21wdCAiZmx1dHRlci1lbmdpbmUgbW9kZSIKKwlkZWZhdWx0IEZMVVRURVJfRU5HSU5FX1JV
TlRJTUVfTU9ERV9ERUJVRyBpZiBCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcKKwlkZWZhdWx0IEZM
VVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERV9SRUxFQVNFCisKK2NvbmZpZyBGTFVUVEVSX0VOR0lO
RV9SVU5USU1FX01PREVfREVCVUcKKwlib29sICJEZWJ1ZyIKKwloZWxwCisJICBVc2VzIGp1c3Qt
aW4tdGltZSAoSklUKSBjb21waWxhdGlvbiBmb3IgZmFzdGVyIGNvbXBpbGF0aW9uCisJICBhbmQg
ZGVidWdnaW5nLiBUaGlzIG1vZGUgaXMgYWxzbyBjYWxsZWQgY2hlY2sgbW9kZSBvciBzbG93CisJ
ICBtb2RlLiBUaGlzIGFsbG93cyBob3QgcmVsb2FkLgorCisJICBodHRwczovL2RvY3MuZmx1dHRl
ci5kZXYvdGVzdGluZy9idWlsZC1tb2RlcyNkZWJ1ZworCitjb25maWcgRkxVVFRFUl9FTkdJTkVf
UlVOVElNRV9NT0RFX1BST0ZJTEUKKwlib29sICJQcm9maWxlIgorCWhlbHAKKwkgIFNvbWUgZGVi
dWdnaW5nIGFiaWxpdHkgaXMgbWFpbnRhaW5lZOKAlGVub3VnaCB0byBwcm9maWxlIHlvdXIKKwkg
IGFwcHMgcGVyZm9ybWFuY2UuIFByb2ZpbGUgbW9kZSBpcyBkaXNhYmxlZCBvbiB0aGUgZW11bGF0
b3IKKwkgIGFuZCBzaW11bGF0b3IsIGJlY2F1c2UgdGhlaXIgYmVoYXZpb3IgaXMgbm90IHJlcHJl
c2VudGF0aXZlCisJICBvZiByZWFsIHBlcmZvcm1hbmNlLiBQcm9maWxlIG1vZGUgaXMgc2ltaWxh
ciB0byByZWxlYXNlIG1vZGUsCisJICB3aXRoIHRoZSBmb2xsb3dpbmcgZGlmZmVyZW5jZXM6CisK
KwkgIC0gU29tZSBzZXJ2aWNlIGV4dGVuc2lvbnMsIHN1Y2ggYXMgdGhlIG9uZSB0aGF0IGVuYWJs
ZXMgdGhlCisJICAgIHBlcmZvcm1hbmNlIG92ZXJsYXksIGFyZSBlbmFibGVkLgorCisJICAtIFRy
YWNpbmcgaXMgZW5hYmxlZCwgYW5kIHRvb2xzIHN1cHBvcnRpbmcgc291cmNlLWxldmVsCisJICAg
IGRlYnVnZ2luZyAoc3VjaCBhcyBEZXZUb29scykgY2FuIGNvbm5lY3QgdG8gdGhlIHByb2Nlc3Mu
CisKKwkgIGh0dHBzOi8vZG9jcy5mbHV0dGVyLmRldi90ZXN0aW5nL2J1aWxkLW1vZGVzI3Byb2Zp
bGUKKworY29uZmlnIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERV9SRUxFQVNFCisJYm9vbCAi
UmVsZWFzZSIKKwloZWxwCisJICBVc2UgcmVsZWFzZSBtb2RlIGZvciBkZXBsb3lpbmcgdGhlIGFw
cCwgd2hlbiB5b3Ugd2FudCBtYXhpbXVtCisJICBvcHRpbWl6YXRpb24gYW5kIG1pbmltYWwgZm9v
dHByaW50IHNpemUuIFJlbGVhc2UgbW9kZQorCSAgKHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgb24g
dGhlIHNpbXVsYXRvciBvciBlbXVsYXRvciksIG1lYW5zCisJICB0aGF0OgorCisJICAtIEFzc2Vy
dGlvbnMgYXJlIGRpc2FibGVkLgorCisJICAtIERlYnVnZ2luZyBpbmZvcm1hdGlvbiBpcyBzdHJp
cHBlZCBvdXQuCisKKwkgIC0gRGVidWdnaW5nIGlzIGRpc2FibGVkLgorCisJICAtIENvbXBpbGF0
aW9uIGlzIG9wdGltaXplZCBmb3IgZmFzdCBzdGFydHVwLCBmYXN0IGV4ZWN1dGlvbiwKKwkgICAg
YW5kIHNtYWxsIHBhY2thZ2Ugc2l6ZXMuCisKKwkgIC0gU2VydmljZSBleHRlbnNpb25zIGFyZSBk
aXNhYmxlZC4KKworCSAgaHR0cHM6Ly9kb2NzLmZsdXR0ZXIuZGV2L3Rlc3RpbmcvYnVpbGQtbW9k
ZXMjcmVsZWFzZQorCitlbmRjaG9pY2UKK2VuZGlmICMgQlIyX1BBQ0tBR0VfRkxVVFRFUl9FTkdJ
TkUKKwogY29tbWVudCAiZmx1dHRlci1lbmdpbmUgbmVlZHMgYW4gT3BlbkdMIG9yIE9wZW5HTEVT
IGJhY2tlbmQiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GTFVUVEVSX0VOR0lORV9BUkNIX1NV
UFBPUlRTCiAJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfSEFTX0xJQkdMICYmICFCUjJfUEFDS0FH
RV9IQVNfTElCR0xFUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVy
LWVuZ2luZS5tayBiL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsKaW5k
ZXggMzJhYWExY2NjZi4uMTVhNWM2MGZkMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mbHV0dGVyLWVu
Z2luZS9mbHV0dGVyLWVuZ2luZS5taworKysgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0
ZXItZW5naW5lLm1rCkBAIC01Miw4ICs1MiwxMCBAQCBGTFVUVEVSX0VOR0lORV9UQVJHRVRfQVJD
SCA9IHg2NAogRkxVVFRFUl9FTkdJTkVfVEFSR0VUX1RSSVBQTEUgPSB4ODZfNjQtdW5rbm93bi1s
aW51eC1nbnUKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHKSx5KQor
aWZlcSAoJChGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREVfREVCVUcpLHkpCiBGTFVUVEVSX0VO
R0lORV9SVU5USU1FX01PREU9ZGVidWcKK2Vsc2UgaWZlcSAoJChGTFVUVEVSX0VOR0lORV9SVU5U
SU1FX01PREVfUFJPRklMRSkseSkKK0ZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1wcm9maWxl
CiBlbHNlCiBGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREU9cmVsZWFzZQogZW5kaWYKLS0gCjIu
NDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
