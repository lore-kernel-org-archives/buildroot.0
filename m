Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AACD2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 11:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F13A608A0;
	Sun, 11 Jan 2026 11:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7rsuogzxPq8; Sun, 11 Jan 2026 11:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F64760853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768130429;
	bh=zOxc2Jc2JbJP77yFzppTyAXO/yEQrI1Wh69suoavypc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rad65AOgm8h5qtKtzF9yPro/t5RqLBDiacTcZG05DpdNaEhP+7A2cvxIuU6CNC8mW
	 iE2GnveyYi9LpRWOyaQrSElVL6xfrTjhMLTBNQ76Qh0k/tjJOA4QVEAKqkazgAnaWH
	 DAvNgC5LS4wKMxDu2o7u57wG5+Zy0dQLv+NjSk4RrslTUg9dRZt7GR+uvvkMpnLWQM
	 orJQ8FN4S2GaMgIJzz7TD1GWwOqtuwdorWps2UMmCdbSPFaJ5OaTJG9eZWA0X63jiZ
	 /MUSzyjdsZBT+m5cGkpiNp4RmghH4XstNV5z73MU7gn4q/k4WwwtZUJKMqtga7YKsH
	 kIFTmDBPn/oKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F64760853;
	Sun, 11 Jan 2026 11:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C451CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F78401D0
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fud9BOJL5ZwR for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 11:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAC824008C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC824008C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAC824008C
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:20:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07A91A4C3700
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 12:20:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60108)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vetUb-000000000J2-1cvD
 for buildroot@buildroot.org; Sun, 11 Jan 2026 11:20:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 12:20:20 +0100
Message-ID: <20260111112021.3551404-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768130422;
 bh=9qhCO/EzeH9Bug0QV6AvNsUlhFpdoL3m+MZW1IzYAGw=;
 h=From:To:Subject:Date:From;
 b=U3zl3QP+A1YlLRd1wbR8Y92zwg8roFkj92720qKpg3fjWJU3e0ERQp4j0lheCQEN2
 0J0r+cdx08w036fhzuWrS+lEBKIpXEyDxXgWphNWuxKkYlq9qMnY52/DFWtJal+Rfi
 0F5pTHXFy5t1PY3s6u/AbfNEUmHuYQsNyrZpt9nTMzs3nxT0rwKYNQI5go1gK5zwJA
 c3ErOYrxrJ41c95X300qIIGdgWgS1//KgQd9t5KG0t0DPLtLrnV7eFU2vYgroebdH3
 TJ8lQTukkgY7jUK8nPxP6G7Kg+qf7cv4LfWlwHZougaL2Skaq3PGhJuCMYCA4c9sjz
 PX9yZX+WAegPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=U3zl3QP+
Subject: [Buildroot] [PATCH 1/1] package/uqmi: bump version
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

