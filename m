Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3519FFEFB77
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC57860B1B;
	Fri, 27 Feb 2026 18:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QShlq8_ZfqxH; Fri, 27 Feb 2026 18:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F417460B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772217140;
	bh=epMkC+Rybpp0x9o7N32EuTWv5DOTrHPsw1JMQWid8e4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ITyfbbDvt1kRpCA5UWSvWyfdGBreVZx3u/H7UwMbj2VyY3MNCeqVy8MPcQa+ESI3L
	 8PdAe7HzRgVsWsyIZ0g0CcJBSzvd1voZbdiiu/9/nwD98jL+TBihFCH/ghuAqplj6m
	 TsWjLKKkyQGWyVnZ9/EIVCsbwX/QYD9hKRIVH9SZNThmsK7EFcseeMy4TIxk6L+fOe
	 A9B+/6fn84tli3gDU4OImFTnRsh1gxQSpxQLd19rKCFunTCjEehkkp9X26S1ztmLDU
	 WK/gPsKJYtcyPx5qXJ/0SmYr/jAxHIc7uwmuy8HTVb6yPx2f03uHng6hRthi7KcXYI
	 DhXK3aj0u6Rog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F417460B5D;
	Fri, 27 Feb 2026 18:32:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A85204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE4F60B5D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfTDZ_Hdcmuq for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4770360B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4770360B1B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4770360B1B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:32:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F73FA4C3119;
 Fri, 27 Feb 2026 19:32:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36556)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw2dL-000000003ci-1ApN;
 Fri, 27 Feb 2026 18:32:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 27 Feb 2026 19:32:14 +0100
Message-ID: <20260227183214.1610624-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772217135;
 bh=kD4J2oHmzlpou0oLSWGLfSSvrcJvzSVp+Ad9tQVfGwU=;
 h=From:To:Cc:Subject:Date:From;
 b=lwZCnaMkknW5jIy50As015E4k/byTDEsZyhrVJMlMPHZnOokD59UUfWU5f9k1LFQB
 ngFtDj+Y7a/l5ZAKkETl7aPUhgc+Tk0RZdMT67kqpnYlTj1gdnigPgW6mTNtNxS4+u
 Jy3uh3dZQ/gIlF5gGTB98pyqivTgB5aujeF4kpTbg6l3zbNJyYdak/231TQnU+Y/7t
 jxiRRaoK7RnerVY6yfNI4HwTQcHKvXNY8CAGwls2v5tmWMx7wfI1Hs/vQjxVwYRMBP
 KqoRRGk0yVg6woPxTXUue58hsgcZZ6gZNUW23jq8sg+Bjve3vqqZ0maVc2N0JUBKqR
 G4Tcb+ziVm0qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lwZCnaMk
Subject: [Buildroot] [PATCH 1/1] package/wlroots: fix build with libinput
 1.31
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

