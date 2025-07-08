Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD38C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 11:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB9B60D53;
	Tue,  8 Jul 2025 11:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKOtJOAOT-Pf; Tue,  8 Jul 2025 11:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 488F1606EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488F1606EC;
	Tue,  8 Jul 2025 11:33:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BACDF15F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 11:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B831340118
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 11:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZDY6plisJQ4 for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 11:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AC2E400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC2E400DD
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AC2E400DD
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 11:33:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so2652624f8f.1
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 04:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751974421; x=1752579221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tqVb1BXlAMT8Z2pRYnPgFn8vC8CxX0TgRTHWfv37odA=;
 b=DHQHy+VxBeX7BZZs+D+MPvUW6Zvx7CjmDrQAxB5n3udUd6RlTBCE9XM7/rhCWB9FLA
 zdgM/YfTFlCtJeyVfiLfsKpQFTZ+PNvhNQ9ZsRZW2lhGXWiOByq1HRvkb/qUFu+1K717
 P2QKUH/8egPdRos2L5WNsvghKNhztHLlOJN6vpL3gqr3x/luId0rEiA83BsXpriHyW1P
 sHknr4aJ4+cXR1Kq/Udq/kg5r7rKLYkanPQkPY6m3S3F/LjPDoQUeoKQ1r6FV2/ynjn0
 sGPUK7Me27wxitNHIz+g0YLZC0IUdxJFzgWJYICMWdb3OaHsf1h3EDnOS3sAPDdB1cNL
 3Sqw==
X-Gm-Message-State: AOJu0YyGqlS3Fi+THoRCyN5eIG8Q4EiWlMJ+hRiMurl33OIBopaIqZ09
 SL+DPi0X0BlVOQiLtAgtHWaoggAeELUTq+ua6CGToDPZGwl3EXmMQMCThnXNK5W1UyL3fBhlATh
 Avh0h
X-Gm-Gg: ASbGnctMnxIn0Xb3pEYlpiulEI1AdaiAD05jR87tkMIjW1Tmk5v77zv8VlJQMVA/03d
 Kyfq0seP2Q0vdxlaOpAxWfhk39L5NAT0vxLk7thX/MqXlqnC+/Haxhvyhg6pjvopwXT9Gc91pv0
 4VpdvGH/7GliAcjYb8KQQTYxZf5bM4nIbwcvox7HmwdIylVOuxlDbEK49w3Rp7bKtsAg5rohY4J
 nFSMQtH6gMSBPZsFok334LDV7V+Mdch+++NivJ5sny8RWOgNM4hPl1mPjMWW10MH90sbgDYZLLZ
 rD/6xCJV9GX39OsRxQGo+a4ZBaUkfwdPdqoUV6ZM33gvxTTFoC7O377tt30y2PewUbt0X7oKqUI
 nodC+ixMvEsLUyHALeA==
X-Google-Smtp-Source: AGHT+IGFaHR5wVm+QeyVX4UWHSHOpkNV3mq1XKp1/mUdKw75dRZ6yL4S2vVcDPvqlS7V2i7yEL81sw==
X-Received: by 2002:a05:6000:653:b0:3b4:9721:2b1b with SMTP id
 ffacd0b85a97d-3b497212d44mr16195602f8f.9.1751974420600; 
 Tue, 08 Jul 2025 04:33:40 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0b9bsm12909428f8f.30.2025.07.08.04.33.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 04:33:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 13:33:28 +0200
Message-ID: <20250708113328.2269438-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751974421; x=1752579221; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqVb1BXlAMT8Z2pRYnPgFn8vC8CxX0TgRTHWfv37odA=;
 b=F7MznazXx+dl25Lx1c2UB45xQJkPEpIxSdZz6AtI2UsmIa6eHUxsLsx7S6P60nMgaU
 0GBaCAmX/c1KsjPmvSjK47EpKhMI3UuwRmzQULY5LmHTC2TXIXTTtGbaTpQ87Qbf/fcw
 iME8k3/t6lWAZptqc4LuBBQq8eZ0Hyiy+PHswgANbY9nFI5YNh/GO4cBTX0ygf9m21Zw
 mJYA7q09h6nmxH0SSJ6x+vsHig9cXdO8sBOG17+WgXidL/qAivcdh9nuVHmgmn5+9VuU
 fbROj+sIfZZhpXZpjy3S9ZgpaOuwXaMCMGGP8Q2CymjtfLAfqnm/sDRFKvAa2QjPcpOp
 ZYUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F7MznazX
