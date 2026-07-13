Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D25C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 08:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCECA60619;
	Mon, 13 Jul 2026 08:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8dgnM9FkdiK; Mon, 13 Jul 2026 08:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09DF60626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783931897;
	bh=ttpZFFUzqAqiDb1onq6JHiCnhoiRsP1MVAlT0ISZ/4A=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=D5xMt/FPCJCLKhji0RvsAia9H+835UTMNxCCxCHWHt8K3/YskeGd4ltChrHdJCbpF
	 NCkcPVZSCLpKVOrDcmm6J4eQgtDv3+cckPcIk0gNEeLJDXUWUG63BW+qXqNAMb8wmm
	 2KyGj4yZZ7CCfHb4VWMb+uA1/b976EGwtpcqE251mLYLM2i9aAujysRodJe0jtZLWq
	 DaQCec7/L8y2ppF0MdIMaLj1I7S183Gj16KQaCcY/0s7fGa72bVob2EPer6GtiEC0c
	 nkKUqlgf9gXEoio6N5GwIge8P/SAhOzLf8mJ+LbkJ9RqvUUlQ7Tv2jGLxUayJThSkG
	 ZPvK+Zbt+Bheg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09DF60626;
	Mon, 13 Jul 2026 08:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E748128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A96160626
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvPZ63RNUaJI for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 08:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A138360619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A138360619
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A138360619
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 08:38:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4C9A3C2BB0F;
 Mon, 13 Jul 2026 08:38:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2CF8860341;
 Mon, 13 Jul 2026 08:38:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8731A11BD1FAF; 
 Mon, 13 Jul 2026 10:38:06 +0200 (CEST)
Date: Mon, 13 Jul 2026 10:37:55 +0200
MIME-Version: 1.0
Message-Id: <20260713-libxmslxec-bump-v1-1-8e29a316202f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVpS0hcRSy0poz4SwdpIu6uW
 H6L9y5g9IQMVXKBx5OY1iVCpQnYoV16FNRFg5a6kKXKxEQmzDwFtMIc8yZUnruukAad0xCrzaO
 j8B3r5jcfZkS7vxu47wejlUo+cwAAAA==
X-Change-ID: 20260713-libxmslxec-bump-144fd60beff2
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1783931888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=mGRsPDOe/iy/UVdnY7nkB5D9ZmPh5XYM9F/zyrcyPvE=;
 b=Z8/PpBz7Epox54FLr75ZP5dlQZBn/GqWLE5g5yLqvpBBuB1M85yw5E3ZnQ9D68cbqcy7I8
 6bO82saEI8MECUpDAmZphGE+96vgxQNldCJK3ztgUzDS0VhtqDq1bXhLLktlRTLQs2Fk3p
 +G3gVtPaNvLm3PVSRx2bkw1QmxwE0TuMTgrJBMOcrQMCWXKCYM+I7z6rDHoc/WqwxB2JFn
 PVRTW/jjctfi7xYe+XY3deBGYCj8pg6bpx36fKmP2J8lCLoKRWxRGPvVRGf2zwV0Mf47pp
 qfTQCEC2ArZN19qLSCWKYouTZjCmATSzsXDNmcFqg7oX92U1vXcnyKbSZ1wemQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Z8/PpBz7
Subject: [Buildroot] [PATCH] package/libxmlsec1: bump version to 1.3.12
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

