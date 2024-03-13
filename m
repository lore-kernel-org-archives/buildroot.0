Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A39C54E66
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2187782001;
	Wed, 13 Mar 2024 22:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnX2faHYVq91; Wed, 13 Mar 2024 22:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE87482005
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE87482005;
	Wed, 13 Mar 2024 22:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53F01BF3D9
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 22:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD02A402C3
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 22:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PCMU5GM9Osm for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 22:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78E7B40515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E7B40515
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78E7B40515
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 22:50:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 93F50C2728
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 22:46:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABA24E0005;
 Wed, 13 Mar 2024 22:46:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Mar 2024 23:46:10 +0100
Message-ID: <20240313224610.2743219-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
References: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1710369974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXSHKqXUs4bJMpeyNp7RFyBk0tiJ+0DmIKh2+3KM+kU=;
 b=pGrNU+V3XUt/CnrulQeiupklc6EgjWrihVk9coGI6/5hBX3G5Wt3rx3uvMSSPScepoz6EP
 bGEviBxhhH5tvupZ29wQTU26sVu7D+YgciQTGbrDccEyBpUWFosPeV2h8rHNkxHO4jQCNf
 vcNgSgH5u0SGDYSOXFd6jj6RCak16FibNIQ/83LKwzWoy53eeDZ/fS0P6wt7fW3JGmj9jb
 ZE+2EVWVdJsRYQmkMcrq48D+sjU0EVpq2cg2jSGYyKZ07mfWEScIKo8hwrYkyMGCkksew1
 M5LXu7KgzOq5dsYGqMVWdW3CD+tQUvSQhte4J9BllGYW63sv/uYGF28nzwMJVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pGrNU+V3
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5webkit: fix WebCore
 compatibility issue with updated libxml2
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCnF0NXdl
YmtpdCBidWlsZCBjdXJyZW50bHkgYnJlYWtzIG9uIHRoZSBmb2xsb3dpbmcgZXJyb3I6CgpYU0xT
dHlsZVNoZWV0TGlieHNsdC5jcHA6MTQ4OjEyOTogZXJyb3I6IGludmFsaWQgY29udmVyc2lvbiBm
cm9tIOKAmHZvaWQgKCopKHZvaWQqLCB4bWxFcnJvciop4oCZIHtha2Eg4oCYdm9pZCAoKikodm9p
ZCosIF94bWxFcnJvciop4oCZfSB0byDigJh4bWxTdHJ1Y3R1cmVkRXJyb3JGdW5j4oCZIHtha2Eg
4oCYdm9pZCAoKikodm9pZCosIGNvbnN0IF94bWxFcnJvciop4oCZfSBbLWZwZXJtaXNzaXZlXQog
IDE0OCB8ICAgICBYTUxEb2N1bWVudFBhcnNlclNjb3BlIHNjb3BlKGNhY2hlZFJlc291cmNlTG9h
ZGVyKCksIFhTTFRQcm9jZXNzb3I6OmdlbmVyaWNFcnJvckZ1bmMsIFhTTFRQcm9jZXNzb3I6OnBh
cnNlRXJyb3JGdW5jLCBjb25zb2xlKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKCopKHZvaWQqLCB4bWxF
cnJvciopIHtha2Egdm9pZCAoKikodm9pZCosIF94bWxFcnJvciopfQoKVGhpcyBlcnJvciBpcyBk
dWUgdG8gYW4gQVBJIHVwZGF0ZSBpbiBsaWJ4bWwyLCBlbmZvcmNpbmcgY29uc3Qgb24gbW9yZQpz
dHJ1Y3QgaW4gdmVyc2lvbiAyLjEyLjAgKHNlZSBbMV0pLiBCdWlsZHJvb3Qgbm93IHRyYWNrcyB2
Mi4xMi41LgpVcHN0cmVhbSBXZWJraXQgcHJvamVjdCBoYXMgYWxyZWFkeSBpc3N1ZWQgdGhlIGNv
cnJlc3BvbmRpbmcgZml4IChbMl0pLAp3aGljaCB1cGRhdGVzIGNvcnJlc3BvbmRpbmcgaW50ZXJu
YWwgcHJvdG90eXBlcyBkZXBlbmRpbmcgb24gbGlieG1sMgp2ZXJzaW9uLCBidXQgdGhlIHF0NXdl
YmtpdCB2ZXJzaW9uIHRyYWNrZWQgaW4gYnVpbGRyb290IGRvZXMgbm90IGludGVncmF0ZQp0aGUg
Y29ycmVzcG9uZGluZyBXZWJraXQgdmVyc2lvbi4KCkZpeCB0aGlzIGJ1aWxkIGlzc3VlIGJ5IGJy
aW5naW5nIHRoZSB1cHN0cmVhbSBwYXRjaCAiYXMgaXMiIGZyb20gV2Via2l0CgpbMV0gaHR0cHM6
Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvLS9yZWxlYXNlcy92Mi4xMi4wClsyXSBo
dHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvMWJhZDE3NmIyNDk2NTc5ZDc2
MDg1MmM4MGNmZjNhZDlmYjdjM2E0YgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiAuLi4tbGlieG1sMi12ZXJzaW9uLTIuMTIu
MC1kdWUtdG8tQVBJLWMucGF0Y2ggfCA2MSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0
NXdlYmtpdC8wMDA4LUJ1aWxkLWZhaWxzLXdpdGgtbGlieG1sMi12ZXJzaW9uLTIuMTIuMC1kdWUt
dG8tQVBJLWMucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAwOC1C
dWlsZC1mYWlscy13aXRoLWxpYnhtbDItdmVyc2lvbi0yLjEyLjAtZHVlLXRvLUFQSS1jLnBhdGNo
IGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMDgtQnVpbGQtZmFpbHMtd2l0aC1saWJ4bWwyLXZl
cnNpb24tMi4xMi4wLWR1ZS10by1BUEktYy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmQ2ZjM3OWFlOGVjZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
cXQ1L3F0NXdlYmtpdC8wMDA4LUJ1aWxkLWZhaWxzLXdpdGgtbGlieG1sMi12ZXJzaW9uLTIuMTIu
MC1kdWUtdG8tQVBJLWMucGF0Y2gKQEAgLTAsMCArMSw2MSBAQAorRnJvbSBkZjQ5YmZjNGM5MzAw
MTk3MGM5YjkyNjY5MDNlZTdlODgwNGZiNTc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+CitEYXRlOiBNb24s
IDIwIE5vdiAyMDIzIDA3OjQyOjMwIC0wODAwCitTdWJqZWN0OiBbUEFUQ0hdIEJ1aWxkIGZhaWxz
IHdpdGggbGlieG1sMiB2ZXJzaW9uIDIuMTIuMCBkdWUgdG8gQVBJIGNoYW5nZQorIGh0dHBzOi8v
YnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yNjUxMjgKKworUmV2aWV3ZWQgYnkgUGhp
bGlwcGUgTm9ybWFuZC4KKworU3RhcnRpbmcgd2l0aCBsaWJ4bWwyIDIuMTIuMCwgdGhlIEFQSSBo
YXMgY2hhbmdlZCB0aGUgY29uc3QtbmVzcyBvZiB0aGUKK3htbEVycm9yIHBvaW50ZXJzLCB3aGlj
aCByZXN1bHRzIGluIGEgYnVpbGQgZXJyb3IgZHVlIHRvIGEgbWlzbWF0Y2hlZAordHlwZSBpbiB0
aGUgcGFyc2luZyBlcnJvciBjYWxsYmFjay4gVGhpcyBwYXBlcnMgb3ZlciB0aGUgZGlmZmVyZW5j
ZSBieQordXNpbmcgcHJlcHJvY2Vzc29yIGNvbmRpdGlvbmFscy4KKworKiBTb3VyY2UvV2ViQ29y
ZS94bWwvWFNMVFByb2Nlc3Nvci5oOiBVc2UgY29uc3Qgd2hlbiBidWlsZGluZyBhZ2FpbnN0Cisg
IGxpYnhtbDIgMi4xMi4wIG9yIG5ld2VyLgorKiBTb3VyY2UvV2ViQ29yZS94bWwvWFNMVFByb2Nl
c3NvckxpYnhzbHQuY3BwOgorKFdlYkNvcmU6OlhTTFRQcm9jZXNzb3I6OnBhcnNlRXJyb3JGdW5j
KTogRGl0dG8uCisKK0Nhbm9uaWNhbCBsaW5rOiBodHRwczovL2NvbW1pdHMud2Via2l0Lm9yZy8y
NzA5NzdAbWFpbgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2Nv
bW1pdC8xYmFkMTc2YjI0OTY1NzlkNzYwODUyYzgwY2ZmM2FkOWZiN2MzYTRiCitTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgorLS0tCisg
U291cmNlL1dlYkNvcmUveG1sL1hTTFRQcm9jZXNzb3IuaCAgICAgICAgICB8IDQgKysrKworIFNv
dXJjZS9XZWJDb3JlL3htbC9YU0xUUHJvY2Vzc29yTGlieHNsdC5jcHAgfCA0ICsrKysKKyAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvU291cmNlL1dlYkNv
cmUveG1sL1hTTFRQcm9jZXNzb3IuaCBiL1NvdXJjZS9XZWJDb3JlL3htbC9YU0xUUHJvY2Vzc29y
LmgKK2luZGV4IDIxYmI0NWI1Y2JlMS4uNWNmMjA1NTc5MThmIDEwMDY0NAorLS0tIGEvU291cmNl
L1dlYkNvcmUveG1sL1hTTFRQcm9jZXNzb3IuaAorKysrIGIvU291cmNlL1dlYkNvcmUveG1sL1hT
TFRQcm9jZXNzb3IuaAorQEAgLTYxLDcgKzYxLDExIEBAIHB1YmxpYzoKKyAKKyAgICAgdm9pZCBy
ZXNldCgpOworIAorKyNpZiBMSUJYTUxfVkVSU0lPTiA+PSAyMTIwMAorKyAgICBzdGF0aWMgdm9p
ZCBwYXJzZUVycm9yRnVuYyh2b2lkKiB1c2VyRGF0YSwgY29uc3QgeG1sRXJyb3IqKTsKKysjZWxz
ZQorICAgICBzdGF0aWMgdm9pZCBwYXJzZUVycm9yRnVuYyh2b2lkKiB1c2VyRGF0YSwgeG1sRXJy
b3IqKTsKKysjZW5kaWYKKyAgICAgc3RhdGljIHZvaWQgZ2VuZXJpY0Vycm9yRnVuYyh2b2lkKiB1
c2VyRGF0YSwgY29uc3QgY2hhciogbXNnLCAuLi4pOworICAgICAKKyAgICAgLy8gT25seSBmb3Ig
bGliWFNMVCBjYWxsYmFja3MKK2RpZmYgLS1naXQgYS9Tb3VyY2UvV2ViQ29yZS94bWwvWFNMVFBy
b2Nlc3NvckxpYnhzbHQuY3BwIGIvU291cmNlL1dlYkNvcmUveG1sL1hTTFRQcm9jZXNzb3JMaWJ4
c2x0LmNwcAoraW5kZXggYTY1NjkxMDg3ZTNjLi45ZjZiMzYzZGZjNmMgMTAwNjQ0CistLS0gYS9T
b3VyY2UvV2ViQ29yZS94bWwvWFNMVFByb2Nlc3NvckxpYnhzbHQuY3BwCisrKysgYi9Tb3VyY2Uv
V2ViQ29yZS94bWwvWFNMVFByb2Nlc3NvckxpYnhzbHQuY3BwCitAQCAtNTksNyArNTksMTEgQEAg
dm9pZCBYU0xUUHJvY2Vzc29yOjpnZW5lcmljRXJyb3JGdW5jKHZvaWQqLCBjb25zdCBjaGFyKiwg
Li4uKQorICAgICAvLyBJdCB3b3VsZCBiZSBuaWNlIHRvIGRvIHNvbWV0aGluZyB3aXRoIHRoaXMg
ZXJyb3IgbWVzc2FnZS4KKyB9CisgCisrI2lmIExJQlhNTF9WRVJTSU9OID49IDIxMjAwCisrdm9p
ZCBYU0xUUHJvY2Vzc29yOjpwYXJzZUVycm9yRnVuYyh2b2lkKiB1c2VyRGF0YSwgY29uc3QgeG1s
RXJyb3IqIGVycm9yKQorKyNlbHNlCisgdm9pZCBYU0xUUHJvY2Vzc29yOjpwYXJzZUVycm9yRnVu
Yyh2b2lkKiB1c2VyRGF0YSwgeG1sRXJyb3IqIGVycm9yKQorKyNlbmRpZgorIHsKKyAgICAgUGFn
ZUNvbnNvbGVDbGllbnQqIGNvbnNvbGUgPSBzdGF0aWNfY2FzdDxQYWdlQ29uc29sZUNsaWVudCo+
KHVzZXJEYXRhKTsKKyAgICAgaWYgKCFjb25zb2xlKQorLS0gCisyLjQzLjEKKwotLSAKMi40My4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
