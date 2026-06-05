Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1EECD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 09:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8988608EC;
	Fri,  5 Jun 2026 09:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdWCI-P3wZkO; Fri,  5 Jun 2026 09:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FAE6608E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780653162;
	bh=xa9vz90FHdPmajdZSdGc6+gHCTeBVJ/t+9s1cw+PprM=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W+RvXb2VYav36RVkuDkZ4OfC1+PuYKDe6uDh80eE6ZfaRTMYQJmR35vsLMf7amcdX
	 HdYWBjwielL8OjxaEMCrkR+PC3+GMIekXfmR8Z+0eAoMfgLOXec/BBqxxnZzFX9zhp
	 MK8jWCqUnwSxq4OqvMMOEvJNx6F8NCv9iz32EuR7f6R2O2hphR6FMp/mUPZiFqpSvI
	 sEste5a1FIF7eMAji6VQ2h2546c8kHMF5hYNWDFs2Jj4Fe0GB5SGlxloJ2w/KLzr/h
	 2Q2H3Kog8RigcmevKUke4ItWnZtehri8ekZRBFA2YhENxHmTMgIbOrkicE3Mll6qDR
	 MzbeflBHL8NpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FAE6608E7;
	Fri,  5 Jun 2026 09:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08C5126A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD6CA40D77
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZc7P_hgKPsU for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 264BC40D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264BC40D76
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 264BC40D76
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 119974ACE;
 Fri,  5 Jun 2026 02:43:18 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.129.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AE453F86F;
 Fri,  5 Jun 2026 02:43:22 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 05 Jun 2026 11:43:05 +0200
Message-Id: <20260605-p11-v1-0-f3a206958d94@arm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACmaImoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNj3QJDQ11T40SzNAvzZPMUo1QloMqCotS0zAqwKdFKeakVJUqxtbU
 AtmYAQVsAAAA=
X-Change-ID: 20260603-p11-53a6f87c7d2e
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1780652602; bh=Zj1he+yJn/Tvf/0iHJLyKY6zAnssetyiD1LlWttlcTw=;
 h=From:Subject:Date:To:Cc:From;
 b=DlawsqWPIYb6ZtAKOAg8Xay1SJsnUo0r44RckA6PISdfGDrjs9lkrgDX0M7pQHY48
 rCn6PyvzVR4xvWs6vEnt6YDA07PS5szRrL833qLpDGkwx16HlwihOzfge11DEbvXxj
 APROJCcHXDz4cdqkFCPHaIUO05P2N69ot1Wt78Iw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com
 header.a=rsa-sha256 header.s=foss header.b=DlawsqWP
Subject: [Buildroot] [PATCH next 0/2] Add support for pkcs11 to host-gnutls
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

RnV0dXJlIFUtQm9vdCAyMDI2LjA3IHdpbGwgYnVpbGQgbWtlZmljYXBzdWxlIHdpdGggcGtjczEx
IHN1cHBvcnQuIFsxXQoKVGhpcyBjYXVzZXMgbGluayBlcnJvcnMgd2l0aCBCdWlsZHJvb3QsIHN1
Y2ggYXMgdGhlIGZvbGxvd2luZyBvbmU6CgogIG1rZWZpY2Fwc3VsZS5jOigudGV4dC5zdGFydHVw
KzB4Y2QzKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZ251dGxzX3BrY3MxMV9pbml0JwoKKE90
aGVyIHN5bWJvbHMgdGhlIGxpbmtlciBjb21wbGFpbnMgYWJvdXQgYXJlOiBnbnV0bHNfcGtjczEx
X2FkZF9wcm92aWRlciwKZ251dGxzX3BrY3MxMV9vYmpfbGlzdF9pbXBvcnRfdXJsNCwgZ251dGxz
X3g1MDlfY3J0X2ltcG9ydF9wa2NzMTEgYW5kCmdudXRsc19wa2NzMTFfZGVpbml0LikKClRoZSBm
b2xsb3dpbmcgZXhhbXBsZSBjb21tYW5kcyBjYW4gYmUgdXNlZCB0byByZXByb2R1Y2UgdGhlIGlz
c3VlOgoKICBtYWtlIHFlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZwogIGVjaG8gJ0JSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjYuMDctcmMzIicgPj4uY29uZmlnCiAg
ZWNobyAnQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFM9eScgPj4uY29uZmlnCiAgZWNobyAn
IyBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTIGlzIG5vdCBzZXQnID4+LmNvbmZpZwog
IG1ha2Ugb2xkZGVmY29uZmlnCiAgbWFrZSB1Ym9vdAoKVGhpcyBzZXJpZXMgZG9lcyB0aGUgZm9s
bG93aW5nIGNoYW5nZXMgdG8gc29sdmUgdGhpcyBpc3N1ZToKMS4gRW5hYmxlIGhvc3QgY29tcGls
YXRpb24gZm9yIHAxMS1raXQKMi4gQnVpbGQgaG9zdC1nbnV0bHMgd2l0aCBwa2NzMTEgc3VwcG9y
dCwgbGV2ZXJhZ2luZyB0aGUgbmV3IGhvc3QtcDExLWtpdC4KCkZvciB0aGUgc2FrZSBvZiBzaW1w
bGljaXR5LCBwa2NzMTEgc3VwcG9ydCBpcyBhZGRlZCB1bmNvbmRpdGlvbmFsbHkgdG8KaG9zdC1n
bnV0bHMuIElmIHRoaXMgaXMgcHJlZmVycmVkLCBhIGNvbmZpZyBvcHRpb24gY291bGQgYmUgYWRk
ZWQgaW5zdGVhZC4KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS91LWJvb3QvdS1ib290L2NvbW1p
dC8wYzcxNmExNTdiZTQ2MDAwNmE0Yjc2MjYyNWRlMzI5YjVlMzZkYmY5IFsxXQpTaWduZWQtb2Zm
LWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Ci0tLQpWaW5jZW50
IFN0ZWhsw6kgKDIpOgogICAgICBwYWNrYWdlL3AxMS1raXQ6IGVuYWJsZSBob3N0IGJ1aWxkCiAg
ICAgIHBhY2thZ2UvZ251dGxzOiBhZGQgaG9zdCBzdXBwb3J0IGZvciBwa2NzMTEKCiBwYWNrYWdl
L2dudXRscy9nbnV0bHMubWsgICB8IDUgKysrLS0KIHBhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1r
IHwgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAzMjM1MWY5Nzk4MjJhMGIzYTQ1YjgyYzJkODJiZGIy
MzI4YjAyZjVhCmNoYW5nZS1pZDogMjAyNjA2MDMtcDExLTUzYTZmODdjN2QyZQoKQmVzdCByZWdh
cmRzLAotLSAKVmluY2VudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
