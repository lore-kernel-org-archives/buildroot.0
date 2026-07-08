Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC635C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6580E40D0A;
	Wed,  8 Jul 2026 19:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUR1OdrZiDPx; Wed,  8 Jul 2026 19:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D73BB40CB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783540443;
	bh=rSCsKyiI/L7ri/jLeMBentySg146CtzjtcQMiZCYsQE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J/j0HVAoOpYZCsovgcIWtkrMLZTMfrj++9NM/F9U1dkH1RmwfB5pxP6Nrj+ry68Ih
	 ScBGW1Jf4j5gWXm/tuV6JZ7LyyKJjwHyfZtobzitiYxuyyMWdjSMhkTWAuG2EJ5x54
	 rugN+Rb648oPCgxTwzN+UlwdPZHaXllhXOm8BHdUW69T4VeDraO8FfkctqL9boQA5O
	 mDDvo+Cfnxx+E9COoSVaC6jgg9eWSJyVv6oUpYQhptFOch07dGjtvldD3D5ku6Aye2
	 6xoaDUocyn1/V4qSuaA2iY/GGHjp+3RXm93SKQ1Ex7NtjKo/Z29ggJG6MwMSXzf9Uk
	 HH6bG07uSeWDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D73BB40CB4;
	Wed,  8 Jul 2026 19:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD4D315
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 987C660811
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWjtyTeW3WPT for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 19:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92517605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92517605E3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92517605E3
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:54:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a01.dip0.t-ipconnect.de [91.58.10.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A75B8A4C1A3B;
 Wed,  8 Jul 2026 21:53:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39872)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whYLG-000000007I4-1BY5;
 Wed, 08 Jul 2026 19:53:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Jul 2026 21:53:57 +0200
Message-ID: <20260708195358.1653881-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783540438;
 bh=kxRagTMjjTViAzoy7ll+bUceoXswdtnlSgdKCo9mogI=;
 h=From:To:Cc:Subject:Date:From;
 b=SIMPq0/smrJKyWTvtBvN3UPTMa1e90+3uk2o/e2Qd3XWnQ6KVcmbpphAKysUfnwn9
 BU79TgdXb+yqGQ7PwXmIatZyRK1jS6tECix5SmI0Gl/d2asVUY120mdpvYgXLNzNYg
 /t5r4I5TPRYMwHBWri7+OHIuNf8v5WbNFd8OWJnfjKGpw5MATywn3VIYYVFbac5+60
 TdjLyfAqvk4mqJb/1VylAMfQMWytvbmh9BTnOsUWjxbIdopT2OVWJ8G2PjdO8PDCam
 E5QHXSYOmx+nxiV6EcPg5yg9R4/v36U6Bu7VlAutkF79gRqZArs/Vu69xTZrO3XuNH
 MZc5P8XaEQLVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SIMPq0/s
