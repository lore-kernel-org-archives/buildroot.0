Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5EEE67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C0160C30;
	Thu, 31 Oct 2024 22:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv5zInaGKObY; Thu, 31 Oct 2024 22:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2C660C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2C660C21;
	Thu, 31 Oct 2024 22:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D19045B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB6F81DE3
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODP5umCDtG74 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B51E81DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B51E81DE1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B51E81DE1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:02:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso10972985e9.3
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412172; x=1731016972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0pD6qD+xUwBfvxGafc56+gSuL6+I3ZqkTQTcHrw/yM=;
 b=PCJbm7avedxjcpkmmuTrh97bg/DdCCYbXMho7pu9RyYpw3TGNhB1Ceo9TYevw+Ya+V
 58p2jl9lQ83VyCSFdPhrmI7ReQYNTFrL8hBpAVciyI2wT4HUxP/3sNDVayocU/6jR7aF
 5uJSc6Je/TUUQwnkh3ZMtZgiyqmz7XpjSO6RLRsVX3Kj0G2J3jlUcga9FwYZpkGUOP9y
 ugr18YZTBvnEBwe0eenGEOmzKh6eUYGlt5BpAz4rjJSBEKlYi/atEpblmtImL6Y5vBH7
 a9syuNB0omeyprcrHOycGyK0ZUJLhtKlUCFPkPTeI8BRlHnsUNv8DtoC1rBz7yhc7T7/
 EfGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrI7h1KAikvpL5JNCjStQ55mbHvFKdPMhYaX8H68Gc/njE+FWczJRzAnXY0pHLk9GJi1sJptLbXQs=@buildroot.org
X-Gm-Message-State: AOJu0YyHeSukaNaIeII5oNIEv8IwWWCqP+Vyoz4gRHDpNhZHCLtwTUoa
 S0jKKevwLuFSva8YG3wfggEiD09Ka6thP2uvWOCG8s2PG3+GGQ7tfCsbB9XmMC8=
X-Google-Smtp-Source: AGHT+IFQPRxcWOtns2W1tx/Fq1V9PNptr1wl90o3Pu1/ilVU1BWIxV0SAHk+KXQAGIAhnPZMs73sgw==
X-Received: by 2002:a05:600c:19c8:b0:430:54a4:5b03 with SMTP id
 5b1f17b1804b1-4319ac6fad6mr160296795e9.6.1730412172365; 
 Thu, 31 Oct 2024 15:02:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5bf4b0sm39306435e9.14.2024.10.31.15.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:02:52 -0700 (PDT)
Message-ID: <8b495502-8dfc-43b5-876f-a2b880fb65e8@smile.fr>
Date: Thu, 31 Oct 2024 23:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-3-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241031213348.2057705-3-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730412172; x=1731016972; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o0pD6qD+xUwBfvxGafc56+gSuL6+I3ZqkTQTcHrw/yM=;
 b=S9HCHOyVh+0fcoIr6olaGbfuhjLGZTJSn3f0Mowo0mDT3vARZOoRqLa38cN1CDsmDo
 9fp7F+CAhxjg8wbYVviF2u843jtnFsiYk73xYhl2Wt9RTLTclgJwtHZDx4y/znLUfOPX
 YjUZXXmy1WsBKLpCVZql3HnjQrUXLov/EQh/Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=S9HCHOyV
