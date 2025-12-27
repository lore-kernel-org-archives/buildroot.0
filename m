Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A1E92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 370CB40185;
	Sat, 27 Dec 2025 15:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQqK55eIaT08; Sat, 27 Dec 2025 15:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA3D4068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850031;
	bh=3/TcChkg9UrVrv5rD1WJca4AItO2JuZhS30XQ+rLSjs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dvJjANO9xEVnGnoJoLANiqb9haVgZ3ma5PXmVZ17oF6Fl9aIcud4Q7PbHDFbSFiia
	 PeE1/WhUNhNMJCn2Ce0Gc+rbyPHqI8fSYPhKXxGfyBwYSfP5QlGBLNnD0cc0qZyptK
	 J/VBZ5MW8hcPEuMCJLJwsxJ4aKmmIJpahlfx1m8/CWiuLNZLVz782Tzxs9JG+gvQE2
	 +OJAsihfNSXU8R+aRVLXcNd5lV+Usxs0FcrNCuxEth50Im8o/xzPXNpwwup3bAU5R0
	 45GZtIow0cdL7S5KihJej63drTdwKJHdgx2YoxezninDMQWG/UAp6WIEq14K1cGPFv
	 IilntDXyyutZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA3D4068F;
	Sat, 27 Dec 2025 15:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D012AD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9D56071F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UGOYxNaNLCe for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59DB9606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59DB9606CC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59DB9606CC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:40:27 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2E087C1D1A5
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:40:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6617560725
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:40:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28FB611978520; Sat, 27 Dec 2025 16:40:13 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Dec 2025 16:40:01 +0100
Message-ID: <20251227154005.2015199-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766850014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=eOQR9OMh2VKDLstlkzNeER6fqNdlzQRZk2fY0uBHCSg=;
 b=xpzxJSYrPcGACcC3vUAHvLZSPQHEEgdgivDR/ItmSczpIVGnWbnjnN9mBEBcMSPtFcrkit
 jfydErGD65HUcO4CCTUsMyMNom+RbIUCkfSBH+pvXRxhWO4X9XIiZOCCTVR2lcPFWK7OMH
 rvabssg66xCQ9/NvESNYY0VI0uy0DsKgrLGAt1L7IXLJJUjINiedyeNB3jyXGM2lKqgz0Y
 DBoFbjzGkKav4OryAy5o9ImjQPQtCPiv5ckXcZVDgpZ8f9dAUhiI3Lk8VSt1ZmufugWzr5
 c2UksKkRHtgIGFOXKxR3d3sbnFBXNMiT9FcS9W7fNYM29uEe1zmBi1JlXNh/gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xpzxJSYr
