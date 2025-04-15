Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D8EC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C42981AAD;
	Tue, 15 Apr 2025 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ml5o7vRsboB; Tue, 15 Apr 2025 19:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5090583332
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5090583332;
	Tue, 15 Apr 2025 19:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BCA9108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D0ED61099
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAHD3u4FKgD9 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90EBC60BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90EBC60BE0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90EBC60BE0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:52:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7CEE3B005A9;
 Tue, 15 Apr 2025 21:52:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 21:52:44 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 21:52:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250410153114.1374261-1-vincent.stehle@arm.com>
References: <20250410153114.1374261-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <24fdcdcc81f9a66cf4cf79ac0ee8cabf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744746766;
 bh=X1bBlaPEN8DwLia3qcjPpPXkc3sLhNBaB0Ro28QyVv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PFbKFD+aPAKGjeU3Hk55lHgEKrXu8W+sXK/9CfLe1aSVFZ8/g9MAYG5XI2vsRiS95
 2Zh5ZftgFL+qcAUjDfOmKpdxLD/u71RsLf7hKQjItZmCCsvvduD6KbflnkbUkfE4Hq
 Q6BF77riilYKTY46XEGDaljnVBwHg4bCoE6zI8QsyFOF+2kcMJWXMxBNlknHEhHsd8
 oP9mjUmM2AlrN0qH/hkwERA4E1IKN2HemM0qwj7Om13dSC1ByvkK2Q6Y1pKP1aomoy
 ruvYbMXSn8c7pxdoNzES5XQydtP6Ljhky9wuL2fiqE3qmiYMuCxHypXKVkrdMgOkUs
 4e3hfMW9Ljy0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PFbKFD+a
Subject: Re: [Buildroot] [PATCH] boot/edk2: drop dependency on tf-a for
 macchiatobin
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMDQvMjAyNSAxNzozMSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdoZW4gYnVpbGRp
bmcgYSBmaXJtd2FyZSBmb3IgdGhlIE1BQ0NISUFUT2JpbiB3aXRoIGVkazIgYW5kCj4gYXJtLXRy
dXN0ZWQtZmlybXdhcmUsIHRoZSBidWlsZCBmYWlscyB3aXRoIHRoZSBmb2xsb3dpbmcgbWFrZSBl
cnJvcjoKPiAKPiAgIG1ha2VbMV06IENpcmN1bGFyIAo+IG91dHB1dC9idWlsZC9lZGsyLWVkazIt
c3RhYmxlMjAyNDExLy5zdGFtcF9jb25maWd1cmVkIDwtIAo+IGFybS10cnVzdGVkLWZpcm13YXJl
IGRlcGVuZGVuY3kgZHJvcHBlZC4KPiAKPiBJbiBmYWN0LCBvbmx5IFRGLUEgZGVwZW5kcyBvbiBF
REsgSUkgKHBhc3NlZCBhcyBCTDMzKSBmb3IgYnVpbGRpbmcgYW5kCj4gbm90IHZpY2UgdmVyc2Eu
IFsxXQo+IAo+IERyb3AgdGhlIGZhbHNlIGRlcGVuZGVuY3kgb24gVEYtQSB0byBmaXggdGhlIGJ1
aWxkLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vU2VtaWhhbGYvZWRrMi1wbGF0Zm9ybXMv
d2lraS9CdWlsZF9maXJtd2FyZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlv
PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkkgYWxzbyBhZGRlZCBleHRyYSBpbmZvIGlu
IHRoZSBjb21taXQgbG9nIHdoaWxlIGFwcGx5aW5nLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
