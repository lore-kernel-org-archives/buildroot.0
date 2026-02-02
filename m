Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77162E73165
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C9940BAA;
	Mon,  2 Feb 2026 19:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N043r8yL1HmI; Mon,  2 Feb 2026 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A3940B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770060662;
	bh=v2MQQFpzjyEXBwBYq3FR556BPRvVXFxLualoued1jP8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JcHWOpAyt92tJR/KGxM235wDQ3GTOh/1e5HqCUFYERr9gG+I0O9hgzw15JmqJ3U/m
	 Vk19O++eSV7K5BsCxuVBZ9rL9qcNsxIuFJwgWu8+QwEtHmCJXyUYRyuHL3LzmwrGUK
	 BOBkovUUGtr/v4dYVNDjnuq7FNA0hU1J0ffaAPAUn0CipYw+uzL9qM6iAUoKhFGjtt
	 +TEhPlJr2HkttyELxmCAF0gjoeF02uWXOItF6nYD1oOBmKF10G1CucF8FQxsC8GXta
	 KINgjY5rBpisHhXF1Ze9pO+Q2QGCSW12mW89EVPEEK6kLzR2fbEJiGVZJq8qArJm73
	 JxPyye4DUJGPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A3940B7D;
	Mon,  2 Feb 2026 19:31:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D42A149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 19:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF3A40B71
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 19:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7_IbdHxHGRC for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 19:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D5F740B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D5F740B6E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D5F740B6E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 19:30:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1522FA4C5320
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 20:30:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38074)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmzdN-0000000013a-3qec
 for buildroot@buildroot.org; Mon, 02 Feb 2026 19:30:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Feb 2026 20:30:52 +0100
Message-ID: <20260202193053.173059-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770060654;
 bh=xnYyPc8xdtc2BTsFuVW6bQHKgJholNJWltDbPSykzhY=;
 h=From:To:Subject:Date:From;
 b=Y4tsg9cg8UsfYaDhbyFt86ZkSyC5l/dH6LQDefZ+z/hrAOn1tq80+kXojSNum3wjA
 9iCVLri+1yCKvh6VpT8PCKtAQJVcT+BoR4wmHXW8Bl3ta7vDV1OiHzeulBJRn1yqii
 c4DZAqCjvYKWEp3Q3LvgtvRIhvt+lNkbmxat01yqPgeUkG707IS92WsLgdilKRrKf9
 8yo+pZNzz9ZI6v1r+CkfXC5xHgmk804SIHuI8qfvZQHtd65M12KT91vUSbxfJ7g6wJ
 OOceWSPY4haSlz+/XxzYPJpS/GQESMpUGqFhT6U3g+hdn+GKCV9pACoiHP4082Fq3X
 fefYg8O92iEgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y4tsg9cg
Subject: [Buildroot] [PATCH 1/1] package/hddtemp: bump version to 0.4.4
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

