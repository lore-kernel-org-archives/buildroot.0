Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7747DC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB6F60751;
	Wed, 16 Apr 2025 21:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYxrgKtuX9DL; Wed, 16 Apr 2025 21:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2375C6076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2375C6076C;
	Wed, 16 Apr 2025 21:23:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C377311B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B54AF42561
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgEwZ9JDfUHB for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D57442542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D57442542
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D57442542
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0F121C0083; Wed, 16 Apr 2025 23:23:29 +0200 (CEST)
Message-ID: <7d99913a-0dd1-425b-a64e-56a79558ce3a@rnout.be>
Date: Wed, 16 Apr 2025 23:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 buildroot@buildroot.org
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 brian.cain@oss.qualcomm.com
References: <ae120d6e18c6982f3f2b9a50b3b0aee0b206ad37.1743525327.git.matheus.bernardino@oss.qualcomm.com>
Content-Language: en-GB
In-Reply-To: <ae120d6e18c6982f3f2b9a50b3b0aee0b206ad37.1743525327.git.matheus.bernardino@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TswlbOt2kxtY/7z8Bx4TYlyg0mtoc/chBSjTPEcHhNU=;
 b=AEfIxfMl1G0UruFlp6fNbDii3hjV4rB/4BuqEZojYPH3LqZvKR4FCYpOzxGppgNiiZHKRh
 IHGGeKpLoySVMlgfmyc6uACK3Aa6D5nLi2xUOmwSIBisO6jklYmkk7AO8CRIv+hgfTZxTQ
 +LKZpJdCv+2iInLzGxa3NPjusNOt9b4GT43QOXliJnDqzcei8Ji4DoZ/LkYhPE+Jn3njrL
 +0V43egr7XTF2SC4/xMvhSlVUIB3PbUq90TKsoaQxOC9nt4aglEyuOgRe7V9BZNoZVNv8j
 rr7tCtEE5WMTTj4CvG+jrnyyJCZlxzYuwMiSL5KdiDmPkAb2D02YUmS0yXJIbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH RESEND] linux: fix broken mailing list link
 (404)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDAxLzA0LzIwMjUgMTg6MzYsIE1hdGhldXMgVGF2YXJlcyBCZXJuYXJkaW5vIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8g
PG1hdGhldXMuYmVybmFyZGlub0Bvc3MucXVhbGNvbW0uY29tPgoKIMKgQXBwbGllZCB0b8KgMjAy
NS4wMi54LCAyMDI0LjExLnggYW5kIDIwMjQuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKg
QXJub3V0Cgo+IC0tLQo+IE5vdyBzZW5kaW5nIGFmdGVyIHN1YnNjcmliaW5nIHRvIHRoZSBsaXN0
Lgo+Cj4gICBsaW51eC9saW51eC5tayB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIv
bGludXgvbGludXgubWsKPiBpbmRleCBmOTE1ODIzZGNmLi4xNjc2MmFjMmU2IDEwMDY0NAo+IC0t
LSBhL2xpbnV4L2xpbnV4Lm1rCj4gKysrIGIvbGludXgvbGludXgubWsKPiBAQCAtNTM3LDcgKzUz
Nyw3IEBAIGVuZGlmCj4gICAjIHRoZSBzYW1lICQoQlIyX01BS0UpIGludm9jYXRpb24gaGFzIHNo
b3duIHRvIGNhdXNlIHBhcmFsbGVsIGJ1aWxkCj4gICAjIGlzc3Vlcy4KPiAgICMgVGhlIGNhbGwg
dG8gZGlzYWJsZSBnY2MtcGx1Z2lucyBpcyBhIHN0b3AtZ2FwIG1lYXN1cmU6Cj4gLSMgICBodHRw
Oi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIwLU1heS8yODI3Mjcu
aHRtbAo+ICsjICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjAwNTEyMDk1
NTUwLkdXMTI1MzZAc2NhZXIKPiAgIGRlZmluZSBMSU5VWF9CVUlMRF9DTURTCj4gICAJJChjYWxs
IEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX0dDQ19QTFVHSU5TKQo+ICAgCSQoZm9yZWFjaCBk
dHMsJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIKSksIFwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
