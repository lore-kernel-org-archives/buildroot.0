Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2407E63F3D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3E660AD8;
	Mon, 16 Feb 2026 09:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW3IpbAVhvwJ; Mon, 16 Feb 2026 09:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E47060AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771233099;
	bh=g8jFh+OY9TKv2FXbhWPtoMz0DlOGfyX27OmPgcA/ptY=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E7HVrTFbHqjnDKIEz3ToNb3GumiGzAs+ZHOjdAyZ6SByLi/DWdZrAFekybxenW+Ke
	 zTgjM6Blr9gnPBh5nWSyMQ2uW5lAXIc1ciDg4MCekG30wWqM7dU85d5OZgtaEP085B
	 Ba8OhlL7iCHjFJtPRWU3gYEbJS5F6ifFSAIW5A2LlTVN84JVLWcJSVukalNHj/vWPJ
	 vQ0K23orctFBL7tOB1bbQ78j2EgMUW5LzlotmyCoIeCKM0zmohUwojui61YF7u1Ocu
	 lTxqjENjKO8FKerhBlOrGgN+GnSUfq54zksge9MDl49HxBODik9pxuF5rKIfDXPX27
	 nPVE1X8mg/I8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E47060AEF;
	Mon, 16 Feb 2026 09:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E2A835B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4F383B92
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6UvKKsiVcG9 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.42;
 helo=smtprelay04.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8518082AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8518082AEF
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8518082AEF
 for <buildroot@busybox.net>; Mon, 16 Feb 2026 09:11:37 +0000 (UTC)
Received: from [80.128.8.127] (helo=mail.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1vruZ4-000000000CT-0VP7
 for buildroot@busybox.net; Mon, 16 Feb 2026 10:06:46 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 16 Feb
 2026 10:06:43 +0100
Received: from go-sys.de (192.168.1.113) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Mon, 16 Feb 2026 10:06:43 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Mon, 16 Feb 2026 10:06:38 +0100
Message-ID: <20260216090642.7202-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] SDL3_image: Add new package SDL3_image
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

