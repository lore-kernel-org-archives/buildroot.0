Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C7AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 13:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5141381FB6;
	Fri, 28 Jun 2024 13:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_FgQq0pZ50R; Fri, 28 Jun 2024 13:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5841B83848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5841B83848;
	Fri, 28 Jun 2024 13:20:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08D5B1BF39E
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 13:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F141860FC9
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 13:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ee6IBby2UlSO for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 13:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7601F6060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7601F6060D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7601F6060D
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 13:20:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36C5C24000D;
 Fri, 28 Jun 2024 13:20:05 +0000 (UTC)
Date: Fri, 28 Jun 2024 15:20:04 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20240628152004.7e3493c9@kmaincent-XPS-13-7390>
In-Reply-To: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
References: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719580805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsppD4nbMxBuYZmPoZsjAFn4jsTVNgJW0XShcreUqSM=;
 b=J3axUYVFzYYXHXQETBBp6P2DzQiHitmlh/uYYYalSGEst5JgEhDV5fJtTEcrYDAj+93B2k
 22QTAMRxjtX6rQIgXf/3ZylSrMImIdZGlJz4nX1auR8rx2baklfQfL9mNR85QhFo1WuZ+3
 m8im0Iefdw516oSoiXRrpoj8AwhY+kK7t6AEwWErO4D6MRIsXNRkBHhoHNxjA/MaAlJnl8
 G5w4/P/DODPrnG9Qe7+WzoEwj07mn52OMU/lwU7XjXCts6EZuB3lO/08+c9EpVJqtbbXUe
 v43LS4qdHI/DdgiTTMJjBYGTgWW6FMESU6YVmNe0A4FOVupJRUUTnZBAn2kCJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J3axUYVF
Subject: Re: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTHVjYSwKCk9uIE1vbiwgMTcgSnVuIDIwMjQgMTg6MDA6NTAgKzAyMDAKTHVjYSBDZXJl
c29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEJ5IGRlZmF1bHQgVS1C
b290IGJ1aWxkcyBhIGRlZmF1bHQgZW52aXJvbm1lbnQgZnJvbSBpdHMgb3duIGNvbmZpZ3VyYXRp
b24KPiBhbmQgYSBib2FyZC1zcGVjaWZpYyBzZXQgb2YgdmFyaWFibGVzLiBIb3dldmVyIGl0IGFs
c28gYWxsb3dzIHRvIGJ5cGFzcwo+IHRoaXMgZW50aXJlbHkgYW5kIGRlZmluZSB0aGUgZW50aXJl
IGRlZmF1bHQgZW52aXJvbm1lbnQgZnJvbSBhIHRleHQgZmlsZS4KPiAKPiBFeHBvc2UgdGhpcyBm
ZWF0dXJlIHRvIEJ1aWxkcm9vdC4gVGhpcyBhbGxvd3MgdG8gaGF2ZSBhIGZpbGUgZS5nLiBpbgo+
IGJvYXJkLy4uLi91Ym9vdC5lbnYgd2hpY2ggY29udGFpbnMgYW4gZWFzeSB0byBtYWludGFpbiB0
ZXh0IGZpbGUgd2l0aCB0aGUKPiB3YW50ZWQgZGVmYXVsdCBlbnZpcm9ubWVudCwgd2l0aG91dCBw
YXRjaGluZyB0aGUgVS1Cb290IHNvdXJjZSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
Q2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGJvb3QvdWJvb3Qv
Q29uZmlnLmluIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYm9vdC91Ym9v
dC91Ym9vdC5tayAgfCAgOSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluIGIvYm9vdC91Ym9v
dC9Db25maWcuaW4KPiBpbmRleCBmMzcwNDBhMjhhOTcuLmEzYmYzZTAwOWM1MiAxMDA2NDQKPiAt
LS0gYS9ib290L3Vib290L0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3QvdWJvb3QvQ29uZmlnLmluCj4g
QEAgLTEzNiw2ICsxMzYsMzUgQEAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdN
RU5UX0ZJTEVTCj4gIAkgIHRoYXQgd2lsbCBiZSBtZXJnZWQgdG8gdGhlIG1haW4gVS1Cb290IGNv
bmZpZ3VyYXRpb24gZmlsZS4KPiAgZW5kaWYKPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1VCT09U
X1VTRV9ERUZBVUxUX0VOVl9GSUxFCj4gKwlib29sICJHZW5lcmF0ZSBkZWZhdWx0IGVudmlyb25t
ZW50IGZyb20gdGV4dCBmaWxlIgo+ICsJc2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfWFhE
Cj4gKwloZWxwCj4gKwkgIERlZmluZSB0aGUgZW50aXJlIFUtQm9vdCBkZWZhdWx0IGVudmlyb25t
ZW4vKnQgZnJvbSBhIGZpbGUsCj4gKwkgIGRpc2FibGluZyBhbGwgdGhlIGxvZ2ljIHRvIGdlbmVy
YXRlIGl0IGZyb20gdGhlIFUtQm9vdCBzb3VyY2UKPiArCSAgY29kZSBhbmQgb3RoZXIgY29uZmln
dXJhdGlvbiB2YWx1ZXMuCj4gKwo+ICsJICBCYXNlZCBvbiB0aGUgVVNFX0RFRkFVTFRfRU5WX0ZJ
TEUgYW5kIERFRkFVTFRfRU5WX0ZJTEUgVS1Cb290Cj4gKwkgIGNvbmZpZ3VyYXRpb24gdmFyaWFi
bGVzLgo+ICsKPiArCSAgUmVxdWlyZXMgVS1Cb290ID49IHYyMDE4LjA1Lgo+ICsKPiArY29uZmln
IEJSMl9UQVJHRVRfVUJPT1RfREVGQVVMVF9FTlZfRklMRQo+ICsJc3RyaW5nICJUZXh0IGZpbGUg
d2l0aCBkZWZhdWx0IGVudmlyb25tZW50Igo+ICsJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1VCT09U
X1VTRV9ERUZBVUxUX0VOVl9GSUxFCj4gKwloZWxwCj4gKwkgIFRleHQgZmlsZSBjb250YWluaW5n
IHRoZSB2YXJpYWJsZXMgdG8gYmUgdXNlZCBhcyB0aGUgZGVmYXVsdAo+ICsJICBlbnZpcm9ubWVu
dCBpbiBVLUJvb3QuCj4gKwo+ICsJICBGcm9tIHRoZSBVLUJvb3QgZG9jdW1lbnRhdGlvbjoKPiAr
Cj4gKwkgICAgVGhlIGZvcm1hdCBpcyB0aGUgc2FtZSBhcyBhY2NlcHRlZCBieSB0aGUgbWtlbnZp
bWFnZSB0b29sLCB3aXRoCgpMaW5lIGV4Y2VlZCA2MiBjaGFyYWN0ZXJzLgoKUGxlYXNlIHVzZSBj
aGVjay1wYWNrYWdlIHRvb2w6IAouL3V0aWxzL2NoZWNrLXBhY2thZ2UgYm9vdC91Ym9vdC8qCiAg
Ym9vdC91Ym9vdC9Db25maWcuaW46MTYxOiBoZWxwIHRleHQ6IDx0YWI+PDIgc3BhY2VzPjw2MiBj
aGFycz4KICAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI3dyaXRpbmctcnVsZXMtY29u
ZmlnLWluKQoKRXhjZXB0IGZvciB0aGF0IGZpeDoKQWNrZWQtYnk6IEtvcnkgTWFpbmNlbnQgPEtv
cnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
