Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DC1C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 16:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAEAC42845;
	Thu, 31 Jul 2025 16:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pLh0q-3QDH4; Thu, 31 Jul 2025 16:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A718C42852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A718C42852;
	Thu, 31 Jul 2025 16:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3843C160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA5A18410B
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2n4DP7uxVCtt for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B2B68425D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2B68425D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2B68425D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8026A1F68F;
 Thu, 31 Jul 2025 16:21:17 +0000 (UTC)
Date: Thu, 31 Jul 2025 18:21:10 +0200
Message-Id: <20250731-openscap-v2-0-5d7fec0cb36d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPaXi2gC/0XMQQrDIBCF4auEWdeixih01XuULIyZNAOtigZpC
 d69NhS6/B+Pb4eMiTDDpdshYaFMwbeQpw7cav0dGc2tQXI5cCMVCxF9djYyI7ReJhSDEQjtHhM
 u9Dqo29h6pbyF9D7kIr7rD+n5HymCcaY0KttLlHq21ymE7UH+7MITxlrrB9NsUTOiAAAA
X-Change-ID: 20250724-openscap-7166fbe1571e
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetheejgedttddvueekffduffekleeuuedtvddugfeuieduieejheevjeegfeeljeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753978877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nCJzkqQOxf6peWSTn51GDaxZJ1N99CtejCYC7Asy+zE=;
 b=Ov3XWeIP30lVvTAzCpCVxnvCGpISzQ2SO8+G1oieR9Z5QxQ3J08zcnw0jh1CXYI+JZCQer
 davn5gj+7iZV+ZP4hcY3AoQROyh5UuEDvlYqVsfM1U0Ce0fphLzUVInkQhSyUeb6iz0odw
 gYPCrSjdUJf71Tcw2VEo0PE3fdsDhF36Srbekcq1OzuN41vTuEysOzA4kbWkHQZmIQKWqY
 aG9rVf+HgwNR0+uh2rc65KXYRUqpUcxZCDidC9G3/c0s3mN+YU0slDfqYoCXZIa/Gqo0oT
 AVmbWWILxx0D6NOuyL6wYGnbBsddQvRkvn4EtHUUWk5L1J8EweuuvGdFF4phjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ov3XWeIP
