Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88214C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 09:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470BB81C6E;
	Tue, 29 Jul 2025 09:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy-mC75yDGgB; Tue, 29 Jul 2025 09:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 487A081322
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487A081322;
	Tue, 29 Jul 2025 09:45:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B0D415C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D54D403E7
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fg0hWY5g7HyJ for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 09:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=benoit.monin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1884C4016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1884C4016B
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1884C4016B
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:34 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 824A6583EF2
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:21:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12F6543980;
 Tue, 29 Jul 2025 09:21:46 +0000 (UTC)
Date: Tue, 29 Jul 2025 11:21:30 +0200
MIME-Version: 1.0
Message-Id: <20250729-cmake4-v2-2-24fd7677de1c@bootlin.com>
References: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
In-Reply-To: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieffteegleevieeuhfethfdvtdegfeelleejfeeiffelvdfgjeelffekteeuhffgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehpdhhvghloheplgduledvrdduieekrddutddrudejvdgnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegurghnohhmi
 hhmrghntghhvghgohduvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplfhovghlshhonhevrghrlhesghhmrghilhdrtghomhdprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753780906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbvQ1Z25NQK1t1X3UHFDrsZsOlTA9iaaSGShghQXddc=;
 b=GqMn5Nw9VSGSeIhg1kHlDBu5NZFtg7qiJfRrwNheC8Y5lJRPYC7ml+uCROGKJg3FV9hRrG
 nxzjPlWUj/g24N1UaJwTf1i9yx62jbxzA/dkWkgX8Go5h8R38vQBM3qON5S4m1Jb2lOGiL
 s/LM31s+dsFmAYyHgAld1sGDfmHFLDIgIRJDwNJOa7k+NcVkRYE/PTic/+2V+QRX2aVYSu
 HEmiCQNo5NUzfQFauZYyUHnwF6ZdxA9FbI74TF2B0JzJsXDNSiyR+8Sn+SLUIh/EFxdPxJ
 NFkHdTkSe5eYX8+yK7zxlaBaBVQE8nPdQ2sxw6WSpFhPPN8z5l586ivAYdO35g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GqMn5Nw9
