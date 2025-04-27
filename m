Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8525BC369D1
	for <buildroot@archiver.kernel.org>; Sun, 27 Apr 2025 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775A660A7C;
	Sun, 27 Apr 2025 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku8R14YHQWU2; Sun, 27 Apr 2025 19:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918196075B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918196075B;
	Sun, 27 Apr 2025 19:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96432C5
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CE0C40578
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 19:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeX5EBXTGK2d for <buildroot@buildroot.org>;
 Sun, 27 Apr 2025 19:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6537A404DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6537A404DA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6537A404DA
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 19:41:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06C15439B7;
 Sun, 27 Apr 2025 19:41:50 +0000 (UTC)
Date: Sun, 27 Apr 2025 21:41:38 +0200
MIME-Version: 1.0
Message-Id: <20250427-patch_pahole-v1-1-b8cc84bd5a51@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHGIDmgC/x3MQQqAIBBA0avErDNMTKGrRITYlAOhohGBePek5
 V+8XyBjIswwdwUSPpQp+BZj34F1xp/IaG8NgouJS6FZNLd1WzQuXMgOpRWiUUpKDY3EhAe9/27
 5ycDF8MJa6wd/lklXaQAAAA==
X-Change-ID: 20250427-patch_pahole-f676eea66447
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Francis Laniel <flaniel@linux.microsoft.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheekleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeevfedtieefvdefgfdvgfejudeiveduledtueelhfehgfeivdfhtefhgfffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopehflhgrnhhivghlsehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745782911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dbh5SjG0xz+/5Kw2H87y+y7ocmtIuQmJf3ZK8Wc4eVs=;
 b=cr6gVPsaaEpGlU3/5mhIQT7gWyK0hXoasB6wZLLRK1le3RK0n6B89g9XLDbm++HlH8LTjR
 b0hMJ4J+2oz5ek0ycSY6JwCBPOV6TS8knJCkTvmZOzGd5Pq524amjBLMRSur54iNi5SulK
 azk4uer0iZAtnKuu3WzeF72ppj1OzQa9VKlKkv5g14PVLpG+0/iunbffqjHBzahTS1rzMe
 dQX/9TUVTtqDTQpsSmiIKKIplkxuljXR/+LGPCPTroMn27A2iVw4ajV4hkFbDnjoWQYNv4
 Ho6Xxia8m6eQQowPZARtT7HcadFQ8pGo9ukkmh57H8qdIUO4HqpJxieXbHrX4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cr6gVPsa
Subject: [Buildroot] [PATCH 2025.02.x] package/pahole: fix build with
 host-cmake 4.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aG9zdC1wYWhvbGUgYnVpbGQgZmFpbHMgd2l0aCByZWNlbnQgaG9zdC1jbWFrZSB2ZXJzaW9ucywg
