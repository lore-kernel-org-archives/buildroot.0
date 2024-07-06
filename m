Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D34C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 10:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46E95400F8;
	Sat,  6 Jul 2024 10:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWtMwRcihsb1; Sat,  6 Jul 2024 10:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F5A40124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F5A40124;
	Sat,  6 Jul 2024 10:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9421BF2F3
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AF3E6084B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUA1qRa0Qemb for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 10:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12D1F6083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12D1F6083E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12D1F6083E
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 10:23:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6c1.dip0.t-ipconnect.de [79.214.198.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A7B2A4C0D5C
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 12:23:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32952)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sQ2Ze-000000002ET-2Z3r
 for buildroot@buildroot.org; Sat, 06 Jul 2024 10:23:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 12:23:20 +0200
Message-Id: <20240706102322.3127779-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720261402;
 bh=EhBUMpHABSG/V6cfhCkKnLRquKGeCNr0vLnJq6cXx8g=;
 h=From:To:Subject:Date:From;
 b=Iq4zH5rlfukxduYz7Yg03EKgvHSMKUrJX1GEUQSSv5z/5/oqeJmYyQp45uxPJ/XNs
 5C0bbqqMOMRQ4g9bY6GUCvNguk4rjsmBt2xUTsPib/2/Wq6kWcE+Wum5xqj+qib9TR
 sRkMxIbdAf3Pb1NHal69qdZn5/yv6WxbxzKMpf/iAxm4TnkrJ5t7xg25c9pNZbEq2O
 Lf0jo6ycijgHjSk2e30PXdzZyziwMqiPnrMj05edYogHVL5EmCrw+a/qQN60jFc0Dy
 hZml2jcPqncysAuCc2gEPvnZJs2kRZB26DLDefRztPLzoIhdliiJsEObjudcie6i7W
 YtSAUNVy8pRgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Iq4zH5rl
Subject: [Buildroot] [PATCH 1/3] package/libdisplay-info: bump version to
 0.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

UmVtb3ZlZCBwYXRjaCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuClVzZSB4eiB0
YXJiYWxsIGFuZCBpdHMgc2hhMjU2IGhhc2gsIGJvdGggcHJvdmlkZWQgYnkgdXBzdHJlYW0uCgpT
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIC4uLjAwMDEt
ZGlzcGxheWlkLmMtSW5jbHVkZS1zeXMtdHlwZXMuaC5wYXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIHBhY2thZ2UvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mby5oYXNoICB8ICAz
ICstCiBwYWNrYWdlL2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm8ubWsgICAgfCAgNiAr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJkaXNwbGF5LWluZm8vMDAwMS1kaXNwbGF5aWQu
Yy1JbmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkaXNw
bGF5LWluZm8vMDAwMS1kaXNwbGF5aWQuYy1JbmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoIGIvcGFj
a2FnZS9saWJkaXNwbGF5LWluZm8vMDAwMS1kaXNwbGF5aWQuYy1JbmNsdWRlLXN5cy10eXBlcy5o
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzZmE1N2VlMTBkLi4wMDAwMDAw
MDAwCi0tLSBhL3BhY2thZ2UvbGliZGlzcGxheS1pbmZvLzAwMDEtZGlzcGxheWlkLmMtSW5jbHVk
ZS1zeXMtdHlwZXMuaC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM2ICswLDAgQEAKLUZyb20g
NjQ4YzFjYjY2YjU3MWIwMzc5NzZiNjEzNjM2NTRmMzk0NDhmNWZhYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci1EYXRlOiBTdW4s
IDcgTWF5IDIwMjMgMTQ6MTQ6NDggKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gZGlzcGxheWlkLmM6
IEluY2x1ZGUgc3lzL3R5cGVzLmgKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRl
eHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQK
LQotRml4ZXMgYnVpbGQgZXJyb3IKLS4uL2Rpc3BsYXlpZC5jOjM3NzoxMDogZXJyb3I6IOKAmHNz
aXplX3TigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYc2l6ZV904oCZPwotCi1zZWVuIHdpdGg6Ci1hcmMtbGludXgtZ2NjLmJyX3JlYWwg
KEJ1aWxkcm9vdCAyMDIxLjExLTQ0MjgtZzZiNjc0MWIpIDEwLjIuMAotCi1VcHN0cmVhbTogaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9uL2xpYmRpc3BsYXktaW5mby8tL2Nv
bW1pdC81Yzk4MDFhNzVmMjgxNTc5MGFkMWVkNTUwMGNlYzI3MjhhMzZjNmVjCi0KLVNpZ25lZC1v
ZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLS0KLSBkaXNwbGF5aWQuYyB8
IDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvZGlz
cGxheWlkLmMgYi9kaXNwbGF5aWQuYwotaW5kZXggMzk4NzcyYi4uZjE3NDljNiAxMDA2NDQKLS0t
LSBhL2Rpc3BsYXlpZC5jCi0rKysgYi9kaXNwbGF5aWQuYwotQEAgLTMsNiArMyw3IEBACi0gI2lu
Y2x1ZGUgPGludHR5cGVzLmg+Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgotICNpbmNsdWRlIDxzdHJp
bmcuaD4KLSsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0gCi0gI2luY2x1ZGUgImJpdHMuaCIKLSAj
aW5jbHVkZSAiZGlzcGxheWlkLmgiCi0tLSAKLTIuMzkuMgotCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm8uaGFzaCBiL3BhY2thZ2UvbGliZGlzcGxh
eS1pbmZvL2xpYmRpc3BsYXktaW5mby5oYXNoCmluZGV4IGEwODI5NDc5YTguLmNjOTNhMGNmMzIg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mby5oYXNo
CisrKyBiL3BhY2thZ2UvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mby5oYXNoCkBAIC0x
LDMgKzEsNCBAQAorIyBGcm9tIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9lbWVyc2lv
bi9saWJkaXNwbGF5LWluZm8vLS9yZWxlYXNlcy8wLjIuMC9kb3dubG9hZHMvbGliZGlzcGxheS1p
bmZvLTAuMi4wLnRhci54ei5zaGEyNTZzdW0KK3NoYTI1NiAgNWEyZjAwMmExNmY0MmRkMzU0MGM4
ODQ2ZjgwYTkwYjhmNGJkY2QwNjdhOTRiOWQyMDg3YmMyZmVhZTk3NDE3NiAgbGliZGlzcGxheS1p
bmZvLTAuMi4wLnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDUxY2RiMDM2Mjg4
MmNhMmFmNjI1MzJhYjRkOTVlNjBkODFlOTg5MGIzMzkyNjQ3MTlmZDU1ZjhlMzk0NWQ2OTUgIGxp
YmRpc3BsYXktaW5mby0wLjEuMS50YXIuYnoyCiBzaGEyNTYgIDE1YjM5NjI0NGU1ODgzMGM1NjE0
YjkzOTRmNGRlY2NmZTY4NDk3MGNkNTA3ZjI5OTM4M2FiNTdhZDMzOWVlZGQgIExJQ0VOU0UKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mby5tayBiL3Bh
Y2thZ2UvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mby5tawppbmRleCAyNmE2YTlhNGQ5
Li5iODg0NjM4NDllIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmRpc3BsYXktaW5mby9saWJkaXNw
bGF5LWluZm8ubWsKKysrIGIvcGFja2FnZS9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZv
Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCRElT
UExBWV9JTkZPX1ZFUlNJT04gPSAwLjEuMQotTElCRElTUExBWV9JTkZPX1NPVVJDRSA9IGxpYmRp
c3BsYXktaW5mby0kKExJQkRJU1BMQVlfSU5GT19WRVJTSU9OKS50YXIuYnoyCi1MSUJESVNQTEFZ
X0lORk9fU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9lbWVyc2lvbi9saWJk
aXNwbGF5LWluZm8vLS9hcmNoaXZlLyQoTElCRElTUExBWV9JTkZPX1ZFUlNJT04pCitMSUJESVNQ
TEFZX0lORk9fVkVSU0lPTiA9IDAuMi4wCitMSUJESVNQTEFZX0lORk9fU09VUkNFID0gbGliZGlz
cGxheS1pbmZvLSQoTElCRElTUExBWV9JTkZPX1ZFUlNJT04pLnRhci54egorTElCRElTUExBWV9J
TkZPX1NJVEUgPSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1lcnNpb24vbGliZGlz
cGxheS1pbmZvLy0vcmVsZWFzZXMvJChMSUJESVNQTEFZX0lORk9fVkVSU0lPTikvZG93bmxvYWRz
CiBMSUJESVNQTEFZX0lORk9fTElDRU5TRSA9IE1JVAogTElCRElTUExBWV9JTkZPX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCiBMSUJESVNQTEFZX0lORk9fSU5TVEFMTF9TVEFHSU5HID0gWUVTCi0t
IAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
