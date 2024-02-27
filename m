Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB702C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9954D4050E;
	Tue, 27 Feb 2024 22:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzvuA6DxvCKY; Tue, 27 Feb 2024 22:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACBD240526
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACBD240526;
	Tue, 27 Feb 2024 22:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 992121BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 938858223F
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ec1rfuR-9y8R for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 493C28223E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 493C28223E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 493C28223E
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:17:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412ae15b06fso8026495e9.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 14:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709072249; x=1709677049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qi5Gc5/pzLg1i0rvT/1t+OaUAmOyzqemEoiu5cSureE=;
 b=DCC6OpluOjxdo88jP68h6bfQ7hhmXI1y9k+kMSfb8zyny89xw84hV3prtHubM1RhMN
 8hkZl1/AZTPrTzSjNLd+BTnO/M/8bWArxO+rdKAICvf69aNNkF0gIXbhNuVSvwpf8qiX
 bcHywkhyZpdK6z9OX1Ydez8nm+t1pfXl5IOEGLRXsAkuM1nJcc23ejRflu6VZTRbVCEe
 uuNotR6TpZGmbenyuwX4cCkYZ+SCGO2nsrc4MhSsThF3gNCNGZnPTISzhW8VyZuAxC84
 bYax6yOhqPCmI57rpkOZyBex2nxfhIDlryYx+DCvA1Exp5w14FaJUdGanQG2bAX6qlZI
 3NRw==
X-Gm-Message-State: AOJu0Ywr6ZNxANiC++/cpO5Q+jm7I6QQM8vk4WmS1tmdISLury0Mda8/
 8n/AlX1XjguI9AMEs7cRHZlymMEdRYDD6GQhvd/OcXV0bpiOp8dM9rS5qceXaog=
X-Google-Smtp-Source: AGHT+IG+BTFtlWxqBntD9i3oPJyqbtKwuyIEKhdPntrLAjrg5mMnZwR+FK5k55elAztD52ywF4afSQ==
X-Received: by 2002:a05:600c:5125:b0:412:529c:356f with SMTP id
 o37-20020a05600c512500b00412529c356fmr8400563wms.28.1709072249133; 
 Tue, 27 Feb 2024 14:17:29 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jn5-20020a05600c6b0500b0041228b2e179sm83770wmb.39.2024.02.27.14.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 14:17:28 -0800 (PST)
Message-ID: <422f5b14-1eb5-4c20-af28-b063f9957b28@smile.fr>
Date: Tue, 27 Feb 2024 23:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <f56ed1032d3006e56e14c57be4c077d3199ad8a8.camel@gmail.com>
 <CABGWkvp2axJpgMFK+_OByKxG6nw0UwjCAHDgPqqVc7bip+z_oQ@mail.gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvp2axJpgMFK+_OByKxG6nw0UwjCAHDgPqqVc7bip+z_oQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709072249; x=1709677049;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qi5Gc5/pzLg1i0rvT/1t+OaUAmOyzqemEoiu5cSureE=;
 b=v8GtOYGkU5pkaHrzl0QgY5fUTbhtEYJVzmcoaDdGGSo4NmBPx4oKmtT4uvRj5Ycbjv
 f/IAX9UlhWCdbdgGXW81BPzNz14s827UVcn3XNVTQucKACAPeSKo5tmCoCsgWz0LdRIr
 PMkLN7+F4mJC0je9DhYfZDQF2EkpC95BuihzaiPbwLJBXlOkA6tmT1uEHA4dx9eCcNGq
 coLzUMRLLqz/aGMXlljkIy41C6WFPQNk0wqwxQ9IAi+s9TkigEYYDMYNkjNrGEeDyP8A
 5wwYE/oIQKpNywsWaZeT2UC6slyK/99stcDJKqpw7iUp0KI6mjvC3yCsTjpXocQ4zVZm
 XOrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=v8GtOYGk
