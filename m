Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6220C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A351E80EE9;
	Fri, 12 Jul 2024 22:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7770CWwVjc8; Fri, 12 Jul 2024 22:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FCB80FB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6FCB80FB5;
	Fri, 12 Jul 2024 22:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 833B31BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709BC6061F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PWbUpGR6s1E for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F4636060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4636060C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F4636060C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:24:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42795086628so16397775e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720823064; x=1721427864;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SSBF3OmFa0UwBXrI6ZQ8pXFcUBaZuUapEkQ5At53/kc=;
 b=N3PJ9XdoJoUr9v6l/BwZPAdvtHQ/cr/uyfyyrW6oZ6MH95yrewwsibnQjri1YJVHYt
 d7PaVA3wbMW0JS7JJi4s8G+qs80mLEf2qbQlwPWCO2qzbCrSoaRX2Dc3QY/MW+Fl92h5
 zJtz06eKrDECLqJuKRp0cwXZp0WiySLVG0R+tusLnj0fy8wcYiMzXC9rsp6noNzL0bRv
 sRy8koQ2rExb+wqmSr/b5QtZGuWLEupC8aPBUTzqmT7xN/eBCoAUT3KaJya8AMRd4Ube
 wbkcrgka19ERidAb8in0FMO13evPG0XkkDEofMh8c62R9E3DlbRBnSEzma0NB7Snl4OO
 yivg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJzm3TtoJDog0CV4ImPJwvq6FRRt8Ham4ujOTwJ1Y9tunoQ3vafNv1V1pjG2zBoUqcceRNL7XBqMmXWQyzfAIBhDUR9QilA==
X-Gm-Message-State: AOJu0Ywz3zQfMppNIngT/NoEHPC/NWEnCCugXaXtdU8IP7lbD1h/kTdd
 ZSx7IgC2TUmp+sGnrlYe/FsR1lodN+ROKmA/q6cib0Dlexgu1NLAbxrVG3vBJVQ=
X-Google-Smtp-Source: AGHT+IFn0t1ZYQb1J44x9VkNbdDmdjjdlWH4A3yd0xDvc0r9lOy7IeDNH54qVAeOt+8yzIzTPKz8Xw==
X-Received: by 2002:a05:600c:5753:b0:426:597c:7d4d with SMTP id
 5b1f17b1804b1-426707e1f87mr85380855e9.18.1720823064458; 
 Fri, 12 Jul 2024 15:24:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e81edasm838785e9.15.2024.07.12.15.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:24:24 -0700 (PDT)
Message-ID: <cbfb1aba-3d4a-44e5-a980-f1f332c2ee3b@mind.be>
Date: Sat, 13 Jul 2024 00:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240703082850.750420-1-sairon@sairon.cz>
Content-Language: en-GB
In-Reply-To: <20240703082850.750420-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720823064; x=1721427864; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SSBF3OmFa0UwBXrI6ZQ8pXFcUBaZuUapEkQ5At53/kc=;
 b=g2WLngrqQEKX/8YvD3TM0bgsuSoV1NSSss2FsOdzQ0w7clRyhf3SIBO/IbvzU2Hdlt
 tO4MqPdaqRecc1i36TQGuzEskhUx8OqzWxQFHlIiZg6+dvhPqanxovT6kU2+CfsFDVaZ
 uIR7S4qItOnHQTPd5qHtoFEft885fz0hbCFrqHBdmhwqVAbr2w+fMjASmL1ELVrIb0aZ
 OnEqWg08v0R4F06h6mvy4zodZ0c82lleeEnIdSbvvcfFw7GWoeO+CFGvb0J8ZO345vEs
 A9FdgAA/qNZrskHk3SgQvmVwHI3xIm6DC45koHUTblQxFkJ/sCB//8CojFzI69ZLuphl
 gu5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g2WLngrq
