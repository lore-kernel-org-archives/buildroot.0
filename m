Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C02CC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 14:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CBD360A92;
	Tue, 16 Jul 2024 14:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyTarkzAoj6l; Tue, 16 Jul 2024 14:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3445860A97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3445860A97;
	Tue, 16 Jul 2024 14:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4596A1BF37F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3304E40BBF
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmohSszloPOY for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 14:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5C92400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C92400D6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5C92400D6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:22:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so2815070f8f.1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 07:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721139759; x=1721744559;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aOx/aLDtNA/BGUlw5SUo3dVI8Qt2RMgmaae5Weaypl4=;
 b=vhaXNTIdzzelpS/lyzyhG5XU6sq2YCrhitWfxr5Df8qd/gUYI2h7dYsrvKukjxXrmm
 GJ6Of+ajeyIQBqwOWbwoRS1FIT80NIbAtdPFo0+yMMQc1I64ehcfUNa/7zxhFvZqvtlX
 puEIwK4XMijJOlsIaGHVGNN/AmX/zd9Bi7qdW+8UNi2qUGvsORHDfzT9LwkZq3T/hz1U
 3J5+o7waNyxdibpgC5+6NxQgseQ0lSADPj0Z6Qvr1viBOWDH0rj2J58cn4OOnNhbbgWh
 HjPczJ3w87u3lS9sNHctgZp/sdnsvf0ezC5TxQoCFYhKHWyQwYqQ1q95FDmcjy/l5Anq
 YCAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ0Qvq4zET+ZUDdX0kiqRAV1TW/DEzKv3J5BvVny4HzJcQGmpiThboNnexOFYni8xCoeZB4kz/YUtz6DFCnbCnqY7Ivrn6oQ==
X-Gm-Message-State: AOJu0Yw4QAVrFtOy5fdW0Mmb/dydGDKnSH/mk2OpTQo0xdLmVmmHbQPt
 UllpgD/ajCs9aktpcrdaLXSvFhtrSYL+Q3PVpI+hPZGeLud1n31XjQE//DlKJ9Q=
X-Google-Smtp-Source: AGHT+IFFUsQCo454QYwo/N57h/8Yz3gcNNwsFQ+Xg/j0nzJcqPexgs7Txz9riRL0P6r7zpko7jQ05w==
X-Received: by 2002:a5d:6607:0:b0:367:98e6:2a1b with SMTP id
 ffacd0b85a97d-368260bf907mr1414440f8f.4.1721139759324; 
 Tue, 16 Jul 2024 07:22:39 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db047e5sm9205243f8f.107.2024.07.16.07.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:22:38 -0700 (PDT)
Message-ID: <fbabd24f-673d-4f60-a5b3-d502146947cd@mind.be>
Date: Tue, 16 Jul 2024 16:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rush, David" <david.rush2@hpe.com>, Romain Naour
 <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Bryan Brattlof <bb@ti.com>,
 Neal Frager <neal.frager@amd.com>, Kory Maincent <kory.maincent@bootlin.com>
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
 <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
 <DM4PR84MB1664C75FF1FD9995EEE4E3A8B6A22@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <DM4PR84MB1664C75FF1FD9995EEE4E3A8B6A22@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721139759; x=1721744559; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aOx/aLDtNA/BGUlw5SUo3dVI8Qt2RMgmaae5Weaypl4=;
 b=hTEnvq1JDPybit6X4mTiejbIp7AzLMCTmAPggRuP1mE1CzH/Vx5ZnQGADSpfPYUtxJ
 HAabdPUeqth+XrDc2xF1RT+lKiPMiP+7qYwQ+I7U46AT9vTc11VvoHL1AZ+3T5KYQ7xa
 RTIqoGZ9tHXH9HIrrd611BJmiEBZyy60V/3887cmfV6+A3OMNGVrygttIvrOi/9lPKf5
 fb0NobFxvPQ3/3O16cyoXrf9HdjZvtv+/d15RHvE9ZUQrW6tUV4vwzDP4P6cMdZgIoUi
 Knm2ddx77X+b6/yIOOBL9zuck4RP9nFQHyO5kCY+BSHYxTyVRJ8ejRA//skvxBxzC2tK
 53Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hTEnvq1J