Subject: [Buildroot] [PATCH 1/2] package/libsvg-cairo: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIGlzIG5vIGxvbmdlciBtYWludGFpbmVkLCBubyByZWxlYXNlIHNpbmNlIDIw
MDUsIGFuZCBpdHMKZGVwZW5kZW5jeSBsaWJzdmcgaGFzIGJ1aWxkIGlzc3VlcyBhcyBpdCB1c2Vz
IHRvbyBvbGQgWE1MIEFQSXM6CgovaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0
L2hvc3QvYmluLy4uL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNs
dWRlL2xpYnhtbDIvbGlieG1sL1NBWC5oOjE4OjQ6IHdhcm5pbmc6ICN3YXJuaW5nICJsaWJ4bWwv
U0FYLmggaXMgZGVwcmVjYXRlZCIgWy1XY3BwXQogICAxOCB8ICAgI3dhcm5pbmcgImxpYnhtbC9T
QVguaCBpcyBkZXByZWNhdGVkIgogICAgICB8ICAgIF5+fn5+fn4KCnN2Z2ludC5oOjQyOjk6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSAneG1sUGFyc2VyQ3R4dFB0cicKICAgNDIgfCB0eXBlZGVm
IHhtbFBhcnNlckN0eHRQdHIgc3ZnX3htbF9wYXJzZXJfY29udGV4dF90OwogICAgICB8ICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBDb25maWcuaW4ubGVnYWN5ICAgICAgICAg
ICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgLQogcGFja2FnZS9saWJzdmctY2Fpcm8vQ29uZmlnLmluICAgICAgICAgfCAxMSAtLS0t
LS0tLS0tLQogcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLmhhc2ggfCAgNiAtLS0t
LS0KIHBhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5tayAgIHwgMTYgLS0tLS0tLS0t
LS0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlic3ZnLWNhaXJvL0NvbmZpZy5pbgogZGVs
ZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5oYXNoCiBk
ZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJzdmctY2Fpcm8vbGlic3ZnLWNhaXJvLm1rCgpk
aWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKaW5kZXggZTEw
ZmQ5NWY4ZC4uZTQyZjcwZDBkOSAxMDA2NDQKLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQorKysgYi9D
b25maWcuaW4ubGVnYWN5CkBAIC0xNDYsNiArMTQ2LDE0IEBAIGVuZGlmCiAKIGNvbW1lbnQgIkxl
Z2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyNi4wMiIKIAorY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QlNWR19DQUlSTworCWJvb2wgImxpYnN2Zy1jYWlybyBwYWNrYWdlIHJlbW92ZWQiCisJc2VsZWN0
IEJSMl9MRUdBQ1kKKwloZWxwCisJICBUaGUgbGlic3ZnLWNhaXJvIHBhY2thZ2UgaGFzIGJlZW4g
cmVtb3ZlZC4gSXRzIGxhdGVzdAorCSAgdXBzdHJlYW0gcmVsZWFzZSB3YXMgZnJvbSAyMDA1LCBh
bmQgaXQgd2Fzbid0IHVzZWQgYnkgYW55CisJICBvdGhlciBCdWlsZHJvb3QgcGFja2FnZS4KKwog
Y29uZmlnIEJSMl9QQUNLQUdFX09QRU5DVjNfV0lUSF9GRk1QRUcKIAlib29sICJvcGVuY3YzIGZm
bXBlZyBzdXBwb3J0IHJlbW92ZWQiCiAJc2VsZWN0IEJSMl9MRUdBQ1kKZGlmZiAtLWdpdCBhL0RF
VkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGE5ZWI1ZDkyMzEuLjJiMjc5MDRlZTAgMTAwNjQ0
Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtNTg0LDcgKzU4NCw2IEBAIEY6
CXBhY2thZ2Uvc3VueGktYm9hcmRzLwogTjoJQ2Fyc3RlbiBTY2hvZW5lcnQgPGMuc2Nob2VuZXJ0
QGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvbGliZHZic2kvCiBGOglwYWNrYWdlL2xpYnN2Zy8KLUY6
CXBhY2thZ2UvbGlic3ZnLWNhaXJvLwogCiBOOglDw6lkcmljIENow6lwaWVkIDxjZWRyaWMuY2hl
cGllZEBnbWFpbC5jb20+CiBGOglwYWNrYWdlL3puYy8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29u
ZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggZjMzYzExNmVjNS4uMDVkMzVmNjg2MSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAg
LTE3NjksNyArMTc2OSw2IEBAIG1lbnUgIkdyYXBoaWNzIgogCXNvdXJjZSAicGFja2FnZS9saWJy
YXcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJyc3ZnL0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2UvbGlic3ZnL0NvbmZpZy5pbiIKLQlzb3VyY2UgInBhY2thZ2UvbGlic3ZnLWNh
aXJvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlidmEvQ29uZmlnLmluIgogCXNvdXJj
ZSAicGFja2FnZS9saWJ2YS1pbnRlbC1kcml2ZXIvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9saWJ2ZHBhdS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnN2Zy1jYWlyby9D
b25maWcuaW4gYi9wYWNrYWdlL2xpYnN2Zy1jYWlyby9Db25maWcuaW4KZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDQ2MDJlOTNjMmEuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9saWJz
dmctY2Fpcm8vQ29uZmlnLmluCisrKyAvZGV2L251bGwKQEAgLTEsMTEgKzAsMCBAQAotY29uZmln
IEJSMl9QQUNLQUdFX0xJQlNWR19DQUlSTwotCWJvb2wgImxpYnN2Zy1jYWlybyIKLQlzZWxlY3Qg
QlIyX1BBQ0tBR0VfQ0FJUk8KLQlzZWxlY3QgQlIyX1BBQ0tBR0VfQ0FJUk9fUE5HCi0Jc2VsZWN0
IEJSMl9QQUNLQUdFX0xJQlNWRwotCWhlbHAKLQkgIExpYnN2Zy1jYWlybyBwcm92aWRlcyB0aGUg
YWJpbGl0eSB0byByZW5kZXIgU1ZHIGNvbnRlbnQgZnJvbQotCSAgZmlsZXMgb3IgYnVmZmVycy4g
QWxsIHJlbmRlcmluZyBpcyBwZXJmb3JtZWQgdXNpbmcgdGhlIGNhaXJvCi0JICByZW5kZXJpbmcg
bGlicmFyeS4KLQotCSAgaHR0cDovL2NhaXJvZ3JhcGhpY3Mub3JnCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8uaGFzaCBiL3BhY2thZ2UvbGlic3ZnLWNhaXJv
L2xpYnN2Zy1jYWlyby5oYXNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkOWNmYmZm
YTdhLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5o
YXNoCisrKyAvZGV2L251bGwKQEAgLTEsNiArMCwwIEBACi0jIEZyb20gaHR0cDovL2NhaXJvZ3Jh
cGhpY3Mub3JnL3NuYXBzaG90cy9saWJzdmctY2Fpcm8tMC4xLjYudGFyLmd6Lm1kNQotbWQ1ICBk
NzlkYTdiM2E2MGFkOGM4ZTRiOTAyYzliMzU2MzA0NyAgbGlic3ZnLWNhaXJvLTAuMS42LnRhci5n
egotCi0jIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBhMzgwYmU2YTc4ZWMyOTM4MTAwY2U5
MDQzNjM4MTVhOTQwNjhmY2EzNzJjNjY2YjhjYzgyYWE4NzExYTAyMTVjICBsaWJzdmctY2Fpcm8t
MC4xLjYudGFyLmd6Ci1zaGEyNTYgIGQ4MGM5ZDA4NGViZmI1MGVhMWVkOTFiZmJjMjQxMGQ2Y2U1
NDIwOTdhMzJjNDNiMDA3ODFiODNhZGNiOGM3N2YgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlic3ZnLWNhaXJvL2xpYnN2Zy1jYWlyby5tayBiL3BhY2thZ2UvbGlic3ZnLWNhaXJvL2xp
YnN2Zy1jYWlyby5tawpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZjdhMTA1ZTAzZS4u
MDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL2xpYnN2Zy1jYWlyby9saWJzdmctY2Fpcm8ubWsKKysr
IC9kZXYvbnVsbApAQCAtMSwxNiArMCwwIEBACi0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotIwot
IyBsaWJzdmctY2Fpcm8KLSMKLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCi0KLUxJQlNWR19DQUlS
T19WRVJTSU9OID0gMC4xLjYKLUxJQlNWR19DQUlST19TSVRFID0gaHR0cDovL2NhaXJvZ3JhcGhp
Y3Mub3JnL3NuYXBzaG90cwotTElCU1ZHX0NBSVJPX0RFUEVOREVOQ0lFUyA9IGNhaXJvIGxpYnN2
ZwotTElCU1ZHX0NBSVJPX0lOU1RBTExfU1RBR0lORyA9IFlFUwotTElCU1ZHX0NBSVJPX0xJQ0VO
U0UgPSBMR1BMLTIuMSsKLUxJQlNWR19DQUlST19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwotCi1M
SUJTVkdfQ0FJUk9fQ09ORl9PUFRTID0gLS13aXRob3V0LXgKLQotJChldmFsICQoYXV0b3Rvb2xz
LXBhY2thZ2UpKQotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