QnVpbGRyb290IGNvbW1pdCAwNDMzYzhkMDJhZjgwM2RlOTBiNDFjNDJiYjQxYmJjOWYyZDQzNmZm
IGJ1bXBlZApsaWJpbnB1dCB0byB2ZXJzaW9uIDEuMzEuMCB3aGljaCBjYXVzZXMgYSBidWlsZCBl
cnJvciB3aXRoIHdscm9vdDoKCi4uL2JhY2tlbmQvbGliaW5wdXQvc3dpdGNoLmM6IEluIGZ1bmN0
aW9uIOKAmGhhbmRsZV9zd2l0Y2hfdG9nZ2xl4oCZOgouLi9iYWNrZW5kL2xpYmlucHV0L3N3aXRj
aC5jOjMyOjk6IGVycm9yOiBlbnVtZXJhdGlvbiB2YWx1ZQog4oCYTElCSU5QVVRfU1dJVENIX0tF
WVBBRF9TTElEReKAmSBub3QgaGFuZGxlZCBpbiBzd2l0Y2ggWy1XZXJyb3I9c3dpdGNoXQogICAz
MiB8ICAgICAgICAgc3dpdGNoIChsaWJpbnB1dF9ldmVudF9zd2l0Y2hfZ2V0X3N3aXRjaChzZXZl
bnQpKSB7CgpUaGUgYnVpbGQgZXJyb3Igd2FzIG5vdCB5ZXQgZGV0ZWN0ZWQgYnkgdGhlIGF1dG9i
dWlsZGVycyBidXQgY2FuIGJlCnJlcHJvZHVjZWQgdXNpbmcgdGhpcyBkZWZjb25maWc6CgpCUjJf
eDg2XzY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RP
UklFUz15CkJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQpCUjJfUEFD
S0FHRV9NRVNBM0Q9eQpCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfU09GVFBJUEU9
eQpCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0dMWD15CkJSMl9QQUNLQUdFX01FU0EzRF9PUEVO
R0xfRUdMPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FUz15CkJSMl9QQUNLQUdFX1hPUkc3
PXkKQlIyX1BBQ0tBR0VfV0xST09UUz15CgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0PgotLS0KIC4uLmliaW5wdXQtZml4LWJ1aWxkLXdpdGgtbGliaW5wdXQtMS4z
MS5wYXRjaCB8IDUxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS93bHJvb3RzLzAwMDEtYmFja2Vu
ZC1saWJpbnB1dC1maXgtYnVpbGQtd2l0aC1saWJpbnB1dC0xLjMxLnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS93bHJvb3RzLzAwMDEtYmFja2VuZC1saWJpbnB1dC1maXgtYnVpbGQtd2l0aC1s
aWJpbnB1dC0xLjMxLnBhdGNoIGIvcGFja2FnZS93bHJvb3RzLzAwMDEtYmFja2VuZC1saWJpbnB1
dC1maXgtYnVpbGQtd2l0aC1saWJpbnB1dC0xLjMxLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLmM1ZWYxMWVjZjAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L3dscm9vdHMvMDAwMS1iYWNrZW5kLWxpYmlucHV0LWZpeC1idWlsZC13aXRoLWxpYmlucHV0LTEu
MzEucGF0Y2gKQEAgLTAsMCArMSw1MSBAQAorRnJvbSBjMTQ1MmQ4ODExNDcxMGY1NzcyNjYyYjFk
OGVmYjljNzFlZGFhMzRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWxla3NlaSBC
YXZzaGluIDxhbGViYXN0cjg5QGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgNyBGZWIgMjAyNiAxNzo0
ODoxNiAtMDgwMAorU3ViamVjdDogW1BBVENIXSBiYWNrZW5kL2xpYmlucHV0OiBmaXggYnVpbGQg
d2l0aCBsaWJpbnB1dCAxLjMxCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvd2xyb290cy93bHJvb3RzLy0vY29tbWl0L2MxNDUyZDg4MTE0NzEwZjU3NzI2NjJiMWQ4
ZWZiOWM3MWVkYWEzNGMKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KKy0tLQorIGJhY2tlbmQvbGliaW5wdXQvbWVzb24uYnVpbGQgfCA0ICsrKysKKyBiYWNr
ZW5kL2xpYmlucHV0L3N3aXRjaC5jICAgIHwgNSArKysrKworIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9iYWNrZW5kL2xpYmlucHV0L21lc29uLmJ1aWxk
IGIvYmFja2VuZC9saWJpbnB1dC9tZXNvbi5idWlsZAoraW5kZXggYzI0NGViNzdhLi4wOTFiMGUw
ZWIgMTAwNjQ0CistLS0gYS9iYWNrZW5kL2xpYmlucHV0L21lc29uLmJ1aWxkCisrKysgYi9iYWNr
ZW5kL2xpYmlucHV0L21lc29uLmJ1aWxkCitAQCAtMjksMyArMjksNyBAQCBmZWF0dXJlcyArPSB7
ICdsaWJpbnB1dC1iYWNrZW5kJzogdHJ1ZSB9Cisgd2xyX2RlcHMgKz0gbGliaW5wdXQKKyAKKyBp
bnRlcm5hbF9jb25maWcuc2V0MTAoJ0hBVkVfTElCSU5QVVRfQlVTVFlQRScsIGxpYmlucHV0LnZl
cnNpb24oKS52ZXJzaW9uX2NvbXBhcmUoJz49MS4yNi4wJykpCisraW50ZXJuYWxfY29uZmlnLnNl
dDEwKAorKwknSEFWRV9MSUJJTlBVVF9TV0lUQ0hfS0VZUEFEX1NMSURFJywKKysJbGliaW5wdXQu
dmVyc2lvbigpLnZlcnNpb25fY29tcGFyZSgnPj0xLjMwLjkwMScpCisrKQorZGlmZiAtLWdpdCBh
L2JhY2tlbmQvbGliaW5wdXQvc3dpdGNoLmMgYi9iYWNrZW5kL2xpYmlucHV0L3N3aXRjaC5jCitp
bmRleCBhYmVlYzg2ZDcuLjlkZGUzYzljYiAxMDA2NDQKKy0tLSBhL2JhY2tlbmQvbGliaW5wdXQv
c3dpdGNoLmMKKysrKyBiL2JhY2tlbmQvbGliaW5wdXQvc3dpdGNoLmMKK0BAIC0yLDYgKzIsNyBA
QAorICNpbmNsdWRlIDxsaWJpbnB1dC5oPgorICNpbmNsdWRlIDx3bHIvaW50ZXJmYWNlcy93bHJf
c3dpdGNoLmg+CisgI2luY2x1ZGUgImJhY2tlbmQvbGliaW5wdXQuaCIKKysjaW5jbHVkZSAiY29u
ZmlnLmgiCisgCisgY29uc3Qgc3RydWN0IHdscl9zd2l0Y2hfaW1wbCBsaWJpbnB1dF9zd2l0Y2hf
aW1wbCA9IHsKKyAJLm5hbWUgPSAibGliaW5wdXQtc3dpdGNoIiwKK0BAIC0zNiw2ICszNywxMCBA
QCB2b2lkIGhhbmRsZV9zd2l0Y2hfdG9nZ2xlKHN0cnVjdCBsaWJpbnB1dF9ldmVudCAqZXZlbnQs
CisgCWNhc2UgTElCSU5QVVRfU1dJVENIX1RBQkxFVF9NT0RFOgorIAkJd2xyX2V2ZW50LnN3aXRj
aF90eXBlID0gV0xSX1NXSVRDSF9UWVBFX1RBQkxFVF9NT0RFOworIAkJYnJlYWs7CisrI2lmIEhB
VkVfTElCSU5QVVRfU1dJVENIX0tFWVBBRF9TTElERQorKwljYXNlIExJQklOUFVUX1NXSVRDSF9L
RVlQQURfU0xJREU6CisrCQlyZXR1cm47CisrI2VuZGlmCisgCX0KKyAJc3dpdGNoIChsaWJpbnB1
dF9ldmVudF9zd2l0Y2hfZ2V0X3N3aXRjaF9zdGF0ZShzZXZlbnQpKSB7CisgCWNhc2UgTElCSU5Q
VVRfU1dJVENIX1NUQVRFX09GRjoKKy0tIAorR2l0TGFiCisKLS0gCjIuNDcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