Subject: [Buildroot] [PATCH] package/sngrep: security bump to v1.8.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VlIHRoZSByZWxlYXNlIG5vdGVzOgoKLSBodHRwczovL2dpdGh1Yi5jb20vaXJvbnRlYy9zbmdy
ZXAvcmVsZWFzZXMvdGFnL3YxLjcuMAotIGh0dHBzOi8vZ2l0aHViLmNvbS9pcm9udGVjL3NuZ3Jl
cC9yZWxlYXNlcy90YWcvdjEuOC4wCi0gaHR0cHM6Ly9naXRodWIuY29tL2lyb250ZWMvc25ncmVw
L3JlbGVhc2VzL3RhZy92MS44LjEKLSBodHRwczovL2dpdGh1Yi5jb20vaXJvbnRlYy9zbmdyZXAv
cmVsZWFzZXMvdGFnL3YxLjguMgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxp
dGllczoKCi0gQ1ZFLTIwMjQtMzExOToKICAgIEEgYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxp
dHkgZXhpc3RzIGluIGFsbCB2ZXJzaW9ucyBvZiBzbmdyZXAgc2luY2UKICAgIHYwLjQuMiwgZHVl
IHRvIGltcHJvcGVyIGhhbmRsaW5nIG9mICdDYWxsLUlEJyBhbmQgJ1gtQ2FsbC1JRCcgU0lQCiAg
ICBoZWFkZXJzLiBUaGUgZnVuY3Rpb25zIHNpcF9nZXRfY2FsbGlkIGFuZCBzaXBfZ2V0X3hjYWxs
aWQgaW4gc2lwLmMgdXNlCiAgICB0aGUgc3RybmNweSBmdW5jdGlvbiB0byBjb3B5IGhlYWRlciBj
b250ZW50cyBpbnRvIGZpeGVkLXNpemUgYnVmZmVycwogICAgd2l0aG91dCBjaGVja2luZyB0aGUg
ZGF0YSBsZW5ndGguIFRoaXMgZmxhdyBhbGxvd3MgcmVtb3RlIGF0dGFja2VycyB0bwogICAgZXhl
Y3V0ZSBhcmJpdHJhcnkgY29kZSBvciBjYXVzZSBhIGRlbmlhbCBvZiBzZXJ2aWNlIChEb1MpIHRo
cm91Z2gKICAgIHNwZWNpYWxseSBjcmFmdGVkIFNJUCBtZXNzYWdlcy4KICAgIGh0dHBzOi8vd3d3
LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI0LTMxMTkKCi0gQ1ZFLTIwMjQtMzEyMDoKICAg
IEEgc3RhY2stYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxpdHkgZXhpc3RzIGluIGFsbCB2ZXJz
aW9ucyBvZiBzbmdyZXAKICAgIHNpbmNlIHYxLjQuMS4gVGhlIGZsYXcgaXMgZHVlIHRvIGluYWRl
cXVhdGUgYm91bmRzIGNoZWNraW5nIHdoZW4KICAgIGNvcHlpbmcgJ0NvbnRlbnQtTGVuZ3RoJyBh
bmQgJ1dhcm5pbmcnIGhlYWRlcnMgaW50byBmaXhlZC1zaXplIGJ1ZmZlcnMKICAgIGluIHRoZSBz
aXBfdmFsaWRhdGVfcGFja2V0IGFuZCBzaXBfcGFyc2VfZXh0cmFfaGVhZGVycyBmdW5jdGlvbnMK
ICAgIHdpdGhpbiBzcmMvc2lwLmMuIFRoaXMgdnVsbmVyYWJpbGl0eSBhbGxvd3MgcmVtb3RlIGF0
dGFja2VycyB0bwogICAgZXhlY3V0ZSBhcmJpdHJhcnkgY29kZSBvciBjYXVzZSBhIGRlbmlhbCBv
ZiBzZXJ2aWNlIChEb1MpIHZpYSBjcmFmdGVkCiAgICBTSVDCoG1lc3NhZ2VzLgogICAgaHR0cHM6
Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjQtMzEyMAoKU2lnbmVkLW9mZi1ieTog
VGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KLS0tCiBwYWNr
YWdlL3NuZ3JlcC9zbmdyZXAuaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdlL3NuZ3JlcC9zbmdyZXAu
bWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc25ncmVwL3NuZ3JlcC5oYXNoIGIvcGFja2FnZS9z
bmdyZXAvc25ncmVwLmhhc2gKaW5kZXggYzliOWM4YmU4ZC4uYWVhOWQ5NTc3MCAxMDA2NDQKLS0t
IGEvcGFja2FnZS9zbmdyZXAvc25ncmVwLmhhc2gKKysrIGIvcGFja2FnZS9zbmdyZXAvc25ncmVw
Lmhhc2gKQEAgLTEsNiArMSw2IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2lyb250ZWMv
c25ncmVwL3JlbGVhc2VzL2Rvd25sb2FkL3YxLjcuMC9zbmdyZXAtMS43LjAudGFyLmd6Lm1kNXN1
bQotbWQ1ICBlZTNjYzdiZDc1YWRlYjcxMzQxMWFhNjc4ZTQ1YWU0YyAgc25ncmVwLTEuNy4wLnRh
ci5negorIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9pcm9udGVjL3NuZ3JlcC9yZWxlYXNlcy9k
b3dubG9hZC92MS44LjIvc25ncmVwLTEuOC4yLnRhci5nei5tZDVzdW0KK21kNSAgZWIyYTM5OGUy
ZTk4OTkzZWUyYTE5YTNhZmRkZmMyODIgIHNuZ3JlcC0xLjguMi50YXIuZ3oKIAogIyBMb2NhbGx5
IGNvbXB1dGVkCi1zaGEyNTYgIDJlNWJhM2E0ZDY0ODZlYTAwYmQ3M2QyY2NlZmYzODNiYTE2MmRj
ZDZkMDE3MGFlNzRjZmEzYjFjMjA2ZTJjYjEgIHNuZ3JlcC0xLjcuMC50YXIuZ3oKK3NoYTI1NiAg
MWNkMDViZGRkNTMxYjM1M2UzMDY5YzUyNDNlNzA3NmI2MGEzZWU5MDdkYmJjM2M5YzI4MzQ2NzZl
ZDhjNGJhYyAgc25ncmVwLTEuOC4yLnRhci5negogc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdi
MzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBMSUNFTlNFCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3NuZ3JlcC9zbmdyZXAubWsgYi9wYWNrYWdlL3NuZ3JlcC9zbmdy
ZXAubWsKaW5kZXggYjg2ZDdlODNmMC4uNTM5OWQwNDFiNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9z
bmdyZXAvc25ncmVwLm1rCisrKyBiL3BhY2thZ2Uvc25ncmVwL3NuZ3JlcC5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVNOR1JFUF9WRVJTSU9OID0gMS43
LjAKK1NOR1JFUF9WRVJTSU9OID0gMS44LjIKIFNOR1JFUF9TSVRFID0gXAogCWh0dHBzOi8vZ2l0
aHViLmNvbS9pcm9udGVjL3NuZ3JlcC9yZWxlYXNlcy9kb3dubG9hZC92JChTTkdSRVBfVkVSU0lP
TikKIFNOR1JFUF9MSUNFTlNFID0gR1BMLTMuMCsKLS0gCjIuNTAuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