Subject: Re: [Buildroot] bare metal toolchain tuning options
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBBZGRpbmcgc29tZSBwZW9wbGUgd2hvIGFyZSBhY3R1YWxseSBpbnZvbHZlZCBpbiB0aGlzIGJh
cmVtZXRhbCBzdHVmZiBpbiBDYy4KCk9uIDE2LzA3LzIwMjQgMTY6MTMsIFJ1c2gsIERhdmlkIHdy
b3RlOgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBBcm5vdXQgVmFuZGVj
YXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+Cj4+IFNlbnQ6IEZyaWRheSwgSnVseSAxMiwgMjAyNCAy
OjUyIFBNCj4+IFRvOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj47IFJ1c2gs
IERhdmlkCj4+IDxkYXZpZC5ydXNoMkBocGUuY29tPjsgYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
Pj4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIGJhcmUgbWV0YWwgdG9vbGNoYWluIHR1bmluZyBv
cHRpb25zCj4+Cj4+Cj4+Cj4+IE9uIDEyLzA3LzIwMjQgMjE6MzcsIFJvbWFpbiBOYW91ciB2aWEg
YnVpbGRyb290IHdyb3RlOgo+Pj4gSGVsbG8gRGF2aWQsIEFsbCwKPj4+Cj4+PiBMZSAwOC8wNy8y
MDI0IMOgIDE5OjU4LCBSdXNoLCBEYXZpZCBhIMOpY3JpdMKgOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4g
SGF2aW5nIHRoZSBvcHRpb24gdG8gYnVpbGQgYSBiYXJlIG1ldGFsIHRvb2xjaGFpbiBhbG9uZ3Np
ZGUgdGhlIExpbnV4IGJpdHMKPj4gaXMgZmFudGFzdGljLiBBcyB0aGluZ3MgYXJlIG5vdyBvbmx5
IHRoZSBhcmNoIHR1cGxlIGlzIGNvbmZpZ3VyYWJsZSB0aG91Z2ggdGhlCj4+IGRlZmNvbmZpZywg
d2hpY2ggbWF5IG5vdCBhbHdheXMgZ2V0IHRvIHRoZSBkZXNpcmVkIHJlc3VsdC4gSGFzIGFueW9u
ZSBsb29rZWQKPj4gYXQgYWRkaW5nIGNvbmZpZ3VyZSBvcHRpb25zIGZvciB0dW5pbmcgdGhlIGJh
cmUgbWV0YWwgdG9vbGNoYWluIHBhY2thZ2U/IEZvcgo+PiBleGFtcGxlLCB3aGVuIGV4cGVyaW1l
bnRpbmcgd2l0aCBhbiBhcm0gY29ydGV4IG00IG1pY3JvY29udHJvbGxlciB3aXRoIGEKPj4gJ25h
bm8nIG5ld2xpYiBjb25maWd1cmF0aW9uLCB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gZ2NjIGFu
ZCBuZXdsaWIncwo+PiBjb25maWd1cmUgY29tbWFuZCBnb3QgbWUgYSB3b3JraW5nIHRvb2xjaGFp
bjoKPj4+Cj4+PiBUaGUgQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVCBvcHRpb24g
aXMgc29tZXRoaW5nIG5ldwo+PiBpbgo+Pj4gQnVpbGRyb290IChhZGRlZCBpbiBKYW51YXJ5IDIw
MjQpIGFuZCBpbml0aWFsbHkgaW50ZW5kZWQgdG8gYnVpbGQKPj4+IHp5bnFtcC1maXJtd2FyZSAo
eGlsaW54KSByZXF1aXJlZCB0byBib290IHRoZSBib2FyZC4KPj4+Cj4+PiBJIGRvbid0IHRoaW5r
IGl0J3MgbWVhbnQgZm9yIGFub3RoZXIgcHVycG9zZS4gRm9yIGV4YW1wbGUsIGJ1aWxkaW5nIGEK
Pj4+IHJlbW90ZWNvcmUKPj4+IG00IGJhc2VkIGZpcm13YXJlIGV0Yy4uLgo+Pgo+PiAgICBBY3R1
YWxseSwgSSB0aGluayBpdCB3YXMgaW50cm9kdWNlZCBpbiB0aGlzIGdlbmVyaWMgd2F5IHByZWNp
c2VseSB0byBiZSBhYmxlIHRvCj4+IHVzZSBpdCBmb3Igb3RoZXIgcHVycG9zZXMsIGxpa2UgcmVt
b3RlY29yZSBmaXJtd2FyZS4uLgoKICBMaXR0bGUgc2lkZS10cmFjazogd2UgYWxzbyBoYXZlIHRo
ZSBhcm0tZ251LXRvb2xjaGFpbiBwYWNrYWdlIHRoYXQgY2FuIGJlIHVzZWQgCmZvciByZW1vdGVj
b3JlIHN0dWZmLiBUaGlzIGlzIG9ubHkgYWRkaW5nIHRvIHRoZSBjb25mdXNpb24uLi4KCgo+PiAg
ICBBbmQgSSB3YXNuJ3QgYSBiaWcgZmFuIGZvciBtZXJnaW5nIHRoaXMgYmVjYXVzZSBJIGZlYXJl
ZCB0aGVyZSB3b3VsZCBiZSBubwo+PiBlbmQgb2YgdHVuYWJsZXMgYW5kIGFkZGl0aW9uYWwgY29u
ZmlnIG9wdGlvbnMgbmVlZGVkIHRvIHJlYWxseSBtYWtlIGl0IHdvcmssCj4+IGFuZCBJTUhPIHRo
YXQgZmFsbHMgb3V0c2lkZSB0aGUgc2NvcGUgb2YgQnVpbGRyb290IChidWlsZGluZyBhIExpbnV4
IHJvb3RmcykuCj4gCj4gSWYgdGhlIGdjYyBhbmQgbmV3bGliIGJhcmVtZXRhbCBwYWNrYWdlcyBl
YWNoIGhhZCBhbiBleHRyYSBjb25maWcgc2V0dGluZyBmb3IKPiBhcHBlbmRpbmcgYSBjdXN0b21p
emVkIGxpc3Qgb2YgY29uZmlndXJlIHNjcmlwdCBhcmd1bWVudHMsIG9yIHVzZSBhIGRlZmF1bHQK
PiBsaXN0IGlmIHVuc3BlY2lmaWVkLCB3b3VsZCBnbyBhIGxvbmcgd2F5IGluIG1ha2luZyB0aGlz
IGZlYXR1cmUgbW9yZSBnZW5lcmFsbHkKPiB1c2VmdWwuIEFuZCwgaXQgd291bGRuJ3QgcmVxdWly
ZSBhIGJ1bmNoIG9mIGV4dHJhIG1hY2hpbmVyeS4KCiAgSSB0aGluayBleHRyYSBvcHRpb25zIHRv
IGdjYydzIGNvbmZpZ3VyZSBpcyBkZWZpbml0ZWx5IGFuIG9wdGlvbi4gV2UgYWxyZWFkeSAKZG8g
c29tZXRoaW5nIHNpbWlsYXIgZm9yIGUuZy4gYXJtLXRydXN0ZWQtZmlybXdhcmUuIEJ1dCBJIGd1
ZXNzIHNvbWUgb2YgdGhvc2UgCm9wdGlvbnMgd2lsbCBuZWVkIHRvIGJlIHJlcGxpY2F0ZWQgZm9y
IGJpbnV0aWxzPyBBbmQgd2hhdCBhYm91dCBwcmVidWlsdCAKdG9vbGNoYWlucyBsaWtlIGFybS1n
bnUtdG9vbGNoYWluPwoKCiAgUmVnYXJkcywKICBBcm5vdXQKCgo+IAo+IFdvdWxkIGEgbWluaW1h
bCBhcHByb2FjaCBsaWtlIHRoaXMgYmUgb2s/Cj4gCltzbmlwXQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
