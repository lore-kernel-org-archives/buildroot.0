Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F76C369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 16:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5708680CE9;
	Sat, 19 Apr 2025 16:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSG3mTtYETj0; Sat, 19 Apr 2025 16:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E58E80CB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E58E80CB9;
	Sat, 19 Apr 2025 16:37:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE68D230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF778606BA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrLcmhzxMNBs for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 16:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D93A606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D93A606AA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D93A606AA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:37:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37B8A4399E;
 Sat, 19 Apr 2025 16:37:50 +0000 (UTC)
Date: Sat, 19 Apr 2025 18:37:50 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
Message-ID: <20250419183750.5e209d58@windsurf>
In-Reply-To: <20250411155314.1378413-1-vincent.stehle@arm.com>
References: <20250411155314.1378413-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehvihhntggvnhhtrdhsthgvhhhlvgesrghrmhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephhhis
 ehsvghniihilhhlrgdrihho
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745080671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZI8sK6J+JXt4QpuOSbmAiTra2LT+zc+xzwQ2H34l8I=;
 b=kn0cyPBon2OMGKSqmNwF71fAAjEX4Q68q5bj8N0u0qjAeJ+4VhcfJ/4HkMd0nqrY0CPd/W
 NC/VrdoZB6Cc+w/+TjpyWaqJOmu0F2RhOon59M02QoklkE1xsoHd1/iYdWfCdlAf9qw42f
 nGuhRtslzigvevf02+pfgMZzpCe+x+qHJx/MVcQzDfYA/5xEeJiqYNvolmoGLf/oKQ2+Ry
 gGbHOjqysODP5NK6UK6nwomq+WMclwQ+eJW1HS2Bgj1iGbQwHXdZEDyeIBGY7o4oFmYjPS
 FnKWWbqo1TXNyeZ4a++v+8c0IvIuebU7cyXvpuQP7cvbzWBN7hhpL4a+F4ovOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kn0cyPBo
Subject: Re: [Buildroot] [PATCH] support/testing: test_edk2: add a few build
 tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxMSBBcHIgMjAyNSAxNzo1MzoxNCArMDIwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBTb21lIEVESyBJSSBjb25maWd1cmF0aW9ucyBo
YXZlIGNvbXBsZXggZGVwZW5kZW5jaWVzIG9uIHNldmVyYWwgcGFja2FnZXMKPiBhbmQgYWRkaXRp
b25hbCBidWlsZCBvcHRpb25zOyBidWlsZCB0ZXN0cyBoZWxwIGtlZXBpbmcgdHJhY2sgb2YgdGhv
c2UKPiBtb3JlIGVhc2lseS4KPiAKPiBGYWN0b3JpemUgc29tZSBjb2RlIGNvbW1vbiB0byBhbGwg
dGhlIGJ1aWxkIHRlc3RzIGludG8gYSBuZXcKPiBUZXN0RWRrMkJ1aWxkQmFzZSBjbGFzcywgd2hp
Y2ggZGVmaW5lcyBhIGJhc2UgY29uZmlndXJhdGlvbiBhbmQgYSBtZXRob2QKPiB0byBhc3NlcnQg
dGhhdCBiaW5hcmllcyBkbyBpbmRlZWQgZXhpc3QgYWZ0ZXIgdGhlIGJ1aWxkLgo+IAo+IFdoaWxl
IGF0IGl0LCBhZGQgbXlzZWxmIGluIERFVkVMT1BFUlMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBEaWNrIE9sc3NvbiA8
aGlAc2VuemlsbGEuaW8+Cj4gLS0tCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
