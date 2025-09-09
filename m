Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C72CAC587
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 07:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49A280AE4;
	Tue,  9 Sep 2025 07:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EmpaM-dzLop; Tue,  9 Sep 2025 07:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9137180A67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9137180A67;
	Tue,  9 Sep 2025 07:24:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0AE7CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6AE240FDD
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5Td7HE3vHEG for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 07:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B51F740BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51F740BE8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B51F740BE8
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:24:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C63C2007A;
 Tue,  9 Sep 2025 07:24:25 +0000 (UTC)
Date: Tue, 09 Sep 2025 09:24:19 +0200
MIME-Version: 1.0
Message-Id: <20250909-fix_php_lua-v1-1-f3e379f98bf9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIACLWv2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3bTMiviCjIL4nNJEXcukNHMLc6MkI9MkUyWgjoKiVKA02LTo2Np
 aALrWuHhdAAAA
X-Change-ID: 20250908-fix_php_lua-9bf7872b25b5
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedukedvffeiheeuuefgudejgfdtvdegkedvtdeiffffleevtdegffejkeejlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 egrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehorhholhhirgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1757402665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QTqKEyHznO8QQrhza9VXqnWWXTlJ8EYmuBlhcFdvm7M=;
 b=fGriQOTQvhQH/FUNqWhl/glt/a3XF1u//mcZOLXge4N9yHjIXlskUR4PMfrBY5tePYCdq6
 dXyTnUVmK8L8PC2UcDhd8ST+6X6DVW3LT5A+jkHUyISFp7j1smF4OaT9qCOZKer+0HhlMT
 GWkRUTRnm17i9k3JHvIfpiNkd7WWxR1zm8FwPYcsi0o3vo5/AP+ZIj21hKe5QjYB+v2mMR
 gJ6vr3jrXdFQMgI/hpVfJ55dIvjXBfRgunEce7rYbR2JLjlvwAZuODxEqLdOxn8MzguNgG
 BbcLOXTvpIj2XU7zeSE3/YODKThmnCre7lfeVEfjAA3murOR4YDDvrtuUSGUow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fGriQOTQ