Subject: [Buildroot] [PATCH 1/1] package/dracut: bump version to 111
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
Cc: Thierry Bultel <tbultel@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9naXRodWIuY29tL2RyYWN1dC1uZy9kcmFjdXQvYmxvYi8xMTEvTkVXUy5tZAoKUmVt
b3ZlZCBwYXRjaCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5lIHBh
c3NlZDoKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzFmZGI2
NjU1NzU3Mjc0MTcyNGYzMTNlZDc0NDRkMDk3NWI5YWYwNjQKCiAuLi5ldmVudC1maW5kX2JpbmFy
eS1mcm9tLWRyb3BwaW5nLWxhc3QucGF0Y2ggfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNr
YWdlL2RyYWN1dC9kcmFjdXQuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2Fn
ZS9kcmFjdXQvZHJhY3V0Lm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2RyYWN1dC8wMDAxLWZpeC1mdW5jdGlvbnMtcHJldmVudC1maW5kX2JpbmFy
eS1mcm9tLWRyb3BwaW5nLWxhc3QucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RyYWN1dC8w
MDAxLWZpeC1mdW5jdGlvbnMtcHJldmVudC1maW5kX2JpbmFyeS1mcm9tLWRyb3BwaW5nLWxhc3Qu
cGF0Y2ggYi9wYWNrYWdlL2RyYWN1dC8wMDAxLWZpeC1mdW5jdGlvbnMtcHJldmVudC1maW5kX2Jp
bmFyeS1mcm9tLWRyb3BwaW5nLWxhc3QucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IGFkMzEyZDBiODUuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9kcmFjdXQvMDAwMS1maXgt
ZnVuY3Rpb25zLXByZXZlbnQtZmluZF9iaW5hcnktZnJvbS1kcm9wcGluZy1sYXN0LnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNDUgKzAsMCBAQAotRnJvbSA5NGM0Mjc0ZTMyNDY3MjM1ZmI1ODBh
MjdlYTE4MjE2OWYyNTNjYTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYt
OD9xP01hdD1DMz1BOW89MjBQb3Vycmllcj89IDxtYXRlby5wb3VycmllckBzbWlsZS5mcj4KLURh
dGU6IFR1ZSwgMjggQXByIDIwMjYgMTc6MjM6MjMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gZml4
KGZ1bmN0aW9ucyk6IHByZXZlbnQgZmluZF9iaW5hcnkgZnJvbSBkcm9wcGluZyBsYXN0IFBBVEgK
LSBlbGVtZW50Ci1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLVdoZW4gYHJl
YWRgIGVuY291bnRlcnMgRU9GIGJlZm9yZSB0aGUgZGVsaW1pdGVyLCBpdCByZXR1cm5zIGEgbm9u
LXplcm8KLWV4aXQgc3RhdHVzLCBjYXVzaW5nIHRoZSB3aGlsZSBsb29wIHRvIHRlcm1pbmF0ZSBp
bW1lZGlhdGVseS4gQXMgYSByZXN1bHQsCi1pZiB0aGUgUEFUSCBzdHJpbmcgZG9lc24ndCBlbmQg
d2l0aCBhIGNvbG9uLCB0aGUgdmVyeSBsYXN0IGRpcmVjdG9yeSBpbgotUEFUSCBpcyBpZ25vcmVk
IGJ5IGZpbmRfYmluYXJ5KCkuCi0KLVRoaXMgY2F1c2VkIHJlZ3Jlc3Npb25zIG9uIHNwbGl0LXVz
ciBhcmNoaXRlY3R1cmVzIHdoZXJlIGNyaXRpY2FsCi1iaW5hcmllcyByZXNpZGUgZXhjbHVzaXZl
bHkgaW4gL2JpbiwgYW5kIC9iaW4gaGFwcGVucyB0byBiZQotYXBwZW5kZWQgYXQgdGhlIHZlcnkg
ZW5kIG9mIHRoZSBQQVRIIGJ5IGRyYWN1dC5zaC4KLQotQXBwZW5kaW5nIGEgdmlydHVhbCBjb2xv
biB0byB0aGUgSGVyZS1TdHJpbmcgZW5zdXJlcyB0aGUgbG9vcCBwcm9jZXNzZXMKLWFsbCBkaXJl
Y3RvcmllcyBjb3JyZWN0bHkuCi0KLUZpeGVzIGRyYWN1dC1uZyBpc3N1ZSAjMTQ2NyA6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9kcmFjdXQtbmcvZHJhY3V0LW5nL2lzc3Vlcy8xNDY3Ci0KLVVwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vZHJhY3V0LW5nL2RyYWN1dC1uZy9wdWxsLzI0MTYKLVNpZ25l
ZC1vZmYtYnk6IE1hdMOpbyBQb3VycmllciA8bWF0ZW8ucG91cnJpZXJAc21pbGUuZnI+Ci0tLS0K
LSBkcmFjdXQtZnVuY3Rpb25zLnNoIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZHJhY3V0LWZ1bmN0aW9ucy5zaCBi
L2RyYWN1dC1mdW5jdGlvbnMuc2gKLWluZGV4IGY0MzBhMjhlLi41MDQ2ZjQ1ZSAxMDA3NTUKLS0t
LSBhL2RyYWN1dC1mdW5jdGlvbnMuc2gKLSsrKyBiL2RyYWN1dC1mdW5jdGlvbnMuc2gKLUBAIC05
NCw3ICs5NCw3IEBAIGZpbmRfYmluYXJ5KCkgewotICAgICAgICAgICAgIHByaW50ZiAiJXNcbiIg
IiR7X3BhdGh9IgotICAgICAgICAgICAgIHJldHVybiAwCi0gICAgICAgICBmaQotLSAgICBkb25l
IDw8PCAiJFBBVEgiCi0rICAgIGRvbmUgPDw8ICIke1BBVEh9OiIKLSAKLSAgICAgW1sgLW4gJHtk
cmFjdXRzeXNyb290ZGlyLX0gXV0gJiYgcmV0dXJuIDEKLSAgICAgdHlwZSAtUCAiJHsxIyMqL30i
Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RyYWN1dC9kcmFjdXQuaGFzaCBi
L3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5oYXNoCmluZGV4IDMyODhlZDZhZDQuLjFiNWIzZGNlNTUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5oYXNoCisrKyBiL3BhY2thZ2UvZHJh
Y3V0L2RyYWN1dC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEy
NTYgIDBkMzU3ODUzZjhjZjIzNzFkODlhOGViY2JiYjFmZDJjMWM4NWE3OWQ4ODY2OTI1ZmQ3Mzg1
ZWFlYjIwYTI3ZGMgIGRyYWN1dC0xMTAudGFyLmd6CitzaGEyNTYgIGNhOTQ5MTkwNjkyZTkxNjEx
ZWYxNmVhMzY0MmMwZjc2NGY2Mzk0ODg2MGYzZjc0MjUyNDMxMDcyOGM5OTE0OTMgIGRyYWN1dC0x
MTEudGFyLmd6CiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFm
YjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZHJhY3V0L2RyYWN1dC5tayBiL3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5tawppbmRleCBiNDBmNjE4
ZmU4Li4zYTFjMTU2N2U4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2RyYWN1dC9kcmFjdXQubWsKKysr
IGIvcGFja2FnZS9kcmFjdXQvZHJhY3V0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotRFJBQ1VUX1ZFUlNJT04gPSAxMTAKK0RSQUNVVF9WRVJTSU9OID0g
MTExCiBEUkFDVVRfU0lURSA9ICQoY2FsbCBnaXRodWIsZHJhY3V0LW5nLGRyYWN1dC1uZywkKERS
QUNVVF9WRVJTSU9OKSkKIERSQUNVVF9MSUNFTlNFID0gR1BMLTIuMAogRFJBQ1VUX0xJQ0VOU0Vf
RklMRVMgPSBDT1BZSU5HCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