Subject: Re: [Buildroot] [PATCH v6 00/16] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLCBEYXJpbywgQWxsLAoKTGUgMjcvMDIvMjAyNCDDoCAyMTo0MSwgRGFyaW8g
QmluYWNjaGkgYSDDqWNyaXTCoDoKPiBIaSBBbGV4YW5kZXIsCj4gCj4gT24gVHVlLCBGZWIgMjcs
IDIwMjQgYXQgODo0OeKAr1BNIEFsZXhhbmRlciBTdmVyZGxpbgo+IDxhbGV4YW5kZXIuc3ZlcmRs
aW5AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gSGVsbG8gRGFyaW8sCj4+Cj4+IE9uIFNhdCwgMjAy
NC0wMi0yNCBhdCAyMTo1NiArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+PiBUaGUgU0st
QU02MkItUDEgaXMgdGhlIG5ld2VzdCB2ZXJzaW9uIG9mIFNLLUFNNjIgd2hpY2ggaW5jbHVkZXMK
Pj4+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxlIChIUy1GUykgc2lsaWNvbiB0byBvcHRp
b25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4+PiBhbmQgZW5jcnlwdGlvbiBmb3Igc2VjdXJpdHkgYXBw
bGljYXRpb25zLgo+Pj4gVGhpcyByZXF1aXJlcyBlbmFibGluZyB0aGUgQlIyX1RBUkdFVF9USV9L
M19JTUFHRV9HRU5fU0VDVFlQRV9IU19GUyBvcHRpb24sCj4+PiB3aGljaCwgaG93ZXZlciwgd2Fz
IGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZXJyb3JzIGFuZCBidW1wcyB0aGUgTGludXgK
Pj4+IGtlcm5lbCBhbmQgVS1Cb290IHJlcXVpcmVkIGZvciBzdWNoIGEgbmV3IGRldmljZS4KPj4K
Pj4gaW4gY29udHJhc3QgdG8geW91ciB0ZXN0cyBhbmQgbXkgbGFzdCB0ZXN0cyBvbiBTSy1BTTYy
QiB0aGlzIHRpbWUgSSd2ZSB0cmllZAo+PiBvbiBHUCBib2FyZCAoU0stQU02MikgYW5kIHRoZSBi
dWlsZCAoZm9yIEdQKSBkaWRuJ3QgYm9vdCBvdXQgb2YgdGhlIGJveC4KPj4KPj4gSSd2ZSBicmll
Zmx5IGNoZWNrZWQgdGlib28zLmJpbiBhbmQgaXQncyB0aGUgc21hbGxlciBvbmUgb2YgYWxsLCBz
byB0aGlzCj4+IHBhcnQgbG9va3MgY29ycmVjdC4gTWF5YmUgd2UgbmVlZCB0byBjaGVjayBpZiB0
aGUgRmlybXdhcmUgYmxvYnMgYXJlIGNvcnJlY3QKPj4gaW4gR1AgY2FzZS4uLgoKSSBjaGVja2Vk
IHRoZSB0aWJvb3QzLmJpbiBiZXR3ZWVuIHY3IGFuZCB2NSBvZiB0aGlzIHNlcmllczoKCnY3Ogot
cnctci0tci0tLiAxIHJvbW5hbyByb21uYW8gICAgMjgyNTQ1IDI3IGbDqXZyLiAyMjoyMyB0aWJv
b3QzLmJpbgoKdjUKLXJ3LXItLXItLS4gMSByb21uYW8gcm9tbmFvICAgIDI4MjU0NSAxMyBmw6l2
ci4gMTU6NTcgdGlib290My1hbTYyeC1ncC1ldm0uYmluCi1ydy1yLS1yLS0uIDEgcm9tbmFvIHJv
bW5hbyAgICAyODUxMzQgMTMgZsOpdnIuIDE1OjU3IHRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgot
cnctci0tci0tLiAxIHJvbW5hbyByb21uYW8gICAgMjg1MTM0IDEzIGbDqXZyLiAxNTo1NyB0aWJv
b3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4KCk5vdGUsIHdlIGNvcHkgdGhlIHRpYm9vdDMgZmlybXdh
cmUgdXNpbmcgdGhlIGNvbXBsZXRlIGZpbGUgbmFtZSwgd2UgZG9uJ3QgdXNlCnRoZSB0aWJvb3Qz
LmJpbiBzeW1saW5rIGdlbmVyYXRlZCBieSBiaW5tYW4gdG9vbC4KCiAgY3AgJChARCkvdGlib290
My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmlu
CiQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbgoKVmVyaWZ5IGlmIHlvdXIgQU02MiBkZXZpY2Ug
aXMgcmVhbGx5IGEgR1Agb25lLgoKPiAKPiBJIGhhdmUgdGVzdGVkIGFsbCA3IHZlcnNpb25zIG9u
IFNLLUFNNjJCIHN1Y2Nlc3NmdWxseSwgYnV0IEkgZG9uJ3QKPiBoYXZlIGEgR1AgYm9hcmQuCj4g
Q291bGQgaXQgYmUgYW4gb3B0aW9uIGZvciB5b3UgdG8gZmluZCBvdXQgd2hpY2ggaXMgdGhlIGxh
dGVzdCB2ZXJzaW9uCj4gdGhhdCBhbHNvIHdvcmtzIGZvciBHUD8KPiBBIHNvcnQgb2Ygc2VyaWVz
IGJpc2VjdD8KCkkgZG9uJ3Qgc2VlIGFueSBvYnZpb3VzIGlzc3VlLgpQbGVhc2Ugc2hhcmUgeW91
ciBib290IGxvZyBhbmQgeW91ciBkZWZjb25maWcuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
Cj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IERhcmlvCj4+Cj4+IC0tCj4+IEFsZXhhbmRlciBTdmVy
ZGxpbi4KPj4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