Subject: [Buildroot] [PATCH] package/php-lua: fix build with lua < 5.2
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Romain Naour <romain.naour@smile.fr>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGhwLWx1YSBmYWlscyB0byBidWlsZCBpbiBidWlsZHJvb3QgMjAyNS4wOC1yYzMgb24gdGhlIGZv
bGxvd2luZyBlcnJvcjoKCmluIGZpbGUgaW5jbHVkZWQgZnJvbSBbLi4uXS91c3IvaW5jbHVkZS9w
aHAvWmVuZC96ZW5kLmg6MzIsCiAgICAgICAgICAgICAgICAgZnJvbSBbLi4uXS91c3IvaW5jbHVk
ZS9waHAvbWFpbi9waHAuaDozMSwKICAgICAgICAgICAgICAgICBmcm9tIFsuLi5dL2J1aWxkL3Bo
cC1sdWEtMi4wLjcvbHVhLmM6MjQ6ClsuLi5dL2J1aWxkL3BocC1sdWEtMi4wLjcvbHVhLmM6IElu
IGZ1bmN0aW9uIOKAmHBocF9sdWFfd3JpdGVfcHJvcGVydHnigJk6ClsuLi5dL2J1aWxkL3BocC1s
dWEtMi4wLjcvbHVhLmM6MjQ3OjM3OgplcnJvcjog4oCYdmFs4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuCuKAmHp2YWzigJk/CiAgMjQ3IHwg
ICAgICAgICBsdWFfcHVzaGxzdHJpbmcoTCwgWlNUUl9WQUwodmFsKSwgWlNUUl9MRU4odmFsKSk7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+ClsuLi5dL3Vz
ci9pbmNsdWRlL3BocC9aZW5kL3plbmRfc3RyaW5nLmg6NjY6MjY6Cm5vdGU6IGluIGRlZmluaXRp
b24gb2YgbWFjcm8g4oCYWlNUUl9WQUzigJkKICAgNjYgfCAjZGVmaW5lIFpTVFJfVkFMKHpzdHIp
ICAoenN0ciktPnZhbAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+ClsuLi5d
L2J1aWxkL3BocC1sdWEtMi4wLjcvbHVhLmM6MjQ3OjM3Ogpub3RlOiBlYWNoIHVuZGVjbGFyZWQg
aWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24KaXQgYXBw
ZWFycyBpbgogIDI0NyB8ICAgICAgICAgbHVhX3B1c2hsc3RyaW5nKEwsIFpTVFJfVkFMKHZhbCks
IFpTVFJfTEVOKHZhbCkpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fgpbLi4uXS91c3IvaW5jbHVkZS9waHAvWmVuZC96ZW5kX3N0cmluZy5oOjY2OjI2Ogpu
b3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFpTVFJfVkFM4oCZCiAgIDY2IHwgI2RlZmlu
ZSBaU1RSX1ZBTCh6c3RyKSAgKHpzdHIpLT52YWwKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjIxNDogbHVhLmxvXSBFcnJvciAxCgpU
aGUgaXNzdWUgdHJpZ2dlcnMgb25seSBpZiBsdWEgaW50ZXJwcmV0ZXIgdmVyc2lvbiBpcyBsb3dl
ciB0aGFuIDUuMi4gSW4KdGhpcyBjYXNlLCAgcGhwX2x1YV93cml0ZV9wcm9wZXJ0eSBjYWxscyBa
U1RSX1ZBTCBvbiB0aGUgd3JvbmcgdmFyaWFibGUuCgpGaXggcGhwLWx1YSBidWlsZCBieSBjYWxs
aW5nIFpTVFJfVkFMIG9uIHRoZSBjb3JyZWN0IHZhcmlhYmxlLgoKU3VnZ2VzdGVkLWJ5OiBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCldoaWxlIHRoaXMgcGF0Y2gg
Zml4ZXMgcGhwLWx1YSB3aXRoIGx1YSA8IDUuMiwgdGhpcyB3b3VsZCBtYWtlcyBpdCB5ZXQKYW5v
dGhlciBkb3duc3RyZWFtLW9ubHkgcGF0Y2gsIHdoaWNoIGlzIG5vdCByZWFsbHkgZGVzaXJhYmxl
LiBJIHdpbGwKcGluZyBpbiB0aGUgbWVhbiB0aW1lIHRoZSBpbmFjdGl2ZSB1cHN0cmVhbSByZXBv
c2l0b3J5diB0byBjaGVjayBpZgp0aGVyZSBpcyBhbnkgY2hhbmNlIHRoYXQgaXQgY291bGQgYmUg
dXBkYXRlZCB0byBpbnRlZ3JhdGUgdGhvc2UgcGF0Y2hlcy4KLS0tCiAuLi5hLmMtZml4LVpTVFJf
VkFMLXVzYWdlLXdoZW4tdXNpbmctbHVhLTUuMi5wYXRjaCB8IDM4ICsrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9waHAtbHVhLzAwMDQtbHVhLmMtZml4LVpTVFJfVkFMLXVzYWdlLXdoZW4tdXNpbmctbHVh
LTUuMi5wYXRjaCBiL3BhY2thZ2UvcGhwLWx1YS8wMDA0LWx1YS5jLWZpeC1aU1RSX1ZBTC11c2Fn
ZS13aGVuLXVzaW5nLWx1YS01LjIucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYzVkOTlkYjdmNTE4MzYyYmY2
ZThkMDk4MWUzOGNhODlkNGFlNzA4OAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcGhwLWx1
YS8wMDA0LWx1YS5jLWZpeC1aU1RSX1ZBTC11c2FnZS13aGVuLXVzaW5nLWx1YS01LjIucGF0Y2gK
QEAgLTAsMCArMSwzOCBAQAorRnJvbSA3YmYzMzQ4MzJhZDM2ZDFmMjk3NjQwNmQ2ODBiMzVhMTY4
ZmZhYTkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0FsZXhpcz0y
MExvdGhvcj1DMz1BOT89IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KK0RhdGU6IE1vbiwg
OCBTZXAgMjAyNSAxNzoyMDoxMiArMDIwMAorU3ViamVjdDogW1BBVENIXSBsdWEuYzogZml4IFpT
VFJfVkFMIHVzYWdlIHdoZW4gdXNpbmcgbHVhIDwgNS4yCitNSU1FLVZlcnNpb246IDEuMAorQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CisKK1doZW4gdXNpbmcgYSBsdWEgaW50ZXJwcmV0ZXIgd2l0aCBhIHZlcnNp
b24gbG93ZXIgdGhhbiA1LjEsIHRoZQorcGhwX2x1YV93cml0ZV9wcm9wZXJ0eSBlbmRzIHVwIGNh
bGxpbmcgdGhlIFpTVFJfVkFMIHdpdGggdGhlIHdyb25nCit2YXJpYWJsZSAoaXQgaXMgZXhwZWN0
ZWQgdG8gcmVjZWl2ZSAibWVtYmVyIiwgYSB6ZW5kX3N0cmluZyB2YXJpYWJsZSwKK2J1dCBpdCBp
cyAidmFsdWUiIHRoYXQgaXMgcGFzc2VkLCB3aGljaCBpcyBhIHp2YWwpLgorCitGaXggcGhwLWx1
YSBjb21wYXRpYmlsaXR5IHdpdGggaW50ZXJwcmV0ZXJzIDwgNS4yIGJ5IHBhc3NpbmcgdGhlIGNv
cnJlY3QKK3ZhcmlhYmxlCisKK1Vwc3RyZWFtOiB1cHN0cmVhbSBkZWFkLCBjdXN0b20gcGF0Y2gK
K1NpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+CistLS0KKyBsdWEuYyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2x1YS5jIGIvbHVhLmMKK2luZGV4IGE0MGU1
ZGE0NDJhNC4uNTg4OWJjN2Y4M2VhIDEwMDc1NQorLS0tIGEvbHVhLmMKKysrKyBiL2x1YS5jCitA
QCAtMjQ0LDcgKzI0NCw3IEBAIHN0YXRpYyB6dmFsKiBwaHBfbHVhX3dyaXRlX3Byb3BlcnR5KHpl
bmRfb2JqZWN0ICpvYmplY3QsIHplbmRfc3RyaW5nICptZW1iZXIsIHp2CisgCWx1YV9TdGF0ZSAq
TCA9IHBocF9sdWFfb2JqX2Zyb21fb2JqKG9iamVjdCktPkw7CisgCisgI2lmIChMVUFfVkVSU0lP
Tl9OVU0gPCA1MDIpCistCWx1YV9wdXNobHN0cmluZyhMLCBaU1RSX1ZBTCh2YWwpLCBaU1RSX0xF
Tih2YWwpKTsKKysJbHVhX3B1c2hsc3RyaW5nKEwsIFpTVFJfVkFMKG1lbWJlciksIFpTVFJfTEVO
KG1lbWJlcikpOworIAlwaHBfbHVhX3NlbmRfenZhbF90b19sdWEoTCwgdmFsdWUpOworIAorIAls
dWFfc2V0dGFibGUoTCwgTFVBX0dMT0JBTFNJTkRFWCk7CistLSAKKzIuNTEuMAorCgotLS0KYmFz
ZS1jb21taXQ6IDU2ZDlkNWU4ZjA4NzI3MzdmZDc5YWJmNmE2MGU2NjkyMGJiNzg2MWMKY2hhbmdl
LWlkOiAyMDI1MDkwOC1maXhfcGhwX2x1YS05YmY3ODcyYjI1YjUKCkJlc3QgcmVnYXJkcywKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
