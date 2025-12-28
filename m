Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D1BD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9542140342;
	Sun, 28 Dec 2025 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7yY34o6LBP2; Sun, 28 Dec 2025 21:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F6140465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766956266;
	bh=c8Zs0Kn5VoDcKTuNMgTU9a3QlP2f3QMaamNQL4gQxds=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c37DqZhtrkyWqitw72Pv/7XAl44DkQ8H+dyeb6B0sHIhBU6rlhvWyeVbw0zU+N9uh
	 5ar136GHz0Sx2juZJD79ImU7vOyISakadyMo0VG0siSlKuOh8cAk475guPDKHLvfn3
	 V5qhrCEKZHgGt0Q+XpN00jMg8AmWhh68+Zt15gXFQ/GpzrNtDxJlJiQI+ABNIKY2mR
	 Y6pZk2+Fx/HviB2ubzEJOlricmrW/GL7rOWkvZ0tMtKrTNO9TupeOBedjw278upy7d
	 l9jndp22LDgC8KtwHoywvDQSVqHJjJEXJ3JTnD8LjPhV0zSoRZAXax2Y8x/o3UBsiC
	 gPVPrg9wz1Zgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F6140465;
	Sun, 28 Dec 2025 21:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7D9B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4263F401D7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XRSOGi-j3FG for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3221E4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3221E4007C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3221E4007C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7AA921A24C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B67360725;
 Sun, 28 Dec 2025 21:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 539BC119792C9; Sun, 28 Dec 2025 22:10:59 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 22:10:41 +0100
Message-ID: <20251228211045.3059593-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766956259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BUzsqpFQOBqX33PmD/YRf7XQdfC0yjSDxrJQ50CyxY4=;
 b=abH0IidZHplDHDFZdJE+fU0J3aYG3JrrYszAU1hbCTY+ts9ahEiS5Bo2/ll0RTLlSnKHyR
 Y2zZ45N9Pvi7grbXf32eu3DsgMJduVsx1Z1yX18O71FZNM3Fqm8K3i+NreS95Anz41Mwds
 vHRXFcwC7CqvU11BKVLfHp4aA1k6sqPO4gTp89GLdid98xSyu54BRV+Lf0wBS602RUQwfG
 DTN2Aqp+7DrcdJu7nIGrO1kSMrveyO2RNIXl4IfqLUpTw8TWXzxkQ8rQy26VFKJen/ddD2
 PAQdkhySX2RyCdQjSls9qqtHn8FxoS3SgW2Zuh/ORiLsAJP2BAMTkeMI0HNn3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=abH0IidZ