Subject: [Buildroot] [PATCH v2 0/5] package/compliance-as-code: introduce
 new package
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgaXMgdGhlIHYyIG9mIHRoZSBzZXJpZXMgYnJpbmdpbmcgaW4gQ29tcGxpYW5j
ZSBBcyBDb2RlIHBvbGljaWVzIFsxXQooQ2FDKSBvbiBhIHRhcmdldC4gVGhpcyBwcm9qZWN0IGFp
bXMgdG8gcHJvdmlkZSBzZWN1cml0eSBwb2xpY3kgY29udGVudApvbiBzeXN0ZW1zOiB0aGlzIGNv
bnRlbnQgYnJpbmdzIGRhdGEgZmlsZXMgZGVzY3JpYmluZyBjaGVja3Mgc3RhbmRhcmRzCmFuZCBh
dXRvbWF0aW9ucyBmb3Igc3lzdGVtIGNvbmZpZ3VyYXRpb24uICBUaG9zZSBmaWxlcyBjb21lIGlu
IHZhcmlvdXMKZm9ybWF0cyAoWENDREYsIE9WQUwsIFNDQVApLiAgVGhpcyBwcm9qZWN0IGlzIHRp
Z2h0bHkgY291cGxlZCB0byB0aGUKT3BlblNDQVAgdG9vbCBbMl06Ci0gdG8gYnVpbGQgdGhlIGRh
dGEgZmlsZXMgdG8gZW1iZWQgb24gdGhlIHRhcmdldCBzeXN0ZW0KLSBhbmQgdG8gcGVyZm9ybSBh
bmFseXNpcyBvbiB0aGUgc3lzdGVtLCBieSBjb25zdW1pbmcgdGhlIGRhdGEgZmlsZXMKCkNhQyB0
aGVuIGRlcGVuZHMgb24gYm90aCBvcGVuc2NhcCBhbmQgaG9zdC1vcGVuc2NhcC4KVGhlIHNlcmll
cyBicmluZ3MgaW4gdGhlIGZvbGxvd2luZyBjb21taXRzOgotIGNvbW1pdCAxIGJyaW5ncyBsaWJ4
bXNlYzEsIG9uZSBvZiBvcGVuc2NhcCBkZXBlbmRlbmNpZXMKLSBjb21taXQgMiBicmluZ3MgYmFj
ayBob3N0LWxpYmN1cmwgKHdoaWNoIGhhcyBiZWVuIHN1cHBvcnRlZCBhbmQgbGF0ZXIKICByZW1v
dmVkIGZyb20gQlIsIGFzIHRoZXJlIHdhcyBubyB1c2VyIGFueW1vcmUpLCBzaW5jZSBob3N0LW9w
ZW5zY2FwCiAgbmVlZHMgaG9zdC1saWJjdXJsCi0gY29tbWl0IDMgYnJpbmdzIG9wZW5zY2FwIHBh
Y2thZ2UKLSBjb21taXQgNCBicmluZ3MgQ2FDIHBhY2thZ2UKClRoZSBuZXcgQ2FDIHBhY2thZ2Ug
YnJpbmdzIGEgbWluaW1hbCBmZWF0dXJlIHNldCBmb3Igbm93OiBpdCBvbmx5IGJyaW5ncwp0aGUg
c2VjdXJpdHkgcG9saWN5IGRhdGEgZmlsZXMgKGllOiBYTUwgZmlsZXMpIG9uIHRoZSB0YXJnZXQu
IEl0IGNhbiBiZQpleHRlbmRlZCBsYXRlciBhcyBuZWVkZWQgdG8gYnJpbmcgaW4gZm9yIGV4YW1w
bGUgZ2VuZXJhdGVkIGJhc2ggc2NyaXB0LAphbnNpYmxlIHBsYXlib29rcywgZXRjLgoKVGVzdGlu
ZyBvdXRwdXQ6CiQgLi91dGlscy90ZXN0LXBrZyAtYyBjYWMuY29uZmlnIC1wIGNvbXBsaWFuY2Ut
YXMtY29kZQogICBib290bGluLWFybXY1LXVjbGliYyBbMS82XTogT0sKICAgYm9vdGxpbi1hcm12
Ny1nbGliYyBbMi82XTogT0sKICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBTS0lQUEVE
CiAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzQvNl06IE9LCiAgIGJyLWFybS1mdWxsLXN0YXRpYyBb
NS82XTogU0tJUFBFRAogICBhcm0tYWFyY2g2NCBbNi82XTogT0sKClsxXSBodHRwczovL2dpdGh1
Yi5jb20vQ29tcGxpYW5jZUFzQ29kZS9jb250ZW50ClsyXSBodHRwczovL2dpdGh1Yi5jb20vT3Bl
blNDQVAvb3BlbnNjYXAKClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxv
dGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIHJld29yZGVkIGNvbW1pdHMg
dGl0bGVzIGFuZCBtZXNzYWdlcwotIHJlZm9ybWF0ZWQsIHJlb3JkZXJlZCBjb250ZW50IGFuZC9v
ciBjbGVhbmVkIG11bHRpcGxlIGZpbGVzCi0gYWRkZWQgS2NvbmZpZyBjb21tZW50cyBmb3IgdG9v
bGNoYWluIGRlcHMKLSBhZGRlZCBtaXNzaW5nIERFVkVMT1BFUlMgZW50cnkKLSBmaXhlZCBsaWNl
bnNpbmcgaXNzdWVzIGZvciBvcGVuc2NhcAotIGRpc2FibGVkIHB5dGhvbjMgaW4gb3BlbnNjYXAK
LSByZW1vdmVkIHNvbWUgbm9uIGV4aXN0aW5nIEtDb25maWcgZGVwZW5kZW5jaWVzIGFuZCBob29r
cyAKLSBmaXhlZCBLQ29uZmlnIG1hbmFnZW1lbnQgaW4gQ2FDIC5tayBmaWxlCi0gdXBkYXRlZCBp
bnN0YWxsIHRhcmdldCBpbiBDYUMgdG8gdXNlIGNwCi0gaW50cm9kdWNlZCBhIHNpbXBsZSBydW50
aW1lIHRlc3QgZm9yIG9wZW5zY2FwL0NhQwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNTA3MzAtb3BlbnNjYXAtdjEtMC00NmU0YTMyZTI2ZGFAYm9vdGxpbi5jb20K
Ci0tLQpBbGV4aXMgTG90aG9yw6kgKDUpOgogICAgICBwYWNrYWdlL2xpYnhtbHNlYzE6IG5ldyBw
YWNrYWdlCiAgICAgIHBhY2thZ2UvbGliY3VybDogUmVhcHBseSAibGliY3VybDogYWRkIGhvc3Qg
dmFyaWFudCIKICAgICAgcGFja2FnZS9vcGVuc2NhcDogbmV3IHBhY2thZ2UKICAgICAgcGFja2Fn
ZS9jb21wbGlhbmNlLWFzLWNvZGU6IG5ldyBwYWNrYWdlCiAgICAgIHN1cHBvcnQvdGVzdGluZzog
YWRkIHJ1bnRpbWUgdGVzdGluZyBmb3IgY29tcGxpYW5jZS1hcy1jb2RlCgogREVWRUxPUEVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKwogcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdl
L2NvbXBsaWFuY2UtYXMtY29kZS9Db25maWcuaW4gICAgICAgICAgICAgICB8IDMzICsrKysrKysr
KysrCiBwYWNrYWdlL2NvbXBsaWFuY2UtYXMtY29kZS9jb21wbGlhbmNlLWFzLWNvZGUuaGFzaCB8
ICA0ICsrCiBwYWNrYWdlL2NvbXBsaWFuY2UtYXMtY29kZS9jb21wbGlhbmNlLWFzLWNvZGUubWsg
ICB8IDQxICsrKysrKysrKysrKysKIHBhY2thZ2UvbGliY3VybC9saWJjdXJsLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMTEgKysrKwogcGFja2FnZS9saWJ4bWxzZWMxL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrCiBwYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1s
c2VjMS5oYXNoICAgICAgICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvbGlieG1sc2VjMS9saWJ4
bWxzZWMxLm1rICAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKwogcGFja2FnZS9vcGVu
c2NhcC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrCiBwYWNr
YWdlL29wZW5zY2FwL29wZW5zY2FwLmhhc2ggICAgICAgICAgICAgICAgICAgICB8ICAzICsKIHBh
Y2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAubWsgICAgICAgICAgICAgICAgICAgICAgIHwgNjkgKysr
KysrKysrKysrKysrKysrKysrKwogLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9jb21wbGlhbmNlX2Fz
X2NvZGUucHkgICAgICAgfCAyMyArKysrKysrKwogMTMgZmlsZXMgY2hhbmdlZCwgMjYyIGluc2Vy
dGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiAwNDYxMDQzYTUxMzIyZWJjZjdjZGQ5MGIwZDJmOWI1
OWRmMTdiYjljCmNoYW5nZS1pZDogMjAyNTA3MjQtb3BlbnNjYXAtNzE2NmZiZTE1NzFlCgpCZXN0
IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
