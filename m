Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C75F3026E
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 19:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D1F40E37;
	Sun, 15 Mar 2026 19:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzSn4rgWDycz; Sun, 15 Mar 2026 19:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8E540CD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773602275;
	bh=qkxjJTN4TsimTe5IZkxDo2HpnRlBUQutsXEquUoIaVQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WsKxUppjg4K6OweauIlNYC8HCS9vTyPFUd9D11Zi10EiXSdFevo1mqL+ZmxQc/1xv
	 OizZZPzBATCKyZLoe+ND8Y0iCWN/F534399tGKy2eQzBDHFWuVt1P1knb1l436SjhY
	 1HvtmCSNXEuDvg3hG0KB7HKXstUsVl0H61DHDqNka/Mz/9bfN36glKLiJddRS484jT
	 TdqCEGL5KaytthsYcp6mjGsc7f+DsEHY9BvnWtAZdXZws1KfmDbUJ7d3hVeqCLbA+j
	 r4mA7SN5SX3ZjZkXyHEwLJ8GKYHzswGAa5y6QVuPN1fqsukUMv1FQU06EAer8UMXao
	 02hfDYM2NTtIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE8E540CD5;
	Sun, 15 Mar 2026 19:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8417F201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 19:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E1F60B48
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 19:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzYA6EpfehNf for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 19:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA02A60B46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA02A60B46
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA02A60B46
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 19:17:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5017AA4C0DF0;
 Sun, 15 Mar 2026 20:17:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34098)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1qyC-000000004zp-28Hd;
 Sun, 15 Mar 2026 19:17:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2026 20:17:48 +0100
Message-ID: <20260315191748.762183-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773602269;
 bh=FdivbnqZYcSCTM90KNTbgPXONkXFaMQnBLfV+X2zXjo=;
 h=From:To:Cc:Subject:Date:From;
 b=SiJ7V3WQi69iwvjP+DVyotv13vf0NNBuV5OQumMLhe5A5uSZzXsbgSCbVw7DUuIKD
 EKVvRD/IQb9VWpJmSEj/V16K1b11uQLnJQ50jgriV4AC7TdeSCznK8RlLLHSOttEVe
 sOQovETIiRcxANCpWSDrvrTZeUBqpFonDA/78YjzV+U38xZ27TCaTNZiyshQeFTWld
 PY+BeKeNXRzdZDOvH90WoRdMucoU4WsMKGbSHq1fTJQoG6+7wg3xfkmqDSPmOYrgJI
 Ar0FMICgMRxVPGZ2gAO/8d13CKdxTqKy85VBzEGUXXnETotqzVS1ac7lqgosuqhZEa
 aQnYLhrjyq0EA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SiJ7V3WQ
Subject: [Buildroot] [PATCH 1/1] package/igh-ethercat: fix build with kernel
 >= 6.15
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

