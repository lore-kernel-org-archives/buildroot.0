Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D471C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA8F83B25;
	Thu,  9 May 2024 15:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7PMHVFTC4ka; Thu,  9 May 2024 15:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECE483B94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ECE483B94;
	Thu,  9 May 2024 15:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64ED61BF5DB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E14D4150F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUPTBbEHu-xH for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:35:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1B0D414FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B0D414FA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1B0D414FA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:35:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE551FF802;
 Thu,  9 May 2024 15:35:36 +0000 (UTC)
Date: Thu, 9 May 2024 17:35:35 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240509173535.1db220f3@windsurf>
In-Reply-To: <20240418085858.126825-1-alexis.lothore@bootlin.com>
References: <20240418085858.126825-1-alexis.lothore@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715268937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KF0QFD21FEaBgT8GfQZcNsmA5sDTctd2mZ0B4JFFmCE=;
 b=ahtQCdAm6BR4G/h1kcJPDNH5EsYMM+7+HmWXOWXr6C2FWdA9BH0kjl2nxEpTGKO6aAbwxu
 01RfN0unuqlM/oR9rMGhGpIYkBtl17UnV4gF+4lUS/NaNUrKSaVCwyhPv2NzDFUToxLLk9
 K1jVCJ8XG8Jea58RsZo37bPu8hw3wCra4rsmNBtpZHwOi3yUJDDoKv+EdrTetIZLXoc/iL
 PX7z6yHP1HCZ6Vj+0nhraBDXgKwBcgrMLO9pFFNHLJQnhsuYRMK8M+cL3dFk0w/3Vb42NC
 qo/9QdTfZH+7sIGUxoxWkVep2YZH/LQl6a0qkyjpitqZp1sN3URjJMf3bQA0bQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ahtQCdAm
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pppd: bump package to fix
 startup issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxOCBBcHIgMjAyNCAxMDo1ODo1OCArMDIwMApBbGV4aXMgTG90aG9yw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBwcHBkIGZhaWxzIHRv
IHN0YXJ0IG9uIGEgc3lzdGVtcyB3aXRoIGJ1aWxkcm9vdCAyMDI0LjAyLnggYmVjYXVzZSBvZgo+
IG1pc3NpbmcgcHBwZCBkaXJlY3RvcnkgaW4gL3Zhci9ydW4uIFRoZXJlIGFyZSBzb21lIGxvZ3Mg
aGludGluZyBhdCB0aGlzCj4gaXNzdWU6Cj4gV2FybmluZzogY291bGRuJ3Qgb3BlbiBwcHAgZGF0
YWJhc2UgL3Zhci9ydW4vcHBwZC9wcHBkMi50ZGIKPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92
YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBw
cC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBDYW4ndCBjcmVhdGUgbG9j
ayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkKPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9j
ay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBDYW4ndCBj
cmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVu
L3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
PiBDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHkt
ZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAKPiBUaGUgaXNzdWUgaGFzIGFscmVh
ZHkgYmVlbiBkZXRlY3RlZCBhbmQgZml4ZWQgdXBzdHJlYW0gKHNlZSBbMV0pIGFuZCBpcwo+IGV4
cGVjdGVkIHRvIGJlIHJlbGVhc2VkIG9uIGEgdjIuNS4xLCBidXQgdGhpcyByZWxlYXNlIHNlZW1z
IHRvIGJlIHN0YWxsZWQKPiBmb3Igbm93IChzZWUgWzJdKS4gQnVtcCBvbiBjdXJyZW50IG1hc3Rl
ciwgd2hpY2ggY3VycmVudGx5IHJlZmxlY3RzIHdoYXQKPiB3aWxsIGxpa2VseSBiZSB0aGUgMi41
LjEuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcHAtcHJvamVjdC9wcHAvaXNzdWVzLzQx
OQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcHBwLXByb2plY3QvcHBwL2lzc3Vlcy80NjAKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBidW1wIHBhY2thZ2UgaW5zdGVhZCBvZiBi
YWNrcG9ydGluZyBwYXRjaGVzLCBiYXNlZCBvbiBCZXJuZCBLdWhscycKPiAgIHN1Z2dlc3Rpb24K
PiAtIHJlbW92ZSBwYXRjaGVzIHRoYXQgYXJlIG5vdyBpbnRlZ3JhdGVkIGluIG5ldyB2ZXJzaW9u
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLiBJIGhhZCB0byBkcm9wIHBhdGNoIDAwMDUgd2hp
Y2ggd2FzIGFkZGVkIGluCnRoZSBtZWFuIHRpbWUsIGFzIGl0IGlzIGFscmVhZHkgdXBzdHJlYW0g
YW5kIHRoZXJlZm9yZSBwYXJ0IG9mIHRoaXMKdmVyc2lvbiBidW1wLgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
