Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C82EC02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9874406B9;
	Fri, 31 Jan 2025 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVRhgcHKkyL6; Fri, 31 Jan 2025 16:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9302C406C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9302C406C4;
	Fri, 31 Jan 2025 16:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C99416C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 010D660ACB
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNPSZ4pgxkm6 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 16:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B29AC60810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29AC60810
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B29AC60810
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:44:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AA7844354;
 Fri, 31 Jan 2025 16:44:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tdu7g-008Rnh-0u;
 Fri, 31 Jan 2025 17:44:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-4-thomas.petazzoni@bootlin.com>
Date: Fri, 31 Jan 2025 17:44:04 +0100
In-Reply-To: <20250119084511.2816892-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 19 Jan 2025 09:45:07
 +0100")
Message-ID: <87tt9f3pd7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeeujeelvddvkefgudegueekveeifedutdelhfegkeekgfffueehtdevfeevffeffeenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] package/gnu-efi: fix build due to
 short-wchar
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gVGhlIGdudS1lZmkgY29kZSBiYXNlIGlzIHNv
IGZhciBidWlsdCB3aXRoIC1mc2hvcnQtd2NoYXI6CiA+IOKAmC1mc2hvcnQtd2NoYXLigJkKID4g
ICAgICBPdmVycmlkZSB0aGUgdW5kZXJseWluZyB0eXBlIGZvciDigJh3Y2hhcl904oCZIHRvIGJl
IOKAmHNob3J0IHVuc2lnbmVkCiA+ICAgICAgaW504oCZIGluc3RlYWQgb2YgdGhlIGRlZmF1bHQg
Zm9yIHRoZSB0YXJnZXQuICBUaGlzIG9wdGlvbiBpcyB1c2VmdWwKID4gICAgICBmb3IgYnVpbGRp
bmcgcHJvZ3JhbXMgdG8gcnVuIHVuZGVyIFdJTkUuCgogPiAgICAgICpXYXJuaW5nOiogdGhlIOKA
mC1mc2hvcnQtd2NoYXLigJkgc3dpdGNoIGNhdXNlcyBHQ0MgdG8gZ2VuZXJhdGUgY29kZQogPiAg
ICAgIHRoYXQgaXMgbm90IGJpbmFyeSBjb21wYXRpYmxlIHdpdGggY29kZSBnZW5lcmF0ZWQgd2l0
aG91dCB0aGF0CiA+ICAgICAgc3dpdGNoLiAgVXNlIGl0IHRvIGNvbmZvcm0gdG8gYSBub24tZGVm
YXVsdCBhcHBsaWNhdGlvbiBiaW5hcnkKID4gICAgICBpbnRlcmZhY2UuCgogPiBIb3dldmVyLCB0
aGlzIGlzIGhpZ2hseSBpbmNvbXBhdGlibGUgd2l0aCB0aGUgZGVmaW5pdGlvbnMgb2Ygd2NoYXJf
dAogPiBieSBtdXNsLCBjYXVzaW5nIGJ1aWxkIGlzc3VlczoKCiA+IC93b3JrZGlyL2luc3RhbmNl
LTAvb3V0cHV0LTEvYnVpbGQvZ251LWVmaS0zLjAuMTgvL2xpYi9jb25zb2xlLmM6ODQ6Njg6IGVy
cm9yOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2YgJ0Nvbk91dC0+T3V0cHV0U3RyaW5nJyBmcm9tIGlu
Y29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlw
ZXNdCiA+IFsuLi5dCiA+IC93b3JrZGlyL2luc3RhbmNlLTAvb3V0cHV0LTEvYnVpbGQvZ251LWVm
aS0zLjAuMTgvL2xpYi9jb25zb2xlLmM6ODQ6Njg6IG5vdGU6IGV4cGVjdGVkICdDSEFSMTYgKicg
e2FrYSAnaW50IConfSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAnc2hvcnQgdW5zaWduZWQgaW50
IConCgogPiBUaGVzZSBoYXZlIGJlZW4gYWRkcmVzc2VkIHVwc3RyZWFtIGJ5IHNpbXBseSBub3Qg
dXNpbmcgLWZzaG9ydC13Y2hhcgogPiBhbnltb3JlLCBzbyB3ZSBiYWNrcG9ydCB0aGUgcmVsZXZh
bnQgcGF0Y2hlcy4KCiA+IFRoZSBwYXRjaCAwMDAzLVVzZS1jaGFyMTZfdC1saXRlcmFscy5wYXRj
aCB3YXMgZGlyZWN0bHkgYmFja3BvcnRlZCwgaXQKID4gd2FzICJyZWRvbmUiIChpdCdzIGEgdmVy
eSBtZWNoYW5pY2FsIHBhdGNoKSBhcyBiYWNrcG9ydGluZyB0aGUgcGF0Y2gKID4gYW5kIGZpeGlu
ZyB0aGUgY29uZmxpY3RzIHdhcyBtb3JlIGVmZm9ydCB0aGFuIHJlZG9pbmcgdGhlIHBhdGNoIGZy
b20KID4gc2NyYXRjaC4gQnV0IGluIGVzc2VuY2UsIGl0IGlzIHRoZSBzYW1lIHBhdGNoIGFzIHdo
YXQgaXMgdXBzdHJlYW0uCgogPiBGaXhlczoKCiA+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvOGIyZjViMzgyODRlNzBkZGU4YzU2MTllNTA1MGU3ZjIwMWEwYmNjMy8K
CiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+CgpDb21taXR0ZWQgdG8gMjAyNC4xMS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