QnVpbGRyb290IGNvbW1pdCBjNmU5MTQ4MTk3NzQyMTJlNzliZTE5ZjYyNzA2ZjY1M2I5NjQ2ZjEx
IGJ1bXBlZCB0aGUKcGFja2FnZSBmcm9tIDEuNi4zIHRvIDEuNi44LiBUaGUgcHJldmlvdXMgdmVy
c2lvbiAxLjYuMyBmYWlsZWQgdG8gYnVpbGQKd2l0aCBrZXJuZWwgPj0gNi4xNSBhcyBzZWVuIGhl
cmU6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy83ZjQvN2Y0YjNlNjMy
YTVkZTY3ZGVjMjYyNGEyMDk3MDQ1ZWM0ZDc2NzI0Ni8KImV4YW1wbGVzL21pbmkvbWluaS5jOjUy
ODo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24KIMOi4oKsy5xkZWxf
dGltZXJfc3luY8Oi4oKs4oSiIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDUy
OCB8ICAgICBkZWxfdGltZXJfc3luYygmdGltZXIpOyIKClRoZSBidW1wIHRvIDEuNi44IGluY2x1
ZGVzIGEgY29tbWl0IHdoaWNoIGZpeGVzIHRoZSBwcm9ibGVtOgpodHRwczovL2dpdGxhYi5jb20v
ZXRoZXJsYWIub3JnL2V0aGVyY2F0Ly0vY29tbWl0LzI0MDA4MGYxMTA2MmNjYTQyZjkxMzJjZDMy
ZmFkM2I5OTM1MDI2NjUKCmJ1dCBpdCBvbmx5IG1hc2tlZCBvdGhlciBidWlsZCBlcnJvcnMgd2hp
Y2ggd2VyZSBmb3VuZCBieSB0aGUKYXV0b2J1aWxkZXJzOgpodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvMWE1LzFhNTQ2ZWUyMjE3ZTc4NDNiODUyYTViNzliNDc3ZWYyM2Rm
NmEwNjQvCiJleGFtcGxlcy90dHkvdHR5LmM6MjM2OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbgogJ2RlbF90aW1lcl9zeW5jJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KICAyMzYgfCAgICAgZGVsX3RpbWVyX3N5bmMoJnRpbWVyKTsiCgp3aGljaCBu
ZWVkIHNpbWlsYXIgZml4ZXMuCgpGaXhlczoKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzBiYS8wYmE3MTYzZTUwMTIzMDlkM2EzMWFhNzE4NmNhOTVhOWQ1YzhkZTY5LwoK
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5uZXct
dGltZXItaW50ZXJmYWNlLXNpbmNlLWtlcm5lbC02LjEucGF0Y2ggfCA2MyArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvaWdoLWV0aGVyY2F0LzAwMDEtdHR5LUltcGxlbWVudGVkLW5ldy10aW1lci1p
bnRlcmZhY2Utc2luY2Uta2VybmVsLTYuMS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWdo
LWV0aGVyY2F0LzAwMDEtdHR5LUltcGxlbWVudGVkLW5ldy10aW1lci1pbnRlcmZhY2Utc2luY2Ut
a2VybmVsLTYuMS5wYXRjaCBiL3BhY2thZ2UvaWdoLWV0aGVyY2F0LzAwMDEtdHR5LUltcGxlbWVu
dGVkLW5ldy10aW1lci1pbnRlcmZhY2Utc2luY2Uta2VybmVsLTYuMS5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZTU2OGVhYmE5Ci0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9pZ2gtZXRoZXJjYXQvMDAwMS10dHktSW1wbGVtZW50ZWQtbmV3LXRpbWVyLWlu
dGVyZmFjZS1zaW5jZS1rZXJuZWwtNi4xLnBhdGNoCkBAIC0wLDAgKzEsNjMgQEAKK0Zyb20gZTMy
ZTk5ZjhiOGVjMDJhMzQwYWQzYjkzY2M4YWJkMzY3ODFmZjU2OCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CitEYXRlOiBTdW4sIDE1
IE1hciAyMDI2IDIwOjA2OjQyICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHR0eTogSW1wbGVtZW50
ZWQgbmV3IHRpbWVyIGludGVyZmFjZSBzaW5jZSBrZXJuZWwgNi4xNQorCitVcHN0cmVhbTogaHR0
cHM6Ly9naXRsYWIuY29tL2V0aGVybGFiLm9yZy9ldGhlcmNhdC8tL21lcmdlX3JlcXVlc3RzLzE4
NworCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorLS0tCisg
ZXhhbXBsZXMvdHR5L3R0eS5jIHwgNCArKysrCisgdHR5L21vZHVsZS5jICAgICAgIHwgOCArKysr
KysrKworIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEv
ZXhhbXBsZXMvdHR5L3R0eS5jIGIvZXhhbXBsZXMvdHR5L3R0eS5jCitpbmRleCA0ZDQ3YTQ5Li5l
NWI0ZDUyIDEwMDY0NAorLS0tIGEvZXhhbXBsZXMvdHR5L3R0eS5jCisrKysgYi9leGFtcGxlcy90
dHkvdHR5LmMKK0BAIC0yMzMsNyArMjMzLDExIEBAIHN0YXRpYyB2b2lkIF9fZXhpdCBjbGVhbnVw
X21pbmlfbW9kdWxlKHZvaWQpCisgeworICAgICBwcmludGsoS0VSTl9JTkZPIFBGWCAiU3RvcHBp
bmcuLi5cbiIpOworIAorKyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04o
NiwgMTUsIDApCisrICAgIHRpbWVyX2RlbGV0ZV9zeW5jKCZ0aW1lcik7CisrI2Vsc2UKKyAgICAg
ZGVsX3RpbWVyX3N5bmMoJnRpbWVyKTsKKysjZW5kaWYKKyAKKyAgICAgZnJlZV9zZXJpYWxfZGV2
aWNlcygpOworIAorZGlmZiAtLWdpdCBhL3R0eS9tb2R1bGUuYyBiL3R0eS9tb2R1bGUuYworaW5k
ZXggMmI3YjIyYi4uMTJhZDFlNyAxMDA2NDQKKy0tLSBhL3R0eS9tb2R1bGUuYworKysrIGIvdHR5
L21vZHVsZS5jCitAQCAtMjkyLDcgKzI5MiwxMSBAQCBzdGF0aWMgaW50IGVjX3R0eV9pbml0KGVj
X3R0eV90ICp0LCBpbnQgbWlub3IsCisgCisgc3RhdGljIHZvaWQgZWNfdHR5X2NsZWFyKGVjX3R0
eV90ICp0dHkpCisgeworKyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04o
NiwgMTUsIDApCisrICAgIHRpbWVyX2RlbGV0ZV9zeW5jKCZ0dHktPnRpbWVyKTsKKysjZWxzZQor
ICAgICBkZWxfdGltZXJfc3luYygmdHR5LT50aW1lcik7CisrI2VuZGlmCisgICAgIHR0eV91bnJl
Z2lzdGVyX2RldmljZSh0dHlfZHJpdmVyLCB0dHktPm1pbm9yKTsKKyB9CisgCitAQCAtMzY3LDEw
ICszNzEsMTQgQEAgc3RhdGljIHZvaWQgZWNfdHR5X3dha2V1cChzdHJ1Y3QgdGltZXJfbGlzdCAq
dCkKKyBzdGF0aWMgdm9pZCBlY190dHlfd2FrZXVwKHVuc2lnbmVkIGxvbmcgZGF0YSkKKyAjZW5k
aWYKKyB7CisrI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTig2LCAxNSwg
MCkKKysgICAgZWNfdHR5X3QgKnR0eSA9IHRpbWVyX2NvbnRhaW5lcl9vZih0dHksIHQsIHRpbWVy
KTsKKysjZWxzZQorICNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04oNCwg
MTUsIDApCisgICAgIGVjX3R0eV90ICp0dHkgPSBmcm9tX3RpbWVyKHR0eSwgdCwgdGltZXIpOwor
ICNlbHNlCisgICAgIGVjX3R0eV90ICp0dHkgPSAoZWNfdHR5X3QgKikgZGF0YTsKKysjZW5kaWYK
KyAjZW5kaWYKKyAgICAgc2l6ZV90IHRvX3JlY3Y7CisgCistLSAKKzIuNDcuMworCi0tIAoyLjQ3
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
