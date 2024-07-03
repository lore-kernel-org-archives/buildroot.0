Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E4C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 07:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C110404AB;
	Wed,  3 Jul 2024 07:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7MoKudfutrl; Wed,  3 Jul 2024 07:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E707641A1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E707641A1C;
	Wed,  3 Jul 2024 07:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFDA1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5849340761
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24Nyu7NJEQqW for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 07:07:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D81E940759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D81E940759
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D81E940759
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 07:07:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so28498205e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 00:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719990473; x=1720595273;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZI3QpHuQOYYKl7MPRK/h3S/N0Gjj3JflfLRV5E6ZJ+4=;
 b=dAuq7cUOGSUNl7vhm93iWrJ/vGvvPMiVfzlmsph6bewS4Smsx2x0NrmRKYcaYkyawn
 +CfWzxbYoJwwy3+IKUYnamuwq7jiLkqY5IRVUNpQBQ8aZPHYHr6CzijbCgSybBAkUYw7
 S2UjULvMmhrJ1eTYCDuxMXx0TTdiz/GuiGwbD67G/0BIWSCQqlP+xlqx62iNVffbplbZ
 0yqk63QuCoceXe90AOjkNau6d3zgKlZVP7OUASdypp/7mjqVvJIO+fDKvrbqnkUGMrhz
 xKmr6jhVt8qoTp5v3AC5pmrhuY1zOPantwz7QtlTqu3Osdv0fs5NH2VaVXgNcKTtYns9
 Kp+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDZK42Q/5YOJwU0Z+VJvEo36GUyvTRoTG74FFkt9RtaWpb5G5q7IZvLqAQDJLBXLJcSAqwauLUX3mZGcIzDV+00SO+38xuyg==
X-Gm-Message-State: AOJu0Ywb4Nn+gawfAPjYyNyIzSj5P3Zpc1tOAWRuVuXkvJ4VDVZ/FcWQ
 reox/4GR18YYDG3PcjcKmp/GLU5Tqho1uVEpQmGi/3PiWmleZ5jBr8PbsafQy2Q=
X-Google-Smtp-Source: AGHT+IFhPLsYrfv5GF4qgeoqIjQxIAi78kCuo3yWgzfkJh3XIQFG5cXeNgEWw4ABOqr86LO+hB8JAA==
X-Received: by 2002:a05:600c:3509:b0:421:dd8c:35a3 with SMTP id
 5b1f17b1804b1-4257a020459mr99813195e9.26.1719990472747; 
 Wed, 03 Jul 2024 00:07:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b626sm223847275e9.15.2024.07.03.00.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:07:52 -0700 (PDT)
Message-ID: <b71d6073-be4d-4d57-8472-cff1e74adbf3@mind.be>
Date: Wed, 3 Jul 2024 09:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Al Walker <al@inline.audio>, buildroot@buildroot.org
References: <92110F02-FA7C-4C28-BADE-CF912167AA1B@contoso.com>
Content-Language: en-GB
In-Reply-To: <92110F02-FA7C-4C28-BADE-CF912167AA1B@contoso.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719990473; x=1720595273; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZI3QpHuQOYYKl7MPRK/h3S/N0Gjj3JflfLRV5E6ZJ+4=;
 b=hp4iCK3icRHjC4i1aULmFLWRGiOSUKQh3vI71QlKyFqaBof3K4gIwLqWKE0g2CyfT7
 A5EbqcCsM4ReHJy34cZQL1u5oxVycIwhjzDLPdzHChM26ePncREE+HrbUCKN9AM9FCxk
 5Pd2zZCCSRi5kS05Bn24pfmy1G8OeR4Ljw4jnLqc49JCZIoh1ACrU3tqrTqPJBgdpIC6
 I4lwC+1DdMlcD6PRHzTbNk5H8j4tRUoQ0O79rZQTP2yBHGNRfLYcn8fe+LMVhIWP248N
 QBtTGE+S+sNpSvXNokE2xp9dE2Sf+BhhkQqEVHWWmy8vWvVxcM007DdhsWEXP9rhQx5y
 6EXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hp4iCK3i
Subject: Re: [Buildroot] Buildroot Newbie
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

