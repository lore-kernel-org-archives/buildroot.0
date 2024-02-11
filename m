Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447E0C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF5F404D8;
	Sun, 11 Feb 2024 17:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofpOJs2flyhJ; Sun, 11 Feb 2024 17:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4B04028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4B04028D;
	Sun, 11 Feb 2024 17:33:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53B271BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4746D40774
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYOZoypu0eKf for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59B3240773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B3240773
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59B3240773
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:33:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF990A4C0686;
 Sun, 11 Feb 2024 18:33:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50022)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZDhj-000000004jX-1bkx;
 Sun, 11 Feb 2024 18:33:23 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:33:23 +0100
Message-Id: <20240211173323.2755976-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707672803;
 bh=wfJby8rYBb0zwpGFreZGIukqIURyx2ohfGsF9JBfXkM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZD6OKiEg+My7ggdAcDUq9nhUxuE4DT5ViU6ZjcTSsz4ZIzaNe0kQXfL4uB8u5Fp0R
 Y8ZCpYrfxDhWdzuKPdmacMRD0O3dazfM7L+25VzaaKnzsuE/euMrqpbIjiIcFZ0gTV
 t8QLKEOK8CYWIjM8JxiTwzoKUPq+MBqNOrHb7V5pRIumvDU36rv67YyRjQumFgOCM4
 8zTQuPQHOlhAoHE09FiKbJTKplL9d7znWc+xmIaBomFPjfbDmNu9Un9wBl5SWXTgLn
 h4sXfJefkw8fJpHl8iY94p7cxJxCfWtAFeFlR91VOs0we9XXb655zF7YgkSoWwIkxY
 jRCGn/Usu8EBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=ZD6OKiEg
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVz
YS1hbm5vdW5jZS8yMDI0LUZlYnJ1YXJ5LzAwMDc0Ny5odG1sCmh0dHBzOi8vY2dpdC5mcmVlZGVz
a3RvcC5vcmcvbWVzYS9tZXNhL3RyZWUvZG9jcy9yZWxub3Rlcy8yNC4wLjAucnN0P2g9MjQuMAoK
UmVtb3ZlZCBwYXRjaCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgpTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvbWVzYTNk
LWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgICAgICB8ICAyICstCiAuLi5lX2Rlc2NyaXB0aW9u
LWZpeC11bmtub3duLWxpbnV4LTMuNS0ucGF0Y2ggfCA2OCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBw
YWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDQgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL21lc2EzZC8wMDA1LXV0aWwtb3Nfc2FtZV9maWxlX2Rlc2NyaXB0aW9u
LWZpeC11bmtub3duLWxpbnV4LTMuNS0ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2Ez
ZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNh
M2QtaGVhZGVycy5tawppbmRleCBiOWIzMjhiMjY4Li4xZDAwNmRiYzkxIDEwMDY0NAotLS0gYS9w
YWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCisrKyBiL3BhY2thZ2UvbWVz
YTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKQEAgLTEyLDcgKzEyLDcgQEAgZW5kaWYKIAog
IyBOb3QgcG9zc2libGUgdG8gZGlyZWN0bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVj
YXVzZSBvZgogIyBmaXJzdC9zZWNvbmQgZXhwYW5zaW9uIHRyaWNrZXJ5Li4uCi1NRVNBM0RfSEVB
REVSU19WRVJTSU9OID0gMjMuMy41CitNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjQuMC4wCiBN
RVNBM0RfSEVBREVSU19TT1VSQ0UgPSBtZXNhLSQoTUVTQTNEX0hFQURFUlNfVkVSU0lPTikudGFy
Lnh6CiBNRVNBM0RfSEVBREVSU19TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKIE1F
U0EzRF9IRUFERVJTX0RMX1NVQkRJUiA9IG1lc2EzZApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNh
M2QvMDAwNS11dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbi1maXgtdW5rbm93bi1saW51eC0z
LjUtLnBhdGNoIGIvcGFja2FnZS9tZXNhM2QvMDAwNS11dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlw
dGlvbi1maXgtdW5rbm93bi1saW51eC0zLjUtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBjMDExNTgwZjZiLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbWVzYTNkLzAwMDUt
dXRpbC1vc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24tZml4LXVua25vd24tbGludXgtMy41LS5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDY4ICswLDAgQEAKLUZyb20gYjYwOTc0ZmFjOGEyZjRjODVj
YmIyY2E3ODhmYzRlYzNlODE5OThmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRo
b21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KLURhdGU6IFR1ZSwgMTcg
QXVnIDIwMjEgMTE6NTQ6NDkgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gdXRpbDogb3Nfc2FtZV9m
aWxlX2Rlc2NyaXB0aW9uOiBmaXggdW5rbm93biBsaW51eCA8IDMuNQotIHN5c2NhbGwgU1lTX2tj
bXAKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotaHR0cHM6Ly9tYW43Lm9y
Zy9saW51eC9tYW4tcGFnZXMvbWFuMi9rY21wLjIuaHRtbAotCi1UaGUga2NtcCgpIHN5c3RlbSBj
YWxsIGZpcnN0IGFwcGVhcmVkIGluIExpbnV4IDMuNS4KLQotQnV0IHdhcyBwcm9iYWJseSBhbHNv
IG5vdCBzdXBwb3J0ZWQgYnkgYWxsIG1ham9yIHBsYXRmb3JtcwotYXQgdGhhdCB0aW1lLiBTbyBm
YWxsYmFjayB0byB0aGUgY2hlY2sgdGhhdCBpcyBkb25lIGZvciB3aW5kb3dzLgotCi1TaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Ci1BY2tl
ZC1ieTogWW9uZ2dhbmcgTHVvIDxsdW95b25nZ2FuZ0BnbWFpbC5jb20+Ci1BY2tlZC1ieTogTWlj
aGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Ci1VcHN0cmVhbTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC8zZWY1MTQ5ODI0NDFjZTQ5NmFh
MTI3NjExZWRkMjZiOTg2N2Y0Yjk1Ci1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRo
b21hc0BkZXZvb2dkdC5jb20+Ci0tLS0KLSBzcmMvdXRpbC9vc19maWxlLmMgfCAxOCArKysrKyst
LS0tLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy91dGlsL29zX2ZpbGUuYyBiL3NyYy91dGlsL29zX2Zp
bGUuYwotaW5kZXggNWZiMzBmMmQ5MDguLjQ2NDQyNWE5Yjg3IDEwMDY0NAotLS0tIGEvc3JjL3V0
aWwvb3NfZmlsZS5jCi0rKysgYi9zcmMvdXRpbC9vc19maWxlLmMKLUBAIC0yMDIsMjkgKzIwMiwy
MyBAQCBvc19yZWFkX2ZpbGUoY29uc3QgY2hhciAqZmlsZW5hbWUsIHNpemVfdCAqc2l6ZSkKLSAv
KiBjb3BpZWQgZnJvbSA8bGludXgva2NtcC5oPiAqLwotICNkZWZpbmUgS0NNUF9GSUxFIDAKLSAK
LSsjZW5kaWYKLSsKLSBpbnQKLSBvc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24oaW50IGZkMSwgaW50
IGZkMikKLSB7Ci0rI2lmZGVmIFNZU19rY21wCi0gICAgcGlkX3QgcGlkID0gZ2V0cGlkKCk7Ci0r
I2VuZGlmCi0gCi0gICAgLyogU2FtZSBmaWxlIGRlc2NyaXB0b3IgdHJpdmlhbGx5IGltcGxpZXMg
c2FtZSBmaWxlIGRlc2NyaXB0aW9uICovCi0gICAgaWYgKGZkMSA9PSBmZDIpCi0gICAgICAgcmV0
dXJuIDA7Ci0gCi0rI2lmZGVmIFNZU19rY21wCi0gICAgcmV0dXJuIHN5c2NhbGwoU1lTX2tjbXAs
IHBpZCwgcGlkLCBLQ01QX0ZJTEUsIGZkMSwgZmQyKTsKLS19Ci0tCi0gI2Vsc2UKLS0KLS1pbnQK
LS1vc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24oaW50IGZkMSwgaW50IGZkMikKLS17Ci0tICAgLyog
U2FtZSBmaWxlIGRlc2NyaXB0b3IgdHJpdmlhbGx5IGltcGxpZXMgc2FtZSBmaWxlIGRlc2NyaXB0
aW9uICovCi0tICAgaWYgKGZkMSA9PSBmZDIpCi0tICAgICAgcmV0dXJuIDA7Ci0tCi0gICAgLyog
T3RoZXJ3aXNlIHdlIGNhbid0IHRlbGwgKi8KLSAgICByZXR1cm4gLTE7Ci0tfQotLQotICNlbmRp
ZgotK30KLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5o
YXNoIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gKaW5kZXggN2U0OTExOWM0MS4uNDliNDJl
MjEzMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gKKysrIGIvcGFja2Fn
ZS9tZXNhM2QvbWVzYTNkLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8yMDI0LUZlYnJ1YXJ5LzAw
MDc0OC5odG1sCi1zaGEyNTYgIDY5Y2NiMTI3ODY0MWZmNWJhZDcxY2EwZjg2NjE4OGFlYjFhOTJh
YWRjNGRiYjlkMzVmNTBhZWJlYzViOGI1MGYgIG1lc2EtMjMuMy41LnRhci54egotc2hhNTEyICAx
YWQyOWY1MjRjYWVlMDAwMGVmNTFhYmU1OGQyOWQ5Njg3ZGU1ZmJjNTE2OGY3ZTY3N2JiNGU2OWM1
ZTlhOTQ5MThkNWZiZjZlMTBjNjc1N2ZlN2NlNmQ0N2JhYjEwOWU0NTJmMGZhMmUyNmFhZDJlNmY4
YmZiNzQ0MzgzYjVlYSAgbWVzYS0yMy4zLjUudGFyLnh6CisjIEZyb20gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8yMDI0LUZlYnJ1YXJ5LzAwMDc0
Ny5odG1sCitzaGEyNTYgIGRjN2U4YzA3N2JjNTg4NGRmOTU0NzgyNjNiMzRiZGViYjdlODhlNjAw
Njg5Y2I1NmZiMDdiZTJiOGMzMDRjMzYgIG1lc2EtMjQuMC4wLnRhci54egorc2hhNTEyICA5ZGZk
ZWE3Y2ViYjM3YjljMDIwMzM1ZTI0MTk0YjM5YjM5OWY0OGI1YWY2ZWVjMzBjMzQ1NTEwODI3NmFj
NGUyOWU3YjA2ZGY5NDJjYjJhYmM3YWZhNjY3Nzg0OTY4YzBjNDNkMTliOWFmZTMwZWYwMzAyMWI5
Y2I2YTc4OWYxNSAgbWVzYS0yNC4wLjAudGFyLnh6CiAjIExpY2Vuc2UKIHNoYTI1NiAgYTAwMjc1
YTUzMTc4ZTI2NDVmYjY1YmU5OWE3ODVjMTEwNTEzNDQ2YTUwNzFmZjJjNjk4ZWQyNjBhZDkxN2Q3
NSAgZG9jcy9saWNlbnNlLnJzdApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
IGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCmluZGV4IDRlNmNiMzU3MWEuLjJkMTNmNzMzNmYg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5taworKysgYi9wYWNrYWdlL21lc2Ez
ZC9tZXNhM2QubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAj
IFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVh
ZGVycwotTUVTQTNEX1ZFUlNJT04gPSAyMy4zLjUKK01FU0EzRF9WRVJTSU9OID0gMjQuMC4wCiBN
RVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoKIE1FU0EzRF9TSVRF
ID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKIE1FU0EzRF9MSUNFTlNFID0gTUlULCBTR0ks
IEtocm9ub3MKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
