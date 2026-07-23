Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FD7C531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E9681097;
	Thu, 23 Jul 2026 19:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts3nqlmGRl9e; Thu, 23 Jul 2026 19:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB8381062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784833866;
	bh=voKDNjfFWoX0H41PcaNMvBez9wuXevnA+43QD+3uQDs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FsKn8L69lDN4Yhb6G+qzDXB8Kn/+KypoQVeYeCJmONEDMyppD2dT+PqHB7c3QMyEs
	 hrixPp3Fv1KTAGLNaRnVIe5kyx3Kbmxz4gxczW3J4MQzCS/7mUfQcGmBirQU8j+flw
	 p7ah0PKiDSjV5l31ouQLW+qwsBglRIfpN35BNIuCULjzE9hRJWIPvp+DzKbLoRZPl/
	 u1FbDVy4dyrtDUEH1qvHoRYKg9ZDDzz+n/B9hnDpz4TG4Yb7ifG0M9LD+Tb0kA1ZBo
	 /2adu8HNAv85uUffBwr3/SUw3dOwIaYNuqyDvZXvmYHsGsYhYHNSu31Jin7VU1Se22
	 tGeMj6VRR47JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB8381062;
	Thu, 23 Jul 2026 19:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B5BDA47
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F7880FB0
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT-ZeqGous9i for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 19:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A553D80F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A553D80F8B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A553D80F8B
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:11:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0aa1.dip0.t-ipconnect.de [91.58.10.161])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6ED38A4C4016;
 Thu, 23 Jul 2026 21:11:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53694)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmyou-00000000563-2DVn;
 Thu, 23 Jul 2026 19:11:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 21:10:59 +0200
Message-ID: <20260723191100.1458571-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784833860;
 bh=SUFOPps35JNvMCp8NB5pMp7KpHWqSrqUIXYW6YcRKH4=;
 h=From:To:Cc:Subject:Date:From;
 b=tNjBXu6AoF6AQ6j8MC4Sn/ljV30Xzy1jXAhdL1jdM2WWU3aiNhcbjtecw01csUSQ3
 bKw/UIfgc6DTivUJRNje6fsdH6B2IIBbdWALFYL/5ZDwz0ahPkRziWBqM49rXu0SPr
 54pXEwxmH6N1PRtaPdkvwwD9p9m6p/7OnL6slqJIG6EB2X90g2yN/L9pni9panB8Cg
 W9EOlYwDQXDLc0SQlswJ1dGuETHN6oJNU61j9pQW4fMhf6MpwctgxJ+/WDEE5hxaG5
 OAzU7lPWm0J1L80f/lKkhkzhql6tyGZDsuEF1/7qR50ngyLoEpx7Ctgjd60qq9JVgB
 3ic+A3ICRe16Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tNjBXu6A
Subject: [Buildroot] [PATCH 1/1] package/dropbear: bump version to 2026.94
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

