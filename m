Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2F4CD6E6B
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 13:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2632F42E64;
	Thu,  4 Jun 2026 13:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtc6nswYPaPq; Thu,  4 Jun 2026 13:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2739942E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780579358;
	bh=Jyeo2uffIkbxK1ZCNTkLGDzOs1AqqPARb7vPdWN8oag=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LcNlBK8P+gXA7ck0WfC0Q4h0qxAKfRD8jCdUAIqKvvPje/qcBD0SPb2to09Dx3GYn
	 UOryN3Z7s94KqIiad1m614BLjXE9/GDN3H3Eks26I7W+BdhBoJ2BHkd5Q0uodpMB+0
	 Wwo3hTjiVstvtcI927KeWoDf5b1vvbEBpnSmjqJ6luD6F2yqV+FVGVpzB7ZKTXblFp
	 4ZPMK1nRZCS+h8UjMwdG+Vg4TiGOV+r/Rf4cpeciT7BoSiWapfKr/fvFYEnSkuaKU8
	 oZ8+dsGhug8MtWq29RMavFhy9ke6eK51IVIpxGH+39J5zwNBT5xAnCTNQOmVM3wrHa
	 S0opVa6/5a2fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2739942E2A;
	Thu,  4 Jun 2026 13:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 630DBDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C4E66F50D
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvuTDOhSczx5 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 13:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D9496F50B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9496F50B
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D9496F50B
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:22:35 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-39677c80386so7465861fa.3
 for <buildroot@buildroot.org>; Thu, 04 Jun 2026 06:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780579353; x=1781184153;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0EtsYA5NprElwme86PXMujnZWP98M5GNEeTmbQAil6k=;
 b=SJlVz8calQRPDXBnlyHQRNlWEXW1dbxaNlhtMbpmXvOis9JBcnNoeZTwvb7qVFFivB
 mFRHdIs+nbtN0PMPwPgGaUB6KYHCtv4cUOB32HXrjcczNGzGqYWI6x+iSQuIekkkQ7ww
 rqeGgkl9FKqfe33Y4QuORd+sXr8ldOfhbXkrWQC2exmb3K4yGQMqnphoGasThbk31cI3
 8wlJFE3Le7n+PDG4SvYzRVSz1agDP+HklLUULshArZeZF//CdD9RwRALswayzb3CgnZQ
 HlJPhqwY9qbhwqYWPtS+B7GcfdyzHYFTi2WB5Pf8wGmSKH55juXcG3iiLfvrjSE8DgNG
 Cfmw==
X-Gm-Message-State: AOJu0YzTCi+QocnoKtGlZwXDztyBPghM5g8kwrJhq4aA34xtAaFmi1sk
 7OV9Rt9xiKGtOHEe10OHeePyr+ImsGY5YqYRw0SqEMJbE9awk142oJvD0UKPQw==
X-Gm-Gg: Acq92OFOd7tXRj7Ye2zb339TS0krqeCrc6AGmxFyeSWmSIwyssh8iHOuzid+gPoNV6j
 m913sI3GH+Hg2MDcRWqQFsNEsrr2jJV3f2fKbPcD9kgBwgpF6MdgzmEJ8iDB1bSOHRL/TR8zuIw
 bvBMvg6qzTMVaFwrywFapEHZjNHHgUxEBasLTb3lWR+/wB9IRypfPrXiqnHvJWhpcZVOjVeUFQO
 5yf9JFHr+gASw1sfAB9QNFmUBaCaGGNrhlF5swmLpilU2ovvJ27DEzNBe89ef3AULDF6QBHrgOF
 x4Rq1oIp3/NPDZyJkBH1V3Fj0uAqZzg2fHxKcxWECiaKje5Q8T0ceTNUKidLdv6Srm/9O8FfNVF
 li5RqotS5lhjylMOHrKNoJ9q5k5L1jnrJYOD2CBtD2LG+Crg9+/j9vK2P4ZamTg+dldkUmnPpSm
 vrZpcpIWRkkWhsUcL5He/xkxt344ETRX0GExruiSZv5uU2qFzzAz8Ks5olHVjnRk9M1RvKDcu6+
 so=
X-Received: by 2002:a05:651c:150f:b0:396:8491:3133 with SMTP id
 38308e7fff4ca-396af478488mr26112851fa.22.1780579352631; 
 Thu, 04 Jun 2026 06:22:32 -0700 (PDT)
Received: from tollan.. (h-155-4-121-122.A259.priv.bahnhof.se. [155.4.121.122])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-396ac091a90sm17350911fa.15.2026.06.04.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 06:22:31 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 15:22:28 +0200
Message-ID: <20260604132228.2977562-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780579353; x=1781184153; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0EtsYA5NprElwme86PXMujnZWP98M5GNEeTmbQAil6k=;
 b=VM9pnSwBWx6xBhKO7/F+A5ReMmHySfypyAuRSDE0ZTC+l/tWSn3HlH9xKBCrsSOtpx
 CpZYpfL+y2bMi7T2WWyoqtsgQZc9M4uJkcV+nq+z9Se/e2IJSqHLfGwwatqUCwaG3Dfj
 lW5CMPvIZ+KzjOcKdbJHVOKo61WaThxWLVFeRUqjmo1F6Hhz4iu9v3SVAyvGn6FBlOv7
 1M5yeATtnaI8lxCnmxKnh6PJsxeVSbFY4ZklKLi9kVBBkjNug6X6jlFsupsBaaiqZUS1
 a+5fAm6+0DZgnPvOv+ZguBig3Z4dGVsvHvh1jn6SJiJPrGxbAm7HT95qdf+sKOithVrr
 7O1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VM9pnSwB
