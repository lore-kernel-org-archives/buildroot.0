Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B69C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 09:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544F640609;
	Fri, 14 Mar 2025 09:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYe4_bm4moWl; Fri, 14 Mar 2025 09:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2E1740638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2E1740638;
	Fri, 14 Mar 2025 09:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E18EA
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCDDE40638
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEbJ6ejpdKrX for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 09:34:49 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.249; helo=mslow3.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74C0040609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C0040609
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74C0040609
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:34:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 5AA4A58063C
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:16:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF8FB4320C;
 Fri, 14 Mar 2025 09:16:49 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Fri, 14 Mar 2025 10:16:47 +0100
MIME-Version: 1.0
Message-Id: <20250314-fix-m68k-ntpl-uclibc-v1-1-086dff8d713e@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAP7z02cC/x2MQQ5AMBAAvyJ7tklbKviKOFCLDUpaRCL9u8Zxk
 pl5wZNj8lAnLzi62fNuI8g0ATN3diLkITIoobTIZI4jP7gV5YL2PFa8zMq9Qa2rXBmhxkpKiOn
 hKHr/tmlD+AAmEJCNZgAAAA==
X-Change-ID: 20250314-fix-m68k-ntpl-uclibc-55942c02f911
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741943809; l=3840;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=2UpnNEOumq1sYzVfjGa4drD9uKndDY9H3yi719wcYvQ=;
 b=FgOIaSekvHF3mAhGtIvIB534M0azo6lYNgWa+pd1Q5kYF6bo8/4+nMQ8Ez99ib3e+N0LtYxtg
 LOnNlfySO8hADTRNYwqfgfGapQLG1GjaPenlUekofm6RY6nENeVNt6S
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepgfdvhffhgeefkeetffduheelgfeuleeuueegffetleeliefhgeeulefhfeevtedtnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmeejsgejfeemledutdeimeduudegfhemleeludelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemjegsjeefmeeluddtieemuddugehfmeelleduledphhgvlhhopeihohhsvghlihdqhihotghtohdrhihoshgvlhhirdhorhhgpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfigsgiesohhpvghnrggukhdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1741943810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uU9kNmN7HICWZbSUAl8rLRmwIPsNXPTuii0WXXdPtdA=;
 b=mUzJSTOyZAOPoggQ/fTqoVHs3w+ao+L6fPCYFRsbZchCyJ/21a0tJmICcovof85ezUoGhe
 J/XwPD0kK8pkDdfnP81MRRx7pcoFF8yefVuG/kp8muowFdwr2xs1TsqqubauJe+ILP94fb
 xCxtGvyB4dlC/xhClVCUIWlA6b9wzVRgrR8enzEJCfcjG33PKpA8rfi4xduAH8hXJOueqs
 38/u1Rh/GArb5wlp2Aw8dpH+y7C/gDTkSlM3EHZI0IvS8nKr+OT9yLVOX+6YD1DLranDnG
 AolejoTX7fw+Q3TFDj6oJw7ZE/jqY6rC2iOJ1FD65SAdqVBJHnCA0JCWhohaGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=mUzJSTOy
