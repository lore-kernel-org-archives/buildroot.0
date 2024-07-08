Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF17C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA234035D;
	Mon,  8 Jul 2024 06:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDDw0zkwEZUF; Mon,  8 Jul 2024 06:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 363944035F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363944035F;
	Mon,  8 Jul 2024 06:36:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31C921BF23B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CBE660637
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JLg4PHnWzBd for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CAFF60607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAFF60607
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CAFF60607
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:36:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so20900595e9.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 23:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720420593; x=1721025393;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e8PMMTAPbz9MyZP9DPXYpQf18NjdetGMJBTPT6IrTco=;
 b=OoFbWlw1EFphyhEaZGxWTejkpGF222OQCPZCja9+CZNu8SE0iJOtM4Vy/vg3UI3XT3
 eimgWeVdVyFjqZfDgtZtr7CV55jY0sshx+SMy3yrBTX3fC0n723nwYUBtsiyA7B+qTY/
 oM8xSOPauE6iId0fKd7nSTvA1vG71A0LvntpIxeTwY4xZmeiKdLQwtUZq5I6OhOiCWAd
 4wWpcNTkztfxixE3jUPdPPjzjxK+koyuzzZpkvY1RTOJtlPXOumZk1KbBBFVVoiUmnCA
 MbvCw08+ibXchZUXwuUboc5Puyugvs1VmgrRRIeT+atgLHgFmt4OwhO54mTD5mJuGFba
 Go2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv6qjkGW1Vr3IqwFtDwHmkQLyKSrIDTTUFoSsk0op2+Dtd0MEanFLSGyr+FGBAdPLG7phFx0j0ZyizhRKuLvaEnwoABHAzsA==
X-Gm-Message-State: AOJu0YyJzLknHnEK9ZCjCL38NzrLIzVayQPYbZzUB6WKSilD2sFifcrp
 VIPrjT7RDkKV2XSMdTwqpwGC7Kyd+JbjlgLAyOiswtKY6Mg/JsAehp3zETlHsWBWoKHVY+6t9m4
 9
X-Google-Smtp-Source: AGHT+IH4IeBNV8LT6yaYsoVtQ6LR7+3czgPD+/yXTrYn8osdRPTx0NfoaKQYOb/4/F1hqGb932xlMA==
X-Received: by 2002:a05:600c:3556:b0:426:6dc7:da94 with SMTP id
 5b1f17b1804b1-4266dc7dd03mr1987975e9.20.1720420592870; 
 Sun, 07 Jul 2024 23:36:32 -0700 (PDT)
