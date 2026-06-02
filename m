Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290ECD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B3060BF2;
	Tue,  2 Jun 2026 10:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8Hl0Rjn1wle; Tue,  2 Jun 2026 10:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41BA860BE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780396872;
	bh=vbv2B12L6yzfzPlEP+tJ1qH081qqP9wVKC6Dm2S8n8Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WbacRYKs8+MFWtmQ10/0MhvNe6/sMCuL03cLJYFgKH85uZGvjFR3DVtawsb7YpHgz
	 Lf5htJNSkKcEh9epHMn0xZAEhZQexxf/N2/URup9RhFwSh9C9R2Dq4MLqAurxHfscT
	 0E85MX+LgvGLMAqd2Twc6ZAWODeR/mJJVGx5iefqHmcwaGyzihSv8Qoip2P3Ya6Xff
	 qPZ3Wo/LS5SN9A88pF4z64omvGryDGJuuFPuC3hjepJ3ngNIHpAfBVdwKMceWS0XKx
	 LDubjbd+sXQC61yCUuwP1O7S6fhWWAI98a6UYH6u8Vka/YonCdiAf+2H3rMPnDQVUy
	 nVwHvJNzArlEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41BA860BE1;
	Tue,  2 Jun 2026 10:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F34A33C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3ACB40366
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 10:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72XL01_7HucN for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 10:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A03104035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03104035F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A03104035F
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 10:41:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4295B97C729; Tue,  2 Jun 2026 12:41:06 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Tue,  2 Jun 2026 12:41:05 +0200
Message-ID: <20260602104105.729293-1-arnout@rnout.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780396867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=DHsc/g5BRx3DhC8t+704KzHQu0wYivilmOjr452qSEo=;
 b=K9BrVXsUc5LBt6v1ddr880YofvycCfJdttwQMyaLAHnjkSysMbbfczr2nQ6GC+J2ySUjz5
 ekmHmsCWzA1pDQizeye7mM1CZT7+bbYgS0b07Vb5BGs0Yq7eecaMfa2qWl31wzBQ5EjfXp
 vL5ec5pvriJzq+sZg6WEDRoUdp1UuO17ZxHY+zyMUd8UqjLPKmUZR3yV5r38gvBKtOsaIX
 ezXSyuK5tdu5MlZq89Yj6+aZNDPVGF1Bw4lj4eyzsKk60YbGfQzBMTgvLUIt8jI0yea9Q9
 mRMPl3NBgdXcSTDnHfHr2FtKeshNcit+P+ivnIJxpiOl+7h/svm8nfkpm7vt7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=K9BrVXsU