aHR0cHM6Ly9naXRodWIuY29tL3ZpdGxhdi9oZGR0ZW1wL3JlbGVhc2VzL3RhZy92MC40LjQKClJl
bW92ZWQgcGF0Y2ggd2hpY2ggaXMgaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNlLgoKU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi4vaGRkdGVtcC8wMDAx
LWZpeC1idWlsZC13aXRob3V0LW5scy5wYXRjaCAgfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBw
YWNrYWdlL2hkZHRlbXAvaGRkdGVtcC5oYXNoICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFj
a2FnZS9oZGR0ZW1wL2hkZHRlbXAubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2hkZHRlbXAvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1ubHMucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2hkZHRlbXAvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1ubHMu
cGF0Y2ggYi9wYWNrYWdlL2hkZHRlbXAvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1ubHMucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDM1NmI5NGIwMTAuLjAwMDAwMDAwMDAKLS0t
IGEvcGFja2FnZS9oZGR0ZW1wLzAwMDEtZml4LWJ1aWxkLXdpdGhvdXQtbmxzLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRnJvbSBjOWQwZDI0OWZmMDEzZDMzY2YxZmQ1YTU4
NmMxNmVlMzAwOTVjYzkwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTmljb2xhcyBQ
QVJMQU5UIDxuaWNvbGFzLnBhcmxhbnRAcGFyaHVldC5mcj4KLURhdGU6IEZyaSwgMTQgRmViIDIw
MjUgMTA6MDg6NDMgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gZml4IGJ1aWxkIHdpdGhvdXQgbmxz
Ci1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLT4gaGRkdGVtcC5jOiBJbiBm
dW5jdGlvbiDigJhtYWlu4oCZOgotPiBoZGR0ZW1wLmM6Mjc0OjM6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiaW5kdGV4dGRvbWFpbuKAmSBbLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KLT4gICAyNzQgfCAgIGJpbmR0ZXh0ZG9tYWluIChQQUNLQUdF
LCBMT0NBTEVESVIpOwotPiAgICAgICB8ICAgXn5+fn5+fn5+fn5+fn4KLT4gaGRkdGVtcC5jOjI3
NTozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdGV4dGRvbWFp
buKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLT4gICAyNzUgfCAgIHRleHRk
b21haW4gKFBBQ0tBR0UpOwotPiAgICAgICB8ICAgXn5+fn5+fn5+fgotPiBtYWtlWzJdOiAqKiog
W01ha2VmaWxlOjQ5NjogaGRkdGVtcC1oZGR0ZW1wLm9dIEVycm9yIDEKLQotVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS92aXRsYXYvaGRkdGVtcC9wdWxsLzE2Ci0KLVNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLS0KLSBzcmMvaGRkdGVtcC5jIHwgMiAr
KwotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3NyYy9o
ZGR0ZW1wLmMgYi9zcmMvaGRkdGVtcC5jCi1pbmRleCA2NGQwMDBlLi5iZmVhNTU2IDEwMDY0NAot
LS0tIGEvc3JjL2hkZHRlbXAuYwotKysrIGIvc3JjL2hkZHRlbXAuYwotQEAgLTI3MCw5ICsyNzAs
MTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIqIGFyZ3ZbXSkgewotICAgYmFja3RyYWNlX3Np
Z2lsbCgpOwotICAgYmFja3RyYWNlX3NpZ2J1cygpOwotIAotKyNpZiBFTkFCTEVfTkxTCi0gICBz
ZXRsb2NhbGUgKExDX0FMTCwgIiIpOwotICAgYmluZHRleHRkb21haW4gKFBBQ0tBR0UsIExPQ0FM
RURJUik7Ci0gICB0ZXh0ZG9tYWluIChQQUNLQUdFKTsKLSsjZW5kaWYKLSAKLSAgIHNob3dfZGIg
PSBkZWJ1ZyA9IG51bWVyaWMgPSBxdWlldCA9IHdha2V1cCA9IGFmX2hpbnQgPSBzeXNsb2dfaW50
ZXJ2YWwgPSBmb3JlZ3JvdW5kID0gMDsKLSAgIHVuaXQgPSBERUZBVUxUOwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9oZGR0ZW1wL2hkZHRlbXAuaGFzaCBiL3BhY2thZ2UvaGRkdGVtcC9oZGR0ZW1wLmhh
c2gKaW5kZXggY2Q4MmQ3Zjg5Yi4uMDM0OGEwNTk5MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9oZGR0
ZW1wL2hkZHRlbXAuaGFzaAorKysgYi9wYWNrYWdlL2hkZHRlbXAvaGRkdGVtcC5oYXNoCkBAIC0x
LDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNTkyMzIyYzY0ZjBkNWYw
MzUxMzIyNDllM2QwNTFiNzUyZjVkMjQ4Njc1MTQ1MjJhMTcyODVkNWU3MmQyMTA3NSAgaGRkdGVt
cC0wLjQuMy50YXIuZ3oKK3NoYTI1NiAgZTRhNjAyMjNmZGVjNWFkY2JmNGNmNmQyZmU1YzRhNWMy
ZWVmMjU2YzdiODlmOGRlYWIwZTkyMWExZjYzMWRhYSAgaGRkdGVtcC0wLjQuNC50YXIuZ3oKIHNo
YTI1NiAgZTZkNmEwMDk1MDVlMzQ1ZmU5NDllMTMxMDMzNGZjYjA3NDdmMjhkYWUyODU2NzU5ZGUx
MDJhYjY2YjcyMmNiNCAgR1BMLTIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaGRkdGVtcC9oZGR0ZW1w
Lm1rIGIvcGFja2FnZS9oZGR0ZW1wL2hkZHRlbXAubWsKaW5kZXggNDJkY2IzZDQxNi4uNTZjMDQz
MzFjNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9oZGR0ZW1wL2hkZHRlbXAubWsKKysrIGIvcGFja2Fn
ZS9oZGR0ZW1wL2hkZHRlbXAubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1IRERURU1QX1ZFUlNJT04gPSAwLjQuMworSEREVEVNUF9WRVJTSU9OID0gMC40
LjQKIEhERFRFTVBfU0lURSA9ICQoY2FsbCBnaXRodWIsdml0bGF2LGhkZHRlbXAsdiQoSEREVEVN
UF9WRVJTSU9OKSkKIEhERFRFTVBfTElDRU5TRSA9IEdQTHYyCiBIRERURU1QX0xJQ0VOU0VfRklM
RVMgPSBHUEwtMgotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
