Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB7CD8CBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD8E613C8;
	Tue, 10 Oct 2023 20:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD8E613C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OymTZpwPniC1; Tue, 10 Oct 2023 20:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBE2E6139D;
	Tue, 10 Oct 2023 20:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE2E6139D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC3FC1BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B541E80F92
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B541E80F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIHtxw3kJVho for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:39:29 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A6DA802CA
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A6DA802CA
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-536b39daec1so10341712a12.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696970368; x=1697575168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHwW5TIQ8asXnMB6JebKwP7wBR4B28euAlNAaubgSPw=;
 b=xCmbqQdY089+rR4a9n6dJcyC7rq1L1FTRBHBkupROloTWRmyoRblYz0PMUwIYeHI1s
 8TOBhlgyHIXKQPaqS5vYldq7wZVSzOcqwXNkQ/4ZXAVQ0OOra/ypiQbnLq/eDItQwpO5
 KmQxQ//0pDHA6VcsanoW79F3Ol9cc3P58VpsSznvoeKqrB0YVWaTDRK0rGNwtSC7QysC
 nxIrAc5C1hvr9lhNV+lpUUKIXGOMxh/mANcCboeh+hJAayBDgEl281LanlqkBcqsai4I
 YmQtzWAjeNXPrGaLs2XP2KIAI3oRdRuCpG1zL61fODtEV6lQvELqCAmjrfWy/p8w8xjj
 jWag==
X-Gm-Message-State: AOJu0YyV1uiarnJ+NnjsNWGJt5x0FwVU9iP2XrULTJGgZBlQYUVxgGwr
 dDs4K2Rz5drbLBMWzgPn3WkMJQ==
X-Google-Smtp-Source: AGHT+IGiCBBkz1tGDHUf6g06MU/7bVHpfSiR4gj6aHAyFyhV7chE1TZWH4TjFEt0a3cIgxq0eeQN0A==
X-Received: by 2002:aa7:d64b:0:b0:530:a19b:175 with SMTP id
 v11-20020aa7d64b000000b00530a19b0175mr17625455edr.2.1696970367688; 
 Tue, 10 Oct 2023 13:39:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ee48-20020a056402293000b0053120f313cbsm1285676edb.39.2023.10.10.13.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:39:27 -0700 (PDT)
Message-ID: <61aa0b20-3ffb-c1f8-a03b-3669bf4a1903@mind.be>
Date: Tue, 10 Oct 2023 22:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>
References: <CAN=fXj3uioP_fhczziposSJ1A-t+QzE0kyYj8D5AqZVd8Gmt-A@mail.gmail.com>
 <e5f26a18-911b-1cc3-770f-1fdff91bc2e8@mind.be>
 <CAN=fXj0cBh=sScwv9ZAzxKj-cAJay9_h0VNEEAT5skZUK1W-9w@mail.gmail.com>
In-Reply-To: <CAN=fXj0cBh=sScwv9ZAzxKj-cAJay9_h0VNEEAT5skZUK1W-9w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696970368; x=1697575168; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHwW5TIQ8asXnMB6JebKwP7wBR4B28euAlNAaubgSPw=;
 b=gdqKPwW4pDDwoOsYii4Qjdqk23tth0wN1Sb3Rj9DGOeQJOaxKRnJGJAkodJES7DYC6
 47lBoIZqWD+ZEhIGotm3JkThipd81S3lIjHeYBnIY2zfm/b2rLf6cE6zJVTES0+zCg8V
 cBYrkbG/MoaVUpYLbmYbUt9DyMt4fpLN0Mk66i59Lju37MoS4OHUrAr4eFgsHbYWgRwv
 dXjmRxNTOqcbXuuhxXms3pjhN7FJSWrxqnYGj9/y5bq69PFDJqSqm7O0SHqQKe5Hn7yy
 eW/RBPYP8RfVBxph6moPWWMndsIcUr4Sb0ryw3V2fp9Lo0EifPdEthlVNikqb2tHjbjT
 HVAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gdqKPwW4