Subject: [Buildroot] [PATCH 2025.02.x] package/systemd: fix host build with
 7.0+ kernel
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGludXggdjcuMCBpbnRyb2R1Y2VkIGEgZmV3IG1vcmUgZXJybm8gdmFsdWVzIHRoYXQgYXJlIGFs
aWFzZXMgb2Ygb3RoZXIKZXJybm9zLiBUaGlzIGNhdXNlcyB0aGUgZm9sbG93aW5nIGVycm9yOgoK
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9iYXNpYy9lcnJuby1saXN0LmM6MTM6CnNyYy9i
YXNpYy9lcnJuby10by1uYW1lLmg6NzE6MjM6IGVycm9yOiBpbml0aWFsaXplZCBmaWVsZCBvdmVy
d3JpdHRlbiBbLVdlcnJvcj1vdmVycmlkZS1pbml0XQogICA3MSB8ICAgICAgICAgW0VGU0JBRENS
Q10gPSAiRUZTQkFEQ1JDIiwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn4Kc3JjL2Jhc2ljL2Vycm5vLXRvLW5hbWUuaDo3MToyMzogbm90ZTogKG5lYXIgaW5pdGlhbGl6
YXRpb24gZm9yIOKAmGVycm5vX25hbWVzWzc0XeKAmSkKc3JjL2Jhc2ljL2Vycm5vLXRvLW5hbWUu
aDoxMTQ6MjY6IGVycm9yOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdlcnJvcj1v
dmVycmlkZS1pbml0XQogIDExNCB8ICAgICAgICAgW0VGU0NPUlJVUFRFRF0gPSAiRUZTQ09SUlVQ
VEVEIiwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4Kc3Jj
L2Jhc2ljL2Vycm5vLXRvLW5hbWUuaDoxMTQ6MjY6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9u
IGZvciDigJhlcnJub19uYW1lc1sxMTdd4oCZKQpjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJl
YXRlZCBhcyBlcnJvcnMKCkZvciB0YXJnZXQgc3lzdGVtZCB0aGlzIGlzIG5vdCBhbiBpc3N1ZSBh
cyB3ZSBkb24ndCBzdXBwb3J0IHY3LjAsCmhvd2V2ZXIgaXQgYWxzbyBvY2N1cnMgZm9yIGhvc3Qt
c3lzdGVtZCB3aGVuIGJ1aWxkaW5nIG9uIGEgc3lzdGVtIHdpdGgKa2VybmVsIHY3LjArLgoKQmFj
a3BvcnQgYW4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBleGNsdWRlcyB0aGVzZSB0d28gZXJybm9zIGZy
b20gdGhlCmVycm5vLXRvLW5hbWUgYXJyYXkuIFRoZSB1cHN0cmVhbSBwYXRjaCB3YXMgYXBwbGll
ZCB0byB2MjYxIGFuZApiYWNrcG9ydGVkIHRvIHYyNTguNSwgYnV0IGl0IHdhcyBub3QgYmFja3Bv
cnRlZCB0byB2MjU2LXN0YWJsZSAod2hpY2ggaXMKRU9MKS4KClNpZ25lZC1vZmYtYnk6IEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+Ci0tLQogLi4uaWx0ZXItb3V0LUVGU0JB
RENSQy1hbmQtRUZTQ09SUlVQVEVELnBhdGNoIHwgMzcgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3N5c3RlbWQvMDAwMi1lcnJuby1saXN0LWZpbHRlci1vdXQtRUZTQkFEQ1JDLWFuZC1FRlNDT1JS
VVBURUQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvMDAwMi1lcnJuby1saXN0
LWZpbHRlci1vdXQtRUZTQkFEQ1JDLWFuZC1FRlNDT1JSVVBURUQucGF0Y2ggYi9wYWNrYWdlL3N5
c3RlbWQvMDAwMi1lcnJuby1saXN0LWZpbHRlci1vdXQtRUZTQkFEQ1JDLWFuZC1FRlNDT1JSVVBU
RUQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzhmZDBiYWY0
NQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAyLWVycm5vLWxpc3QtZmls
dGVyLW91dC1FRlNCQURDUkMtYW5kLUVGU0NPUlJVUFRFRC5wYXRjaApAQCAtMCwwICsxLDM3IEBA
CitGcm9tIGFkNmEyOTk4NWI2ZDc4YTM3YWY1NjE2MzM4ZTUxYmFmYzg2NTNjNzEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiBZdSBXYXRhbmFiZSA8d2F0YW5hYmUueXUrZ2l0aHViQGdt
YWlsLmNvbT4KK0RhdGU6IFR1ZSwgMjQgRmViIDIwMjYgMjA6MTk6NDUgKzA5MDAKK1N1YmplY3Q6
IFtQQVRDSF0gZXJybm8tbGlzdDogZmlsdGVyIG91dCBFRlNCQURDUkMgYW5kIEVGU0NPUlJVUFRF
RAorCitUaGVzZSBhcmUgaW50cm9kdWNlZCBpbiBrZXJuZWwgdjcuMC4KKworVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0LzNjZmIxNjk5ODgwOGE2ZWM4
MDEyYTYxMjBkMGE4MmYwZTFhMGM4YmIKK1NpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAcm5vdXQuYmU+CistLS0KKyBzcmMvYmFzaWMvZ2VuZXJhdGUtZXJybm8tbGlz
dC5zaCB8IDEwICsrKysrKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL2dlbmVyYXRlLWVycm5vLWxp
c3Quc2ggYi9zcmMvYmFzaWMvZ2VuZXJhdGUtZXJybm8tbGlzdC5zaAoraW5kZXggZjc1NmIyZTAy
MC4uNDkxZmExYjZlMyAxMDA3NTUKKy0tLSBhL3NyYy9iYXNpYy9nZW5lcmF0ZS1lcnJuby1saXN0
LnNoCisrKysgYi9zcmMvYmFzaWMvZ2VuZXJhdGUtZXJybm8tbGlzdC5zaAorQEAgLTMsOSArMywx
MyBAQAorIHNldCAtZXUKKyBzZXQgLW8gcGlwZWZhaWwKKyAKKy0jIEluIGtlcm5lbCdzIGFyY2gv
cGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vZXJybm8uaCwgRUNBTkNFTExFRCBhbmQgRVJFRlVTRUQg
YXJlIGRlZmluZWQgYXMgYWxpYXNlcyBvZgorLSMgRUNBTkNFTEVEIGFuZCBFQ09OTlJFRlVTRUQs
IHJlc3BlY3RpdmVseS4gTGV0J3MgZHJvcCB0aGVtLgorKyMgSW4ga2VybmVsJ3MgYXJjaC9wYXJp
c2MvaW5jbHVkZS91YXBpL2FzbS9lcnJuby5oLCBUaGUgZm9sbG93aW5nIGFsaWFzZXMgYXJlIGRl
ZmluZWQ6CisrIyBFQ0FOQ0VMTEVEIOKGkiBFQ0FOQ0VMRUQKKysjIEVSRUZVU0VEIOKGkiBFQ09O
TlJFRlVTRUQKKysjIEVGU0JBRENSQyDihpIgRUJBRE1TRworKyMgRUZTQ09SUlVQVEVEIOKGkiBF
VUNMRUFOCisrIyBMZXQncyBkcm9wIHRoZW0uCisgCisgJHsxOj99IC1kTSAtaW5jbHVkZSBlcnJu
by5oIC0gPC9kZXYvbnVsbCB8IFwKKy0gICAgICAgZ3JlcCAtRXYgJ14jZGVmaW5lW1s6c3BhY2U6
XV0rKEVDQU5DRUxMRUR8RVJFRlVTRUQpJyB8IFwKKysgICAgICAgZ3JlcCAtRXYgJ14jZGVmaW5l
W1s6c3BhY2U6XV0rKEVDQU5DRUxMRUR8RVJFRlVTRUR8RUZTQkFEQ1JDfEVGU0NPUlJVUFRFRCkn
IHwgXAorICAgICAgICBhd2sgJy9eI2RlZmluZVsgXHRdK0VbXiBfXStbIFx0XSsvIHsgcHJpbnQg
JDI7IH0nCistLSAKKzIuNTQuMAorCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
