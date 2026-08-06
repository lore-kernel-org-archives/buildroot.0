Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88399C5AC67
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 21:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC7440856;
	Thu,  6 Aug 2026 21:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zcLBRIjqYho; Thu,  6 Aug 2026 21:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A35040874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786051484;
	bh=j8pr8zzRBMDJJpCS0JaujhGUNkl8yrBCO2/AVDz5ydI=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XW7ETEg+94dKqFcWpcjmdJVQsAZ2wAT0qX4/qbyJjeERjrNoh7tdK0N+fYqQRWVZv
	 kqRnQeu2oZwGm/FRH6BJZOo/QAiaB+ZNMT6EMQsNqlO1skEiZLZ8M0QCumcNj5cJNs
	 Q3E16JxZZ5cxS+7L7y8l65nDTQHXy7vQ/Qv8pihmb6oxmOPkK8bG4LEzXBTByfEcym
	 pVIAypgB/iZZwP6RGuKpHhy8ex/MObH+RrgN/eUaqoPWNrx0qfA3d1RiBvtjBK6orN
	 5lyBb4P+d5ldq4mW9bbkvZLabXbALR450ffEagHpRGveW3/8VgUCV5NV+qxJPiKgam
	 kUoAcuF+mb8Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A35040874;
	Thu,  6 Aug 2026 21:24:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99346392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F3B740856
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3gwrX1UEDA8 for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 21:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6238940812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6238940812
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6238940812
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 21:24:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E5D24E41126;
 Thu,  6 Aug 2026 21:24:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 043CB5FEF7;
 Thu,  6 Aug 2026 21:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39A3911C36D51; 
 Thu,  6 Aug 2026 23:24:35 +0200 (CEST)
Date: Thu, 06 Aug 2026 23:24:22 +0200
MIME-Version: 1.0
Message-Id: <20260806-host_tools-v1-1-19c63ecc3b10@bootlin.com>
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
In-Reply-To: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786051475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Dcvj3SKUdOi3zfIBDC9bWpiWHddhr2AmoJTMNYip9N0=;
 b=NLnNz7Eh1GXEzvp0104980XJx0dzdi2gkYK5UzP0KsGxz1o+llDiWxqrt5woDpc3Hhh8zy
 9JKE28PfTjNaf5UwSi2LWFwRLUx8bWqND/2Qeld0vlYSaYOrDBqDXksmUmfCpD6I0ZCfKb
 6W3/+TsP9DGNdT8nIoYfgW4OYXHX7OZrRwk93G63nF/cBrz4cY5YVIWV8PGE0ZZv/0CZPj
 mAwdKet0KGkt2v9JpDJs815wft8fAOkvpYsMQzbZyCtv74r48C4rcxq7e1e9SCiBwObxIx
 gEf0FS2Mm2tzyyv4Fz3KCdKqjZcb9QebJMmtaHkv3+dElzxCQ03GY+DJXC8FGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NLnNz7Eh