Subject: Re: [Buildroot] [RFC] Per-package and relocatable SDKs problem?
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
Cc: Charles Hardin <charles.hardin@chargepoint.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMC8yMDIzIDIxOjA1LCBDaGFybGVzIEhhcmRpbiB3cm90ZToKPiBIaSBBcm5vdXQK
PiAKPiBPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAxMToxMOKAr0FNIEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4+Cj4+ICAgIEhpIENoYXJsZXMsCj4+Cj4+IE9u
IDA5LzEwLzIwMjMgMjM6MzcsIENoYXJsZXMgSGFyZGluIHdyb3RlOgo+Pj4gRm9yIHRoZSBjdXJp
b3VzLAo+Pj4KPj4+IFdlIGhhdmUgZGlzY292ZXJlZCBhIHByb2JsZW0gaW4gdGhhdCB0aGUgcGVy
LXBhY2thZ2UgYnVpbGQgb2YgdGhlIGhvc3QKPj4+IGRpcmVjdG9yeSBpcyBkb2luZyBhbiByc3lu
YyB0byBmaW5hbGl6ZSB0aGUgdHJlZSBmcm9tIHRoZSBsYXN0Cj4+PiBwZXItcGFja2FnZSBkaXJl
Y3RvcnkgaW4gdGhlIGRlcGVuZGVuY3kgY2hhaW4gKGluIG91ciBjYXNlIGJlbG93IHRoaXMKPj4+
IGlzIHF0NXRvb2xzKS4gVGhpcyBtZWFucyB0aGF0IHNldmVyYWwgdGV4dCBmaWxlcyBsaWtlIHRo
ZSBvbmUgYmVsb3cKPj4+IChzaGFzdW0pIGNvbnRhaW4gdGhlIHBlci1wYWNrYWdlIGRpcmVjdG9y
eSBwYXRoIGluIHRoZW0uCj4+Pgo+Pj4gRm9yIGV4YW1wbGUgLSBhIHBlci1wYWNrYWdlIGJ1aWxk
IGFuZCBjaGVjayB0aGUgQlVJTEQgZGlyZWN0b3J5IHRvCj4+PiBjaGVjayB0aGUgc2hhc3VtIHNj
cmlwdAo+Pj4KPj4+ICAgICAgICQgaGVhZCAtNSBob3N0L2Jpbi9zaGFzdW0KPj4+ICAgICAgICMh
L2hvbWUvdWJ1bnR1L2VtYi1wbGF0Zm9ybS1idWlsZC9mYWxjb24vdWNiL3Blci1wYWNrYWdlL3F0
NXRvb2xzL2hvc3QvYmluL3BlcmwKPj4+ICAgICAgICAgICBldmFsICdleGVjCj4+PiAvaG9tZS91
YnVudHUvZW1iLXBsYXRmb3JtLWJ1aWxkL2ZhbGNvbi91Y2IvcGVyLXBhY2thZ2UvcXQ1dG9vbHMv
aG9zdC9iaW4vcGVybAo+Pj4gLVMgJDAgJHsxKyIkQCJ9Jwo+Pj4gICAgICAgICAgICAgICBpZiAw
OyAjIF4gUnVuIG9ubHkgdW5kZXIgYSBzaGVsbAo+Pj4gICAgICAgIyFwZXJsCj4+PiAgICAgICAu
Li4gc25pcCBzbmlwIC4uLgo+Pj4KPj4+IFRoaXMgd29ya3MgaW4gdGhlIGJ1aWxkIHBhdGggYnV0
IHdpbGwgZmFpbCB3aGVuIHRoZSBTREsgaXMgbWFkZSBhbmQKPj4+IHJlbG9jYXRlZCBiZWNhdXNl
IHRoZSByZWxvY2F0ZS1zZGsuc2ggc2NyaXB0IGRvZXNuJ3QgaGFuZGxlCj4+PiBwZXItcGFja2Fn
ZSBwYXRocy4KPj4+Cj4+PiAgICAgICAjIE1ha2Ugc3VyZSBmaWxlIHVzZXMgdGhlIHJpZ2h0IGxh
bmd1YWdlCj4+PiAgICAgICBleHBvcnQgTENfQUxMPUMKPj4+ICAgICAgICMgUmVwbGFjZSB0aGUg
b2xkIHBhdGggd2l0aCB0aGUgbmV3IG9uZSBpbiBhbGwgdGV4dCBmaWxlcwo+Pj4gICAgICAgZ3Jl
cCAtbHIgIiR7T0xEUEFUSH0iIC4gfCB3aGlsZSByZWFkIC1yIEZJTEUgOyBkbwo+Pj4gICAgICAg
ICAgIGlmIGZpbGUgLWIgLS1taW1lLXR5cGUgIiR7RklMRX0iIHwgZ3JlcCAtcSAnXnRleHQvJyAm
JiBbCj4+PiAiJHtGSUxFfSIgIT0gIiR7TE9DRklMRX0iIF0KPj4+ICAgICAgICAgICB0aGVuCj4+
PiAgICAgICAgICAgICAgIHNlZCAtaSAic3wke09MRFBBVEh9fCR7TkVXUEFUSH18ZyIgIiR7RklM
RX0iCj4+PiAgICAgICAgICAgZmkKPj4+ICAgICAgIGRvbmUKPj4+Cj4+Pgo+Pj4gVGhlIE9MRFBB
VEggaXMgdGhlIG9sZCBsb2NhdGlvbiBvZiB0aGUgZGlyZWN0b3J5IHdpdGhvdXQgdGhlIGNvbmNl
cHQKPj4+IG9mIHRoZSBwZXItcGFja2FnZSBwYXRocyBpbiB0aGUgdHJlZS4gU28sIGlzIHRoaXMg
c29tZXRoaW5nIHRoYXQgaXMKPj4+IGtub3duPyBUcmllZCBzZWFyY2hpbmcgdGhlIG1haWxpbmcg
bGlzdCBhbmQgY29tbWl0cyBhbmQgZGlkbid0IHNlZSBhCj4+PiByZWZlcmVuY2UgdG8gdGhpcyBw
cm9ibGVtIHNvIHdhcyBhIGJpdCBjdXJpb3VzLgo+Pgo+PiAgICBJIGJlbGlldmUgdGhhdCBzaG91
bGQgYmUgZml4ZWQgYnkgWzFdLgo+Pgo+PiAgICBBcHBhcmVudGx5IG5vYm9keSBlbHNlIGVuY291
bnRlcmVkIHRoaXMgcHJvYmxlbSB1cCB0byBub3cgYmVjYXVzZSB0aGF0IHBhdGNoCj4+IG5ldmVy
IHJlY2VpdmVkIGFueSBBY2tlZC1ieSBvciBUZXN0ZWQtYnkgOi0pCj4+Cj4+ICAgIFJlZ2FyZHMs
Cj4+ICAgIEFybm91dAo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMTIyNzE1NDMwMC4xMDU1Ni0xLWJyYW5kb24ubWFp
ZXJAY29sbGlucy5jb20vCj4+Cj4gCj4gQ29uZmlybWVkIC0gdGhpcyBmaXhlZCB0aGUgcHJvYmxl
bS4gVGhhbmtzLgo+IAo+IEFwcGxpZWQgdGhlIHBhdGNoIGZvciBvdXIgcHJvamVjdCAtIGhvcGVm
dWxseSBpdCBnZXQncyBtZXJnZWQgaW50byBtYWlubGluZS4KCiAgWW91IGNhbiBleHBlZGl0ZSB0
aGF0IGJ5IHJlcGx5aW5nIHRvIHRoZSBwYXRjaCB3aXRoCgpUZXN0ZWQtYnk6IFlvdXIgTmFtZSA8
eW91ckBlbWFpbD4KCiAgQW5kIGlmIHlvdSBhY3R1YWxseSByZXZpZXcgaXQgKGkuZS4gbG9vayBh
dCB0aGUgY29kZSwgY2hlY2sgdGhhdCBpbmRlZWQgdGhlIApjb2RlIGJsb2NrIHdhcyBtb3ZlZCB3
aXRob3V0IG1vZGlmaWNhdGlvbiwgZXRjLiksIHlvdSBjYW4gYWxzbyBhZGRlZAoKQWNrZWQtYnk6
IFlvdXIgTmFtZSA8eW91ckBlbWFpbD4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4+Cj4+Cj4+
Pgo+Pj4gQ2hhcmxlcwo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
