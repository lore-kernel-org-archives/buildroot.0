Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13789C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 08:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A28960DC5;
	Thu, 26 Jun 2025 08:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc9alFU3Rene; Thu, 26 Jun 2025 08:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977D060673
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977D060673;
	Thu, 26 Jun 2025 08:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BC8C10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CBE660690
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlMQUY44F0iI for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 08:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10D9260640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D9260640
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10D9260640
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:02:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6099442CD;
 Thu, 26 Jun 2025 08:02:44 +0000 (UTC)
Date: Thu, 26 Jun 2025 10:02:42 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Olivier Benjamin
 <olivier.benjamin@bootlin.com>
Message-ID: <20250626100242.27ab1407@booty>
In-Reply-To: <20250625-perf_libtraceevent-v1-1-0bf7620bc6c9@bootlin.com>
References: <20250625-perf_libtraceevent-v1-1-0bf7620bc6c9@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvheduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhteduuefgheehleeihfejjeduvdeltddutddtveeltdfhheeguefgteehkefgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750924965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAfG0iFa9Y+Y3CgmIs43HoTvW0jq9GvR5U7hzbi5Nz8=;
 b=bG+w3wkrU8omb6v5BhSp5zXZa1Q0RsMKZcuXrHxalcpDC8G69scraFLXtHU5yHWS5OaTNU
 BRHkUmeY3hgcKYNOnbnaIKBprw1LH8fvqQSWeqh0XuPfUbMq+Ul1jYvLRSMLqGq+lhYs+p
 /6zsv6KIue7EA+4JDr30BrMcpNmh4950cG9GoWmV7MuIL0drvy3gr8Ajc83CjiCQwdheBy
 oA6MefRuuN5T8hhDloWS3mMMWjR767GZFNsGSJUYgM7HVYBb3o6eavUJ8n8//dPq9gZrBp
 nVAwr9HS9iJyDPhGcZ2TCbW3NXrhv4ov0rL7+Eaiq7qCugwvZ9RQVji6O8JsVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bG+w3wkr
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: build with
 libtraceevent support when it is selected
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGlzLAoKT24gV2VkLCAyNSBKdW4gMjAyNSAyMjo1NDowMSArMDIwMApBbGV4aXMgTG90
aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gV2hlbiB0cnlpbmcg
dG8gcGVyZm9ybSBhIGN1c3RvbSB1cHJvYmUgcmVjb3JkaW5nIG9uIGEgdGFyZ2V0IHdpdGggcGVy
Zgo+IGJ1aWx0IGJ5IGJ1aWxkcm9vdCwgdGhlIHJlY29yZGluZyBzdGVwIGZhaWxzIGFzIHBlcmYg
Y2FuIG5vdCByZWNvcmQKPiB1cHJvYmVzIHdpdGhvdXQgbGlidHJhY2VldmVudCBzdXBwb3J0Ogo+
IAo+ICAgJCBwZXJmIHByb2JlIC14IGxpbmtlZF9saXN0IGluc2VydF9uYW1lIGluZGV4Cj4gICBU
YXJnZXQgcHJvZ3JhbSBpcyBjb21waWxlZCB3aXRob3V0IG9wdGltaXphdGlvbi4gU2tpcHBpbmcg
cHJvbG9ndWUuCj4gICBQcm9iZSBvbiBhZGRyZXNzIDB4ODA4IHRvIGZvcmNlIHByb2JpbmcgYXQg
dGhlIGZ1bmN0aW9uIGVudHJ5Lgo+IAo+ICAgQWRkZWQgbmV3IGV2ZW50Ogo+ICAgICBwcm9iZV9s
aW5rZWRfbGlzdDppbnNlcnRfbmFtZSAob24gaW5zZXJ0X25hbWUgaW4gL3Jvb3QvZ2RiL2xpbmtl
ZF9saXN0IHdpdGggaW5kZXgpCj4gCj4gICBwZXJmIGlzIG5vdCBsaW5rZWQgd2l0aCBsaWJ0cmFj
ZWV2ZW50LCB0byB1c2UgdGhlIG5ldyBwcm9iZSB5b3UgY2FuIHVzZSB0cmFjZWZzOgo+IAo+ICAg
ICAgICAgICBjZCAvc3lzL2tlcm5lbC90cmFjaW5nLwo+ICAgICAgICAgICBlY2hvIDEgPiBldmVu
dHMvcHJvYmVfbGlua2VkX2xpc3QvaW5zZXJ0X25hbWUvZW5hYmxlCj4gICAgICAgICAgIGVjaG8g
MSA+IHRyYWNpbmdfb24KPiAgICAgICAgICAgY2F0IHRyYWNlX3BpcGUKPiAgICAgICAgICAgQmVm
b3JlIHJlbW92aW5nIHRoZSBwcm9iZSwgZWNobyAwID4gZXZlbnRzL3Byb2JlX2xpbmtlZF9saXN0
L2luc2VydF9uYW1lL2VuYWJsZQo+ICAgJCBwZXJmIHJlY29yZCAtZSBwcm9iZV9saW5rZWRfbGlz
dDppbnNlcnRfbmFtZSAuL2xpbmtlZF9saXN0Cj4gICBldmVudCBzeW50YXggZXJyb3I6ICdwcm9i
ZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZScKPiAgICAgICAgICAgICAgICAgICAgICAgIFxfX18g
dW5zdXBwb3J0ZWQgdHJhY2Vwb2ludAo+IAo+ICAgbGlidHJhY2VldmVudCBpcyBuZWNlc3Nhcnkg
Zm9yIHRyYWNlcG9pbnQgc3VwcG9ydAo+ICAgUnVuICdwZXJmIGxpc3QnIGZvciBhIGxpc3Qgb2Yg
dmFsaWQgZXZlbnRzCj4gCj4gICAgVXNhZ2U6IHBlcmYgcmVjb3JkIFs8b3B0aW9ucz5dIFs8Y29t
bWFuZD5dCj4gICAgICAgb3I6IHBlcmYgcmVjb3JkIFs8b3B0aW9ucz5dIC0tIDxjb21tYW5kPiBb
PG9wdGlvbnM+XQo+IAo+ICAgICAgIC1lLCAtLWV2ZW50IDxldmVudD4gICBldmVudCBzZWxlY3Rv
ci4gdXNlICdwZXJmIGxpc3QnIHRvIGxpc3QgYXZhaWxhYmxlIGV2ZW50cwo+IAo+IGxpYnRyYWNl
ZXZlbnQgc3VwcG9ydCBmb3IgcGVyZiBoYXMgYmVlbiBkaXNhYmxlZCB3aXRoIGNvbW1pdAo+IGI0
YWI0NWE1YzFkYiAoInBhY2thZ2UvbGludXgtdG9vbHM6IGRpc2FibGUgbGlidHJhY2V2ZW50IGRl
dGVjdGlvbiIpCj4gYmVjYXVzZSB0aGVyZSB3YXMgbm8gbGlidHJhY2VldmVudCBwYWNrYWdlIGlu
IGJ1aWxkcm9vdCB0byByZXBsYWNlIHRoZQo+IGZvcm1lciBsaWJ0cmFjZWV2ZW50IHJlbW92ZWQg
ZnJvbSB0aGUga2VybmVsIHNvdXJjZXMuIFNpbmNlIHRoZW4sIGNvbW1pdAo+IDE0NzRmMWIzNGIx
NyAoInBhY2thZ2UvbGlidHJhY2VldmVudDogbmV3IHBhY2thZ2UiKSBoYXMgaW50cm9kdWNlZCBh
Cj4gbGlidHJhY2VldmVudCBwYWNrYWdlLiBXZSBjYW4gdGhlbiBleHBvc2UgYWdhaW4gdGhlIHBv
c3NpYmlsaXR5IHRvIGJ1aWxkCj4gcGVyZiB3aXRoIGxpYnRyYWNlZXZlbnQgc3VwcG9ydC4KPiAK
PiBNYWtlIGJ1aWxkcm9vdCBwZXJmIG1ha2VmaWxlIGRldGVjdCBpZiBsaWJ0cmFjZWV2ZW50IHBh
Y2thZ2UgaGFzIGJlZW4KPiBlbmFibGVkLCBhbmQgaWYgc28sIGFsbG93IHRvIGJ1aWxkIHBlcmYg
d2l0aCBsaWJ0cmFjZWV2ZW50IHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAtLS0KPiBUbzogYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT4KPiBDYzogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNv
bT4KPiBDYzogT2xpdmllciBCZW5qYW1pbiA8b2xpdmllci5iZW5qYW1pbkBib290bGluLmNvbT4K
PiAtLS0KPiBJdCBpcyB3b3J0aCBub3RpbmcgdGhhdCB0aGVyZSBpcyBhIGJ1ZyBpbiBwZXJmIG1h
a2VmaWxlIGtlcm5lbCB0aGF0Cj4gYWZmZWN0cyBtYW55IGtlcm5lbCB2ZXJzaW9ucyAodXAgdG8g
Ni4xMCkgYW5kIHRoYXQgcHJldmVudHMgcGVyZiBmcm9tCj4gYnVpbGRpbmcgY29ycmVjdGx5IHdo
ZW4gZW5hYmxpbmcgbGlidHJhY2VldmVudCBzdXBwb3J0IChzZWUgNDQwY2Y3NzYyNWUzCj4gKCJw
ZXJmOiBidWlsZDogU2V0dXAgUEtHX0NPTkZJR19MSUJESVIgZm9yIGNyb3NzIGNvbXBpbGF0aW9u
IikgaW4KPiBsaW51eCkuCgpUaGFua3MgZm9yIHRoZSByZXNlYXJjaCEKCkFuZCBhcHBhcmVudGx5
IHRoZSBtZW50aW9uZWQgY29tbWl0IHdhcyBhcHBsaWVkIGluIDYuMTEgYW5kIG5vdApiYWNrcG9y
dGVkIHRvIDYuMTAgYW5kIHByZXZpb3VzIHN0YWJsZSByZWxlYXNlcy4KClNob3VsZG4ndCBpdCBi
ZSBiYWNrcG9ydGVkPyBUaGlzIGxvb2tzIGxpa2UgYSBmaXgsIGRvZXNuJ3QgaXQ/Cgo+IFNob3Vs
ZCB0aGUgbGlidHJhY2VldmVudCB0aGVuIGJlIGV4cGxpY2l0ZWx5IGVuYWJsZWQgYnkgdGhlCj4g
dXNlciwgcmF0aGVyIHRoYW4gYXV0b21hdGljYWxseSBlbmFibGluZyBpdCB3aGVuIGxpYnRyYWNl
ZXZlbnQgcGFja2FnZQo+IGlzIHNlbGVjdGVkID8KClNob3VsZCB0aGUgZml4IGJlIGJhY2twb3J0
ZWQgdG8gdGhlIGN1cnJlbnRseS1zdXBwb3J0ZWQgc3RhYmxlIGtlcm5lbAp2ZXJzaW9ucywgSSdk
IHNheSB3ZSBjYW4gYXV0b21hdGljYWxseSBlbmFibGUgbGlidHJhY2VldmVudCBzdXBwb3J0LgpP
dGhlcndpc2UgSSdtIG5vdCBzdXJlLi4uIE1lbnRpb25pbmcgdGhlIGlzc3VlIGFuZCBwb2ludGlu
ZyB0byB0aGUgZml4CmNvbW1pdCBpbiB0aGUgS2NvbmZpZyBoZWxwIHRleHQgaXMgYW5vdGhlciBv
cHRpb24uCgpMdWNhCgotLSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