Received: from ?IPV6:2a02:a020:3c7:3ee0:abe7:5248:b844:da6d?
 ([2a02:a020:3c7:3ee0:abe7:5248:b844:da6d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426602e4461sm72676295e9.36.2024.07.07.23.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jul 2024 23:36:32 -0700 (PDT)
Message-ID: <40f2ce73-1b22-4498-bc33-b3f34e7ba8bc@mind.be>
Date: Mon, 8 Jul 2024 08:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Keerthivasan Raghavan <mail2akash97@gmail.com>, buildroot@buildroot.org
References: <CAK2J2tS_xGcztt69CHHSROBDi=NgWN_ACOCF00kVHi7zh1yDGQ@mail.gmail.com>
 <CAK2J2tQtz_h6QBtuuVQh=4TNpohGAbp240UpmtswfMLF3cef1g@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAK2J2tQtz_h6QBtuuVQh=4TNpohGAbp240UpmtswfMLF3cef1g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720420593; x=1721025393; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e8PMMTAPbz9MyZP9DPXYpQf18NjdetGMJBTPT6IrTco=;
 b=A/p49vX0+zsNnAVkyTPCT1WcaMbnmmJ3mGMOXW2ELn8ABMa0zvgJlKM6kVLGNTp07p
 8BhdRNVs9EYWJlYN5/JefbRItRmlGJPLfhHUXcdDQeIfceW9JTtSJC+UKvETEJ0lFURV
 wjuZ2w4+aXTxZflZbWxkqctobG923shG92JZW4B6UHj0vW/Gnyed6xBPZlGKeiJwpi0u
 2uF0LPWE7pbIdGtaNdtIZV7zGNzSrRylbJedFn0aU/1oTytJVMPyJ4M9Ykrv0JItcktb
 eMMAkrB8tC8Z1aFyqUccR39nEMHQ/2YHTXALv0lleiOPX1UlXynXd8h+ee9TRMQ4OUbT
 h5aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A/p49vX0
Subject: Re: [Buildroot] Fwd: Debug prefix map
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

ICBIaSBLZWVydGhpdmFzYW4sCgpPbiAwNi8wNy8yMDI0IDE0OjE0LCBLZWVydGhpdmFzYW4gUmFn
aGF2YW4gd3JvdGU6Cj4gCj4gCj4gLS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0t
LS0KPiBGcm9tOiAqS2VlcnRoaXZhc2FuIFJhZ2hhdmFuKiA8bWFpbDJha2FzaDk3QGdtYWlsLmNv
bSAKPiA8bWFpbHRvOm1haWwyYWthc2g5N0BnbWFpbC5jb20+Pgo+IERhdGU6IFNhdCwgSnVsIDYs
IDIwMjQgYXQgOTo1MOKAr0FNCj4gU3ViamVjdDogRGVidWcgcHJlZml4IG1hcAo+IFRvOiA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4+Cj4g
Cj4gCj4gSGkgQWxsLAo+IAo+IEkgYW0gYSBuZXcgYnVpbGRyb290IHVzZXIuIEJlZW4gZXhwZXJp
bWVudGluZyB3aXRoIGJ1aWxkcm9vdCBhbmQgcnBpNC4KPiBXYW50ZWQgdG8ga25vdyBpZiBidWls
ZHJvb3QgaGFzIGFueSBwcm92aXNpb24gdG8gZW5hYmxlIGRlYnVnIHByZWZpeCBtYXBwaW5nIAo+
IGxpa2UgaW4geW9jdG8gCj4gPGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL3JlZi1tYW51
YWwvdmFyaWFibGVzLmh0bWwjdGVybS1ERUJVR19QUkVGSVhfTUFQPiAKPiAuIEkgY2FtZSBhY3Jv
c3MgdGhlIGRlYnVnZ2luZyBzZWN0aW9uKDguMTMuMiB1c2luZyBnZGIgaW4gYnVpbGRyb290KSBp
biB0aGUgCj4gYnVpbGRyb290IG1hbnVhbCBidXQgZm91bmQgbm8gcmVmZXJlbmNlIHRvIHByZWZp
eCBtYXAuIERvZXMgYnVpbGRyb290IGhhdmUgYW55IAo+IGNvbmNlcHQvcHJvdmlzb24gb2YgYSBk
ZWJ1ZyBtYXAgPyBJZiBub3QsIHdoYXQgY2FuIEkgZG8gdG8gc2ltdWxhdGUgaXQgPwoKICBUaGUg
cHJlZml4LW1hcCBvcHRpb24gaXMgYWRkZWQgKHRvZ2V0aGVyIHdpdGggYSBmZXcgb3RoZXIgb3B0
aW9ucykgd2hlbiB5b3UgCnNldCBCUjJfUkVQUk9EVUNJQkxFPXkuCgogIE5vdGUsIGhvd2V2ZXIs
IHRoYXQgdGhpcyBpcyBub3QgYSBkZWJ1Z2dpbmcgb3B0aW9uLiBJbiBmYWN0LCBpdCBtYWtlcyAK
ZGVidWdnaW5nIG1vcmUgZGlmZmljdWx0LiBJdCByZXBsYWNlcyB0aGUgYWJzb2x1dGUgcGF0aCB3
aXRoIG5vbi1leGlzdGluZyBwYXRocywgCnNvIGlmIHlvdSBvcGVuIHRoZSBwcm9ncmFtIGluIGEg
ZGVidWdnZXIsIHRoZSBkZWJ1Z2dlciB3aWxsIG5vdCBiZSBhYmxlIHRvIAphdXRvbWF0aWNhbGx5
IGZpbmQgdGhlIHNvdXJjZXMuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiAKPiBUaGFuayB5
b3UsCj4gS2VlcnRoaXZhc2FuIFJhZ2hhdmFuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