Subject: Re: [Buildroot] [PATCH 0/4] Improve configurability of EROFS
 filesystem images
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
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDI0IDEwOjI4LCBKYW4gxIxlcm3DoWsgd3JvdGU6Cj4gVGhlIGN1cnJlbnQg
QnVpbGRyb290IHN1cHBvcnQgb2YgRVJPRlMgaXMgYSBiaXQgbGFja2luZyBpbiB0ZXJtcyBvZgo+
IG9wdGlvbnMgdGhhdCBjYW4gYmUgY29uZmlndXJlZCwgZXNwZWNpYWxseSBpdCdzIG5vdCBwb3Nz
aWJsZSB0byBnZXQKPiBjb21wcmVzc2lvbiBsZXZlbCB0aGF0IGlzIG9uIHBhciB3aXRoIHNxdWFz
aGZzLiBUaGlzIHBhdGNoIHNlcmllcwo+IHVwZGF0ZXMgZXJvZnMtdXRpbHMgdG8gdGhlIGxhdGVz
dCB2ZXJzaW9uIGFuZCBhZGRzIG9wdGlvbnMgdGhhdCBlbmFibGUKPiBiZXR0ZXIgY29tcHJlc3Np
b24gbGV2ZWxzIGFuZCBkZWR1cGxpY2F0aW9uIGZlYXR1cmVzIHRoYXQgaGF2ZSBiZWVuCj4gYWRk
ZWQgcmVjZW50bHkuCj4gCj4gSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgYSByZWNlbnQga2VybmVs
IGlzIG5lZWRlZCB0byB1c2UgYWxsIHRoZQo+IGZlYXR1cmVzLCBidXQgYWxsIHRoZSBmZWF0dXJl
cyBpbnRyb2R1Y2VkIGhlcmUgd29yayBhdCBsZWFzdCB3aXRoIExpbnV4Cj4gNi4xIG9yIG5ld2Vy
ICh3aXRoIG1vcmUgZGV0YWlscyBpbiBoZWxwIHRleHRzIG9mIHRoZSBpbmRpdmlkdWFsIGNvbmZp
Zwo+IG9wdGlvbnMpLgo+IAo+IEphbiDEjGVybcOhayAoNCk6Cj4gICAgcGFja2FnZS9lcm9mcy11
dGlsczogYnVtcCB0byAxLjcuMQo+ICAgIHBhY2thZ2UvZXJvZnMtdXRpbHM6IGFkZCBjb25maWcg
b3B0aW9uIGZvciBMWk1BIGNvbXByZXNzaW9uCgogIEFwcGxpZWQgZmlyc3QgdHdvIHBhdGNoZXMg
dG8gbWFzdGVyLCB0aGFua3MuCgoKPiAgICBmcy9lcm9mczogYWRkIExaTUEgY29tcHJlc3Npb24s
IGFsbG93IGNvbmZpZ3VyYWJsZSBjb21wcmVzc2lvbiBsZXZlbAo+ICAgIGZzL2Vyb2ZzOiBhZGQg
Y29uZmlnIG9wdGlvbnMgZm9yIGRlZHVwZSwgZnJhZ21lbnRzIGFuZCB6dGFpbHBhY2tpbmcKCiAg
VGhlc2UgdHdvIGhhdmUgYmVlbiBtYXJrZWQgYXMgQ2hhbmdlcyBSZXF1ZXN0ZWQsIHBlciBvdXIg
ZGlzY3Vzc2lvbiB0aGlzIHdlZWsuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+ICAgZnMvZXJv
ZnMvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQo+ICAgZnMvZXJvZnMvZXJvZnMubWsgICAgICAgICAgICAgICAgICAgIHwgMjQgKysr
KysrKysrLQo+ICAgcGFja2FnZS9lcm9mcy11dGlscy9Db25maWcuaW4gICAgICAgIHwgIDYgKysr
Cj4gICBwYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzLmhhc2ggfCAgMiArLQo+ICAgcGFj
a2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGlscy5tayAgIHwgMTMgKysrLS0KPiAgIDUgZmlsZXMg
Y2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
