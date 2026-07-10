Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06637C4450F
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 21:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFDE40A8D;
	Fri, 10 Jul 2026 21:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaDEXl2XnMCz; Fri, 10 Jul 2026 21:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178CA409CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783720518;
	bh=aH9Uj2lhI8ivpMnjHGZj0ELPujVTQvDYAUYRWOaAvhw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nr3brrtVydeXvvMBYBBtwS4Sp3JooHwD6ONfOrCMWokJ7GD+G/zlGjNFDx2NSlm4/
	 YjmSvs5N5vmpedLKLYNApKiycjAvaCKi6u8VkNYviyrrwIK6/RX+p+nGOzfqwOIhse
	 5xvZ3NhQwjOyAdSmTDH128PnH3n9FGsLDYsTBv8gebCmVf3+3K2yaFO7iLb/AQZr7I
	 r2dRw9VuoO8+aEXJdl7NT3KCser68d/XPPlrD72/pOpWFcqcuoSdb1wrFiX60wJk6i
	 vHnxYlcavEcC2/nyBaNJYvOn7uHF2Zt1t33WbTk5HcwxkIZGbnFOknpsfTEDIzds1z
	 RPKWb2R98SAsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178CA409CA;
	Fri, 10 Jul 2026 21:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C2B4372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71EC460A69
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy2vM6BTVFK8 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 21:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8E73608C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E73608C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8E73608C9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:55:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9D32A4C3259
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:54:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49194)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiJBQ-000000007iu-1pJd
 for buildroot@buildroot.org; Fri, 10 Jul 2026 21:54:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 23:54:55 +0200
Message-ID: <20260710215456.2365392-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710215456.2365392-1-bernd@kuhls.net>
References: <20260710215456.2365392-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783720496;
 bh=siplmicdOY6Lmtj1yxVzUSnQoErHwkNn2EauZvu/+3U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SR7EcP+80sq9vbaUvi7UhuFpNFVo/Di+MrbDZ6m5JqXgqiB8eLZ++/5dgj3e/DKCf
 oaWpAYF9egxGaNHMJbWVzezhnQ+PiHZgaOm8lxX11idwa832uDJQbNH5ZoCWyVwPXz
 2EavFcaEbcaeeIPyy2dGoMn6SfIbGaZh3IVZXMrB+87ivqbODs0I2LN3KC1Tlh5W/r
 y8wVXZh5hGpVSHp+lyLNqCcAYfNtXu4TK9dk1iocYACqPTmmqzNQL9VnfOR2f1xvAP
 bVUtj4CrZ4u+dggP0yD9xj7TXluz4C82/dLdMdiHDV+/vd/BcsXxGecwcmh/OTD/uQ
 Eij09Ra7WjiEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SR7EcP+8
Subject: [Buildroot] [PATCH 2/2] package/igt-gpu-tools: bump version to 2.5
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

