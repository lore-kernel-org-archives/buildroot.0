Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE66D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D758308B;
	Tue, 13 Jan 2026 19:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41UXh9MZ8A2F; Tue, 13 Jan 2026 19:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D68A841FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333589;
	bh=gDMm4/OyvBPdMGrdt1ciEkYi8Oan/Tb4xF/g53MWamk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qaNSnfIlEg82dYg4PcXdd7MozRZzE31uEF4xp6kjceGhTzY9olNsv32iPpLBEv4rU
	 8d+dmF8AOHWJIM1relmOpLA0wT1xHU6cy4tsjbh6vV9RuSeEzVD30ovY8hUryPJCVB
	 8PpqibpT950+sH9zDyiRhekofch95Zp1xY4BRe7eea59zoQnDHoMeH9FrqpfnP/CwE
	 kq0DXx8BfVtpbp8xxSwKyAH7UeNzkpcDYJwkvlhjeVbyQTAr+l97+VMDOwYox2DDu1
	 4fR5NZnAa71s2luebQL4MWPLPHyRuOEWwxlvm96zqj5bKK3ZCcEk064pmXKZayuCcU
	 7J8+erOUMcpAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D68A841FE;
	Tue, 13 Jan 2026 19:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 466F4231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3788584203
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fds5_0Mzl7CS for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34104841FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34104841FE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34104841FE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56A29B97A863; Tue, 13 Jan 2026 20:46:25 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:20 +0100
Message-ID: <20260113194623.98507-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-3-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PcXP66Mvq4CCspIurrkOFosVGmJ9KFTE3D9+OZBEILA=;
 b=fwPHS1l9JoPduudy/mpYaOo5QVNoiyrmSEZw0QlBIdz3wY+qGv8ziXcsEJxYWnmTTStRtH
 YOBm49ZXhA1yLf51JEB8+O6/eQ77iPLgIT9YDGRd4quDLEBm2LXMyuIeyK1MA3yjiCMAMZ
 BLrUvMJJxgIMLlF34Zd3uu+iO3YVxYxKxcj1e14okROc1n3UNB4VAxZgdRHms+Z4JxFzOM
 L1K23+HB52QJSw1STgNtaBLu77s0kMEfuxaYJTWIwTDwl0euZmZorcVGVziX9W4a5iv9uh
 DOW/J4BLsoMfDXqoWhgGrYvexrHw8A6cLthmP3GGQ7RbRzGRMpX7Ym1UjQn/7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fwPHS1l9
