Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB4E7E360
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 09:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6533E8197D;
	Fri,  3 Apr 2026 09:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBIYnki6r9B1; Fri,  3 Apr 2026 09:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691C480F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775209937;
	bh=+g4MwqxzU8YwmpqjwGxo1OKDdsT7G3kfDtaPoyiRSLk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LBeOYvr+Og9ErMlQ5NX1mBuaINsb9rXjGpWuoDHM3KBLYRTzvITOEGmrWVchHZJw4
	 yE1ccYyQ0iOp1iCIy74z/S3ZjInZw7PDCraN6KEoYESLVE3vsJhSr2tTjmB41P6mVe
	 lGpIVUMkdc7J6ZKweVMag/YKQhsmNC9R7ssiUuL/DNvBBGwILEwJo9OJHFUwyawIHa
	 /dYZ75ucqZUcw/7mddcXhxT8sMVHMwZlAqqKkMxcVxJbVkk/iipquRufz9gqvdbiv5
	 JO5SC65/E+5rCak6z1XE/rHRLqK7JWLSP9wxLqGHsHZUh3r+IrhIPAINoU7LuDTV3H
	 9PjtKjm36LOqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691C480F85;
	Fri,  3 Apr 2026 09:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4174D1F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 261DB60882
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgouCz3VmE_o for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 09:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A81B6083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A81B6083C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A81B6083C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:52:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0BBD91A3129
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D2785603C1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 09:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF75710451A8C; 
 Fri,  3 Apr 2026 11:52:08 +0200 (CEST)
Date: Fri, 03 Apr 2026 11:51:52 +0200
MIME-Version: 1.0
Message-Id: <20260403-openscap_bump-v1-1-20f99c3c9429@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3fyC1Lzi5MSC+KTS3ALdVIskE0szUxMzUwNjJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaADW2MSZxAAAA
X-Change-ID: 20260403-openscap_bump-e8b496546503
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775209930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=mHLvK0Ui7rVEHKWjV4d8uAsxhvPbLusHB5Acl2heSV0=;
 b=WBCaTMscwysFBMAXQy3wESJEtzVwMUM4hAgDXCWtLneNVIqV6joZB8fZclwqkgJGxM/heP
 dPtn9cWSPd3M7L+zpYMSFhgyl5azyUPHDO7km8sk115aXgo/j5+wKnYlHJF2h/vZVjAjW2
 6TS41tTYmfW4Wb6/uc35/fWtU/wJ9zf4kbqRdc3BfL113DqJfspaqHHslIub0fRE6Wb5sv
 qb/5JbiVIOKbEMFKSrGjLuRUdQzN7MgISAG8ZGP3+v9Loj8Qz1LhpGwkK7iLBhWPokdTSd
 QilOWe+Hh7BqWNkxM7rVF3/3GTqTpEcKMGBWS18okjbfsttzjHxquq2mi1Agfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WBCaTMsc
Subject: [Buildroot] [PATCH] package/openscap: bump to version 1.4.3
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

