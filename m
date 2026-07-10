Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A38C44509
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 21:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADF08115A;
	Fri, 10 Jul 2026 21:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi1v7UJ0IpdY; Fri, 10 Jul 2026 21:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038B781156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783720503;
	bh=C5EAol/k8TdjBhE9arN1i0kcbEzRFVYHnd1qAQf7gUs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lUOeo9KKLICKQfNVpvxxId/RGwYDLv1eRSqe/oy6/XXW01Hrx3G767rwtrQi5bvAT
	 O5LiTRkTzDL2VlWNdVwVKcsHY7IFr4q0fY1Mgq9wvIMkPt3NYfH6bpPJhE/dw0JRSg
	 WxM6ieonlzkFhWH94zXgJp4PxdscOwEH8v+zjW2cjpqVdO33VZhvA5ahi+APZGs5K1
	 PRYvyTlGx6+EhUzGge0aT8jqAAAYgkLhrLIOuM1jnLYRzVkr9TZYI5yFFTCrBwtal0
	 IJkdNMeVJuY0MwOYs+loJpYb6DJbos32F0Q8RN4zSzGQ0td0xXHJiT34+DQtydZf/n
	 /R6klXa88gqDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038B781156;
	Fri, 10 Jul 2026 21:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BD82EE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA4C0409CA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOtQro2it5aP for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 21:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 664B3409C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664B3409C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 664B3409C3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:54:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFBE8A4C2EB9
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:54:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49194)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiJBQ-000000007iu-1Twc
 for buildroot@buildroot.org; Fri, 10 Jul 2026 21:54:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 23:54:54 +0200
Message-ID: <20260710215456.2365392-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783720496;
 bh=J7Bu9lMa+lcUyCWbUW8K9Sw7DpwEwZIHprzEV071P+I=;
 h=From:To:Subject:Date:From;
 b=g7E2G4MCqoN7KsJuF95d1gMLjh/Rl1ivS0arHZM645hVVvi9S7o6+GdQyXHu4nu7M
 /Wew6pfAWmqFAc4KG0bEYYabH0IcfK45mIGNLhnzFzOwvKPq9f8SxtlfUIlwjjaef/
 BaJ31/1pZtkz/jzv6YyEe3tP2YBrmNm63IhzqUjWIwg38ETBkROX8D3TLE33s+kcmH
 d8JEmV/KY1zoRk427VXSczqInKp13jSungqP520TcvvkQAdMAF+a+JPRb/DhNKzVXA
 fRH8IMp52G7nQkBTTRcAhpnNvGLJefif2/Q/lQeY4ICwScghL3ra/B1aOa6mDZRT3N
 uh+8GKvVRPRsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=g7E2G4MC
Subject: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: fix musl build
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

QnVpbGRyb290IGNvbW1pdCBmOWE5MWJmNjBlMzU2MTcxNTdiOTUwZWVhMDVmYzZmNjE0NGQ2NTBj
IGJ1bXBlZCB0aGUKcGFja2FnZSB0byB2ZXJzaW9uIDIuMyB0aGF0IGluY2x1ZGVzIHVwc3RyZWFt
IGNvbW1pdApodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMv
LS9jb21taXQvNmE4YjMzZTM1MzYyNzE4N2YxYjUzMGYzM2M0YmQzZjUyODI4ODNmMAp3aGljaCBt
YWtlcyB1c2Ugb2YgUEFUSF9NQVggY2F1c2luZyBidWlsZCBlcnJvcnMgb24gbXVzbC4KCkZpeGVz
OgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNDJhLzQyYTZlOWQ5NjUy
YzFlYjk3YzhjNDlhZWQ3NWQyMTBiZjJhZmMwNjYvCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgotLS0KR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0dHBzOi8v
Z2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy80MDNmZWRkNzlhZjgxNTZiN2Ri
MzZmNjk4MTdmNDljMWU3MTY4NDRiCgogLi4uZnJlcXVlbmN5LWluY2x1ZGUtbGltaXRzLmgtdG8t
Zml4LW11LnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lndC1ncHUtdG9vbHMv
MDAwMS10b29scy1pbnRlbF9ncHVfZnJlcXVlbmN5LWluY2x1ZGUtbGltaXRzLmgtdG8tZml4LW11
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzLzAwMDEtdG9vbHMtaW50
ZWxfZ3B1X2ZyZXF1ZW5jeS1pbmNsdWRlLWxpbWl0cy5oLXRvLWZpeC1tdS5wYXRjaCBiL3BhY2th
Z2UvaWd0LWdwdS10b29scy8wMDAxLXRvb2xzLWludGVsX2dwdV9mcmVxdWVuY3ktaW5jbHVkZS1s
aW1pdHMuaC10by1maXgtbXUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMWQ4MThkY2MyMgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaWd0LWdwdS10b29s
cy8wMDAxLXRvb2xzLWludGVsX2dwdV9mcmVxdWVuY3ktaW5jbHVkZS1saW1pdHMuaC10by1maXgt
bXUucGF0Y2gKQEAgLTAsMCArMSwzNiBAQAorRnJvbSA0OGExNzc5NThhOWVjZmY4ZjdjZWUzNzlh
ZmZiMmYzNTk4NGI1OGE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQmVybmQgS3Vo
bHMgPGJlcm5kQGt1aGxzLm5ldD4KK0RhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMjA6MzQ6MDEgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gdG9vbHMvaW50ZWxfZ3B1X2ZyZXF1ZW5jeTogaW5jbHVkZSBs
aW1pdHMuaCB0byBmaXggbXVzbCBidWlsZAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAorCitGaXhlcyBidWlsZCBlcnJvciBzZWVuIHdpdGggbXVzbC1iYXNlZCB0b29sY2hhaW5z
OgorCisuLi90b29scy9pbnRlbF9ncHVfZnJlcXVlbmN5LmM6OTA6MTk6IGVycm9yOgorIOKAmFBB
VEhfTUFY4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQorICAgOTAg
fCAgICAgICAgIGNoYXIgcGF0aFtQQVRIX01BWF07CisKK1Vwc3RyZWFtOiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzM5MTU5Lz9zZXJpZXM9MTcwMjA3JnJldj0xCisK
K1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyB0b29s
cy9pbnRlbF9ncHVfZnJlcXVlbmN5LmMgfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKKworZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3kuYyBiL3Rvb2xz
L2ludGVsX2dwdV9mcmVxdWVuY3kuYworaW5kZXggNjMxNmMyZTU4Li43ZGY3ZjMzMWQgMTAwNjQ0
CistLS0gYS90b29scy9pbnRlbF9ncHVfZnJlcXVlbmN5LmMKKysrKyBiL3Rvb2xzL2ludGVsX2dw
dV9mcmVxdWVuY3kuYworQEAgLTI1LDYgKzI1LDcgQEAKKyAjaW5jbHVkZSA8ZGlyZW50Lmg+Cisg
I2luY2x1ZGUgPGZjbnRsLmg+CisgI2luY2x1ZGUgPGdldG9wdC5oPgorKyNpbmNsdWRlIDxsaW1p
dHMuaD4KKyAjaW5jbHVkZSA8c3RkaW8uaD4KKyAjaW5jbHVkZSA8dGltZS5oPgorICNpbmNsdWRl
IDx1bmlzdGQuaD4KKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