cHJvZHVjaW5nIHRoZQpmb2xsb3dpbmcgZXJyb3I6CgpDTWFrZSBEZXByZWNhdGlvbiBXYXJuaW5n
IGF0IENNYWtlTGlzdHMudHh0OjEgKGNtYWtlX21pbmltdW1fcmVxdWlyZWQpOgogIENvbXBhdGli
aWxpdHkgd2l0aCBDTWFrZSA8IDMuNSB3aWxsIGJlIHJlbW92ZWQgZnJvbSBhIGZ1dHVyZSB2ZXJz
aW9uCm9mCiAgQ01ha2UuCgogIFVwZGF0ZSB0aGUgVkVSU0lPTiBhcmd1bWVudCA8bWluPiB2YWx1
ZSBvciB1c2UgYSAuLi48bWF4PiBzdWZmaXggdG8KdGVsbAogIENNYWtlIHRoYXQgdGhlIHByb2pl
Y3QgZG9lcyBub3QgbmVlZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIKdmVyc2lvbnMuCgpUaGUg
aXNzdWUgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCBhIG1pbmltYWwgZGVmY29uZmlnOgogIEJSMl9h
cm09eQogIEJSMl9jb3J0ZXhfYTc9eQogIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CiAgQlIyX0xJTlVYX0tFUk5FTD15CiAgQlIyX0xJ
TlVYX0tFUk5FTF9ERUZDT05GSUc9InZlcnNhdGlsZSIKICBCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfUEFIT0xFPXkKQW5kIGhvc3QtY21ha2UgPj0gNC4wLjAKClRoZSBpc3N1ZSBoYXMgYWxy
ZWFkeSBiZWVuIGZpeGVkIGluIHRoZSB1cHN0cmVhbSBwYWhvbGUgcHJvamVjdCBhbmQgaXMKaW5j
bHVkZWQgaW4gdmVyc2lvbnMgPj0gMS4yOC4KCkZpeCB0aGUgaXNzdWUgb24gdGhlIGN1cnJlbnQg
TFRTIGJyYW5jaCBieSBicmluZ2luZyB0aGUgZml4aW5nIGNvbW1pdApmcm9tIHVwc3RyZWFtLgoK
U2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4KLS0tClRoZSBpc3N1ZSBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIG9uIGJ1aWxkcm9vdCBtYXN0
ZXIgYnJhbmNoIChbMV0pIGJ5CmJ1bXBpbmcgdGhlIHBhY2thZ2Ugb24gYSBuZXdlciB2ZXJzaW9u
IHRvIG1ha2Ugc3VyZSB0byBpbmNsdWRlIHRoZQpjb3JyZXNwb25kaW5nIGZpeC4KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTA0MTUtYnVtcF9wYWhvbGUtdjEtMS02
YzZkZjNmZjQ5N2ZAYm9vdGxpbi5jb20vCi0tLQogLi4uTWFrZUxpc3RzLnR4dC1SZXF1aXJlLWNt
YWtlLTMuNS1vci1oaWdoZXIucGF0Y2ggfCA0NSArKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGFob2xl
LzAwMDEtQ01ha2VMaXN0cy50eHQtUmVxdWlyZS1jbWFrZS0zLjUtb3ItaGlnaGVyLnBhdGNoIGIv
cGFja2FnZS9wYWhvbGUvMDAwMS1DTWFrZUxpc3RzLnR4dC1SZXF1aXJlLWNtYWtlLTMuNS1vci1o
aWdoZXIucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMDFmOThmY2I4ODIxNDhmM2EwYmE5YjBlNmM4OWYzZmQ5
ZDU1ODg1MQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcGFob2xlLzAwMDEtQ01ha2VMaXN0
cy50eHQtUmVxdWlyZS1jbWFrZS0zLjUtb3ItaGlnaGVyLnBhdGNoCkBAIC0wLDAgKzEsNDUgQEAK
K0Zyb20gMTJjYTExMjgxOTEyYzI3MmY5MzFlODM2YjkxNjBlZTgyNzI1MDcxNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRo
YXQuY29tPgorRGF0ZTogVHVlLCAyNiBOb3YgMjAyNCAxNDoxOToxNiAtMDMwMAorU3ViamVjdDog
W1BBVENIXSBDTWFrZUxpc3RzLnR4dDogUmVxdWlyZSBjbWFrZSAzLjUgb3IgaGlnaGVyCisKK1Rv
IGFkZHJlc3MgdGhpcyB3YXJuaW5nIGZyb20gY21ha2U6CisKK0NNYWtlIERlcHJlY2F0aW9uIFdh
cm5pbmcgYXQgQ01ha2VMaXN0cy50eHQ6MSAoY21ha2VfbWluaW11bV9yZXF1aXJlZCk6CisgIENv
bXBhdGliaWxpdHkgd2l0aCBDTWFrZSA8IDMuNSB3aWxsIGJlIHJlbW92ZWQgZnJvbSBhIGZ1dHVy
ZSB2ZXJzaW9uIG9mCisgIENNYWtlLgorCisgIFVwZGF0ZSB0aGUgVkVSU0lPTiBhcmd1bWVudCA8
bWluPiB2YWx1ZSBvciB1c2UgYSAuLi48bWF4PiBzdWZmaXggdG8gdGVsbAorICBDTWFrZSB0aGF0
IHRoZSBwcm9qZWN0IGRvZXMgbm90IG5lZWQgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIHZlcnNp
b25zLgorCitDYzogQWxhbiBNYWd1aXJlIDxhbGFuLm1hZ3VpcmVAb3JhY2xlLmNvbT4KK0NjOiBB
bmRyaWkgTmFrcnlpa28gPGFuZHJpaS5uYWtyeWlrb0BnbWFpbC5jb20+CitDYzogRG9tZW5pY28g
QW5kcmVvbGkgPGNhdm9rQGRlYmlhbi5vcmc+CitDYzogRG9taW5pcXVlIExldWVuYmVyZ2VyIDxk
aW1zdGFyQG9wZW5zdXNlLm9yZz4KK0NjOiBEb21pbmlxdWUgTWFydGluZXQgPGFzbWFkZXVzQGNv
ZGV3cmVjay5vcmc+CitDYzogRWR1YXJkIFppbmdlcm1hbiA8ZWRkeXo4N0BnbWFpbC5jb20+CitD
YzogR3VpbGhlcm1lIEFtYWRpbyA8YW1hZGlvQGdlbnRvby5vcmc+CitDYzogSmFuIEFsZXhhbmRl
ciBTdGVmZmVucyA8aGVmdGlnQGFyY2hsaW51eC5vcmc+CitDYzogSmlyaSBPbHNhIDxqb2xzYUBr
ZXJuZWwub3JnPgorQ2M6IE1hdHRoaWFzIFNjaHdhcnpvdHQgPHp6YW1AZ2VudG9vLm9yZz4KK0xp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aMFlFRkFCUWVqZkdUeXJqQHgxCitTaWdu
ZWQtb2ZmLWJ5OiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAcmVkaGF0LmNvbT4KK1Vw
c3RyZWFtOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZGV2ZWwvcGFob2xlL3BhaG9s
ZS5naXQvY29tbWl0Lz9pZD0xMmNhMTEyODE5MTJjMjcyZjkzMWU4MzZiOTE2MGVlODI3MjUwNzE2
CitTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgorLS0tCisgQ01ha2VMaXN0cy50eHQgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBi
L0NNYWtlTGlzdHMudHh0CitpbmRleCAxZDBkYWRmNmVlYTcuLjkwZmE2NWMzOTFiNiAxMDA2NDQK
Ky0tLSBhL0NNYWtlTGlzdHMudHh0CisrKysgYi9DTWFrZUxpc3RzLnR4dAorQEAgLTEsNCArMSw0
IEBACistY21ha2VfbWluaW11bV9yZXF1aXJlZChWRVJTSU9OIDIuOC4xMikKKytjbWFrZV9taW5p
bXVtX3JlcXVpcmVkKFZFUlNJT04gMy41KQorIHByb2plY3QocGFob2xlIEMpCisgY21ha2VfcG9s
aWN5KFNFVCBDTVAwMDA1IE5FVykKKyAKKy0tIAorMi40OS4wCisKCi0tLQpiYXNlLWNvbW1pdDog
ODNiNWU2MTA1Y2FmNjgxZDc3ZTk2ZmU1ZjczOGNjZTlhMDE0Y2Q4NApjaGFuZ2UtaWQ6IDIwMjUw
NDI3LXBhdGNoX3BhaG9sZS1mNjc2ZWVhNjY0NDcKCkJlc3QgcmVnYXJkcywKLS0gCkFsZXhpcyBM
b3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