VXBkYXRlIGxpYnhtbHNlYyBmcm9tIDEuMy45IHRvIDEuMy4xMi4gVGhlIHBhY2thZ2UgdGhlbiBu
ZWVkcyBhIGZldwphZGp1c3RtZW50czoKLSB0aGVyZSBhcmUgdW5kZWZpbmVkIHJlZmVyZW5jZXMg
dG8geG1sRGVidWdEdW1wRG9jdW1lbnQgKFsxXSk6CgogIHVuaXRfdGVzdHMvdHJhbnNmb3JtX2hl
bHBlcnNfdW5pdF90ZXN0cy5jOjI5MTo5OiBlcnJvcjogaW1wbGljaXQKICBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiDigJh4bWxEZWJ1Z0R1bXBEb2N1bWVudOKAmQogIFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQoKVGhpcyBpcyBkdWUgdG8geG1sc2VjMSB1bml0IHRlc3RzIGJlaW5n
IGJ1aWx0IHN5c3RlbWF0aWNhbGx5LCBhbmQKZGVwZW5kaW5nIG9uIGxpYnhtbDIgYmVpbmcgYnVp
bHQgd2l0aCAtLXdpdGgtZGVidWcsIHNvIHBhdGNoCmFwcHMvTWFrZWZpbGUuYW0gYWNjb3JkaW5n
bHkgYXQgYnVpbGQgdGltZSB0byBkaXNhYmxlIHVuaXQgdGVzdHMgYnVpbGQuCgotIHRoZSBidWls
ZCBjYW4gZmFpbCB3aXRoIG9sZGVyIEdDQyB2ZXJzaW9ucyBkdWUgdG8gYW4gdW5pbXBsZW1lbnRl
ZAogIHBhcmFtZXRlciAoWzJdKToKCiAgYWFyY2g2NC1saW51eC1nY2MuYnJfcmVhbDogZXJyb3I6
IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uIFwKICDigJgtV2Zvcm1hdC1vdmVyZmxv
dz0y4oCZOyBkaWQgeW91IG1lYW4g4oCYLVdzdHJpY3Qtb3ZlcmZsb3c94oCZPwoKVGhpcyBmb3Jt
YXQtb3ZlcmZsb3cgcGFyYW1ldGVyIGhhcyBiZWVuIGltcGxlbWVudGVkIGluIEdDQyA3LCBzbyBt
YWtlCnRoZSBwYWNrYWdlIGRlcGVuZCBvbiBHQ0MgPj0gNy4gQW5vdGhlciBzb2x1dGlvbiBjb3Vs
ZCBoYXZlIGJlZW4gdG8KcGFzcyAtLWRpc2FibGUtcGVkYW50aWMgdG8gdGhlIHBhY2thZ2UncyBj
b25maWd1cmUsIGJ1dCB0aGF0IHNvdW5kcyBhCmJpdCBzdHJvbmcganVzdCB0byBkaXNhYmxlIGEg
cGFyYW1ldGVyIHRoYXQgaGFzIGJlZW4gZXhpc2l0aW5nIGZvcgphbG1vc3QgMTAgeWVhcnMuCgot
IHRoZSBidWlsZCBjYW4gZmFpbCBvbiBtaXNzaW5nIGF0b21pY3MgKFszXSk6CgogIFsuLi5dL2Jv
b3RsaW4tbTY4ay01MjA4LXVjbGliYy9ob3N0L29wdC9leHQtdG9vbGNoYWluL202OGstYnVpbGRy
b290LXVjbGludXgtdWNsaWJjL2Jpbi9sZC5yZWFsOgogIFsuLi5dL2Jvb3RsaW4tbTY4ay01MjA4
LXVjbGliYy9ob3N0L2Jpbi8uLi9tNjhrLWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliYy9zeXNyb290
L3Vzci9saWIvbGliY3J5cHRvLmEobGliY3J5cHRvLWxpYi10aHJlYWRzX3B0aHJlYWQubyk6CiAg
aW4gZnVuY3Rpb24gYENSWVBUT19hdG9taWNfc3RvcmUnOiB0aHJlYWRzX3B0aHJlYWQuYzooLnRl
eHQrMHhjZDIpOgogIHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2lzX2xvY2tfZnJl
ZScKClNvIG1ha2UgdGhlIHBhY2thZ2UgZGVwZW5kIG9uIGxpYmF0b21pYwoKWzFdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMjUyNzUyNzAzNApbMl0g
aHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMvMTQ0NDk2ODE2MTUK
WzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzE0NDQ5Njgx
NjIxCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tPgotLS0KVGhpcyBwYXRjaCBmb2xsb3dzIEJlcm5kIEt1aGxzJyBhdHRlbXB0IHRvIHVw
Z3JhZGUgbGlieG1sc2VjMSB0byAxLjMuMTEKZnJvbSBhIGZldyBtb250aHMgYWdvOgoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjYwNTE5MTg1NzMyLjEwMjk0MDItMS1iZXJu
ZEBrdWhscy5uZXQvCgpCZXJuZCwgSSB0aGVuIHRvb2sgdGhlIGxpYmVydHkgdG8gYWRkIHlvdXIg
U29CIGFuZCBDby1EZXZlbG9wZWQtYnkgZm9yCnRoZSB1bml0IHRlc3QgZGlzYWJsaW5nIHBhcnQs
IHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGF0J3Mgbm90IG9rLgotLS0KIHBhY2thZ2UvbGlieG1s
c2VjMS9Db25maWcuaW4gICAgICAgfCAgNSArKysrKwogcGFja2FnZS9saWJ4bWxzZWMxL2xpYnht
bHNlYzEuaGFzaCB8ICAyICstCiBwYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayAgIHwg
MTAgKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4gYi9wYWNr
YWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCmluZGV4IDRhNjg2ODUzYWUwZS4uNzgyZTZjZWQ3Y2U5
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
bGlieG1sc2VjMS9Db25maWcuaW4KQEAgLTEsNSArMSw3IEBACiBjb25maWcgQlIyX1BBQ0tBR0Vf
TElCWE1MU0VDMQogCWJvb2wgImxpYnhtbHNlYzEiCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF83ICMtV2Zvcm1hdC1vdmVyZmxvdworCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IQVNfQVRPTUlDCiAJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfTElCWE1MMgogCWhlbHAKQEAgLTEwLDMgKzEyLDYgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0xJQlhNTFNFQzEKIAogCSAgaHR0cHM6Ly93d3cuYWxla3NleS5jb20veG1sc2VjLwogCSAg
aHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMKKworY29tbWVudCAibGlieG1sc2VjMSBu
ZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNyIKKwlkZXBlbmRzIG9uICAhQlIyX1RPT0xDSEFJ
Tl9HQ0NfQVRfTEVBU1RfNyB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfQVRPTUlDCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoIGIvcGFja2FnZS9saWJ4bWxzZWMx
L2xpYnhtbHNlYzEuaGFzaAppbmRleCA5ZTBlNjdlNzMyMmUuLjdmMzRjMjg5ODQxYiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaAorKysgYi9wYWNrYWdlL2xp
YnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1
dGVkCi1zaGEyNTYgIGE2MzFjOGNkN2E2Yjg2ZTZhZGI5ZjViOTM1ZDQ1YTljZjk3NjhiM2NiMDkw
ZDQ2MWU4ZWI5ZDA0M2NmOWI2MmYgIHhtbHNlYzEtMS4zLjkudGFyLmd6CitzaGEyNTYgIDI0MDQ1
MTk5YWYxMmQ5M2ZlNWZkYmJiZjdlMzg2ZTgyM2U0ODQyMDcxZTk0MzJlMmI5MGFjMTA4Yjg4OWE5
MjMgIHhtbHNlYzEtMS4zLjEyLnRhci5negogc2hhMjU2ICBkNWU5Mzg4NTM0MjU2MzYwYzZhMDA5
ZDRmMTlhYjJiOGQ2ZWMwYWE3ZmYzMmE1MWUyMmQ4OTllZDdiZWI1YzQ4ICBDb3B5cmlnaHQKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2FnZS9saWJ4
bWxzZWMxL2xpYnhtbHNlYzEubWsKaW5kZXggMjkyMjJiYzE2ZmZkLi44OGYwYWU5ZmQ5NGYgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCisrKyBiL3BhY2thZ2Uv
bGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotTElCWE1MU0VDMV9WRVJTSU9OID0gMS4zLjkKK0xJQlhNTFNFQzFfVkVS
U0lPTiA9IDEuMy4xMgogTElCWE1MU0VDMV9TT1VSQ0UgPSB4bWxzZWMxLSQoTElCWE1MU0VDMV9W
RVJTSU9OKS50YXIuZ3oKIExJQlhNTFNFQzFfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gx
MjMveG1sc2VjL3JlbGVhc2VzL2Rvd25sb2FkLyQoTElCWE1MU0VDMV9WRVJTSU9OKQogTElCWE1M
U0VDMV9MSUNFTlNFID0gTUlUCkBAIC0yMiw2ICsyMiwxNCBAQCBMSUJYTUxTRUMxX0NPTkZfT1BU
UyA9IFwKIAktLXdpdGhvdXQtbnNzIFwKIAktLWRpc2FibGUtZGVzCiAKKyMgeG1sc2VjX3VuaXRf
dGVzdHMgbmVlZHMgeG1sRGVidWdEdW1wRG9jdW1lbnQoKSBmcm9tIGxpYnhtbDIgd2hpY2ggaXMg
bm90CisjIHByZXNlbnQgaW4gYnVpbGRyb290IGJlY2F1c2UgbGlieG1sMiBpcyBidWlsZCB3aXRo
IC13aXRob3V0LWRlYnVnCitkZWZpbmUgTElCWE1MU0VDMV9ESVNBQkxFX1VOSVRfVEVTVFMKKwkk
KFNFRCkgJ3Mvbm9pbnN0X1BST0dSQU1TID0geG1sc2VjX3VuaXRfdGVzdHMvbm9pbnN0X1BST0dS
QU1TID0vJyBcCisJCSQoQEQpL2FwcHMvTWFrZWZpbGUuYW0KK2VuZGVmCitMSUJYTUxTRUMxX1BP
U1RfUEFUQ0hfSE9PS1MgKz0gTElCWE1MU0VDMV9ESVNBQkxFX1VOSVRfVEVTVFMKKwogSE9TVF9M
SUJYTUxTRUMxX0NPTkZfT1BUUyA9IFwKIAktLWVuYWJsZS1jcnlwdG8tZGw9bm8gXAogCS0td2l0
aC1vcGVuc3NsIFwKCi0tLQpiYXNlLWNvbW1pdDogZDJhNjU5OWY3Yjg1YmE2NGI2NTQyYWRhNTY0
NTdlYmE2ZTJiZTM2NApjaGFuZ2UtaWQ6IDIwMjYwNzEzLWxpYnhtc2x4ZWMtYnVtcC0xNDRmZDYw
YmVmZjIKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