Subject: [Buildroot] [PATCH 1/1] package/hostapd: add MBO (Wi-Fi Agile
 Multiband) support option
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
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIEJSMl9QQUNLQUdFX0hPU1RBUERfTUJPIHRvIGVuYWJsZSBNdWx0aWJhbmQgT3BlcmF0aW9u
IChXaS1GaQpBZ2lsZSBNdWx0aWJhbmQpIG9uIHRoZSBBUCBzaWRlLCBwcm92aWRpbmcgc3RhbmRh
cmRpemVkIGhpbnRzIHRoYXQKaGVscCBjbGllbnRzIHBpY2sgdGhlIGJlc3QgZnJlcXVlbmN5IGJh
bmQgYW5kIEJTUy4KCk1CTyBidWlsZHMgb24gV05NIChJRUVFIDgwMi4xMXYpLCBzbyBCUjJfUEFD
S0FHRV9IT1NUQVBEX1dOTSBpcwpzZWxlY3RlZCBhdXRvbWF0aWNhbGx5LgoKU2lnbmVkLW9mZi1i
eTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9ob3N0
YXBkL0NvbmZpZy5pbiAgfCAxOSArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2hvc3RhcGQv
aG9zdGFwZC5tayB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2hvc3RhcGQvQ29uZmlnLmluIGIvcGFja2FnZS9ob3N0
YXBkL0NvbmZpZy5pbgppbmRleCA2NjAyNzRkZGYwLi43NjdiMjRiYTE3IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2hvc3RhcGQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvaG9zdGFwZC9Db25maWcuaW4K
QEAgLTgzLDYgKzgzLDI1IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUQVBEX1dQQTMKIAloZWxw
CiAJICBFbmFibGUgV1BBMyBzdXBwb3J0IGluY2x1ZGluZyBPV0UsIFNBRSwgRFBQCiAKK2NvbmZp
ZyBCUjJfUEFDS0FHRV9IT1NUQVBEX1dOTQorCWJvb2wgIkVuYWJsZSBXTk0gKFdpcmVsZXNzIE5l
dHdvcmsgTWFuYWdlbWVudCkiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUQVBEX0hBU19X
SUZJX0RSSVZFUlMKKwloZWxwCisJICBFbmFibGUgc3VwcG9ydCBmb3IgV2lyZWxlc3MgTmV0d29y
ayBNYW5hZ2VtZW50IChJRUVFIDgwMi4xMXYpCisJICBvbiB0aGUgQVAgc2lkZS4gVGhpcyBlbmFi
bGVzIGZlYXR1cmVzIHN1Y2ggYXMgQlNTIFRyYW5zaXRpb24KKwkgIE1hbmFnZW1lbnQgd2hpY2gg
YWxsb3dzIHRoZSBBUCB0byBzdWdnZXN0IG9yIHJlcXVlc3QgYSBzdGF0aW9uCisJICB0byBtb3Zl
IHRvIGFub3RoZXIgQlNTLgorCitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVEFQRF9NQk8KKwlib29s
ICJFbmFibGUgTUJPIChNdWx0aWJhbmQgT3BlcmF0aW9uKSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0hPU1RBUERfSEFTX1dJRklfRFJJVkVSUworCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUQVBE
X1dOTQorCWhlbHAKKwkgIEVuYWJsZSBzdXBwb3J0IGZvciBNQk8gKE11bHRpYmFuZCBPcGVyYXRp
b24sIFdpLUZpIEFnaWxlCisJICBNdWx0aWJhbmQpLiBUaGlzIGZhY2lsaXRhdGVzIGVmZmljaWVu
dCB1c2Ugb2YgdGhlIGZyZXF1ZW5jeQorCSAgYmFuZHMgYXZhaWxhYmxlIHRvIHRoZSBBUCwgZW5h
YmxpbmcgYmFuZCBzdGVlcmluZyBvZiBzdGF0aW9ucworCSAgdG93YXJkIHRoZSBtb3N0IHN1aXRh
YmxlIGJhbmQuCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUQVBEX1ZMQU4KIAlib29sICJFbmFi
bGUgVkxBTiBzdXBwb3J0IgogCWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ob3N0YXBk
L2hvc3RhcGQubWsgYi9wYWNrYWdlL2hvc3RhcGQvaG9zdGFwZC5tawppbmRleCBkODNiNTc0ZmFk
Li4xODQwZjczNjZlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2hvc3RhcGQvaG9zdGFwZC5taworKysg
Yi9wYWNrYWdlL2hvc3RhcGQvaG9zdGFwZC5tawpAQCAtMTAxLDYgKzEwMSwxNCBAQCBIT1NUQVBE
X0NPTkZJR19ESVNBQkxFICs9IFwKIAlDT05GSUdfT1dFCiBlbmRpZgogCitpZmVxICgkKEJSMl9Q
QUNLQUdFX0hPU1RBUERfV05NKSx5KQorSE9TVEFQRF9DT05GSUdfRU5BQkxFICs9IENPTkZJR19X
Tk0KK2VuZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVEFQRF9NQk8pLHkpCitIT1NUQVBE
X0NPTkZJR19FTkFCTEUgKz0gQ09ORklHX01CTworZW5kaWYKKwogaWZlcSAoJChCUjJfUEFDS0FH
RV9IT1NUQVBEX1ZMQU4pLCkKIEhPU1RBUERfQ09ORklHX0VOQUJMRSArPSBDT05GSUdfTk9fVkxB
TgogZW5kaWYKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