aHR0cHM6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvQ0hBTkdFUwoKUmVtb3ZlZCBwYXRjaCwg
dGhlIGJ1aWxkIGVycm9yIHdhcyBmaXhlZCB1cHN0cmVhbSBieQpodHRwczovL2dpdGh1Yi5jb20v
bWtqL2Ryb3BiZWFyL3B1bGwvNDc1CgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy83ODU4OWJkYjA0ODczMWI3YzcxN2Y4YWM3MTgx
OTM4ZmNmNzlhNTc2CmFmdGVyIGluY2x1ZGluZwpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYwNjA3MTMwMjE5LjEzNTAxMjgtOC1qZWFubWlj
aGVsLmhhdXRib2lzQHlvc2VsaS5vcmcvCnRvIGZpeCBhbiBvbGQgbTY4ayBidWlsZCBlcnJvci4K
CiAuLi4vMDAwMS1zY3AtZml4LWJ1aWxkLXdpdGgtZ2NjLTE0LngucGF0Y2ggICAgfCA0MCAtLS0t
LS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLmhhc2ggICAgICAgICAg
ICAgICAgfCAgMiArLQogcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5tayAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlv
bnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Ryb3BiZWFyLzAwMDEtc2NwLWZpeC1i
dWlsZC13aXRoLWdjYy0xNC54LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kcm9wYmVhci8w
MDAxLXNjcC1maXgtYnVpbGQtd2l0aC1nY2MtMTQueC5wYXRjaCBiL3BhY2thZ2UvZHJvcGJlYXIv
MDAwMS1zY3AtZml4LWJ1aWxkLXdpdGgtZ2NjLTE0LngucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDBjMmI1Y2JkYjUuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9kcm9wYmVh
ci8wMDAxLXNjcC1maXgtYnVpbGQtd2l0aC1nY2MtMTQueC5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDQwICswLDAgQEAKLUZyb20gMGM2NzM3MjI1NzU3NWY2ZWM1OTM2NGFiYTVjYTU3OWMxMjZi
NzY3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFZveGVsIDx2b3hlbEBhbmRyZWV2
Lm1zay5ydT4KLURhdGU6IFR1ZSwgMjEgSnVsIDIwMjYgMTk6Mjg6MDAgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSF0gc2NwOiBmaXggYnVpbGQgd2l0aCBnY2MgPj0gMTQueAotTUlNRS1WZXJzaW9uOiAx
LjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAotCi1GaXhlcyBidWlsZCBlcnJvcnMgc2VlbiB3aXRoIGdjYyAx
NC54OgotCi1zcmMvc2NwLmM6IEluIGZ1bmN0aW9uIOKAmHNpbmvigJk6Ci1zcmMvc2NwLmM6MTIx
NDozMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGFzY2lpX2lz
ZGlnaXTigJkKLSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLQotc3JjL3NjcC5j
OiBJbiBmdW5jdGlvbiDigJhva25hbWXigJk6Ci1zcmMvc2NwLmM6MTUwMToyMjogZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGFzY2lpX2lzYWxwaGHigJkKLSBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLQotVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ta2ovZHJvcGJlYXIvcHVsbC80NzQKLQotU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMg
PGJlcm5kQGt1aGxzLm5ldD4KLS0tLQotIHNyYy9zY3AuYyB8IDEgKwotIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL3NjcC5jIGIvc3JjL3NjcC5jCi1p
bmRleCBkNzI2NmZkZC4uNjMzYjRkYmEgMTAwNjQ0Ci0tLS0gYS9zcmMvc2NwLmMKLSsrKyBiL3Ny
Yy9zY3AuYwotQEAgLTgxLDYgKzgxLDcgQEAKLSAjaW5jbHVkZSAiY29tcGF0LmgiCi0gI2luY2x1
ZGUgInNjcG1pc2MuaCIKLSAjaW5jbHVkZSAicHJvZ3Jlc3NtZXRlci5oIgotKyNpbmNsdWRlICJk
YnV0aWwuaCIKLSAKLSB2b2lkIGJ3bGltaXQoaW50KTsKLSAKLS0tIAotMi40Ny4zCi0KZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIuaGFzaCBiL3BhY2thZ2UvZHJvcGJlYXIv
ZHJvcGJlYXIuaGFzaAppbmRleCAyNTM4MTMyNDYzLi4zYzQ4ZGZlOTU4IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLmhhc2gKKysrIGIvcGFja2FnZS9kcm9wYmVhci9kcm9w
YmVhci5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBGcm9tIGh0dHBzOi8vbWF0dC51Y2MuYXNuLmF1
L2Ryb3BiZWFyL3JlbGVhc2VzL1NIQTI1NlNVTS5hc2MKLXNoYTI1NiAgMzEwYTYwODc5NTI4OTdj
MTgyZWZiZTE2MDg4ZmEwYzRkMDdjNDY3ZTg1MGEyMjY5OTQ3MjEzNzI3OGZhYmYwOSAgZHJvcGJl
YXItMjAyNi45My50YXIuYnoyCitzaGEyNTYgIGUwOTgwMzRhODQzNjk5MjAwYzhjOTc3YTk5MWZm
ZjczMTU5NzM1YmY3OTVkNWY3MmVmNjcyYzQxYTZiMWFlODEgIGRyb3BiZWFyLTIwMjYuOTQudGFy
LmJ6MgogCiAjIExpY2Vuc2UgZmlsZSwgbG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICBhOTljZTY1
N2Q3OTBiNzYxYzEzMmVlN2UwZGUxOGVkYjQzN2FlNjM2MWU1MzZkOTkxYzZhMTJmMzZlNzcwNDQ1
ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rIGIvcGFj
a2FnZS9kcm9wYmVhci9kcm9wYmVhci5tawppbmRleCBlODhkMWRiZGYxLi45MGEwNDJiNjhiIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rCisrKyBiL3BhY2thZ2UvZHJv
cGJlYXIvZHJvcGJlYXIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1EUk9QQkVBUl9WRVJTSU9OID0gMjAyNi45MworRFJPUEJFQVJfVkVSU0lPTiA9IDIw
MjYuOTQKIERST1BCRUFSX1NJVEUgPSBodHRwczovL21hdHQudWNjLmFzbi5hdS9kcm9wYmVhci9y
ZWxlYXNlcwogRFJPUEJFQVJfU09VUkNFID0gZHJvcGJlYXItJChEUk9QQkVBUl9WRVJTSU9OKS50
YXIuYnoyCiBEUk9QQkVBUl9MSUNFTlNFID0gTUlULCBCU0QtMi1DbGF1c2UsIFB1YmxpYyBkb21h
aW4KLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