Subject: [Buildroot] [PATCH 1/2] package/uglifyjs: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dWdsaWZ5anMgaXMgYSBKYXZhU2NyaXB0IHBhcnNlciwgbWluaWZpZXIsIGNvbXByZXNzb3IgYW5k
IGJlYXV0aWZpZXIKdG9vbGtpdC4KCmh0dHBzOi8vZ2l0aHViLmNvbS9taXNob28vVWdsaWZ5SlMK
ClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvdWdsaWZ5anMvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAg
ICAgICAgIHwgIDcgKysrKysrKwogcGFja2FnZS91Z2xpZnlqcy91Z2xpZnlqcy5oYXNoICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKysKIHBhY2thZ2UvdWdsaWZ5anMvdWdsaWZ5anMubWsgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKwogc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91Z2xpZnlqcy5weSAgICAgfCAyMyArKysrKysrKysr
KysrKysrKysrKysrCiAuLi4vdGVzdHMvcGFja2FnZS90ZXN0X3VnbGlmeWpzL3NhbXBsZV91Z2xp
Znlqcy5qcyB8ICA1ICsrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA1NmRkOWYzOTQzZDEuLjMw
MjdkMTMxMDUyOCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0x
NTgsNiArMTU4LDcgQEAgTjogCUFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+CiBGOglwYWNrYWdlL2xpYnhtbHNlYzEvCiBGOglwYWNrYWdlL29wZW5zY2FwLwogRjog
CXBhY2thZ2UvcHl0aG9uLXNjcC8KK0Y6CXBhY2thZ2UvdWdsaWZ5anMvCiAKIE46CUFsaXN0YWly
IEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiBGOglib2FyZC9zaWZpdmUvCmRpZmYg
LS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25maWcuaW4uaG9zdApp
bmRleCA1OTVjYWY5ZTdmZWEuLjBlNGUyOWNkMzUxNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25m
aWcuaW4uaG9zdAorKysgYi9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0CkBAIC0xMjcsNiArMTI3LDcg
QEAgbWVudSAiSG9zdCB1dGlsaXRpZXMiCiAJc291cmNlICJwYWNrYWdlL3RpcGlkZWUvQ29uZmln
LmluLmhvc3QiCiAJc291cmNlICJwYWNrYWdlL3Vib290LXRvb2xzL0NvbmZpZy5pbi5ob3N0Igog
CXNvdXJjZSAicGFja2FnZS91Z2V0dHkvQ29uZmlnLmluLmhvc3QiCisJc291cmNlICJwYWNrYWdl
L3VnbGlmeWpzL0NvbmZpZy5pbi5ob3N0IgogCXNvdXJjZSAicGFja2FnZS91dGlsLWxpbnV4L0Nv
bmZpZy5pbi5ob3N0IgogCXNvdXJjZSAicGFja2FnZS91dHBfY29tL0NvbmZpZy5pbi5ob3N0Igog
CXNvdXJjZSAicGFja2FnZS91dXUvQ29uZmlnLmluLmhvc3QiCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3VnbGlmeWpzL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS91Z2xpZnlqcy9Db25maWcuaW4uaG9z
dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjUxYTMxNjM0YzRlYwot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdWdsaWZ5anMvQ29uZmlnLmluLmhvc3QKQEAgLTAs
MCArMSw3IEBACitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9VR0xJRllKUworCWJvb2wgImhvc3Qg
dWdsaWZ5anMiCisJaGVscAorCSAgdWdsaWZ5anMgaXMgYSBqYXZhc2NyaXB0IHBhcnNlciwgbWlu
aWZpZXIgY29tcHJlc3NvciBhbmQKKwkgIGJlYXV0aWZpZXIgdG9vbGtpdAorCisJICBodHRwczov
L2dpdGh1Yi5jb20vbWlzaG9vL1VnbGlmeUpTLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS91Z2xpZnlq
cy91Z2xpZnlqcy5oYXNoIGIvcGFja2FnZS91Z2xpZnlqcy91Z2xpZnlqcy5oYXNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYjQwM2ZkZDk2MGUxCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS91Z2xpZnlqcy91Z2xpZnlqcy5oYXNoCkBAIC0wLDAgKzEsMyBAQAor
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgNjk4OGI2NGQ0MTY5YzE1MGNlNDZiOGFlNmUy
YzM2OWFhODJiMWQ2N2FkYzc1NTIzNmFiZjk3MmMzODg1NzczNyAgdWdsaWZ5anMtMy4xOS4zLnRh
ci5negorc2hhMjU2ICA0MjJlZThkMGI1MzFhM2UzYzNjNzMwYjRkYmQ2ZjU5MGZmNzg2ODUzODk3
Yjk5OTI4ODhlMzRmY2RhY2JlNTI2ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3VnbGlm
eWpzL3VnbGlmeWpzLm1rIGIvcGFja2FnZS91Z2xpZnlqcy91Z2xpZnlqcy5tawpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjkyMWQ0ZGZmZWU4ZQotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvdWdsaWZ5anMvdWdsaWZ5anMubWsKQEAgLTAsMCArMSwyMyBAQAorIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgdWdsaWZ5anMKKyMKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisKK1VHTElGWUpTX1ZFUlNJT04gPSAzLjE5LjMKK1VHTElGWUpTX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLG1pc2hvbyxVZ2xpZnlKUyx2JChVR0xJRllKU19WRVJTSU9OKSkKK1VHTElGWUpT
X0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKK1VHTElGWUpTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
CitIT1NUX1VHTElGWUpTX0RFUEVOREVOQ0lFUyA9IGhvc3Qtbm9kZWpzCisKK2RlZmluZSBIT1NU
X1VHTElGWUpTX0lOU1RBTExfQ01EUworCSQoSU5TVEFMTCkgLW0gMDc1NSAtZCAkKEhPU1RfRElS
KS9saWIvbm9kZV9tb2R1bGVzL3VnbGlmeS1qcworCXJzeW5jIC1hICQoQEQpL2JpbiAkKEhPU1Rf
RElSKS9saWIvbm9kZV9tb2R1bGVzL3VnbGlmeS1qcy8KKwlyc3luYyAtYSAkKEBEKS9saWIgJChI
T1NUX0RJUikvbGliL25vZGVfbW9kdWxlcy91Z2xpZnktanMvCisJcnN5bmMgLWEgJChARCkvdG9v
bHMgJChIT1NUX0RJUikvbGliL25vZGVfbW9kdWxlcy91Z2xpZnktanMvCisJJChJTlNUQUxMKSAt
bSAwNzU1ICQoQEQpL3BhY2thZ2UuanNvbiAkKEhPU1RfRElSKS9saWIvbm9kZV9tb2R1bGVzL3Vn
bGlmeS1qcy8KKwlsbiAtc2YgLi4vbGliL25vZGVfbW9kdWxlcy91Z2xpZnktanMvYmluL3VnbGlm
eWpzICQoSE9TVF9ESVIpL2Jpbi91Z2xpZnlqcworCitlbmRlZgorCiskKGV2YWwgJChob3N0LWdl
bmVyaWMtcGFja2FnZSkpCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3VnbGlmeWpzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91
Z2xpZnlqcy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjY2NmE1
ZmI0NmZmMQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfdWdsaWZ5anMucHkKQEAgLTAsMCArMSwyMyBAQAoraW1wb3J0IG9zCitpbXBvcnQgaW5m
cmEKK2Zyb20gcGF0aGxpYiBpbXBvcnQgUGF0aAorCitmcm9tIGluZnJhLmJhc2V0ZXN0IGltcG9y
dCBCUlRlc3QKKworSU5QVVRfU0FNUExFID0gUGF0aChfX2ZpbGVfXykucGFyZW50IC8gInRlc3Rf
dWdsaWZ5anMvc2FtcGxlX3VnbGlmeWpzLmpzIgorCisKK2NsYXNzIFRlc3RIb3N0VWdsaWZ5SlMo
QlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09O
RklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfSE9TVF9VR0xJRllKUz15
CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICB1Z2xpZnlq
c19iaW4gPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImhvc3QiLCAiYmluIiwgInVnbGlm
eWpzIikKKworICAgICAgICBjbWQgPSBbdWdsaWZ5anNfYmluLCAiLS1oZWxwIl0KKyAgICAgICAg
aW5mcmEucnVuX2NtZF9vbl9ob3N0KHNlbGYuYnVpbGRkaXIsIGNtZCkKKworICAgICAgICBjbWQg
PSBbdWdsaWZ5anNfYmluLCBJTlBVVF9TQU1QTEUsICItbyIsICJvdXRwdXQuanMiLCAiLWMiLCAi
LW0iXQorICAgICAgICBpbmZyYS5ydW5fY21kX29uX2hvc3Qoc2VsZi5idWlsZGRpciwgY21kKQpk
aWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91Z2xpZnlqcy9z
YW1wbGVfdWdsaWZ5anMuanMgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3Vn
bGlmeWpzL3NhbXBsZV91Z2xpZnlqcy5qcwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLmYzOTNjM2QzNWQ5OQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfdWdsaWZ5anMvc2FtcGxlX3VnbGlmeWpzLmpzCkBAIC0wLDAg
KzEsNSBAQAorZnVuY3Rpb24gYWRkTnVtYmVycyhmaXJzdE51bWJlciwgc2Vjb25kTnVtYmVyKSB7
CisgICAgdmFyIHRvdGFsUmVzdWx0ID0gZmlyc3ROdW1iZXIgKyBzZWNvbmROdW1iZXI7CisgICAg
Y29uc29sZS5sb2coIlRoZSB0b3RhbCBpczogIiArIHRvdGFsUmVzdWx0KTsKKyAgICByZXR1cm4g
dG90YWxSZXN1bHQ7Cit9CgotLSAKMi41NS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