Subject: Re: [Buildroot] [PATCH v3 2/8] support/testing: disable tests using
 edk2 on aarch64 architecture
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBFREsyIHZlcnNpb24gZWRrMi1zdGFibGUyMDI0MDUgKG5vdCB5ZXQgaW4gQnVp
bGRyb290KSBoYXMgZGVwZW5kZW5jaWVzCj4gb24gc3BlY2lmaWMgUWVtdSB2ZXJzaW9uLgo+IAo+
IEJ1aWxkcm9vdCBndWlkZWxpbmVzIGFsc28gcmVjb21tZW5kIHRoYXQgImVhY2ggcGF0Y2ggbXVz
dCBiZSBjb21wbGV0ZSIuCj4gU2VlOiBbMV0uIFRoaXMgbWVhbnMsIGEgcGF0Y2ggaW4gYSBzZXJp
ZXMgaXMgbm90IGFsbG93ZWQgdG8gYnJlYWsKPiBzb21ldGhpbmcga25vd2luZ2x5LCBldmVuIGlu
IHRoZSBzYW1lIHBhdGNoIHNlcmllcy4gVGhpcyBydWxlIGlzCj4gbWFpbmx5IGZvciB1c2luZyBn
aXQgYmlzZWN0Lgo+IAo+IFdlIGFsc28gd2FudCB0byBhdm9pZCBidW1waW5nIEVESzIsIHVwZGF0
ZSB0aGUgcnVudGltZSB0ZXN0IGluZnJhLAo+IGFuZCBmZXcgdGVzdHMgaW4gYSBiaWcgc2luZ2xl
IGNvbW1pdCwgZm9yIHJlYWRhYmlsaXR5LiBUaGlzIHdvdWxkIG1peAo+IHRvbyBtYW55IGNoYW5n
ZXMgaW4gdGhlIHNhbWUgY29tbWl0Lgo+IAo+IEFzIGEgdHJhZGUgb2ZmLCB0aGlzIGNvbW1pdCBk
aXNhYmxlcyB0aGUgcnVudGltZSB0ZXN0cyB3aGljaCBhcmUga25vd24KPiB0byBiZSBicm9rZW4g
YnkgdGhlIHVwY29taW5nIGVkazIgdXBkYXRlLiBUaGVuLCB0aG9zZSB0ZXN0cyB3aWxsIGJlCj4g
aW5kaXZpZHVhbGx5IGZpeGVkIGFuZCByZS1lbmFibGVkIGluIGZvbGxvd3VwIGNvbW1pdHMuCgpX
aXRoIEp1bGllbiwgd2UgZGlkIG91ciBiZXN0IHRvIGF2b2lkIGJyZWFraW5nIHRlc3RzLiBUaGlz
IFFlbXUgdmVyc2lvbiBidW1wCmJyZWFrIHRoaW5ncyBpbiBzZXZlcmFsIHN1YnRpbGUgd2F5Li4u
CgpJIGRvbid0IGhhdmUgYW5vdGhlciBzdWdnZXN0aW9uLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKWWV0LCB0aGlzIHFlbXUgOS4xIGNvbW1pdCBb
MV0gYnJva2UgcWVtdV9hcm1fZWJicl9kZWZjb25maWcgWzJdLgpUaGUgaXNzdWUgaXMgY3VycmVu
dGx5IGludmVzdGlnYXRlZCBbM10uCgpbMV0KaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVj
dC9xZW11Ly0vY29tbWl0LzRjMmMwNDc0NjkzMjI5YzFmNTMzMjM5YmI5ODM0OTVjNTQyNzc4NGQK
WzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvODIz
MzIyNzMzNwpbM10gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVz
LzI1ODgjbm90ZV8yMTgxMjk2NjE4CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhpcyBF
REsyL1FlbXUgaW5jb21wYXRpYmlsaXR5IG9ubHkgYWZmZWN0cyBydW50aW1lIHRlc3RzIHVzaW5n
IEVESzIKPiBvbiB0aGUgQXJtIEFhcmNoNjQgYXJjaGl0ZWN0dXJlLiBUaGlzIGNvbW1pdCBkaXNh
YmxlIHRoZSBydW50aW1lCj4gdGVzdHMgYnkgYWRkaW5nIGEgInNraXBUZXN0KCkiIGNhbGwgaW46
Cj4gLSB0ZXN0cy5ib290LnRlc3RfZWRrMgo+IC0gdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdy
dWJBQXJjaDY0RUZJCj4gLSB0ZXN0cy5wYWNrYWdlLnRlc3RfZnd0cwo+IAo+IFsxXSBodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBh
dGNoZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+
IC0tLQo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkgICAgfCA0ICsr
KysKPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9ncnViLnB5ICAgIHwgNCArKysr
Cj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZnd0cy5weSB8IDQgKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL2Jvb3QvdGVzdF9lZGsyLnB5Cj4gaW5kZXggMTZmYTEwZjhjOS4uN2QzNTBmNTJkOSAxMDA2
NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkKPiArKysg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkKPiBAQCAtMzMsNiArMzMs
MTAgQEAgY2xhc3MgVGVzdEVkazIoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBC
UjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4gICAgICAgICAgIiIiCj4gIAo+ICsgICAgZGVmIHNl
dFVwKHNlbGYpOgo+ICsgICAgICAgIHNlbGYuc2tpcFRlc3QoIkluY29tcGF0aWJsZSBRRW11IDUu
Mi4wIChEb2NrZXIgaW1hZ2UpIC8gIgo+ICsgICAgICAgICAgICAgICAgICAgICAgIkVESzIgKHN0
YWJsZTIwMjQwNSkgdmVyc2lvbnMuIikKPiArCj4gICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4g
ICAgICAgICAgaGRhID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiZGlz
ay5pbWciKQo+ICAgICAgICAgIGZsYXNoMCA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAi
aW1hZ2VzIiwgIlNCU0FfRkxBU0gwLmZkIikKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL2Jvb3QvdGVzdF9ncnViLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVz
dF9ncnViLnB5Cj4gaW5kZXggNTMxNWZhMjNiYS4uNDEyMzRkZTJiOSAxMDA2NDQKPiAtLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkKPiArKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkKPiBAQCAtMTU2LDYgKzE1NiwxMCBAQCBjbGFz
cyBUZXN0R3J1YkFBcmNoNjRFRkkoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICAi
IiIuZm9ybWF0KHBvc3RfaW1hZ2U9aW5mcmEuZmlsZXBhdGgoInRlc3RzL2Jvb3QvdGVzdF9ncnVi
L3Bvc3QtaW1hZ2UtYWFyY2g2NC1lZmkuc2giKSwKPiAgICAgICAgICAgICAgICAgICAgIGxpbnV4
X2ZyYWdtZW50PWluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9ib290L3Rlc3RfZ3J1Yi9saW51eC1hYXJj
aDY0LWVmaS5jb25maWciKSkKPiAgCj4gKyAgICBkZWYgc2V0VXAoc2VsZik6Cj4gKyAgICAgICAg
c2VsZi5za2lwVGVzdCgiSW5jb21wYXRpYmxlIFFFbXUgNS4yLjAgKERvY2tlciBpbWFnZSkgLyAi
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAiRURLMiAoc3RhYmxlMjAyNDA1KSB2ZXJzaW9ucy4i
KQo+ICsKPiAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiAgICAgICAgICBoZGEgPSBvcy5wYXRo
LmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJkaXNrLmltZyIpCj4gICAgICAgICAgYmlv
cyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgIlFFTVVfRUZJLmZkIikK
PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9md3RzLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9md3RzLnB5Cj4gaW5kZXggZWY3
OTIxMzZjMi4uMmM5ODczZWU1NCAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X2Z3dHMucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2Z3dHMucHkKPiBAQCAtMzYsNiArMzYsMTAgQEAgY2xhc3MgVGVzdEZ3dHMoaW5mcmEu
YmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4g
ICAgICAgICAgIiIiCj4gIAo+ICsgICAgZGVmIHNldFVwKHNlbGYpOgo+ICsgICAgICAgIHNlbGYu
c2tpcFRlc3QoIkluY29tcGF0aWJsZSBRRW11IDUuMi4wIChEb2NrZXIgaW1hZ2UpIC8gIgo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIkVESzIgKHN0YWJsZTIwMjQwNSkgdmVyc2lvbnMuIikKPiAr
Cj4gICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gICAgICAgICAgaGRhID0gb3MucGF0aC5qb2lu
KHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiZGlzay5pbWciKQo+ICAgICAgICAgIGZsYXNoMCA9
IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgIlNCU0FfRkxBU0gwLmZkIikK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
