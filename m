Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF24C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8236E60590;
	Mon, 24 Jun 2024 20:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hiri-eSZUvNE; Mon, 24 Jun 2024 20:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742336059A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 742336059A;
	Mon, 24 Jun 2024 20:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD3C1BF46A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC7A1400F8
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcOCl_hyiPvO for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C654400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C654400C1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C654400C1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:11:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4247f36f689so33642335e9.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719259872; x=1719864672;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x0TU23BJ5POpeH92lEEUCKkEuNBYsMv0mtx31F/jKVA=;
 b=wdvhKZXyVVytT1FXHk8DSZASXQUuJdBDtuX5QDyfd0VdMvMDB14Geva2veZTwpbgfX
 izriNlBqSB/hTKVQuugLykAEJp71MkJ7PAuCAnA3kamzPm6TpgGf8679aaIbFsiaXOpw
 sB+UQKm0humR4uITHpLklG2Hu/bpcJxbW1fLemvngqzmrx+YgkzopCCyAO0l2iVwH5wj
 Leiz+kQCDNEbcTMOzESr5LjKaec3dDVFpyCH1viMIeC83F5cQQOiQN96HIv3DUOzYivS
 0RYDtieSoS1DjZWxfBi0MhjDAAzwZbvzH3Gs5DAXdZ+ZZqtSaTY0OaV5lnPXhf8CWHUZ
 eSxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTCBOyxNRpLAiNyO34NT0bqzwA9kC75LtRVOmWLmvOurlof3M3sP3NQrFD9ZWsBo8Kv8bmDk7EFKnFli6net+WRflyVpfLKA==
X-Gm-Message-State: AOJu0Yyuiuo1YrET3HfyAyjg3YaFosVgA/c0UhZ/wyX59NTjm6F9AWxv
 SVwtOyjo7VXjTNaLVS/LDETPMzQoaOQTZIXkJ2OjW1dX0A3/fJNkTtY3FYcFoh3osNJElIbL1Fd
 O
X-Google-Smtp-Source: AGHT+IHn0emy2f1WNke4TjCVo2T71FdT8qYC++QTlOyfIOg6DYCAJspRKk4wlCwR70dnfGFecYODrw==
X-Received: by 2002:a05:600c:240c:b0:424:9477:ba19 with SMTP id
 5b1f17b1804b1-4249477be72mr25073865e9.0.1719259872067; 
 Mon, 24 Jun 2024 13:11:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481910fa7sm149923035e9.29.2024.06.24.13.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 13:11:11 -0700 (PDT)
Message-ID: <395208d4-a447-434a-bf5e-57b3a74aff98@mind.be>
Date: Mon, 24 Jun 2024 22:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayrton Leyssens <aleyssens@idtech.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1PR06MB89260012C046F7C3764905CFADD42@VI1PR06MB8926.eurprd06.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <VI1PR06MB89260012C046F7C3764905CFADD42@VI1PR06MB8926.eurprd06.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719259872; x=1719864672; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x0TU23BJ5POpeH92lEEUCKkEuNBYsMv0mtx31F/jKVA=;
 b=GK8ecQdWPY3wR7uokTQx18kJQnnm6jiTKUOR4VjAIwjCcfBtx+g/+qH2RbWF1hFqhn
 33kcdLPh2HCUEzct2wMiO7Bflr00mmzUZDbMelj20dI+dNJlrsguULkWBvr9gyUWE5Yr
 cJZB3+ppcUavUUOUsDHAIOkuIh7mOj4/Hl60izlJmveguS477bvbTUeY6iE+JGT8i6s4
 QphWMOdrTzUpvyX+rKcgJ9oIZmTJTuNuv81gn7ITd0B8juDEQxy5UAKOogm4lAHK+dUM
 1ytuiIATIBb4uQzLOVBeDJKktvjcLh5KrivQqyptIV0jwuqwB61SKQl4kjSJG9O+FZC4
 ie5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GK8ecQdW
Subject: Re: [Buildroot] Question regarding IMX8M NANO processors
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

