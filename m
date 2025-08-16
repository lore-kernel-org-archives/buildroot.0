Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5A7CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 14:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8160E6132D;
	Sat, 16 Aug 2025 14:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dn9WiGzov3eF; Sat, 16 Aug 2025 14:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B796A6132A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B796A6132A;
	Sat, 16 Aug 2025 14:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB94223
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 14:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78768409B0
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 14:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fp8I2kGoKz0Z for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 14:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C8D340129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8D340129
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C8D340129
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 14:35:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2001:18c0:a22:bf00:5c2b:f296:f108:6612])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D49F8780383;
 Sat, 16 Aug 2025 16:35:07 +0200 (CEST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 16 Aug 2025 16:34:31 +0200
Message-ID: <20250816143431.50398-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755354910;
 bh=/Q+VkWGAEVHyqsJY4wLbVeWp6zFa/U27GPv7ph1GVRc=;
 h=From:To:Cc:Subject:Date:From;
 b=RH7KjDzln6NtV5qge7MpxJENpT4fO52u8wK1Lh1PCJF7FPW7lFQyW8E/gewUjchII
 6rmSL/hPkrYsDz0Ehk+8yZclB/up+z+u5rZB2/66MJu+ZcsvuSbLmzdnGbDH+LXH0R
 E3dgeHRrRRcrAXcTi6u/SxFGMdlxeIQV7rbdWfjQDXR9IqPNCelPOGxblosF/f4vIR
 ZpLTHj8LwND93SeaKvUYQHIIGNAJF8aSauXg9mxajZEj3q8U/W2iOLcRT1IwGXaFAe
 kZaYNYsS0l9Xsg7RK0ggYcLNe5349aSz1GYE4Pm3Ftaxr4Y72URarWwLkxjpmE1fNS
 Qif5NxpusSkCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RH7KjDzl
Subject: [Buildroot] [PATCH 1/1] support/testing: test_msr_tools: fix test
 after bootlin toolchains update
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0gInVwZGF0ZSB0byBCb290bGluIHRvb2xjaGFpbnMg
MjAyNS4wOC0xIiwKdGhlIHRlc3RzLnBhY2thZ2UudGVzdF9tc3JfdG9vbHMgZmFpbHMgd2hlbiBi
dWlsZGluZyBpdHMgS2VybmVsIDUuMTUuNTUKd2l0aCBnY2MgMTUuMS4wLgoKVGhpcyBjb21taXQg
Zml4ZXMgdGhlIGlzc3VlIGJ5IHVwZGF0aW5nIHRoZSB0ZXN0IEtlcm5lbCB0byB0aGUgbGF0ZXN0
CkxUUyB2ZXJzaW9uICg2LjEyLjQyIGF0IHRoZSB0aW1lIG9mIHRoaXMgY29tbWl0KSB3aGljaCBp
bmNsdWRlcyB0aGUKZml4IGZvciBnY2MtMTUuIE5vdGU6IHRoZSA1LjE1Lnkgc2VyaWVzIGRvZXMg
bm90IGluY2x1ZGUgdGhpcyBmaXggZm9yCnRoZSB4ODZfNjQgYXJjaGl0ZWN0dXJlLCB3aGljaCBp
cyB3aHkgdGhpcyBjb21taXQgc3dpdGNoZXMgdG8gNi4xMi55LgoKRml4ZXM6Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTA5ODQ2ODYyOTQKClsxXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTQ3ZGJj
OTJhMjBjNWFjZWE3ODgyMTY2Y2FlNzg5M2U2ZWE2NjFlMQoKQ2M6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9t
c3JfdG9vbHMucHkgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X21zcl90b29scy5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rv
b2xzLnB5CmluZGV4IDRkNjI3NDJhNWYuLmQwOThiMjlhYTIgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5CisrKyBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5CkBAIC0xMSw3ICsxMSw3IEBAIGNs
YXNzIFRlc3RNc3JUb29scyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICBCUjJfVE9P
TENIQUlOX0VYVEVSTkFMPXkKICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTD15CiAgICAgICAgIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjU1IgorICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjQyIgogICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X1VTRV9DVVNUT01fQ09ORklHPXkKICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09O
RklHX0ZJTEU9ImJvYXJkL3FlbXUveDg2XzY0L2xpbnV4LmNvbmZpZyIKICAgICAgICAgQlIyX0xJ
TlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9Int9IgotLSAKMi41MC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