Subject: [Buildroot] [PATCH v2 2/2] package/flatcc: fix cmake 4 compatibility
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
From: =?utf-8?q?Beno=C3=AEt_Monin_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGF0Y2ggZml4aW5nIGNtYWtlIDQgY29tcGF0aWJpbGl0eSwgZm91bmQgaW4gdXBzdHJl
YW0gcHVsbApyZXF1ZXN0ICMzNDkuIFRoZSBwYXRjaCBoYXMgYmVlbiBtb2RpZmllZCB0byBhcHBs
eSBvbiB2ZXJzaW9uIDAuNi4xCmluc3RlYWQgb2YgdGhlIGN1cnJlbnQgdXBzdHJlYW0gSEVBRC4K
ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4K
LS0tCiAuLi5uaW11bV9yZXF1aXJlZF92ZXJzaW9uX3RvXzMuNV9mb3JfY21ha2VfNC5wYXRjaCB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbGF0Y2MvMDAwMS1jbWFrZV9zZXRfbWluaW11bV9y
ZXF1aXJlZF92ZXJzaW9uX3RvXzMuNV9mb3JfY21ha2VfNC5wYXRjaCBiL3BhY2thZ2UvZmxhdGNj
LzAwMDEtY21ha2Vfc2V0X21pbmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtl
XzQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMC4uOWJmYWU1NGFlMmFjNjQzYzM0NTk5MjY5ZTE3YjNjOTlmNTFj
ZTA4MgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZmxhdGNjLzAwMDEtY21ha2Vfc2V0X21p
bmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtlXzQucGF0Y2gKQEAgLTAsMCAr
MSw1MSBAQAorRnJvbSA5MTVmNjJkY2Q5ZjBhMzcyOTQ0Zjc0OWNmNGFjZDcwN2RiMTBjNWZkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWxwZXIgQWsgPGFscGVyeWFzaW5hazFAZ21h
aWwuY29tPgorRGF0ZTogV2VkLCA5IEp1bCAyMDI1IDEyOjU5OjE3ICswMzAwCitTdWJqZWN0OiBb
UEFUQ0hdIGNtYWtlOiBTZXQgbWluaW11bSByZXF1aXJlZCB2ZXJzaW9uIHRvIDMuNSBmb3IgQ01h
a2UgNCsKKyBjb21wYXRpYmlsaXR5CisKK0ZpeDoKKworfCBDTWFrZSBFcnJvciBhdCBDTWFrZUxp
c3RzLnR4dDoyIChjbWFrZV9taW5pbXVtX3JlcXVpcmVkKToKK3wgICBDb21wYXRpYmlsaXR5IHdp
dGggQ01ha2UgPCAzLjUgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIENNYWtlLgorfAorfCAgIFVwZGF0
ZSB0aGUgVkVSU0lPTiBhcmd1bWVudCA8bWluPiB2YWx1ZS4gIE9yLCB1c2UgdGhlIDxtaW4+Li4u
PG1heD4gc3ludGF4Cit8ICAgdG8gdGVsbCBDTWFrZSB0aGF0IHRoZSBwcm9qZWN0IHJlcXVpcmVz
IGF0IGxlYXN0IDxtaW4+IGJ1dCBoYXMgYmVlbiB1cGRhdGVkCit8ICAgdG8gd29yayB3aXRoIHBv
bGljaWVzIGludHJvZHVjZWQgYnkgPG1heD4gb3IgZWFybGllci4KK3wKK3wgICBPciwgYWRkIC1E
Q01BS0VfUE9MSUNZX1ZFUlNJT05fTUlOSU1VTT0zLjUgdG8gdHJ5IGNvbmZpZ3VyaW5nIGFueXdh
eS4KK3wKK3wKK3wgLS0gQ29uZmlndXJpbmcgaW5jb21wbGV0ZSwgZXJyb3JzIG9jY3VycmVkIQor
CitTaWduZWQtb2ZmLWJ5OiBBbHBlciBBayA8YWxwZXJ5YXNpbmFrMUBnbWFpbC5jb20+CitTaWdu
ZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+CitVcHN0
cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2R2aWRlbGFicy9mbGF0Y2MvcHVsbC8zNDkKKy0tLQor
IENNYWtlTGlzdHMudHh0ICAgICAgICAgICAgICAgfCAyICstCisgZXh0ZXJuYWwvaGFzaC9DTWFr
ZUxpc3RzLnR4dCB8IDIgKy0KKyAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50
eHQKK2luZGV4IGQ0MTI3ZjU5OC4uYjUxZTVjNWJkIDEwMDY0NAorLS0tIGEvQ01ha2VMaXN0cy50
eHQKKysrKyBiL0NNYWtlTGlzdHMudHh0CitAQCAtMiw3ICsyLDcgQEAKKyAjY21ha2VfbWluaW11
bV9yZXF1aXJlZCAoVkVSU0lPTiAyLjguMTIuMikKKyAjIENlbnRvcyA3CisgI2NtYWtlX21pbmlt
dW1fcmVxdWlyZWQgKFZFUlNJT04gMi44LjExKQorLWNtYWtlX21pbmltdW1fcmVxdWlyZWQgKFZF
UlNJT04gMi44KQorK2NtYWtlX21pbmltdW1fcmVxdWlyZWQgKFZFUlNJT04gMy41KQorIAorICMg
RGlzYWJsZSBidWlsZCBvZiB0ZXN0cyBhbmQgc2FtcGxlcy4gRHVlIHRvIGN1c3RvbSBidWlsZCBz
dGVwCisgIyBkZXBlbmRlbmN5IG9uIGZsYXRjYyB0b29sLCBzb21lIGN1c3RvbSBidWlsZCBjb25m
aWd1cmF0aW9ucyBtYXkKK2RpZmYgLS1naXQgYS9leHRlcm5hbC9oYXNoL0NNYWtlTGlzdHMudHh0
IGIvZXh0ZXJuYWwvaGFzaC9DTWFrZUxpc3RzLnR4dAoraW5kZXggN2I3ZDk5MGRkLi4xMmViM2Rh
YTQgMTAwNjQ0CistLS0gYS9leHRlcm5hbC9oYXNoL0NNYWtlTGlzdHMudHh0CisrKysgYi9leHRl
cm5hbC9oYXNoL0NNYWtlTGlzdHMudHh0CitAQCAtMSw0ICsxLDQgQEAKKy1jbWFrZV9taW5pbXVt
X3JlcXVpcmVkIChWRVJTSU9OIDMuMC4yKQorK2NtYWtlX21pbmltdW1fcmVxdWlyZWQgKFZFUlNJ
T04gMy41KQorIAorIHByb2plY3QgKEhhc2hUZXN0KQorIAoKLS0gCjIuNTAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