CgpPbiAyNC8wNi8yMDI0IDE3OjI5LCBBeXJ0b24gTGV5c3NlbnMgd3JvdGU6Cj4gSGkgYWxsCj4g
Cj4gSXQgaXMgYSBsb25nIHNob3TCoCwgYnV0IG5vbmV0aGVsZXNz4oCmCj4gCj4gSGFzIGFueW9u
ZSBleHBlcmllbmNlIG9yIChwYXJ0bHkpIGRvbmUgYSBwb3J0IGZvciB0aGUgU00yUy1JTVg4TkFO
TyBwbGF0Zm9ybSBvZiAKPiBBVk5FVCAoaHR0cHM6Ly9lbWJlZGRlZC5hdm5ldC5jb20vcHJvZHVj
dC9tc2Mtc20ycy1pbXg4bmFuby8gCj4gPGh0dHBzOi8vZW1iZWRkZWQuYXZuZXQuY29tL3Byb2R1
Y3QvbXNjLXNtMnMtaW14OG5hbm8vPik/Cj4gCj4gVGhlIElNWDgtZGRyNC1ldmsgZGVmY29uZmln
IHNlZW1zIG5vIGhlbHAgb24gdGhpcyBzaW5jZSB0aGUgZGFtbiB0aGluZyBkb2VzbuKAmXQgCj4g
ZXZlbiB3YW50IHRvIHN0YXJ0IHdpdGggdGhpcyB1LWJvb3QgYW5kIEFURi4KCiAgTm90IHN1cmUg
d2hhdCB5b3UgbWVhbiB3aXRoIElNWDgtZGRyNC1ldmssIHdlIGRvbid0IGhhdmUgYW55dGhpbmcg
bGlrZSB0aGF0Li4uCgoKPiBJIGFwcHJlY2lhdGUgYW55IGhlbHAgSSBjYW4gZ2V0IHdpdGggdGhp
cyBvbmXigKYgdGhlIGFsdGVybmF0aXZlIGlzIGEgcXVpdGUgCj4gYmxvYXRlZCBkZWZhdWx0IGNv
bmZpZ3VyYXRpb24gaW4geW9jdG8gKGxpa2UgKzRnYikuCgogIFN0YXJ0IHdpdGggdGhlIGJ1aWxk
cm9vdCBjb25maWcgZm9yIG9uZSBvZiB0aGUgb3RoZXIgSU1YOE0gTmFubyBib2FyZHM6CmZyZWVz
Y2FsZV9pbXg4bW5ldmtfZGVmY29uZmlnCmlteDhtbl9ic2hfc21tX3MyX2RlZmNvbmZpZwppbXg4
bW5fYnNoX3NtbV9zMl9wcm9fZGVmY29uZmlnCm5pdHJvZ2VuOG1uX2RlZmNvbmZpZwoKICBUaGUg
YnNoIGRlZmNvbmZpZ3Mgd2VyZSBhZGRlZCBtb3N0IHJlY2VudGx5IGFuZCB1c2UgYSByZWNlbnQg
KHVwc3RyZWFtIHJhdGhlciAKdGhhbiBOWFApIGtlcm5lbCwgVS1Cb290IGFuZCBBVEYuIFlvdSBq
dXN0IG5lZWQgdG8gY2hvb3NlIHRoZSBwcm9wZXIgaW4tdHJlZSBEVFMgCm5hbWUgZm9yIGtlcm5l
bCBhbmQgVS1Cb290LiBBbmQgaWYgdXBzdHJlYW0gZG9lc24ndCBoYXZlIGEgRFRTIGZvciB0aGF0
IGJvYXJkLCAKeW91IGNhbiBzaW1wbHkgY29weSBpdCBmcm9tIHlvY3RvIGFuZCBhZGQgaXQgdG8g
dGhlIGJvYXJkIGRpcmVjdG9yeSAoc28gYSBjdXN0b20gCkRUUyByYXRoZXIgdGhhbiBhbiBpbi10
cmVlIG9uZSkuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiBUaGFua3MgaW4gYWR2YW5jZQo+
IAo+IEF5cnRvbiBMZXlzc2Vucwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