aHR0cHM6Ly9saXN0cy54Lm9yZy9hcmNoaXZlcy94b3JnLWFubm91bmNlLzIwMjYtSnVuZS8wMDM3
MTAuaHRtbAoKQWRkZWQgcGF0Y2ggMDAwMiB0byBmaXggbXVzbCBidWlsZCBlcnJvciBpbnRyb2R1
Y2VkIGJ5IHRoaXMgYnVtcCBkdWUgdG8KdXBzdHJlYW0gY29tbWl0Cmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8tL2NvbW1pdC82MmRhNTZjODQ5YzM3YTNh
NTMyZmIxOTc5ZTQ3ZTMyZDBkZDg4ZTY1CgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFi
LmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy81ODI4OTlhNWY4ZjVjM2MxNGVkY2QxODMw
MTU4NWJjNDE1MmJjYjNhCgogLi4uYWR2aXNlLUZpeC10aGUtdHlwZS1mb3Itc2lnaGFuZGxlcl90
LnBhdGNoIHwgNDYgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2ln
dC1ncHUtdG9vbHMuaGFzaCAgICAgIHwgIDYgKy0tCiBwYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0
LWdwdS10b29scy5tayAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaWd0LWdw
dS10b29scy8wMDAyLXRlc3RzLWludGVsLXhlX21hZHZpc2UtRml4LXRoZS10eXBlLWZvci1zaWdo
YW5kbGVyX3QucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2lndC1ncHUtdG9vbHMvMDAwMi10
ZXN0cy1pbnRlbC14ZV9tYWR2aXNlLUZpeC10aGUtdHlwZS1mb3Itc2lnaGFuZGxlcl90LnBhdGNo
IGIvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzLzAwMDItdGVzdHMtaW50ZWwteGVfbWFkdmlzZS1GaXgt
dGhlLXR5cGUtZm9yLXNpZ2hhbmRsZXJfdC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi43ZWUzNGIxZmM4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9pZ3Qt
Z3B1LXRvb2xzLzAwMDItdGVzdHMtaW50ZWwteGVfbWFkdmlzZS1GaXgtdGhlLXR5cGUtZm9yLXNp
Z2hhbmRsZXJfdC5wYXRjaApAQCAtMCwwICsxLDQ2IEBACitGcm9tIGU4MDdjNGNkOTdjM2U5YmJi
ZDg5MDI2Y2Y5ZWQwYjE2YjAyZWYzOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBC
ZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorRGF0ZTogRnJpLCAxMCBKdWwgMjAyNiAyMDoz
NToyMiArMDIwMAorU3ViamVjdDogW1BBVENIXSB0ZXN0cy9pbnRlbC94ZV9tYWR2aXNlOiBGaXgg
dGhlIHR5cGUgZm9yIHNpZ2hhbmRsZXJfdAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAorCitfX3NpZ2hhbmRsZXJfdCBpcyBwcml2YXRlIGludGVyZmFjZSBpbiBnbGliYyBzbyBp
dHMKK2JldHRlciB0byBub3QgdXNlIGl0LCBhcyBhbiBhc2lkZSBmaXhlcyBidWlsZCB3aXRoIG11
c2wKKworUGF0Y2ggd2FzIGluc3BpcmVkIGJ5CitodHRwczovL2xpc3RzLmdudS5vcmcvci9idWct
dGltZS8yMDI1LTAzL21zZzAwMDAwLmh0bWwKKworRml4ZXMgYnVpbGQgZXJyb3Igc2VlbiB3aXRo
IG11c2wtYmFzZWQgdG9vbGNoYWluczoKKworLi4vdGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jOiBJ
biBmdW5jdGlvbiDigJh0ZXN0X2RvbnRuZWVkX2FmdGVyX21tYXDigJk6CisuLi90ZXN0cy9pbnRl
bC94ZV9tYWR2aXNlLmM6NDAwOjQ4OiBlcnJvcjog4oCYX19zaWdoYW5kbGVyX3TigJkgdW5kZWNs
YXJlZAorIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhzaWdo
YW5kbGVyX3TigJk/CisgIDQwMCB8ICAgICAgICAgIG9sZF9zaWdzZWd2ID0gc2lnbmFsKFNJR1NF
R1YsIChfX3NpZ2hhbmRsZXJfdClzaWd0cmFwKTsKKworVXBzdHJlYW06IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC83MzkxNjAvP3Nlcmllcz0xNzAyMDcmcmV2PTEKKwor
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHRlc3Rz
L2ludGVsL3hlX21hZHZpc2UuYyB8IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tYWR2
aXNlLmMgYi90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMKK2luZGV4IDNkMzZiZTk0MS4uYTMzYTA4
NjMwIDEwMDY0NAorLS0tIGEvdGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jCisrKysgYi90ZXN0cy9p
bnRlbC94ZV9tYWR2aXNlLmMKK0BAIC0zOTcsOCArMzk3LDggQEAgc3RhdGljIHZvaWQgdGVzdF9k
b250bmVlZF9hZnRlcl9tbWFwKGludCBmZCkKKyAJCWNoYXIgKnB0ciA9IChjaGFyICopbWFwOwor
IAkJaW50IHNpZzsKKyAKKy0JCW9sZF9zaWdzZWd2ID0gc2lnbmFsKFNJR1NFR1YsIChfX3NpZ2hh
bmRsZXJfdClzaWd0cmFwKTsKKy0JCW9sZF9zaWdidXMgPSBzaWduYWwoU0lHQlVTLCAoX19zaWdo
YW5kbGVyX3Qpc2lndHJhcCk7CisrCQlvbGRfc2lnc2VndiA9IHNpZ25hbChTSUdTRUdWLCAoc2ln
aGFuZGxlcl90KXNpZ3RyYXApOworKwkJb2xkX3NpZ2J1cyA9IHNpZ25hbChTSUdCVVMsIChzaWdo
YW5kbGVyX3Qpc2lndHJhcCk7CisgCisgCQlzaWcgPSBzaWdzZXRqbXAoam1wLCAxKTsgLyogc2F2
ZW1hc2s9MTogc2F2ZS9yZXN0b3JlIHNpZ25hbCBtYXNrICovCisgCQlzd2l0Y2ggKHNpZykgewor
LS0gCisyLjQ3LjMKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUt
dG9vbHMuaGFzaCBiL3BhY2thZ2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzLmhhc2gKaW5k
ZXggYjY2ZDg1NmRhOS4uZjBjNmNlZmYyZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9pZ3QtZ3B1LXRv
b2xzL2lndC1ncHUtdG9vbHMuaGFzaAorKysgYi9wYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdw
dS10b29scy5oYXNoCkBAIC0xLDYgKzEsNiBAQAotIyBGcm9tIGh0dHBzOi8vbGlzdHMueC5vcmcv
YXJjaGl2ZXMveG9yZy1hbm5vdW5jZS8yMDI2LU1hcmNoLzAwMzY3Ni5odG1sCi1zaGEyNTYgIGE0
NGI3ZDA4OWEyNzU1NTk0NGQ0Y2Q1ZGEzNzJjOTMzOTUwMTUzOWUzY2QyNzM1YmJkYjMwZTBkODAy
ZjFjYmUgIGlndC1ncHUtdG9vbHMtMi40LnRhci54egotc2hhNTEyICAzZjhlODIwMmUzYTYxM2Zh
ZjA3N2VjYjNmY2M2YTEzODQwYThkZjk0Zjk0Y2I3ZDNhNzkzM2U1MTg4ODc1N2VhMjJlNDE1NGYy
ZTBmODhiODk2NTgzZTIzYmM4ZmQ0NzJiZDI4NmEwYjUwNjMwYjhiNWVlYjEzODc4YTFhMmQ5ZiAg
aWd0LWdwdS10b29scy0yLjQudGFyLnh6CisjIEZyb20gaHR0cHM6Ly9saXN0cy54Lm9yZy9hcmNo
aXZlcy94b3JnLWFubm91bmNlLzIwMjYtSnVuZS8wMDM3MTAuaHRtbAorc2hhMjU2ICBiZjVlZTVj
YzFlMmI5MmM0NTZkNjI2Yjc5ODZiZTllMmQxOGI0NzY1Y2QwNmMyOGMxYWI0NDkyMDBjMWNlNWUy
ICBpZ3QtZ3B1LXRvb2xzLTIuNS50YXIueHoKK3NoYTUxMiAgMGRhOGY1NmE3NmJiNzkxODZkYTk1
NTQ1YmU2M2I4ZmE4MmM5M2VkZmU5YjVmZTZmZmU0MzAxN2RlYjc5MjYwMTU0NWJiYTI5MmM1MTZi
NTI1ZTFlMjkwODdlOWIwNDg3NTFkZjQ4NzVkOGE3YTY0ZTI2NWJhYzk0M2JmNmJlODEgIGlndC1n
cHUtdG9vbHMtMi41LnRhci54egogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKIHNoYTI1NiAg
MWI3ZTI2Njg1N2IwNTgwODY2MGY0MjM2OWE0YTc5NzQ1OWQ3YjdiZWM3MjQ1ZTM3OGFhMjhhOGRi
MmYyMTNkYSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1n
cHUtdG9vbHMubWsgYi9wYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5tawppbmRl
eCA1ZGNiZGNhYWI1Li5jYmJiYzc0YTRjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2lndC1ncHUtdG9v
bHMvaWd0LWdwdS10b29scy5taworKysgYi9wYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10
b29scy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUlH
VF9HUFVfVE9PTFNfVkVSU0lPTiA9IDIuNAorSUdUX0dQVV9UT09MU19WRVJTSU9OID0gMi41CiBJ
R1RfR1BVX1RPT0xTX1NPVVJDRSA9IGlndC1ncHUtdG9vbHMtJChJR1RfR1BVX1RPT0xTX1ZFUlNJ
T04pLnRhci54egogSUdUX0dQVV9UT09MU19TSVRFID0gaHR0cHM6Ly93d3cueC5vcmcvcmVsZWFz
ZXMvaW5kaXZpZHVhbC9hcHAKIElHVF9HUFVfVE9PTFNfTElDRU5TRSA9IE1JVAotLSAKMi40Ny4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
