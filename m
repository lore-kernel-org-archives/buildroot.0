Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D2CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 17:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E0C40E90;
	Wed,  6 May 2026 17:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdERyXhV95do; Wed,  6 May 2026 17:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23D1840ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778088082;
	bh=GaReZb61uW+mUsxOWhItTZQ3BFcusuBmpALp/BA74l4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWNS4rNFsFG2Hc8IdlI3dA9s3QYTqBVNWRnpzSXPdZix2QCn7ZqGiuugE/F7ccIgM
	 WnUGmGdbMf/qFsBHywIK+rxye5kJoifvt3JDUNBg/6a1D+SjKwi4brVr/EMYicFZGK
	 DQmHeMqlDdKjxAzKfZubfp2hMpmhWiBHC4ZvVQUgHTbQcblUfZlSJS0GAyri5X4RGL
	 JnR2JQJPi6C8Z4pO0azEMqWGU+JS19oTsLPLc8OWtkSp7BYhQUR5w7DbJt9JeNi3au
	 88+YZdxOm1P6w80NcAK4AC6tfd64kAuYKsvSBgfpokYC+34tr5uaNV8F+zsXFP1fDV
	 ZR7ts5D4+ALkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D1840ECD;
	Wed,  6 May 2026 17:21:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC96611B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2CD760E9D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrrfSWJM413j for <buildroot@buildroot.org>;
 Wed,  6 May 2026 17:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B86D60E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B86D60E9C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B86D60E9C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:21:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -572408006; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 May 2026 17:21:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wKfvn-000000020lQ-3tTg;
 Wed, 06 May 2026 19:21:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>,  Manuel Diener
 <manuel.diener@oss.othermo.de>,  Oli Vogt <oli.vogt.pub01@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260506121800.507252-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Wed, 6 May 2026 14:17:58 +0200")
