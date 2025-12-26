Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A9E8FDA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6836360D59;
	Fri, 26 Dec 2025 14:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYL4lR86faB8; Fri, 26 Dec 2025 14:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C865260C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766757792;
	bh=bXnSsiDemiwUUnwCkVMsM8qOl+l1UTP1BZBoSZljvZg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNMf5qTegCq6UHHuCDvX4BNk0rBKqC36Tqi0YzyqBntk0FX+3/QQXZWZARHdjx8x3
	 erNyQl0QMi/AK6/XId0nJwYhYuHAtsKHUfGDT+hZDU+AH5lQPSv3Xdtlwbxk59Affc
	 FzsPtTT6G9SKxScPjsspmAZ+BLheDy8sYdi7RyjbieoLnZu1YvA41IspeuV0/LsPud
	 GOgW04kAAXE5JTW8ggOe5umx72mo0lp+J78W11H8jUFO1mkplBh/1iTSd/ghcaNNic
	 iVof+OSfgjdPJibDo3iRDz8k5lFgIzVWrUrrlX90OPPyiOXEsE9r7r3FSxwsunVEjd
	 GnXT6uw8zy98w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C865260C29;
	Fri, 26 Dec 2025 14:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86AE0B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6925281B14
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJewsJYhAKlT for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 14:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B38581AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B38581AF4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B38581AF4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:03:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1DF0FB0054E;
 Fri, 26 Dec 2025 15:02:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 15:02:51 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 15:02:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Clouter
 <alex+buildroot@digriz.org.uk>, Jean Burgat <jeanburgat33@gmail.com>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Prabhu Sannachi
 <prabhu.sannachi@collins.com>, Denis Bodor <lefinnois@lefinnois.net>, James
 Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, James Knight
 <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael
 Vetter <jubalh@iodoru.org>
In-Reply-To: <20251207144243.3696572-22-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
 <20251207144243.3696572-22-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <06736af841c4f43be23116f108884933@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766757787;
 bh=mo1woYxFPSvlb6l/YV462S3/fbHp3RbQ6ANspY05PaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VjpZspCXfgf63IzM841zj4IkuQKxP1Q480/A+C3rr/9TKnExqamkaje5Q3c0UPdOM
 szqCH5hUgtHyp4xquWzudC0KQUbfAclxFd3ojZRDqFYgoyDmplkMGLiyiSFsU2hvcj
 CszSafvTr0kIkhD1JY/7rEeaEMKOTH8lRQt9Eg03saAOXCtjQoCp6dcVjS3uNf8tkN
 gHykaK7OS3VZWQiZ2VfwVJdR9ZBTN7e+ioIrUaGsJ6NQ2sOjbl7MAlNES8b1x9JDS9
 H6lHqGQqMvf/LEAFSRqai9uaWLmLcvW2VcoHeGDMNhC+IX61ohyg04MB1E3m4rj0Bp
 Dl1f3vZjHR1Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VjpZspCX
Subject: Re: [Buildroot] [PATCH/next 22/33] package/rtptools: bump version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIDA3LzEyLzIwMjUgMTU6NDIsIEJl
cm5kIEt1aGxzIHdyb3RlOgo+IFN3aXRjaGVkIF9TSVRFIHRvIGdpdGh1YiwgcHJldmlvdXMgc2l0
ZSBpcyBvZmZsaW5lLgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pcnRsYWIvcnRwdG9vbHMvY29t
bWl0LzI2ZjZkYWVlYWEzMjE3YTk4Y2I2M2U5NDYzZDYwMjg2ZjdmYjkwZDgKPiByZXBsYWNlZCB0
aGUgYXV0b3Rvb2xzLWJhc2VkIGJ1aWxkIHN5c3RlbSB3aXRoIGEgaGFuZC13cml0dGVuIHNjcmlw
dC4KPiAKPiBBZGRlZCBUQVJHRVRfRElSIGFzIFBSRUZJWCB0byBjb25maWd1cmUubG9jYWwgd2hp
Y2ggaXMgcmVhZCBieSB0aGUKPiBjb25maWd1cmUgc2NyaXB0Ogo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9pcnRsYWIvcnRwdG9vbHMvYmxvYi9tYXN0ZXIvY29uZmlndXJlI0w2OAo+IAo+IHRvIG92ZXJ3
cml0ZSB0aGUgZGVmYXVsdCB2YWx1ZSAiL3Vzci9sb2NhbCI6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L2lydGxhYi9ydHB0b29scy9ibG9iL21hc3Rlci9jb25maWd1cmUjTDY0Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KWy4uLl0KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9ydHB0b29scy9ydHB0b29scy5tayAKPiBiL3BhY2thZ2UvcnRwdG9vbHMv
cnRwdG9vbHMubWsKPiBpbmRleCAyMTQ4Yjc1OWFjLi42MWRlMmI5ZjQ3IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcnRwdG9vbHMvcnRwdG9vbHMubWsKPiArKysgYi9wYWNrYWdlL3J0cHRvb2xzL3J0
cHRvb2xzLm1rCj4gQEAgLTQsMTAgKzQsMTQgQEAKPiAgIwo+ICAKPiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+IAo+IC1SVFBUT09MU19WRVJTSU9OID0gMS4yMgo+IC1SVFBUT09MU19TSVRFID0g
Cj4gaHR0cDovL3d3dy5jcy5jb2x1bWJpYS5lZHUvaXJ0L3NvZnR3YXJlL3J0cHRvb2xzL2Rvd25s
b2FkCj4gK1JUUFRPT0xTX1ZFUlNJT04gPSA1MjBjMGEzNzIyZjM3Y2QyNDNkNjkwODA2M2Q4NmEw
MzA2YWNlMDg4Cj4gK1JUUFRPT0xTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGlydGxhYixydHB0b29s
cywkKFJUUFRPT0xTX1ZFUlNJT04pKQoKV2hlbiB0cnlpbmcgdG8gY29tcGlsZSB0aGlzIG5ldyB2
ZXJzaW9uIHdpdGggdGhlIGNvbW1hbmRzOgoKY2F0ID4uY29uZmlnIDw8RU9GCkJSMl9hYXJjaDY0
PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
Tj15CkJSMl9QQUNLQUdFX1JUUFRPT0xTPXkKRU9GCm1ha2Ugb2xkZGVmY29uZmlnCm1ha2UgcnRw
dG9vbHMKCkl0IGZhaWxzIHdpdGggZXJyb3I6Cgpjb21wYXQtZ2V0dGltZW9mZGF5LmM6IEluIGZ1
bmN0aW9uIOKAmGdldHRpbWVvZmRheeKAmToKY29tcGF0LWdldHRpbWVvZmRheS5jOjQ2OjI1OiBl
cnJvcjogc3RvcmFnZSBzaXplIG9mIOKAmHN0duKAmSBpc27igJl0IGtub3duCgpDb3VsZCB5b3Ug
aGF2ZSBhIGxvb2ssIHBsZWFzZT8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
