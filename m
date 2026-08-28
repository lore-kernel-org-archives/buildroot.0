Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D504C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 22:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DB5280F53;
	Fri, 28 Aug 2026 22:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QayQvnc3cLd; Fri, 28 Aug 2026 22:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787955120;
	bh=KDcrZQAI9CTxJ6uICw8byicCWwg7p8LamQDYuQQaP6g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BdX/FG12WF/rsdeVr9mJLAHQcYJSspR8pyMNc+e8XF2Pn8pD//DWn0cUg9DIEzmoY
	 3Mu9giLvIK7qOhkJuTye2B2vIORMyEFRK3TP5QrCXgkWHf9rJoxIjnpp3+ggRM3BxX
	 cNniyHz7oDxdlOjD9F1watWr7ucbOqSdiPtBX27y+Wpu8ipChAQHKzZGaHxNf/fKkV
	 2OfzvyGZuv7L6fDYXZ6hC7jnrPxKGh9k+WXtUZOY74bmC9wLtd6dzrSwS3lmC5pmS5
	 GF4IrHBilgk2Z+aFFLvMzznOM31S3gbFvZK5dnj3ONYZqzpLRc2cG5lUn2xhcTw0M6
	 KOqJbRcMtAWbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3B580A49;
	Fri, 28 Aug 2026 22:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1A5E23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E35534086A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeGg3u4iS2Gh for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 22:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAB4440856
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:11:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B26811A18B3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:11:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6CDA860537;
 Fri, 28 Aug 2026 22:11:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B10A11C7818C; 
 Sat, 29 Aug 2026 00:11:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Sat, 29 Aug 2026 00:11:43 +0200
Message-ID: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/dpdk: fix example build issue when
 libvirt is present
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