Subject: [Buildroot] [PATCH 3/5] package/qt5/qt5webkit: add patch to fix
 missing <cstdint> include
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgaXMgbm90IGNsZWFyIHdoaWNoIGNoYW5nZSBpbnRyb2R1Y2UgdGhpcyBicmVha2FnZSwgYnV0
IHdlIHN1c3BlY3QKaXQgaXMgcmVsYXRlZCB0byBHQ0MgMTQueC4gSW4gYW55IGNhc2UsIHRoZSBm
aXggZG9lcyBubyBoYXJtIGFuZCBpcwpnb29kIHRvIGJhY2twb3J0IHRvIDIwMjUuMDIueC4KCkZp
eGVzOgoKL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9ici9vdXRwdXQtYWxsL2J1aWxkL3F0NXdlYmtp
dC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL21hdGh1
dGlsLmg6NTc1Ojg6IGVycm9yOiDigJh1aW50MzJfdOKAmSBkb2VzIG5vdCBuYW1lIGEgdHlwZQog
IDU3NSB8IGlubGluZSB1aW50MzJfdCBSb3RMKHVpbnQzMl90IHgsIGludDhfdCByKQogICAgICB8
ICAgICAgICBefn5+fn5+fgovaG9tZS90aG9tYXMvYnVpbGRyb290L2JyL291dHB1dC1hbGwvYnVp
bGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9j
b21tb24vbWF0aHV0aWwuaDoxOToxOiBub3RlOiDigJh1aW50MzJfdOKAmSBpcyBkZWZpbmVkIGlu
IGhlYWRlciDigJg8Y3N0ZGludD7igJk7IHRoaXMgaXMgcHJvYmFibHkgZml4YWJsZSBieSBhZGRp
bmcg4oCYI2luY2x1ZGUgPGNzdGRpbnQ+4oCZCiAgIDE4IHwgI2luY2x1ZGUgPHN0ZGxpYi5oPgog
ICsrKyB8KyNpbmNsdWRlIDxjc3RkaW50PgogICAxOSB8CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIC4uLnktQU5HTEUt
c3JjLWNvbW1vbi1tYXRodXRpbC5oLWluY2x1ZC5wYXRjaCB8IDQ1ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMTItU291cmNlLVRoaXJkUGFydHktQU5HTEUtc3JjLWNv
bW1vbi1tYXRodXRpbC5oLWluY2x1ZC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0
NXdlYmtpdC8wMDEyLVNvdXJjZS1UaGlyZFBhcnR5LUFOR0xFLXNyYy1jb21tb24tbWF0aHV0aWwu
aC1pbmNsdWQucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAxMi1Tb3VyY2UtVGhpcmRQ
YXJ0eS1BTkdMRS1zcmMtY29tbW9uLW1hdGh1dGlsLmgtaW5jbHVkLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmU1MzAyNGE0YmQKLS0tIC9kZXYvbnVsbAorKysg
Yi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAxMi1Tb3VyY2UtVGhpcmRQYXJ0eS1BTkdMRS1zcmMt
Y29tbW9uLW1hdGh1dGlsLmgtaW5jbHVkLnBhdGNoCkBAIC0wLDAgKzEsNDUgQEAKK0Zyb20gMDVj
NWFlYzcyMmViZDc1MGVjMzQwNDQ0NGY5NDUxNTRjMjY2YjYyZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+CitEYXRlOiBTdW4sIDI4IERlYyAyMDI1IDE1OjUxOjI2ICswMTAwCitTdWJqZWN0OiBbUEFU
Q0hdIFNvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vbWF0aHV0aWwuaDogaW5jbHVk
ZQorIG1pc3NpbmcgaGVhZGVyCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisK
K0ZpeGVzOgorCisvaG9tZS90aG9tYXMvYnVpbGRyb290L2JyL291dHB1dC1hbGwvYnVpbGQvcXQ1
d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24v
bWF0aHV0aWwuaDo1NzU6ODogZXJyb3I6IOKAmHVpbnQzMl904oCZIGRvZXMgbm90IG5hbWUgYSB0
eXBlCisgIDU3NSB8IGlubGluZSB1aW50MzJfdCBSb3RMKHVpbnQzMl90IHgsIGludDhfdCByKQor
ICAgICAgfCAgICAgICAgXn5+fn5+fn4KKy9ob21lL3Rob21hcy9idWlsZHJvb3QvYnIvb3V0cHV0
LWFsbC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQvU291cmNlL1RoaXJkUGFydHkvQU5H
TEUvc3JjL2NvbW1vbi9tYXRodXRpbC5oOjE5OjE6IG5vdGU6IOKAmHVpbnQzMl904oCZIGlzIGRl
ZmluZWQgaW4gaGVhZGVyIOKAmDxjc3RkaW50PuKAmTsgdGhpcyBpcyBwcm9iYWJseSBmaXhhYmxl
IGJ5IGFkZGluZyDigJgjaW5jbHVkZSA8Y3N0ZGludD7igJkKKyAgIDE4IHwgI2luY2x1ZGUgPHN0
ZGxpYi5oPgorICArKysgfCsjaW5jbHVkZSA8Y3N0ZGludD4KKyAgIDE5IHwKKworVGFrZW4gZnJv
bSBGZWRvcmEsIGFsc28gdXNlZCBvbiBBcmNoIExpbnV4OgorCisgIGh0dHBzOi8vc3JjLmZlZG9y
YXByb2plY3Qub3JnL3JwbXMvcXQ1LXF0d2Via2l0L3Jhdy9yYXdoaWRlL2YvcXR3ZWJraXQtY3N0
ZGludC5wYXRjaAorICBodHRwczovL2F1ci5hcmNobGludXgub3JnL3BhY2thZ2VzL3F0NS13ZWJr
aXQKKworVXBzdHJlYW06IGRlYWQsIE4vQQorU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KKy0tLQorIFNvdXJjZS9UaGlyZFBhcnR5
L0FOR0xFL3NyYy9jb21tb24vbWF0aHV0aWwuaCB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvc3JjL2Nv
bW1vbi9tYXRodXRpbC5oIGIvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvc3JjL2NvbW1vbi9tYXRo
dXRpbC5oCitpbmRleCA3OTU5ZGE4YmRjYmMuLmM4NmFmZDYxZTEwMyAxMDA2NDQKKy0tLSBhL1Nv
dXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vbWF0aHV0aWwuaAorKysrIGIvU291cmNl
L1RoaXJkUGFydHkvQU5HTEUvc3JjL2NvbW1vbi9tYXRodXRpbC5oCitAQCAtMTYsNiArMTYsNyBA
QAorICNpbmNsdWRlIDxhbGdvcml0aG0+CisgI2luY2x1ZGUgPHN0cmluZy5oPgorICNpbmNsdWRl
IDxzdGRsaWIuaD4KKysjaW5jbHVkZSA8Y3N0ZGludD4KKyAKKyBuYW1lc3BhY2UgZ2wKKyB7Cist
LSAKKzIuNTIuMAorCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