U0RMM19pbWFnZSBpcyBhbiBpbWFnZSBmaWxlIGxvYWRpbmcgbGlicmFyeS4gSXQgbG9hZHMgaW1h
Z2VzCmFzIFNETCBzdXJmYWNlcywgYW5kIHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgZm9ybWF0czog
Qk1QLApHSUYsIEpQRUcsIExCTSwgUENYLCBQTkcsIFBOTSwgVEdBLCBUSUZGLCBYQ0YsIFhQTSwg
WFYuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEZpc2NoZXIgPG1mQGdvLXN5cy5kZT4KLS0tCiBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9zZGwzX2lt
YWdlL0NvbmZpZy5pbiAgICAgICB8ICA5ICsrKysrKysrKwogcGFja2FnZS9zZGwzX2ltYWdlL3Nk
bDNfaW1hZ2UuaGFzaCB8ICAzICsrKwogcGFja2FnZS9zZGwzX2ltYWdlL3NkbDNfaW1hZ2UubWsg
ICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NkbDNfaW1hZ2UvQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zZGwzX2ltYWdlL3NkbDNfaW1hZ2UuaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc2RsM19pbWFnZS9zZGwzX2ltYWdlLm1rCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBmN2M3
ZDNkYmY3Li4xODM4NzlhYmE0IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9w
YWNrYWdlL0NvbmZpZy5pbgpAQCAtMzY2LDYgKzM2Niw3IEBAIGNvbW1lbnQgIkdyYXBoaWMgbGli
cmFyaWVzIgogCXNvdXJjZSAicGFja2FnZS9zZGwyX3R0Zi9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3NkbDMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9zZGwzX2dmeC9Db25maWcu
aW4iCisJc291cmNlICJwYWNrYWdlL3NkbDNfaW1hZ2UvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9zcGlydi1oZWFkZXJzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdGsvQ29uZmln
LmluIgogCXNvdXJjZSAicGFja2FnZS92dWxrYW4taGVhZGVycy9Db25maWcuaW4iCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3NkbDNfaW1hZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9zZGwzX2ltYWdlL0Nv
bmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45YjljNGYwZDc0
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zZGwzX2ltYWdlL0NvbmZpZy5pbgpAQCAtMCww
ICsxLDkgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9TREwzX0lNQUdFCisJYm9vbCAic2RsM19pbWFn
ZSIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NETDMKKwloZWxwCisJICBTREwzX2ltYWdlIGlz
IGFuIGltYWdlIGZpbGUgbG9hZGluZyBsaWJyYXJ5LiBJdCBsb2FkcyBpbWFnZXMKKwkgIGFzIFNE
TCBzdXJmYWNlcywgYW5kIHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgZm9ybWF0czogQk1QLAorCSAg
R0lGLCBKUEVHLCBMQk0sIFBDWCwgUE5HLCBQTk0sIFRHQSwgVElGRiwgWENGLCBYUE0sIFhWLgor
CisJICBodHRwOi8vd3d3LmxpYnNkbC5vcmcvcHJvamVjdHMvU0RMX2ltYWdlLwpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9zZGwzX2ltYWdlL3NkbDNfaW1hZ2UuaGFzaCBiL3BhY2thZ2Uvc2RsM19pbWFn
ZS9zZGwzX2ltYWdlLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
ODNmNWU3ZWFmMQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc2RsM19pbWFnZS9zZGwzX2lt
YWdlLmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBk
NTY4NWYyMjBkNWFlOTk0MzlkNzEwZDgwOGQ4YzQ3OGM2Y2NmYWFjNTM5ODc2OTI5MjM5Yjg3NWE2
NzIzNzkyICBTREwzX2ltYWdlLTMuMS4xLnRhci5negorc2hhMjU2ICA3ODI2ZWNhMGEwZjdlNTkx
ZjM4ZGQ4NDRlMjA3YTIwMGFhYzgxYTU5YjIwZDhhMzBjM2FmOGM2MjgyYWYxM2U2ICBMSUNFTlNF
LnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9zZGwzX2ltYWdlL3NkbDNfaW1hZ2UubWsgYi9wYWNr
YWdlL3NkbDNfaW1hZ2Uvc2RsM19pbWFnZS5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4xODU2OGFiNWViCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zZGwzX2lt
YWdlL3NkbDNfaW1hZ2UubWsKQEAgLTAsMCArMSwyMyBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKyMKKyMgc2RsM19pbWFnZQorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworU0RMM19J
TUFHRV9WRVJTSU9OID0gMy4xLjEKK1NETDNfSU1BR0VfU0lURSA9IGh0dHBzOi8vd3d3LmxpYnNk
bC5vcmcvcHJvamVjdHMvU0RMX2ltYWdlL3JlbGVhc2UKK1NETDNfSU1BR0VfU09VUkNFID0gU0RM
M19pbWFnZS0kKFNETDNfSU1BR0VfVkVSU0lPTikudGFyLmd6CitTREwzX0lNQUdFX0xJQ0VOU0Ug
PSBabGliCitTREwzX0lNQUdFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAorU0RMM19JTUFH
RV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK1NETDNfSU1BR0VfREVQRU5ERU5DSUVTID0gc2RsMwor
CisjIEJlaXNwaWVsIGbDvHIgRm9ybWF0LVVudGVyc3TDvHR6dW5nCitpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQlBORykseSkKK1NETDNfSU1BR0VfREVQRU5ERU5DSUVTICs9IGxpYnBuZworU0RMM19J
TUFHRV9DT05GX09QVFMgKz0gLURTRExJTUFHRV9QTkc9T04KK2Vsc2UKK1NETDNfSU1BR0VfQ09O
Rl9PUFRTICs9IC1EU0RMSU1BR0VfUE5HPU9GRgorZW5kaWYKKworJChldmFsICQoY21ha2UtcGFj
a2FnZSkpCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