V2hlbiBsaWJ2aXJ0IGlzIHByZXNlbnQgYmVmb3JlIERQREsgaXMgYnVpbHQsIHNvbWUgYWRkaXRp
b25hbCBleGFtcGxlcwphcmUgY29tcGlsZWQuIE9uZSBvZiB0aGVtIGZhaWxzIHRvIGJ1aWxkIGR1
ZSB0byBhIG1pc3NpbmcgPHN0ZGxpYi5oPgppbmNsdWRlLiBMZXQncyBpbXBvcnQgYSBwYXRjaCBm
cm9tIE9wZW5TdXNlLCB0aGF0IHdlIGhhdmUgc3VibWl0dGVkCnVwc3RyZWFtLCB0byBmaXggdGhp
cyBpc3N1ZS4KCldlIGNvdWxkbid0IGZpbmQgYW55IGF1dG9idWlsZGVyIGZhaWx1cmUgZm9yIHRo
aXMgaXNzdWUsIGJ1dCB0aGUKZm9sbG93aW5nIGRlZmNvbmZpZyBhbGxvd3MgdG8gcmVwcm9kdWNl
IHRoZSBmYWlsdXJlOgoKQlIyX2FhcmNoNjQ9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09U
TElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlO
QU1JQ19FVURFVj15CkJSMl9QQUNLQUdFX0RQREs9eQpCUjJfUEFDS0FHRV9EUERLX0VYQU1QTEVT
PXkKQlIyX1BBQ0tBR0VfTElCVklSVD15CgpUaGUgcHJvYmxlbSBleGlzdHMgc2luY2UgRFBESyB2
MTkuMTEsIHNvIGl0IGhhcyBiZWVuIGluIEJ1aWxkcm9vdApzaW5jZSBEUERLIHdhcyBpbnRyb2R1
Y2VkIGluIGNvbW1pdApkMTdkMWI2YmRlOTVkNDYzNzZjNGZlOTNlOGNhMWExZjlkYTZjMTc5LgoK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KLS0tCiAuLi5yX21hbmFnZXItYWRkLW1pc3Npbmctc3RkbGliLmgtaGVhZGUucGF0Y2gg
fCA0NiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZHBkay8wMDAyLWV4YW1wbGVzLXZtX3Bvd2Vy
X21hbmFnZXItYWRkLW1pc3Npbmctc3RkbGliLmgtaGVhZGUucGF0Y2gKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2RwZGsvMDAwMi1leGFtcGxlcy12bV9wb3dlcl9tYW5hZ2VyLWFkZC1taXNzaW5nLXN0
ZGxpYi5oLWhlYWRlLnBhdGNoIGIvcGFja2FnZS9kcGRrLzAwMDItZXhhbXBsZXMtdm1fcG93ZXJf
bWFuYWdlci1hZGQtbWlzc2luZy1zdGRsaWIuaC1oZWFkZS5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44OTk4NDJjMmIyCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9kcGRrLzAwMDItZXhhbXBsZXMtdm1fcG93ZXJfbWFuYWdlci1hZGQtbWlzc2luZy1zdGRs
aWIuaC1oZWFkZS5wYXRjaApAQCAtMCwwICsxLDQ2IEBACitGcm9tIDlmNmMzMTkxYjMxNzgyOTRk
Njk4Y2RjYTg1OWNlOWRhYzc4NTE3ZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBH
dWlsbGF1bWUgR2FyZGV0IDxHdWlsbGF1bWUuR2FyZGV0QGFybS5jb20+CitEYXRlOiBUaHUsIDI5
IEF1ZyAyMDI0IDE2OjMzOjE5ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGV4YW1wbGVzL3ZtX3Bv
d2VyX21hbmFnZXI6IGFkZCBtaXNzaW5nIDxzdGRsaWIuaD4gaGVhZGVyCisgaW5jbHVkZSBmb3Ig
c3RydG9sCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK3N0cnRvbCBpcyBk
ZWZpbmVkIGluIHN0ZGxpYi5oCisKK0ZpeGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToK
KworLi4vZXhhbXBsZXMvdm1fcG93ZXJfbWFuYWdlci9ndWVzdF9jbGkvdm1fcG93ZXJfY2xpX2d1
ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGNtZF9xdWVyeV9mcmVxX2xpc3RfcGFyc2Vk4oCZOgorLi4v
ZXhhbXBsZXMvdm1fcG93ZXJfbWFuYWdlci9ndWVzdF9jbGkvdm1fcG93ZXJfY2xpX2d1ZXN0LmM6
MjA4OjQyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYc3RydG9s
4oCZOyBkaWQgeW91IG1lYW4g4oCYc3RydG9r4oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KKyAgMjA4IHwgICAgICAgICAgICAgICAgIGxjb3JlX2lkID0gKHVuc2lnbmVkIGlu
dClzdHJ0b2wocmVzLT5jcHVfbnVtLCAmZXAsIDEwKTsKKyAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KKyAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ0b2sKKworRml4ZXM6IDBlOGY0NzQ5MWYwOTBm
NDRhNDk1NjQyOWNiMjdmNjk0MmI2NjE4YjAgKCJleGFtcGxlcy92bV9wb3dlcjogYWRkIGNvbW1h
bmQgdG8gcXVlcnkgQ1BVIGZyZXF1ZW5jeSIpCitTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgR2Fy
ZGV0IDxndWlsbGF1bWUuZ2FyZGV0QGFybS5jb20+CitbVGhvbWFzOgorLSByZXRyaWV2ZSBwYXRj
aCBmcm9tCitodHRwczovL2J1aWxkLm9wZW5zdXNlLm9yZy9wcm9qZWN0cy9vcGVuU1VTRTo0MjpG
YWN0b3J5LUNhbmRpZGF0ZXMtQ2hlY2svcGFja2FnZXMvZHBkay9maWxlcy8wMDAxLWV4YW1wbGVz
LXZtX3Bvd2VyX21hbmFnZXItYWRkLW1pc3NpbmctaGVhZGVyLnBhdGNoP2V4cGFuZD0xCistIGlt
cHJvdmUgY29tbWl0IG1lc3NhZ2VdCitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgorVXBzdHJlYW06IGh0dHBzOi8vbWFpbHMuZHBk
ay5vcmcvYXJjaGl2ZXMvZGV2LzIwMjYtQXVndXN0LzM0NDU1Mi5odG1sCistLS0KKyBleGFtcGxl
cy92bV9wb3dlcl9tYW5hZ2VyL2d1ZXN0X2NsaS92bV9wb3dlcl9jbGlfZ3Vlc3QuYyB8IDEgKwor
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvZXhhbXBsZXMv
dm1fcG93ZXJfbWFuYWdlci9ndWVzdF9jbGkvdm1fcG93ZXJfY2xpX2d1ZXN0LmMgYi9leGFtcGxl
cy92bV9wb3dlcl9tYW5hZ2VyL2d1ZXN0X2NsaS92bV9wb3dlcl9jbGlfZ3Vlc3QuYworaW5kZXgg
NDExNDU5M2NlZS4uNjNhNTljOGIxMCAxMDA2NDQKKy0tLSBhL2V4YW1wbGVzL3ZtX3Bvd2VyX21h
bmFnZXIvZ3Vlc3RfY2xpL3ZtX3Bvd2VyX2NsaV9ndWVzdC5jCisrKysgYi9leGFtcGxlcy92bV9w
b3dlcl9tYW5hZ2VyL2d1ZXN0X2NsaS92bV9wb3dlcl9jbGlfZ3Vlc3QuYworQEAgLTYsNiArNiw3
IEBACisgI2luY2x1ZGUgPHN0ZGludC5oPgorICNpbmNsdWRlIDxzdHJpbmcuaD4KKyAjaW5jbHVk
ZSA8c3RkaW8uaD4KKysjaW5jbHVkZSA8c3RkbGliLmg+CisgI2luY2x1ZGUgPHRlcm1pb3MuaD4K
KyAKKyAjaW5jbHVkZSA8Y21kbGluZV9yZGxpbmUuaD4KKy0tIAorMi41NS4wCisKLS0gCjIuNTUu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