References: <20260506121800.507252-1-buildroot@bubu1.eu>
Date: Wed, 06 May 2026 19:21:07 +0200
Message-ID: <873404qwsc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QeynNrX3Baz6lrQ8f0G/AbJS/TMoQ2+yNgfm4O0Cg1Gdu4aMcwdVRLjSyi2hOCbBUe2oGCxqeoeREhyIcQUunnExBtzRKDKy4PYxGZ/F3iJMKnXbLZ0VtGcnMDV4E4rgI2VpLMv/WIzVOsP1Jt6dHT9oV9o5smyFc7Rcz047teaP1+6FzkYvOhCV3u9OShDyh1ox7f+F/1rxXrakDTU/pzyHzcNpnk8ImWQG7FY8tDZjZTASVPC7U5tmQ1uQeZmpeBzVD9cgH6R6t6Fiao19fHfOxqfZ+1Tg2aJN1J5PlWgQisT3VAPZIFYg85lqqgAItsA4U4fQxsMq7BWiHFJFbQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=/FvurTVrXLJ/wLyfvE8W1Krpyf4mzP9QfR8ZAUSr2EE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QeynNrX3
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 6.0.5
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk1hcmN1cyIgPT0gTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBEamFuZ28gNi4wLjUgZml4ZXMgdGhyZWUgc2Vj
dXJpdHkgaXNzdWVzIHdpdGggc2V2ZXJpdHkg4oCcbG934oCdIGFuZCBzZXZlcmFsIGJ1Z3MgaW4g
Ni4wLjQuCiA+IFNlY3VyaXR5IEZpeGVzOgogPiAqIENWRS0yMDI2LTU3NjY6IFBvdGVudGlhbCBk
ZW5pYWwtb2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluIEFTR0kKID4gICAgIHJlcXVlc3RzIHZp
YSBmaWxlIHVwbG9hZCBsaW1pdCBieXBhc3MgQVNHSSByZXF1ZXN0cyB3aXRoIGEgbWlzc2luZwog
PiAgICAgb3IgdW5kZXJzdGF0ZWQgQ29udGVudC1MZW5ndGggaGVhZGVyIGNvdWxkIGJ5cGFzcyB0
aGUKID4gICAgIEZJTEVfVVBMT0FEX01BWF9NRU1PUllfU0laRSBsaW1pdCwgcG90ZW50aWFsbHkg
bG9hZGluZyBsYXJnZSBmaWxlcyBpbnRvCiA+ICAgICBtZW1vcnkgYW5kIGNhdXNpbmcgc2Vydmlj
ZSBkZWdyYWRhdGlvbi4KCiA+ICAgICBBcyBhIHJlbWluZGVyLCBEamFuZ28gZXhwZWN0cyBhIGxp
bWl0IHRvIGJlIGNvbmZpZ3VyZWQgYXQgdGhlIHdlYiBzZXJ2ZXIKID4gICAgIGxldmVsIHJhdGhl
ciB0aGFuIHNvbGVseSByZWx5aW5nIG9uIEZJTEVfVVBMT0FEX01BWF9NRU1PUllfU0laRS4KCiA+
ICAgICBUaGlzIGlzc3VlIGhhcyBzZXZlcml0eSDigJxsb3figJ0gYWNjb3JkaW5nIHRvIHRoZSBE
amFuZ28gc2VjdXJpdHkgcG9saWN5CgogPiAqIENWRS0yMDI2LTM1MTkyOiBTZXNzaW9uIGZpeGF0
aW9uIHZpYSBwdWJsaWMgY2FjaGVkIHBhZ2VzIGFuZCBTRVNTSU9OX1NBVkVfRVZFUllfUkVRVUVT
VAogPiAgICAgUmVzcG9uc2UgaGVhZGVycyBkaWQgbm90IHZhcnkgb24gY29va2llcyBpZiBhIHNl
c3Npb24gd2FzIG5vdCBtb2RpZmllZCwKID4gICAgIGJ1dCBTRVNTSU9OX1NBVkVfRVZFUllfUkVR
VUVTVCB3YXMgVHJ1ZS4gQSByZW1vdGUgYXR0YWNrZXIgY291bGQgc3RlYWwgYQogPiAgICAgdXNl
cuKAmXMgc2Vzc2lvbiBhZnRlciB0aGF0IHVzZXIgdmlzaXRzIGEgY2FjaGVkIHB1YmxpYyBwYWdl
LgoKID4gICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRpbmcgdG8g
dGhlIERqYW5nbyBzZWN1cml0eSBwb2xpY3kuCgogPiAqIENWRS0yMDI2LTY5MDc6IFBvdGVudGlh
bCBleHBvc3VyZSBvZiBwcml2YXRlIGRhdGEgZHVlIHRvIGluY29ycmVjdAogPiAgICAgaGFuZGxp
bmcgb2YgVmFyeTogKiBpbiBVcGRhdGVDYWNoZU1pZGRsZXdhcmUKCiA+ICAgICBQcmV2aW91c2x5
LCBVcGRhdGVDYWNoZU1pZGRsZXdhcmUgd291bGQgZXJyb25lb3VzbHkgY2FjaGUgcmVxdWVzdHMg
d2hlcmUKID4gICAgIHRoZSBWYXJ5IGhlYWRlciBjb250YWluZWQgYW4gYXN0ZXJpc2sgKCcqJyku
IFRoaXMgY291bGQgbGVhZCB0byBwcml2YXRlCiA+ICAgICBkYXRhIGJlaW5nIHN0b3JlZCBhbmQg
c2VydmVkLgoKID4gICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRp
bmcgdG8gdGhlIERqYW5nbyBzZWN1cml0eSBwb2xpY3kuCgogPiBCdWdmaXhlczoKID4gKiBGaXhl
ZCBhIG1pc3BsYWNlZCA8L2Rpdj4gaW4gdGhlCiA+ICAgZGphbmdvL2NvbnRyaWIvYWRtaW4vdGVt
cGxhdGVzL2FkbWluL2NoYW5nZV9saXN0Lmh0bWwgdGVtcGxhdGUgYWRkZWQKID4gICBpbiBEamFu
Z28gNi4wIHRoYXQgY291bGQgYmUgcHJvYmxlbWF0aWMgd2hlbiBvdmVycmlkaW5nIHRoZSBwYWdp
bmF0aW9uCiA+ICAgYmxvY2sgKCMzNzAyOSkuCiA+ICogRml4ZWQgYSBidWcgaW4gRGphbmdvIDYu
MCB3aGVyZSBkZXByZWNhdGlvbiB3YXJuaW5ncyBpbmNvcnJlY3RseQogPiAgIHNraXBwZWQgbGlu
ZXMgZnJvbSB0aGlyZC1wYXJ0eSBwYWNrYWdlcyBwcmVmaXhlZCB3aXRoIOKAnGRqYW5nb+KAnQog
PiAgICgjMzcwNjcpLgoKID4gUmVsZWFzZSBub3RlczogaHR0cHM6Ly9kb2NzLmRqYW5nb3Byb2pl
Y3QuY29tL2VuLzYuMC9yZWxlYXNlcy82LjAuNS8KCiA+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBI
b2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