ICBIaSBBbCwKCk9uIDAzLzA3LzIwMjQgMDc6MjYsIEFsIFdhbGtlciB3cm90ZToKPiBIZWxsbywK
PiAKPiBJ4oCZbSBuZXcgdG8gQnVpbGRyb290IGFuZCB0aGlzIGNvbW11bml0eSBhbmQga2VlbiB0
byBjb250cmlidXRlIHdoZXJlIEkgY2FuLCAKPiBhbHRob3VnaCBvYnZpb3VzbHkgSSBoYXZlIGEg
Yml0IG9mIGEgbGVhcm5pbmcgY3VydmUgZmlyc3QuCj4gCj4gSXMgdGhpcyB0aGUgYmVzdCBwbGFj
ZSB0byBwb3N0IHRlY2huaWNhbCBxdWVzdGlvbnMsIGVzcGVjaWFsbHkgZm9yIG15IGluaXRpYWwg
Cj4gc3RlcHMsIHBsZWFzZT8gQW55IGhlbHAgYW5kIGd1aWRhbmNlIGlzIHZlcnkgbXVjaCBhcHBy
ZWNpYXRlZC4KCiAgWWVzIHRoaXMgaXMgdGhlIGNvcnJlY3QgcGxhY2UhIFRoYXQgc2FpZCwgcXVl
c3Rpb25zIHBvc3RlZCBvbiB0aGlzIGxpc3Qgb2Z0ZW4gCmdvIHVuYW5zd2VyZWQgKGJlY2F1c2Ug
bm9ib2R5IGtub3cgdGhlIGFuc3dlciBvZmYgdGhlIHRvcCBvZiB0aGVpciBoZWFkLCBhbmQgCnRo
ZXkncmUgbm90IGludGVyZXN0ZWQgaW4gZG9pbmcgdGhlIG5lY2Vzc2FyeSByZXNlYXJjaCkuCgoK
PiBJbiB0aGUgZmlyc3QgaW5zdGFuY2UgSeKAmXZlIHNldCBteXNlbGYgdGhlIGNoYWxsZW5nZSBv
ZiBjcmVhdGluZyBhIEJ1aWxkcm9vdCAKPiBidWlsZCBmb3IgdGhlIFNUTTMyTVAxNTdELURLMSBi
b2FyZC4gVGhlcmUgaXNu4oCZdCBhIHByZS1leGlzdGluZyBzcGVjaWZpYyAKPiBkZWZjb25maWcg
ZmlsZSBmb3IgdGhpcyB2YXJpYW50LCBzbyBpdCBzZWVtcyBsaWtlIGEgZ29vZCBzdGFydGluZyBw
b2ludC4KCiAgVGhlcmUgaXMgc3RtMzJtcDE1N2FfZGsxX2RlZmNvbmZpZywgSSBkb24ndCB0aGlu
ayB0aGVyZSBhcmUgc3Vic3RhbnRpYWwgCmRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHR3by4gWW91
IGNhbiBidWlsZCB0d28gZGV2aWNlIHRyZWVzIHdpdGggYSBzaW5nbGUgZGVmY29uZmlnLgoKCj4g
U28gZmFyIEnigJl2ZSBzdWNjZXNzZnVsbHkgYnVpbHQgdGhlIHByb2plY3QgdXNpbmcgdGhlIGRl
ZmF1bHQgcGluIGFzc2lnbm1lbnRzIGluIAo+IFNUTTMyQ3ViZUlERSBhbmQgY3JlYXRlZCB0aGUg
LmR0cy8uZHRzaSBmaWxlcyBmb3IgdGhlIENvcnRleC1BNyBjb3JlcywgYnV0IGR0YyAKPiBkaWRu
4oCZdCB3b3JrIGZvciBjb21waWxpbmcgdGhlIC5kdGIgZmlsZXMuCgogIFdoYXQgZG8geW91IG1l
YW4gd2l0aCAiZGlkbid0IHdvcmsiPyBJZiB0aGVyZSBhcmUgc3ludGF4IGVycm9ycywgZHRjIHdp
bGwgCnJlcG9ydCB0aGVtLi4uIFlvdSdsbCBnZXQgYmV0dGVyIGZlZWRiYWNrIGlmIHlvdSBpbmNs
dWRlIHRoZSBlcnJvciBtZXNzYWdlcyAKKHdpdGggc3VmZmljaWVudCBjb250ZXh0KSBpbiB5b3Vy
IG1haWwuCgogIFlvdSBub3JtYWxseSBwYXNzIGluIHRoZSBjdXN0b20gLmR0cyBhbmQgLmR0c2kg
ZmlsZXMgYnkgc3BlY2lmeWluZyAKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggKGFu
ZCB0aGUgZXF1aXZhbGVudCBmb3IgVS1Cb290IGFuZCBURi1BKS4gSXMgCnRoYXQgaG93IHlvdSBk
aWQgaXQ/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEtpbmQgUmVnYXJkcywKPiAKPiBBbAo+
IAo+IEFsIFdhbGtlcgo+IEZvdW5kZXIgJiBDRU8KPiBJbmxpbmUgQXVkaW8gKEhLKSBMaW1pdGVk
Cj4gYWxAaW5saW5lLmF1ZGlvIDxtYWlsdG86YWxAaW5saW5lLmF1ZGlvPgo+IAo+IG0uICs4NiAx
MzAgNjgxMSA1MjY0Cj4gbS4gKzQ0IDc4MTAgNTQwMTIwCj4gCj4gCj4gCj4gSWNvbiBEZXNjcmlw
dGlvbiBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZAo+IAo+IAo+IENPTkZJREVOVElBTElUWcKgTk9U
SUNFOiBUaGlzIG1lc3NhZ2XCoChpbmNsdWRpbmcgYW55wqBhdHRhY2htZW50cykgCj4gY29udGFp
bnPCoGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlwqBjb25maWRlbnRpYWwuIFVubGVzcyB5b3XCoGFy
ZSB0aGUgaW50ZW5kZWQgCj4gcmVjaXBpZW50wqAob3LCoGF1dGhvcmlzZWQgdG8gcmVjZWl2ZcKg
Zm9yIHRoZSBpbnRlbmRlZMKgcmVjaXBpZW50KSwgeW91IG1heSAKPiBub3TCoHJlYWQsIHByaW50
LMKgcmV0YWluLCB1c2UswqBjb3B5LCBkaXN0cmlidXRlIG9ywqBkaXNjbG9zZSB0byBhbnlvbmUg
dGhlwqBtZXNzYWdlIAo+IG9yIGFuecKgaW5mb3JtYXRpb24gY29udGFpbmVkIGluwqB0aGUgbWVz
c2FnZS4gSWYgeW91IGhhdmXCoHJlY2VpdmVkIHRoZSBtZXNzYWdlIAo+IGluwqBlcnJvciwgcGxl
YXNlIGFkdmlzZSB0aGXCoHNlbmRlciBieSByZXBseSBlLW1haWwswqBhbmQgZGVzdHJveSBhbGwg
Y29waWVzIAo+IG9mwqB0aGXCoG9yaWdpbmFsIG1lc3NhZ2XCoChpbmNsdWRpbmcgYW55wqBhdHRh
Y2htZW50cykuCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