VGhlIGN1c3RvbSBwYXRjaCB0byBlbmZvcmNlIHByb2plY3QgYXMgQyBwcm9qZWN0IGFzIGJlZW4g
bWVyZ2VkIHVwc3RyZWFtCnNpbmNlIHRoZW4sIGJ1dCBpdCBpcyBub3QgcmVsZWFzZWQgeWV0LiBU
aGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBwYXRjaCB0bwphcHBseSBpdCBvbiB0b3Agb2YgMS40LjMs
IGFuZCB1c2UgdGhlIG9wcG9ydHVuaXR5IHRvIGZpeCB0aGUgcGF0Y2ggZmlsZQpuYW1lIHRvIG1h
dGNoIHRoZSBjb21taXQgdGl0bGUuCgpTaW5jZSB2ZXJzaW9uIDEuNC4wLCBvcGVuc2NhcCBkZXBl
bmRzIG9uIFBDUkUyIHJhdGhlciB0aGFuIFBDUkUKCmh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NB
UC9vcGVuc2NhcC9jb21wYXJlLzEuMy4xMi4uLjEuNC4zCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIC4uLj0+IDAwMDEtU2V0
LXByb2plY3QtYXMtQy1wcm9qZWN0LWluLUNNYWtlTGlzdHMudHh0LnBhdGNofSB8IDEyICsrKysr
Ky0tLS0tLQogcGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL29wZW5zY2FwL29wZW5z
Y2FwLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9vcGVuc2NhcC8wMDAxLXNldC1wcm9qZWN0LWFzLWMtcHJvamVjdC5wYXRjaCBi
L3BhY2thZ2Uvb3BlbnNjYXAvMDAwMS1TZXQtcHJvamVjdC1hcy1DLXByb2plY3QtaW4tQ01ha2VM
aXN0cy50eHQucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gcGFja2FnZS9v
cGVuc2NhcC8wMDAxLXNldC1wcm9qZWN0LWFzLWMtcHJvamVjdC5wYXRjaApyZW5hbWUgdG8gcGFj
a2FnZS9vcGVuc2NhcC8wMDAxLVNldC1wcm9qZWN0LWFzLUMtcHJvamVjdC1pbi1DTWFrZUxpc3Rz
LnR4dC5wYXRjaAppbmRleCBjNzk0ZmJhZjQ0ZGMuLjJjY2JmZDEzOGQyYiAxMDA2NDQKLS0tIGEv
cGFja2FnZS9vcGVuc2NhcC8wMDAxLXNldC1wcm9qZWN0LWFzLWMtcHJvamVjdC5wYXRjaAorKysg
Yi9wYWNrYWdlL29wZW5zY2FwLzAwMDEtU2V0LXByb2plY3QtYXMtQy1wcm9qZWN0LWluLUNNYWtl
TGlzdHMudHh0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNzQyNjQ3ZWZkMjE1YjY4MmU0
Y2QyNmIxNWFjM2U1ODBjMTBlZjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMmZh
OGRmMTI2YjUzMzMxN2I0Yjg2Mzc1OGNmNTc5ZmZmM2EyYjQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogPT9VVEYtOD9xP0FsZXhpcz0yMExvdGhvcj1DMz1BOT89IDxhbGV4aXMubG90
aG9yZUBib290bGluLmNvbT4KIERhdGU6IE1vbiwgMTYgRmViIDIwMjYgMTM6NTA6NDggKzAxMDAK
IFN1YmplY3Q6IFtQQVRDSF0gU2V0IHByb2plY3QgYXMgQyBwcm9qZWN0IGluIENNYWtlTGlzdHMu
dHh0CkBAIC01MywxNSArNTMsMTUgQEAgdGVzdCBDKysgZmVhdHVyZXMgb24gdGhlIHVzZWQgdG9v
bGNoYWluLgogWzFdIGh0dHBzOi8vYnVpbGRyb290Lm9yZy8KIFsyXSBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMWZlNTUwZmZhNzlmMGEwODNhNDUwYWUwM2ZlMDY3YThh
YjczMzZiZS9idWlsZC1lbmQubG9nCiAKLVVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vT3Bl
blNDQVAvb3BlbnNjYXAvcHVsbC8yMzEyCi1bcGF0Y2ggc2xpZ2h0bHkgYWRhcHRlZCB0byBiZSBh
cHBsaWNhYmxlIG9uIHYxLjMuMTJdCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL09wZW5T
Q0FQL29wZW5zY2FwL2NvbW1pdC9iYmZiMmQ3YjAwY2JiOGUwOGQ5OTk1NDY3MzRkM2JhNmFlMTUw
NzM2CitbcGF0Y2ggc2xpZ2h0bHkgYWRhcHRlZCB0byBiZSBhcHBsaWNhYmxlIG9uIHYxLjQuM10K
IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+CiAtLS0KICBDTWFrZUxpc3RzLnR4dCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIv
Q01ha2VMaXN0cy50eHQKLWluZGV4IGNiMTNkZWJiNDdjZi4uMDViMDU0MzI3OTUxIDEwMDY0NAor
aW5kZXggYzU2MTExNmQ4MjZjLi41NzA4MTI2NjcwMzYgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3Rz
LnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKIEBAIC04LDcgKzgsNyBAQCBpZihOT1QgQ01BS0Vf
QlVJTERfVFlQRSBBTkQgTk9UIENNQUtFX0NPTkZJR1VSQVRJT05fVFlQRVMpCkBAIC03MSw4ICs3
MSw4IEBAIGluZGV4IGNiMTNkZWJiNDdjZi4uMDViMDU0MzI3OTUxIDEwMDY0NAogLXByb2plY3Qo
Im9wZW5zY2FwIikKICtwcm9qZWN0KCJvcGVuc2NhcCIgQykKICBzZXQoT1BFTlNDQVBfVkVSU0lP
Tl9NQUpPUiAiMSIpCi0gc2V0KE9QRU5TQ0FQX1ZFUlNJT05fTUlOT1IgIjMiKQotIHNldChPUEVO
U0NBUF9WRVJTSU9OX1BBVENIICIxMiIpCisgc2V0KE9QRU5TQ0FQX1ZFUlNJT05fTUlOT1IgIjQi
KQorIHNldChPUEVOU0NBUF9WRVJTSU9OX1BBVENIICIzIikKIC0tIAogMi41My4wCiAKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluIGIvcGFja2FnZS9vcGVuc2NhcC9Db25m
aWcuaW4KaW5kZXggMzE3MDU1Yzc1MzI3Li44Mjc1OTA1OThlNDEgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2Uvb3BlbnNjYXAvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluCkBA
IC0xMCw3ICsxMCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0NBUAogCXNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJYU0xUCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTFNFQzEKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfTVVTTF9GVFMgaWYgIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwotCXNlbGVj
dCBCUjJfUEFDS0FHRV9QQ1JFCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BDUkUyCiAJc2VsZWN0IEJS
Ml9QQUNLQUdFX1BDUkVfVVRGCiAJaGVscAogCSAgVGhlIHB1cnBvc2Ugb2YgdGhpcyBwcm9qZWN0
IGlzIHRvIGNyZWF0ZSBzZWN1cml0eSBwb2xpY3kKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNj
YXAvb3BlbnNjYXAuaGFzaCBiL3BhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaAppbmRleCBl
OTg2MzEzNzJkNTEuLjdhMjU3ODliNWJjYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9v
cGVuc2NhcC5oYXNoCisrKyBiL3BhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaApAQCAtMSwz
ICsxLDMgQEAKICMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICA2ZTYxOTEzZmNhM2E3NGQzMTBk
N2NmOTM1NDk3M2VlYWVmYTQyYmU5MDlhZTY0OWFmMWRmNDhjM2MwOGJjNmZmICBvcGVuc2NhcC0x
LjMuMTIudGFyLmd6CitzaGEyNTYgIDk2ZWJlNjk3YWFmYzgzZWIyOTdhOGYyOTU5NmQ1NzMxOTI3
ODExMjQ2N2M0NmU2YWFmMzY0OWIzMTFjZjhmYmEgIG9wZW5zY2FwLTEuNC4zLnRhci5negogc2hh
MjU2ICA1ZGYwNzAwNzE5ODk4OWM2MjJmNWQ0MWRlOGQ3MDNlN2JlZjNkMGU3OWQ2MmUyNDMzMmVl
NzM5YTQ1MmFmNjJhICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL29wZW5z
Y2FwLm1rIGIvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5tawppbmRleCAyMDQyNzUyNGQ3OWEu
LjQyZjY0NGRiNTVlOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5tawor
KysgYi9wYWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotT1BFTlNDQVBfVkVSU0lPTiA9IDEuMy4xMgorT1BFTlND
QVBfVkVSU0lPTiA9IDEuNC4zCiBPUEVOU0NBUF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL09w
ZW5TQ0FQL29wZW5zY2FwL3JlbGVhc2VzL2Rvd25sb2FkLyQoT1BFTlNDQVBfVkVSU0lPTikKIE9Q
RU5TQ0FQX0xJQ0VOU0UgPSBMR1BMLTIuMSsKIE9QRU5TQ0FQX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HCkBAIC0xNyw3ICsxNyw3IEBAIE9QRU5TQ0FQX0RFUEVOREVOQ0lFUyA9IFwKIAlsaWJ4bWwy
IFwKIAlsaWJ4bWxzZWMxIFwKIAlsaWJ4c2x0IFwKLQlwY3JlCisJcGNyZTIKIAogSE9TVF9PUEVO
U0NBUF9ERVBFTkRFTkNJRVMgPSBcCiAJaG9zdC1wa2djb25mIFwKQEAgLTI2LDcgKzI2LDcgQEAg
SE9TVF9PUEVOU0NBUF9ERVBFTkRFTkNJRVMgPSBcCiAJaG9zdC1saWJ4bWwyIFwKIAlob3N0LWxp
YnhtbHNlYzEgXAogCWhvc3QtbGlieHNsdCBcCi0JaG9zdC1wY3JlCisJaG9zdC1wY3JlMgogCiBP
UEVOU0NBUF9DT05GX09QVFMgPSBcCiAJLURFTkFCTEVfT1NDQVBfVVRJTD1PTiBcCgotLS0KYmFz
ZS1jb21taXQ6IDAxMWJjNGI3NDcyYmY3NzgyYWY0ZWI4MTg3ZjVjOTk5MmE5ZjljZWYKY2hhbmdl
LWlkOiAyMDI2MDQwMy1vcGVuc2NhcF9idW1wLWU4YjQ5NjU0NjUwMwoKQmVzdCByZWdhcmRzLAot
LSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