UmVtb3ZlZCBwYXRjaCAwMDAxLCBub3QgbmVlZGVkIGFueW1vcmUgZHVlIHRvIHVwc3RyZWFtIGNv
bW1pdApodHRwczovL2dpdC5vcGVud3J0Lm9yZy8/cD1wcm9qZWN0L3VxbWkuZ2l0O2E9Y29tbWl0
ZGlmZjtoPWViZmU4YjQ3YjM2NjA5MjQ1N2RmN2E3ZjYzMWM4Zjc0NmU4NDU1ZmQKClVwZGF0ZWQg
bGljZW5zZSBmaWxlIG5hbWUgZHVlIHRvIHVwc3RyZWFtIHJlbmFtZToKaHR0cHM6Ly9naXQub3Bl
bndydC5vcmcvP3A9cHJvamVjdC91cW1pLmdpdDthPWNvbW1pdGRpZmY7aD1hMDQzYTc0MDdiZjYw
MmNhYzY2YzllN2JiMmI4MWFhMmU1MGE2OTkzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8
YmVybmRAa3VobHMubmV0PgotLS0KIC4uLjIueC1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3Rvcmlu
Zy10aC5wYXRjaCB8IDU3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvdXFtaS91cW1pLmhh
c2ggICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBwYWNrYWdlL3VxbWkvdXFtaS5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdXFt
aS8wMDAxLXVxbWktYXZvaWQtZ2NjLTEyLngtZmFsc2UtZXJyb3ItcmVwb3J0aW5nLXN0b3Jpbmct
dGgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3VxbWkvMDAwMS11cW1pLWF2b2lkLWdjYy0x
Mi54LWZhbHNlLWVycm9yLXJlcG9ydGluZy1zdG9yaW5nLXRoLnBhdGNoIGIvcGFja2FnZS91cW1p
LzAwMDEtdXFtaS1hdm9pZC1nY2MtMTIueC1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10
aC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTIxOTkyMjhiOS4uMDAwMDAw
MDAwMAotLS0gYS9wYWNrYWdlL3VxbWkvMDAwMS11cW1pLWF2b2lkLWdjYy0xMi54LWZhbHNlLWVy
cm9yLXJlcG9ydGluZy1zdG9yaW5nLXRoLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTcgKzAs
MCBAQAotRnJvbSA2M2FiODg3YmU5MGM3ZmUzN2Q1MzdlYTc1ZTYwZWI5NWQ2ZDg3ZDNmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgu
bmV0PgotRGF0ZTogU3VuLCA1IE1hciAyMDIzIDIyOjA4OjEzICswMTAwCi1TdWJqZWN0OiBbUEFU
Q0hdIHVxbWk6IGF2b2lkIGdjYy0xMi54IGZhbHNlIGVycm9yIHJlcG9ydGluZyAoc3RvcmluZyB0
aGUKLSBhZGRyZXNzIG9mIGxvY2FsIHZhcmlhYmxlICdjb21wbGV0ZScgaW4gJypyZXEuY29tcGxl
dGUnKQotCi1Bdm9pZCBnY2MtMTIueCBmYWxzZSBlcnJvciByZXBvcnRpbmcgKHJlcS0+Y29tcGxl
dGUgaXMgbGF0ZXIgcmVzZXQgdG8gTlVMTAotaW4gY2FzZSBvZiB1c2Ugb2YgbG9jYWwgY29tcGxl
dGUpOgotCi0gIGRldi5jOjIxNzoyMzogZXJyb3I6IHN0b3JpbmcgdGhlIGFkZHJlc3Mgb2YgbG9j
YWwgdmFyaWFibGUgJ2NvbXBsZXRlJyBpbiAnKnJlcS5jb21wbGV0ZScgWy1XZXJyb3I9ZGFuZ2xp
bmctcG9pbnRlcj1dCi0gICAgMjE3IHwgICAgICAgICByZXEtPmNvbXBsZXRlID0gJmNvbXBsZXRl
OwotICAgICAgICB8ICAgICAgICAgfn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fgotCi1TaWduZWQt
b2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci1bVXBzdHJlYW06IGh0
dHA6Ly9saXN0cy5vcGVud3J0Lm9yZy9waXBlcm1haWwvb3BlbndydC1kZXZlbC8yMDIzLU1hcmNo
LzA0MDY2Ny5odG1sXQotU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBn
bXgubmV0PgotLS0tCi1DaGFuZ2VzIHYxIC0+IHYyOgotICAtIGFwcGx5IHByYWdtYSBpZ25vcmVk
IG9ubHkgZm9yIGdjYyA+PSAxMi54IChhcyB0aGUgd2FybmluZwotICAgICctV2RhbmdsaW5nLXBv
aW50ZXInIHdhcyBpbnRyb2R1Y2VkIHdpdGggZ2NjLTEyLngpCi0tLS0KLSBkZXYuYyB8IDEyICsr
KysrKysrKysrKwotIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1n
aXQgYS9kZXYuYyBiL2Rldi5jCi1pbmRleCBiZDEwMjA3Li5kYmQ0MmQ0IDEwMDY0NAotLS0tIGEv
ZGV2LmMKLSsrKyBiL2Rldi5jCi1AQCAtMjAzLDYgKzIwMywxNSBAQCB2b2lkIHFtaV9yZXF1ZXN0
X2NhbmNlbChzdHJ1Y3QgcW1pX2RldiAqcW1pLCBzdHJ1Y3QgcW1pX3JlcXVlc3QgKnJlcSkKLSAJ
X19xbWlfcmVxdWVzdF9jb21wbGV0ZShxbWksIHJlcSwgTlVMTCk7Ci0gfQotIAotKy8qIGF2b2lk
IGdjYy0xMi54IGZhbHNlIGVycm9yIHJlcG9ydGluZzoKLSsgKiAgIGRldi5jOjIxNzoyMzogZXJy
b3I6IHN0b3JpbmcgdGhlIGFkZHJlc3Mgb2YgbG9jYWwgdmFyaWFibGUg4oCYY29tcGxldGXigJkg
aW4g4oCYKnJlcS5jb21wbGV0ZeKAmSBbLVdlcnJvcj1kYW5nbGluZy1wb2ludGVyPV0KLSsgKiAg
ICAgMjE3IHwgICAgICAgICByZXEtPmNvbXBsZXRlID0gJmNvbXBsZXRlOwotKyAqICAgICAgICAg
fCAgICAgICAgIH5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn4KLSsgKi8KLSsjaWYgX19HTlVDX18g
Pj0gMTIKLSsjcHJhZ21hIEdDQyBkaWFnbm9zdGljIHB1c2gKLSsjcHJhZ21hIEdDQyBkaWFnbm9z
dGljIGlnbm9yZWQgIi1XZGFuZ2xpbmctcG9pbnRlciIKLSsjZW5kaWYKLSBpbnQgcW1pX3JlcXVl
c3Rfd2FpdChzdHJ1Y3QgcW1pX2RldiAqcW1pLCBzdHJ1Y3QgcW1pX3JlcXVlc3QgKnJlcSkKLSB7
Ci0gCWJvb2wgY29tcGxldGUgPSBmYWxzZTsKLUBAIC0yMzEsNiArMjQwLDkgQEAgaW50IHFtaV9y
ZXF1ZXN0X3dhaXQoc3RydWN0IHFtaV9kZXYgKnFtaSwgc3RydWN0IHFtaV9yZXF1ZXN0ICpyZXEp
Ci0gCi0gCXJldHVybiByZXEtPnJldDsKLSB9Ci0rI2lmIF9fR05VQ19fID49IDEyCi0rI3ByYWdt
YSBHQ0MgZGlhZ25vc3RpYyBwb3AKLSsjZW5kaWYKLSAKLSBzdHJ1Y3QgcW1pX2Nvbm5lY3RfcmVx
dWVzdCB7Ci0gCXN0cnVjdCBxbWlfcmVxdWVzdCByZXE7Ci0tLSAKLTIuMzkuMgotCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3VxbWkvdXFtaS5oYXNoIGIvcGFja2FnZS91cW1pL3VxbWkuaGFzaAppbmRl
eCAzMjc3YjE3NjQ1Li5jYWUyYTA4YjAyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3VxbWkvdXFtaS5o
YXNoCisrKyBiL3BhY2thZ2UvdXFtaS91cW1pLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICBlY2VjMWFiNWE5Y2Y5MWU1NGQyOTQ5NmQ2NzkzY2U1ODIx
MjQ2MjYxYjk5Yzc0MzEyNjg5OWZjZjk4MzdhZjQ4ICB1cW1pLTBhMTliNWI3NzE0MDQ2NWMyOWUy
YWZhN2Q2MTFmZTkzYWJjOTY3MmYtZ2l0NC50YXIuZ3oKLXNoYTI1NiAgYTY5YmY0NGRiZmYxNWQ3
Mjc1NzhkMjA2OWE2NTRkNjBlOTAzNGM1ZTJjYzNlMTk5YTAxMmU3MmFmZWY2YzI1OSAgbWFpbi5j
CitzaGEyNTYgIGZmNDg1MGNhM2MxNTE3YWM3OTYxNGEzOWZkYjQ3NTYwYzk5ZjExNTkxNjNlOTZl
MWY1MDM3YmY1NTA3NzU2YzYgIHVxbWktNzkxNGRhNDNjZGRhYWY2Y2ZiYTExNjI2MGM4MWU2ZTlh
ZGZmZDVhYi1naXQ0LnRhci5negorc2hhMjU2ICBhNjliZjQ0ZGJmZjE1ZDcyNzU3OGQyMDY5YTY1
NGQ2MGU5MDM0YzVlMmNjM2UxOTlhMDEyZTcyYWZlZjZjMjU5ICB1cW1pL3VxbWkuYwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS91cW1pL3VxbWkubWsgYi9wYWNrYWdlL3VxbWkvdXFtaS5tawppbmRleCBm
MjBjM2Y1MTQxLi41Y2I5ZWJkZTQzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3VxbWkvdXFtaS5tawor
KysgYi9wYWNrYWdlL3VxbWkvdXFtaS5tawpAQCAtNCwxMSArNCwxMSBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotVVFNSV9WRVJTSU9OID0gMGExOWI1Yjc3MTQwNDY1YzI5ZTJhZmE3
ZDYxMWZlOTNhYmM5NjcyZgorVVFNSV9WRVJTSU9OID0gNzkxNGRhNDNjZGRhYWY2Y2ZiYTExNjI2
MGM4MWU2ZTlhZGZmZDVhYgogVVFNSV9TSVRFID0gaHR0cHM6Ly9naXQub3BlbndydC5vcmcvcHJv
amVjdC91cW1pLmdpdAogVVFNSV9TSVRFX01FVEhPRCA9IGdpdAogVVFNSV9MSUNFTlNFID0gTEdQ
TC0yLjArCi1VUU1JX0xJQ0VOU0VfRklMRVMgPSBtYWluLmMKK1VRTUlfTElDRU5TRV9GSUxFUyA9
IHVxbWkvdXFtaS5jCiBVUU1JX0RFUEVOREVOQ0lFUyA9IGpzb24tYyBsaWJ1Ym94CiAKICQoZXZh
bCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