Subject: [Buildroot] [PATCH] package/uclibc: fix NPTL alignment on m68k
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
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGVzdGVkIG9uIFFFTVUgdXNpbmcgdGhlIHFlbXVfbTY4a19xODAwX2RlZmNvbmZpZyBjb25maWd1
cmF0aW9uLCB3aXRoIGEKc3dpdGNoIG9mICB0aGUgdG9vbGNoYWluIHRvIHVjbGliYy1uZyBhbmQg
ZW5hYmxpbmcgcnN5c2xvZy4KClRoaXMgcGF0Y2ggYWRkcmVzc2VzIGFuIGlzc3VlIHdoZXJlIHJz
eXNsb2figJlzIHB0aHJlYWRfY29uZF93YWl0IHdhcwpidXN5LWxvb3BpbmcgZHVlIHRvIGZ1dGV4
X3RpbWU2NCByZXBlYXRlZGx5IHJldHVybmluZyBFSU5WQUwuIFRoZQpjb3JyZWN0aW9uIGluIE5Q
VEwgYWxpZ25tZW50IHJlc29sdmVzIHRoZSAxMDAlIENQVSB1c2FnZSBwcm9ibGVtLgoKVGhpcyBw
YXRjaCBpcyBmaXhlZCB1cHN0cmVhbSBbMV0gc28gYXBwbHkgaXQgdW50aWwgaXQgaXMgdGFnZ2Vk
LgoKWzFdOiAyNzhhYzZiMzAgKCJtNjhrOiBmaXggYWxpZ25tZW50IGluIE5QVEwgY29kZSIpCgpT
aWduZWQtb2ZmLWJ5OiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5
b3NlbGkub3JnPgotLS0KIC4uLi8wMDAxLW02OGstZml4LWFsaWdubWVudC1pbi1OUFRMLWNvZGUu
cGF0Y2ggICAgIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkw
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3VjbGliYy8wMDAxLW02OGstZml4
LWFsaWdubWVudC1pbi1OUFRMLWNvZGUucGF0Y2ggYi9wYWNrYWdlL3VjbGliYy8wMDAxLW02OGst
Zml4LWFsaWdubWVudC1pbi1OUFRMLWNvZGUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uM2U3ZDhjNzM5ZWIw
MWFjZjdjYzdlOWY3OTRhOTE4N2M3YjFmN2Y3YQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
dWNsaWJjLzAwMDEtbTY4ay1maXgtYWxpZ25tZW50LWluLU5QVEwtY29kZS5wYXRjaApAQCAtMCww
ICsxLDkwIEBACitGcm9tIDI3OGFjNmIzMDk4MzE1Y2RkZWM4ZjcxZjI3YmQ4ZGUyMmU1M2NhNmMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBUaG9yc3RlbiBHbGFzZXIgPHRnQGRlYmlh
bi5vcmc+CitEYXRlOiBXZWQsIDEyIE1hciAyMDI1IDIyOjExOjUxICswMTAwCitTdWJqZWN0OiBb
UEFUQ0hdIG02OGs6IGZpeCBhbGlnbm1lbnQgaW4gTlBUTCBjb2RlCisKK1NpZ25lZC1vZmYtYnk6
IFRob3JzdGVuIEdsYXNlciA8dGdAZGViaWFuLm9yZz4KKy0tLQorIC4uLi91bml4L3N5c3YvbGlu
dXgvbTY4ay9iaXRzL3B0aHJlYWR0eXBlcy5oICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KKyAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L202OGsvYml0cy9w
dGhyZWFkdHlwZXMuaCBiL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9t
NjhrL2JpdHMvcHRocmVhZHR5cGVzLmgKK2luZGV4IDJhOTBhMGI5MC4uZDJmMjJjYWVlIDEwMDY0
NAorLS0tIGEvbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L202OGsvYml0
cy9wdGhyZWFkdHlwZXMuaAorKysrIGIvbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L202OGsvYml0cy9wdGhyZWFkdHlwZXMuaAorQEAgLTM5LDcgKzM5LDcgQEAgdHlwZWRl
ZiB1bnNpZ25lZCBsb25nIGludCBwdGhyZWFkX3Q7CisgdHlwZWRlZiB1bmlvbgorIHsKKyAgIGNo
YXIgX19zaXplW19fU0laRU9GX1BUSFJFQURfQVRUUl9UXTsKKy0gIGxvbmcgaW50IF9fYWxpZ247
CisrICBsb25nIGludCBfX2FsaWduIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9fKDQpKSk7Cisg
fSBwdGhyZWFkX2F0dHJfdDsKKyAKKyAKK0BAIC02OSwxMyArNjksMTMgQEAgdHlwZWRlZiB1bmlv
bgorICAgICB9OworICAgfSBfX2RhdGE7CisgICBjaGFyIF9fc2l6ZVtfX1NJWkVPRl9QVEhSRUFE
X01VVEVYX1RdOworLSAgbG9uZyBpbnQgX19hbGlnbjsKKysgIGxvbmcgaW50IF9fYWxpZ24gX19h
dHRyaWJ1dGVfXygoX19hbGlnbmVkX18oNCkpKTsKKyB9IHB0aHJlYWRfbXV0ZXhfdDsKKyAKKyB0
eXBlZGVmIHVuaW9uCisgeworICAgY2hhciBfX3NpemVbX19TSVpFT0ZfUFRIUkVBRF9NVVRFWEFU
VFJfVF07CistICBsb25nIGludCBfX2FsaWduOworKyAgbG9uZyBpbnQgX19hbGlnbiBfX2F0dHJp
YnV0ZV9fKChfX2FsaWduZWRfXyg0KSkpOworIH0gcHRocmVhZF9tdXRleGF0dHJfdDsKKyAKKyAK
K0BAIC05NSwxMyArOTUsMTMgQEAgdHlwZWRlZiB1bmlvbgorICAgICB1bnNpZ25lZCBpbnQgX19i
cm9hZGNhc3Rfc2VxOworICAgfSBfX2RhdGE7CisgICBjaGFyIF9fc2l6ZVtfX1NJWkVPRl9QVEhS
RUFEX0NPTkRfVF07CistICBfX2V4dGVuc2lvbl9fIGxvbmcgbG9uZyBpbnQgX19hbGlnbjsKKysg
IF9fZXh0ZW5zaW9uX18gbG9uZyBsb25nIGludCBfX2FsaWduIF9fYXR0cmlidXRlX18oKF9fYWxp
Z25lZF9fKDgpKSk7CisgfSBwdGhyZWFkX2NvbmRfdDsKKyAKKyB0eXBlZGVmIHVuaW9uCisgewor
ICAgY2hhciBfX3NpemVbX19TSVpFT0ZfUFRIUkVBRF9DT05EQVRUUl9UXTsKKy0gIGxvbmcgaW50
IF9fYWxpZ247CisrICBsb25nIGludCBfX2FsaWduIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9f
KDQpKSk7CisgfSBwdGhyZWFkX2NvbmRhdHRyX3Q7CisgCisgCitAQCAtMTQ0LDEzICsxNDQsMTMg
QEAgdHlwZWRlZiB1bmlvbgorICAgICBpbnQgX193cml0ZXI7CisgICB9IF9fZGF0YTsKKyAgIGNo
YXIgX19zaXplW19fU0laRU9GX1BUSFJFQURfUldMT0NLX1RdOworLSAgbG9uZyBpbnQgX19hbGln
bjsKKysgIGxvbmcgaW50IF9fYWxpZ24gX19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oNCkpKTsK
KyB9IHB0aHJlYWRfcndsb2NrX3Q7CisgCisgdHlwZWRlZiB1bmlvbgorIHsKKyAgIGNoYXIgX19z
aXplW19fU0laRU9GX1BUSFJFQURfUldMT0NLQVRUUl9UXTsKKy0gIGxvbmcgaW50IF9fYWxpZ247
CisrICBsb25nIGludCBfX2FsaWduIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9fKDQpKSk7Cisg
fSBwdGhyZWFkX3J3bG9ja2F0dHJfdDsKKyAjZW5kaWYKKyAKK0BAIC0xNjUsMTMgKzE2NSwxMyBA
QCB0eXBlZGVmIHZvbGF0aWxlIGludCBwdGhyZWFkX3NwaW5sb2NrX3Q7CisgdHlwZWRlZiB1bmlv
bgorIHsKKyAgIGNoYXIgX19zaXplW19fU0laRU9GX1BUSFJFQURfQkFSUklFUl9UXTsKKy0gIGxv
bmcgaW50IF9fYWxpZ247CisrICBsb25nIGludCBfX2FsaWduIF9fYXR0cmlidXRlX18oKF9fYWxp
Z25lZF9fKDQpKSk7CisgfSBwdGhyZWFkX2JhcnJpZXJfdDsKKyAKKyB0eXBlZGVmIHVuaW9uCisg
eworICAgY2hhciBfX3NpemVbX19TSVpFT0ZfUFRIUkVBRF9CQVJSSUVSQVRUUl9UXTsKKy0gIGlu
dCBfX2FsaWduOworKyAgaW50IF9fYWxpZ24gX19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oNCkp
KTsKKyB9IHB0aHJlYWRfYmFycmllcmF0dHJfdDsKKyAjZW5kaWYKKyAKKy0tIAorMi4zOS41CisK
Ci0tLQpiYXNlLWNvbW1pdDogODczNDA3YjQ2YzJiNmI5ZTE1NGJlOTdiZmRlYzYxYzljODM0OTIy
OQpjaGFuZ2UtaWQ6IDIwMjUwMzE0LWZpeC1tNjhrLW50cGwtdWNsaWJjLTU1OTQyYzAyZjkxMQoK
QmVzdCByZWdhcmRzLAotLSAKSmVhbi1NaWNoZWwgSGF1dGJvaXMgPGplYW5taWNoZWwuaGF1dGJv
aXNAeW9zZWxpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
