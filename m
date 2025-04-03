Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED0C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F31CB81831;
	Thu,  3 Apr 2025 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhtthrC8X8lK; Thu,  3 Apr 2025 22:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226A181768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226A181768;
	Thu,  3 Apr 2025 22:00:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E26B31F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB44B608FC
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lajt3NA9deIU for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 22:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AC9D608D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC9D608D3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AC9D608D3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 22:00:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9D6643216;
 Thu,  3 Apr 2025 22:00:47 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 04 Apr 2025 00:00:41 +0200
Message-Id: <D8XCBDX943KB.2BDN1N5MYPSPI@bootlin.com>
Cc: <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, =?utf-8?q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
To: "Andy Yan" <andyshrk@163.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
 <20250205-fix_zxing-v1-2-c3e4c2adfdab@bootlin.com>
 <1d860b05.9627.195f5c15a97.Coremail.andyshrk@163.com>
In-Reply-To: <1d860b05.9627.195f5c15a97.Coremail.andyshrk@163.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeljeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcuuehonhhnvghfihhllhgvfdcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegfeffjeetffeuffdvueekvefhheduudegfedufeefhefghfegtddutedtfeelveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghuihhlughrohhothdrohhrghenucfkphepvdgrtddumegtsgduleemleelvdeimehfkedttdemudduudemtggufhejmeeggeehfhemiegsjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemleelvdeimehfkedttdemudduudemtggufhejmeeggeehfhemiegsjeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnugihshhhrhhkseduieefrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughro
 hhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743717648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLU5kXwL71XNqBcayoQ2l8/cdhJMSbGUtyRh0ADwNqI=;
 b=cnzh/qYbK1jv3zVxGtZIREeazHuaBoUkNcGtptwIArb43EjBO5/BNco4ZpcbANhc5Trta0
 I1pV8OZc0my24+264QAhsLIXUqY6c3Fl68lOEzxX6ycl3hqb4R9iHaEc+RULlOZ13cH8bo
 hGVICmkWCFznIHG3ZhPoWqRx1U900tnYm8S8Mo4x5mY6eh9ErFB/+HH3J/gXD43OpBf/Pq
 SDrznOdJTRwqMzwSjctXjGjwSpafgtuLva2i9nVlgcPXR33NbRqQozVujEsWj3+8z/Y47h
 NJrJTtXRjryRk4dbjLDw+rriJI18GKeMHKkrSEspDBikt0v34A7KfaFiCiM8mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cnzh/qYb