Subject: Re: [Buildroot] [PATCH 3/5] package/qt5/qt5webkit: add patch to fix
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gSXQgaXMgbm90IGNsZWFyIHdoaWNoIGNoYW5nZSBpbnRyb2R1Y2UgdGhp
cyBicmVha2FnZSwgYnV0IHdlIHN1c3BlY3QKPiBpdCBpcyByZWxhdGVkIHRvIEdDQyAxNC54LiBJ
biBhbnkgY2FzZSwgdGhlIGZpeCBkb2VzIG5vIGhhcm0gYW5kIGlzCj4gZ29vZCB0byBiYWNrcG9y
dCB0byAyMDI1LjAyLnguCj4gCj4gRml4ZXM6Cj4gCj4gL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9i
ci9vdXRwdXQtYWxsL2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvVGhpcmRQ
YXJ0eS9BTkdMRS9zcmMvY29tbW9uL21hdGh1dGlsLmg6NTc1Ojg6IGVycm9yOiDigJh1aW50MzJf
dOKAmSBkb2VzIG5vdCBuYW1lIGEgdHlwZQo+ICAgNTc1IHwgaW5saW5lIHVpbnQzMl90IFJvdEwo
dWludDMyX3QgeCwgaW50OF90IHIpCj4gICAgICAgfCAgICAgICAgXn5+fn5+fn4KPiAvaG9tZS90
aG9tYXMvYnVpbGRyb290L2JyL291dHB1dC1hbGwvYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxw
aGE0L1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vbWF0aHV0aWwuaDoxOToxOiBu
b3RlOiDigJh1aW50MzJfdOKAmSBpcyBkZWZpbmVkIGluIGhlYWRlciDigJg8Y3N0ZGludD7igJk7
IHRoaXMgaXMgcHJvYmFibHkgZml4YWJsZSBieSBhZGRpbmcg4oCYI2luY2x1ZGUgPGNzdGRpbnQ+
4oCZCj4gICAgMTggfCAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gICArKysgfCsjaW5jbHVkZSA8Y3N0
ZGludD4KPiAgICAxOSB8Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI1
LjExLnguIFRoYW5rcwoKPiAtLS0KPiAgLi4ueS1BTkdMRS1zcmMtY29tbW9uLW1hdGh1dGlsLmgt
aW5jbHVkLnBhdGNoIHwgNDUgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1d2Vi
a2l0LzAwMTItU291cmNlLVRoaXJkUGFydHktQU5HTEUtc3JjLWNvbW1vbi1tYXRodXRpbC5oLWlu
Y2x1ZC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAxMi1T
b3VyY2UtVGhpcmRQYXJ0eS1BTkdMRS1zcmMtY29tbW9uLW1hdGh1dGlsLmgtaW5jbHVkLnBhdGNo
IGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMTItU291cmNlLVRoaXJkUGFydHktQU5HTEUtc3Jj
LWNvbW1vbi1tYXRodXRpbC5oLWluY2x1ZC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uZTUzMDI0YTRiZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3F0NS9xdDV3ZWJraXQvMDAxMi1Tb3VyY2UtVGhpcmRQYXJ0eS1BTkdMRS1zcmMtY29tbW9u
LW1hdGh1dGlsLmgtaW5jbHVkLnBhdGNoCj4gQEAgLTAsMCArMSw0NSBAQAo+ICtGcm9tIDA1YzVh
ZWM3MjJlYmQ3NTBlYzM0MDQ0NDRmOTQ1MTU0YzI2NmI2MmQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+Cj4gK0RhdGU6IFN1biwgMjggRGVjIDIwMjUgMTU6NTE6MjYgKzAxMDAKPiArU3ViamVjdDog
W1BBVENIXSBTb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL21hdGh1dGlsLmg6IGlu
Y2x1ZGUKPiArIG1pc3NpbmcgaGVhZGVyCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0Cj4gKwo+ICtGaXhlczoKPiArCj4gKy9ob21lL3Rob21hcy9idWlsZHJvb3QvYnIv
b3V0cHV0LWFsbC9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQvU291cmNlL1RoaXJkUGFy
dHkvQU5HTEUvc3JjL2NvbW1vbi9tYXRodXRpbC5oOjU3NTo4OiBlcnJvcjog4oCYdWludDMyX3Ti
gJkgZG9lcyBub3QgbmFtZSBhIHR5cGUKPiArICA1NzUgfCBpbmxpbmUgdWludDMyX3QgUm90TCh1
aW50MzJfdCB4LCBpbnQ4X3QgcikKPiArICAgICAgfCAgICAgICAgXn5+fn5+fn4KPiArL2hvbWUv
dGhvbWFzL2J1aWxkcm9vdC9ici9vdXRwdXQtYWxsL2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFs
cGhhNC9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL21hdGh1dGlsLmg6MTk6MTog
bm90ZTog4oCYdWludDMyX3TigJkgaXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGNzdGRpbnQ+4oCZ
OyB0aGlzIGlzIHByb2JhYmx5IGZpeGFibGUgYnkgYWRkaW5nIOKAmCNpbmNsdWRlIDxjc3RkaW50
PuKAmQo+ICsgICAxOCB8ICNpbmNsdWRlIDxzdGRsaWIuaD4KPiArICArKysgfCsjaW5jbHVkZSA8
Y3N0ZGludD4KPiArICAgMTkgfAo+ICsKPiArVGFrZW4gZnJvbSBGZWRvcmEsIGFsc28gdXNlZCBv
biBBcmNoIExpbnV4Ogo+ICsKPiArICBodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1z
L3F0NS1xdHdlYmtpdC9yYXcvcmF3aGlkZS9mL3F0d2Via2l0LWNzdGRpbnQucGF0Y2gKPiArICBo
dHRwczovL2F1ci5hcmNobGludXgub3JnL3BhY2thZ2VzL3F0NS13ZWJraXQKPiArCj4gK1Vwc3Ry
ZWFtOiBkZWFkLCBOL0EKPiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KPiArLS0tCj4gKyBTb3VyY2UvVGhpcmRQYXJ0eS9BTkdM
RS9zcmMvY29tbW9uL21hdGh1dGlsLmggfCAxICsKPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+ICsKPiArZGlmZiAtLWdpdCBhL1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9j
b21tb24vbWF0aHV0aWwuaCBiL1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vbWF0
aHV0aWwuaAo+ICtpbmRleCA3OTU5ZGE4YmRjYmMuLmM4NmFmZDYxZTEwMyAxMDA2NDQKPiArLS0t
IGEvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvc3JjL2NvbW1vbi9tYXRodXRpbC5oCj4gKysrKyBi
L1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vbWF0aHV0aWwuaAo+ICtAQCAtMTYs
NiArMTYsNyBAQAo+ICsgI2luY2x1ZGUgPGFsZ29yaXRobT4KPiArICNpbmNsdWRlIDxzdHJpbmcu
aD4KPiArICNpbmNsdWRlIDxzdGRsaWIuaD4KPiArKyNpbmNsdWRlIDxjc3RkaW50Pgo+ICsgCj4g
KyBuYW1lc3BhY2UgZ2wKPiArIHsKPiArLS0gCj4gKzIuNTIuMAo+ICsKPiAtLSAKPiAyLjUyLjAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
