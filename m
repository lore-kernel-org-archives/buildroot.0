Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CF2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B913615E2
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B913615E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 464BD401CC;
	Tue, 16 Nov 2021 20:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NX5ljOP0KknD; Tue, 16 Nov 2021 20:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 368AD40226;
	Tue, 16 Nov 2021 20:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EECA1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E99080F0D
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmCdlby15Uvl for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:31:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F29D080F0B
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:31:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x15so532682edv.1
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=s/85R9tNX6NfzmGBlFWJZXys29SjfBK0ZE0QFSfxggc=;
 b=eTcz8Q3IXIH+gGYVAeBb/1AhVnASM8ScfNp93Mq7e4gurnLAcSfx6Yr0XbjhDynweE
 CZ+qoEM7HvvfgCZ1XLrBW2B51F2s8rtoRHaUSomVThh28dOLj1QOMC60fc82zKWyXQd7
 xtZwxLj5o3GKboRrbT1kqupKaLA9GnigFBVT2Rv5mkm8zri1cku3ujfKHS7xilLcB8cG
 V5VPBoxKy5f2yzCIKl8Kv7eSxi62hYHwpNsdX5jooL85upEPefgVsZyYuRT93tjvIgQ5
 Wi55g703xiDzme00wxR691fQggeJV1UNSxGrIviU7kDzdhTXcaISilI6cjNSuhDp9lUx
 8Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s/85R9tNX6NfzmGBlFWJZXys29SjfBK0ZE0QFSfxggc=;
 b=fLc5LlAfA7BMSVebb8Rzor1TH9hZC2abDaHYvdgWPuf6EcGJN+6Rz6qA8XzJ3G8An9
 cgn8AIkve6zlcIUIfRmRlR7VdTljLu0AtzRNfmvl4jCZbJu3F4r3BSxDuivm/UCns0Jr
 yYWeM8P4KTEcn5scjeLjmWvfhweMMeigpZs+ulyvgQ/gyDaT8B8Z3xR9LSdTVSFO1Qom
 TxXlAwSWvAvonxKX63bf7kJpJKsfqsM0F9g2tvWskdxZZFL+UZMU02Nf0uzzxqDY4plm
 4TM23jQkT/EPOPgacfVnUgkuCRGPFoJwk8Bh7wV5gK2nEL+Di0umfcQtNpsHc05QKYPl
 ZR/g==
X-Gm-Message-State: AOAM532/2i7NUsCr8jkdi3wO6yFxZ3UtVz/FuwEH+CqBJpiXY0SlfLqR
 /YOjae09XnR/szwZOx+PuvznKIhYXlSskw==
X-Google-Smtp-Source: ABdhPJx623i6r6GeZiNuFmY9FAK6fjOBboE7jZeMqUWQK4p+yOCARDYTykZu6bhvpwr7jTp3kYO0IA==
X-Received: by 2002:a17:907:869e:: with SMTP id
 qa30mr13178662ejc.356.1637094660967; 
 Tue, 16 Nov 2021 12:31:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x5sm5909116edv.29.2021.11.16.12.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:31:00 -0800 (PST)
Message-ID: <91c5d3db-aa17-58b0-b9a2-13f94a7ef11d@mind.be>
Date: Tue, 16 Nov 2021 21:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211115173344.3861620-1-fontaine.fabrice@gmail.com>
 <a6dad847-a0ec-aeba-90ce-252d8907ad43@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <a6dad847-a0ec-aeba-90ce-252d8907ad43@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: disable objcopy
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8xMS8yMDIxIDE4OjIwLCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBIZWxsbywK
PiAKPiBPbiAxMS8xNS8yMSA2OjMzIFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+PiBEcm9w
IGZvdXJ0aCBwYXRjaCBhbmQgZGlzYWJsZSBvYmpjb3B5IGFzIHN1Z2dlc3RlZCBieSB1cHN0cmVh
bSBpbgo+PiBodHRwczovL2J1Z3MuZ2hvc3RzY3JpcHQuY29tL3Nob3dfYnVnLmNnaT9pZD03MDQ0
NDIjYzIKPj4KPj4gVGhpcyB3aWxsIGFsc28gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVy
ZSBvbiBzcGFyYzoKPj4KPj4gwqDCoMKgwqAgT0JKQ09QWSBidWlsZC9yZWxlYXNlL3Jlc291cmNl
cy9mb250cy91cncvRGluZ2JhdHMuY2ZmLm8KPj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9p
bnN0YW5jZS0zL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mv
c3BhcmM2NC1idWlsZHJvb3QtbGludXgtZ251LzkuMy4wLy4uLy4uLy4uLy4uL3NwYXJjNjQtYnVp
bGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IAo+PiAtLXJlbGF4IGFuZCAtciBtYXkgbm90IGJlIHVz
ZWQgdG9nZXRoZXIKCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCgo+IAo+IE5pY2UhCj4g
Cj4gVGhpcyB3aWxsIGFsc28gZml4IHRoZSBidWlsZCBmb3IgeHRlbnNhOgo+ICDCoMKgwqDCoCBP
QkpDT1BZIGJ1aWxkL3JlbGVhc2UvcmVzb3VyY2VzL2ZvbnRzL3Vydy9EaW5nYmF0cy5jZmYubwo+
ICDCoMKgwqDCoCBPQkpDT1BZIGJ1aWxkL3JlbGVhc2UvcmVzb3VyY2VzL2ZvbnRzL3Vydy9OaW1i
dXNNb25vUFMtQm9sZC5jZmYubwo+IAo+IC90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29w
dC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL3h0ZW5zYS1idWlsZHJvb3QtbGludXgtdWNs
aWJjLzkuMy4wLy4uLy4uLy4uLy4uL3h0ZW5zYS1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9s
ZDogCj4gLS1yZWxheCBhbmQgLXIgbWF5IG5vdCBiZSB1c2VkIHRvZ2V0aGVyCj4gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMDk0NWYzMDVkMzE1MzA2NzcyODJmMzhmYTdj
OTlhZjUyOTVkNDdiZAo+IAo+IAo+IEkgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gcnVudGltZS10
ZXN0IGl0LCBidXQgSSBjYW4gY29uZmlybSBpdCBidWlsZHMgZm9yOgo+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3RsaW4teDg2LTY0LW11c2wgWzEvNl06IE9L
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bGluLW1pcHNlbC11
Y2xpYmMgWzIvNl06IE9LCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bGlu
LW1pcHNlbDMycjYtZ2xpYmMgWzMvNl06IE9LCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJvb3RsaW4tc3BhcmMtdWNsaWJjIFs0LzZdOiBTS0lQUEVECj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bGluLXNwYXJjNjQtZ2xpYmMgWzUv
Nl06IE9LCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bGluLXh0
ZW5zYS11Y2xpYmMgWzYvNl06IE9LCgogIEl0J3MgY29udmVuaWVudCBpZiB5b3UgY2FuIGFkZCB5
b3VyIFRlc3RlZC1ieSBhbmQvb3IgUmV2aWV3ZWQtYnkgdGFnLiBUb28gbGF0ZSAKbm93IHRob3Vn
aC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gCj4gVGhhbmtzIQo+IAo+IFJhcGhhw6tsCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