Subject: Re: [Buildroot] [PATCH 02/12] package/gstreamer1/gstreamer1: bump
 version to 1.24.11
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSB0ZXN0ICEKClRoaXMgc2VyaWVzIG5l
ZWRlZCBhIHNlY29uZCB2ZXJzaW9uIHRvIGRpc2FibGUgYnkgZGVmYXVsdCB0aGUgZGlmZmVyZW50
Cm5ldyBmZWF0dXJlcyBmcm9tIGdzdHJlYW1lciB0aGF0IGFyZW4ndCBzdXBwb3J0ZWQgeWV0LgoK
SSB3b3JrZWQgb24gdGhpcyBzZWNvbmQgdmVyc2lvbiBidXQgaXQgaXNuJ3QgZmluaXNoZWQgeWV0
IGFuZCBJIGRpZG4ndApoYWQgbXVjaCB0aW1lIHRvIGZpbmlzaCBpdC4uLgoKT24gV2VkIEFwciAy
LCAyMDI1IGF0IDExOjA3IEFNIENFU1QsIEFuZHkgWWFuIHdyb3RlOgo+Cj4gSGVsbG/vvIwKPiAg
ICAgIEFyZSB0aGUgcmVtYWluaW5nIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgbGVmdCB1bm1lcmdl
ZCBkdWUgdG8gYmVpbmcgZm9yZ290dGVuPwo+Cj4gQXQgMjAyNS0wMi0wNSAxNzo0Nzo0MCwgIlRo
b21hcyBCb25uZWZpbGxlIHZpYSBidWlsZHJvb3QiIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g
d3JvdGU6Cj4+U2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZp
bGxlQGJvb3RsaW4uY29tPgo+Cj4gICAgIFRlc3RlZC1ieTogIEFuZHkgWWFuPGFuZHlzaHJrQDE2
My5jb20+Cj4KPj4tLS0KPj4gcGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVy
MS5oYXNoIHwgNCArKy0tCj4+IHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1l
cjEubWsgICB8IDIgKy0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4+Cj4+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIx
L2dzdHJlYW1lcjEuaGFzaCBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1l
cjEuaGFzaAo+PmluZGV4IDQ0NWYxYzE1ZjQ4YTczODkxZmY2ODFlNmVmMDI2MWQ1MjE3OTJkZDku
LjdjYzk5MmE1Y2I0NzdiNDg5MzljMjg3ZWY0NzU4NjU4MGQxYjE4NzkgMTAwNjQ0Cj4+LS0tIGEv
cGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5oYXNoCj4+KysrIGIvcGFj
a2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5oYXNoCj4+QEAgLTEsMyArMSwz
IEBACj4+LSMgRnJvbSBodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJl
YW1lci9nc3RyZWFtZXItMS4yMi4xMi50YXIueHouc2hhMjU2c3VtCj4+LXNoYTI1NiAgYWMzNTJm
M2QwMmNhYTY3ZjNiMTY5ZGFhOWFhNzhiMDRkZWEwZmMwOGE3MjdkZTczY2IyOGQ4OWJkNTRjNmY2
MSAgZ3N0cmVhbWVyLTEuMjIuMTIudGFyLnh6Cj4+KyMgRnJvbSBodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdHJlYW1lci9nc3RyZWFtZXItMS4yNC4xMS50YXIueHouc2hh
MjU2c3VtCj4+K3NoYTI1NiAgMDkzYTM3OTYwMmEyNTBkNWNkMzNiODhlNzIzNzU3YzgwMTk4MzE3
ZWZkZTMzODkzZWRmM2M4N2I2ZTUzYjkwNyAgZ3N0cmVhbWVyLTEuMjQuMTEudGFyLnh6Cj4+IHNo
YTI1NiAgYWQyZWVjNTE5ZWJkNGI1ZGY4NmVhODRkZmYyNGFlM2JmYTJlZGVhODQ2YTcwM2I1ODkw
MmRkMjIxYWUzNzVkYiAgQ09QWUlORwo+PmRpZmYgLS1naXQgYS9wYWNrYWdlL2dzdHJlYW1lcjEv
Z3N0cmVhbWVyMS9nc3RyZWFtZXIxLm1rIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEv
Z3N0cmVhbWVyMS5tawo+PmluZGV4IDE1Nzc5OTQyNDhhNWI5YzU3ZTUwMWFiZTMwMzFmOGI5OGYz
NzJmMGUuLmUwNjMwOWJlYjRiZjhlZjVmOGJjZDMzYTcxNWNmYjQ2NzNjNGJhM2QgMTAwNjQ0Cj4+
LS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5tawo+PisrKyBi
L3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEubWsKPj5AQCAtNCw3ICs0
LDcgQEAKPj4gIwo+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAKPj4tR1NUUkVBTUVSMV9W
RVJTSU9OID0gMS4yMi4xMgo+PitHU1RSRUFNRVIxX1ZFUlNJT04gPSAxLjI0LjExCj4+IEdTVFJF
QU1FUjFfU09VUkNFID0gZ3N0cmVhbWVyLSQoR1NUUkVBTUVSMV9WRVJTSU9OKS50YXIueHoKPj4g
R1NUUkVBTUVSMV9TSVRFID0gaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9n
c3RyZWFtZXIKPj4gR1NUUkVBTUVSMV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPj4KPj4tLSAKPj4y
LjQ4LjEKPj4KPj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj5idWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
