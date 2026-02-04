Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94D3EA7942
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE3581095;
	Wed,  4 Feb 2026 19:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GanIvU_RK0y2; Wed,  4 Feb 2026 19:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66BBD81145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770231935;
	bh=8ebYjQXXqmxHNA0l3faREcXEE7WRkPbELQ5P0GjTw9k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MAdGnHT1OCvTqp1WhQHcS9DQE/arf7sddTwgEj6ccVsNOEQLW/fuzb/eWmjGp07hP
	 3WLAGTJ0vMkbbq3aAP6xVynDM3hJUoJFzjbBnKoqHeHA3MLMLRkdlBvhofvMaGO/wl
	 D/N4P2lhuI73J8pySeKvgBPnnHE7FJP9DNy9zU5gMJKl48JR8XEqH2MDQkUSiYcguE
	 XBq/hNBDNRRYhJWxnDATaSmI0TK5+tXttEADaUmNzpxDcAquhRvOauKreL7terITcf
	 NA2/GtNz2r+WfbZKEtZaYpAHq8/6r9tJel7bHRe8GsJg6XNKmWLZ+v7d9pUMkP0QeU
	 nvY8V1lTthIHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66BBD81145;
	Wed,  4 Feb 2026 19:05:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D8D17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C7F4005A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Vv23fHQLJo0 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89F6140012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F6140012
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89F6140012
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-59dd263bf42so99351e87.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 11:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770231931; x=1770836731;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJGl/AZFfqf8A8NFLi2y7ovf42vYGEbmvfE2GKVKr1s=;
 b=U2cJ/KBpTU7AkXqPPXj6Vjhjtcitn0Hx/MhB7iS+UUWrjXH6a3+cOl7uC3N9CaGQJn
 lRl1o/9DulimkZ2aWEe+anH+ExMt2quPAhvX1TcwvamiIRaAhUsjlg64Ad1gzIdBB9Hi
 eTc7ZayWQKsFJH8BbPNpd2+2Bk5/p7B6yZW/peQy6EyH1//12zWr8R5r8vTdAmOTmgwO
 JinXi0azcg24TjX0BoCBuej5SPsGI3AgctzxcO/0E/UR6/pEGTF623hVAWS6aQp+cUfj
 ecWtznENlj328VN9snkJuQEN1rqXptDfUlrwYkI9J724wGjn2ScbgvLuWVAdZeHLe1uj
 iDMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmhUvImV4ujvDbPgDKEtNXBemsI8s2pS0p5ghW5peMYRfasOiwrBZEPcEi/EOIK7OkuLkTPsxz6rA=@buildroot.org
X-Gm-Message-State: AOJu0Yzr6i1NJaMWD0skdKMWMzGJv2djYiciCQLBWEywJGOQSavYuulg
 4FPmHTXbDgrTyrNZwrsnDFYjZZ04rXk+1Bde98R3bb7oNEIPAtQelVZqL+6PBXlruUT0O1IGc5n
 7yVj7cy8=
X-Gm-Gg: AZuq6aKuTYEHh/hvZV2BxPi0hqdC/0fytkAGCUo3tcm7b29PfBc0LgC3v0yyCPVJN27
 Sd2iHomrFMUFDtwzM0aO0yIjqLzKECSFVC4WdMz2+oWJSEMsQyOy5MfNttFbRYTLhEDfaaHTp+E
 8efILDeW2o9PyRFL7cPEywb38YaXV4MNwGZBXJZA7qOp7kzLge6nP1ksPWpJBH7KyEhHo6x1DXu
 auACqdl8TMKCsYu3mkfSNxVGz4IYj23oRuW/Uo9bF0vSkmT04DPI0uLFblomavO1/lb6qWodie5
 Rs+qmImF8W051EbT35N0ffGUjfVQeK5QSsdD1HStaOQIciaUH/qRiZU9NsYMDbpy3GbymXdRB24
 LMoFVki5HBZbtjYrRWot7o3bKQMUknTyzimXBKIHMHtY4j0T45u7FW/439LzaT2Qf0F3dkUkdwx
 /Ly3BHbUn++IEggzC54u/hTG8SRyigpyZcRRIxzQZV
X-Received: by 2002:a05:6000:18a3:b0:435:b068:d3d2 with SMTP id
 ffacd0b85a97d-436180611a9mr5667563f8f.57.1770230034182; 
 Wed, 04 Feb 2026 10:33:54 -0800 (PST)
Received: from [192.168.24.72] (46.127.95.79.rev.sfr.net. [79.95.127.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805f25dsm8560225f8f.29.2026.02.04.10.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 10:33:53 -0800 (PST)
Message-ID: <a8b5d9b0-9142-4aaf-a3f8-38b1d8abfd69@smile.fr>
Date: Wed, 4 Feb 2026 19:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: bernd@kuhls.net, buildroot@buildroot.org, romain.naour@gmail.com,
 thomas.devoogdt@barco.com, thomas.petazzoni@bootlin.com
References: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
 <20260204123609.3607193-1-thomas@devoogdt.com>
 <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CACXRmJh1-5Cy92kF9TM5nDs_uB90WAe5iOGmNNL2E-cMhJE7GA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770231931; x=1770836731; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PJGl/AZFfqf8A8NFLi2y7ovf42vYGEbmvfE2GKVKr1s=;
 b=dQjhJ5ECuddiiB1V5bsUFIoyJqU8XizBTvonqU4EpStEgaLEvloccMaBkAmm9o2hBh
 9NlKoIkSbDoQyhGHVx9QQl2MxW6WKDbG8FaOhPj+uYS8mjOQz7RnNRcgCmbDVXT16Tiz
 YL2WvhspeWruPEMJvZpTg8w5Rs+cF1PiJpJ00=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dQjhJ5EC
Subject: Re: [Buildroot] [PATCH v3] package/mesa3d: fix compilation with
 host-llvm enabled
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

SGkgVGhvbWFzLCBBbGwsCgpMZSAwNC8wMi8yMDI2IMOgIDE0OjQxLCBUaG9tYXMgRGV2b29nZHQg
YSDDqWNyaXTCoDoKPiBIaSBSb21haW4sIEFsbCwKPiAKPiAKPiBVcGRhdGU6Cj4gCj4gV2hlbiBj
b21waWxpbmcgb24gbWFzdGVyLCB0aGVuIG1lc29uIGlzIHNvbWVob3cgYWJsZSB0byBmaW5kIHRo
ZSByaWdodAo+IGxsdm0tY29uZmlnLCBzbyByZXByb2R1Y3Rpb24gb25seSBzZWVtcyB0byBiZSBw
b3NzaWJsZSBpZiB0aGUgaG9zdAo+IG1hY2hpbmUgc2hpcHMgd2l0aCBhIG5ld2VyIHZlcnNpb24g
YXMgdGhlIG9uZSBidWlsZHJvb3QgaXMgdXNpbmcuCj4gCj4gbGx2bS1jb25maWcgZm91bmQ6IFlF
Uwo+ICgvaG9tZS90aG9tYXMvRG9jdW1lbnRzL2V4dGVybmFsL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9iaW4vbGx2bS1jb25maWcpCj4gMjEuMS44Cj4gUnVuLXRpbWUgZGVwZW5kZW5jeSBMTFZNICht
b2R1bGVzOiBiaXR3cml0ZXIsIGNvcmUsIGNvdmVyYWdlLCBlbmdpbmUsCj4gZXhlY3V0aW9uZW5n
aW5lLCBpbnN0Y29tYmluZSwgaXJyZWFkZXIsIGxpYmRyaXZlciwgbGlua2VyLCBsdG8sCj4gbWNk
aXNhc3NlbWJsZXIsIG1jaml0LCBuYXRpdmUsIG9wdGlvbiwgc2NhbGFyb3B0cywgdGFyZ2V0LAo+
IHRyYW5zZm9ybXV0aWxzLCBhbGwtdGFyZ2V0cywgY29yb3V0aW5lcywgZnJvbnRlbmRkcml2ZXIs
IGZyb250ZW5kaGxzbCwKPiBsdG8sIHdpbmRvd3Nkcml2ZXIpIGZvdW5kOiBZRVMgMjEuMS44CgpU
aGFua3MgZm9yIHRoaXMgdXBkYXRlLgoKSSdtIHdvbmRlcmluZyBpZiB0aGUgaXNzdWUgY291bGQg
YWxzbyBiZSByZWxhdGVkIHRvIHRoZSB0YXJnZXQgYXJjaGl0ZWN0dXJlLi4uCgpZb3UgY2FuIHJl
cHJvZHVjZSB0aGUgaXNzdWUgdGFyZ2V0dGluZyBhbiBCUjJfeDg2XzY0ICh3aGlsZSBidWlsZGlu
ZyBvbiB4ODZfNjQpCm9uIDIwMjUuMDUueCBicmFuY2guIEJ1dCBjYW4geW91IHN0aWxsIHJlcHJv
ZHVjZSBpdCBpZiB5b3UgdXNlIGFuIGFhcmNoNjQgYXMgYQp0YXJnZXQpPwoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IAo+IEtyLAo+IAo+IFRob21hcyBEZXZvb2dkdAo+IAo+IAo+IE9wIHdv
IDQgZmViIDIwMjYgb20gMTM6MzYgc2NocmVlZiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZv
b2dkdC5jb20+Ogo+Pgo+PiBGcm9tOiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBi
YXJjby5jb20+Cj4+Cj4+IE1lc29uJ3MgY3VzdG9tIExMVk0gcGFyc2VyIHVzZXMgbGx2bS1jb25m
aWcgd2l0aCBhIGRlZmF1bHQgc2VhcmNoIHBhdGggb2YKPj4gL3Vzci9iaW4sIGNhdXNpbmcgaXQg
dG8gZGV0ZWN0IHRoZSBob3N0IHN5c3RlbSdzIGxsdm0tY29uZmlnICh2ZXJzaW9uIDE4LjEuMykK
Pj4gaW5zdGVhZCBvZiB0aGUgYnVpbGRyb290LWNvbXBpbGVkIG9uZS4gVGhpcyBmb3JjZXMgYWxs
IExMVk0tcmVsYXRlZCBwYWNrYWdlcyB0bwo+PiBtYXRjaCB2ZXJzaW9uIDE4LjEuMywgYnV0IHNp
bmNlIHRoZSBob3N0IHN5c3RlbSBsYWNrcyBsbHZtc3BpcnZsaWIsIHRoZSBidWlsZAo+PiBmYWls
cy4gVGhpcyBwYXRjaCBmb3JjZXMgTWVzb24gdG8gdXNlIHRoZSBidWlsZHJvb3QtY29tcGlsZWQg
bGx2bS1jb25maWcuCj4+Cj4+IE5vdGUgdGhhdCBMTFZNX0NPTkZJRyBpcyBhIENNYWtlIG9wdGlv
biwgbm90IGEgTWVzb24gb25lLiBUaGlzIGlzIGJlY2F1c2UKPj4gTWVzb24gaGFzIGN1c3RvbSBk
ZXBlbmRlbmN5IHJlc29sdXRpb24gbG9naWMgZm9yIExMVk0gKHNlZQo+PiBodHRwczovL21lc29u
YnVpbGQuY29tL0RlcGVuZGVuY2llcy5odG1sI2xsdm0pLiBUaGUgRVhUUkFfQklOQVJJRVMgbWVj
aGFuaXNtCj4+IGNhbm5vdCBiZSB1c2VkIGhlcmUsIGFzIGl0IG9ubHkgYXBwbGllcyB0byBjcm9z
cy1jb21waWxhdGlvbiBzY2VuYXJpb3MsIHdoaWNoCj4+IGRvZXMgbm90IGFwcGx5IHRvIGhvc3Qt
bWVzYTNkIGJ1aWxkcy4KPj4KPj4gUmVwcm9kdWN0aW9uIChPbiBCUjIgdGFnOiAyMDI1LjA1LjMp
Ogo+Pgo+PiBCUjJfeDg2XzY0PXkKPj4gQlIyX3g4Nl9hdG9tPXkKPj4gQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTD15Cj4+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfR0xJQkNf
U1RBQkxFPXkKPj4gQlIyX0xJTlVYX0tFUk5FTD15Cj4+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQo+PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEu
MjQiCj4+IEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+PiBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvcGMvbGludXguY29uZmlnIgo+PiBCUjJf
TElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPj4gQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19I
T1NUX09QRU5TU0w9eQo+PiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfTElCRUxGPXkKPj4g
QlIyX1BBQ0tBR0VfTUVTQTNEPXkKPj4gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk09eQo+PiBCUjJf
UEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfSTkxNT15Cj4+IEJSMl9QQUNLQUdFX01FU0Ez
RF9HQUxMSVVNX0RSSVZFUl9JUklTPXkKPj4gQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0w9
eQo+PiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VTPXkKPj4KPj4gRml4ZXM6Cj4+Cj4+IGxs
dm0tY29uZmlnIGZvdW5kOiBZRVMgKC91c3IvYmluL2xsdm0tY29uZmlnLTE4KSAxOC4xLjMKPj4g
UnVuLXRpbWUgZGVwZW5kZW5jeSBMTFZNIChtb2R1bGVzOiBiaXR3cml0ZXIsIGNvcmUsIGNvdmVy
YWdlLCBlbmdpbmUsIGV4ZWN1dGlvbmVuZ2luZSwgaW5zdGNvbWJpbmUsIGlycmVhZGVyLCBsaWJk
cml2ZXIsIGxpbmtlciwgbHRvLCBtY2Rpc2Fzc2VtYmxlciwgbWNqaXQsIG5hdGl2ZSwgb3B0aW9u
LCBzY2FsYXJvcHRzLCB0YXJnZXQsIHRyYW5zZm9ybXV0aWxzLCBhbGwtdGFyZ2V0cywgY29yb3V0
aW5lcywgZnJvbnRlbmRkcml2ZXIsIGZyb250ZW5kaGxzbCwgbHRvLCB3aW5kb3dzZHJpdmVyKSBm
b3VuZDogWUVTIDE4LjEuMwo+PiBEZXBlbmRlbmN5IExMVk1TUElSVkxpYiBmb3VuZDogTk8uIEZv
dW5kIDE1LjAuMC4wIGJ1dCBuZWVkOiAnPj0gMTguMScgOyBtYXRjaGVkOiAnPj0gMTUuMC4wLjAn
LCAnPCAxOC4yJwo+PiBSdW4tdGltZSBkZXBlbmRlbmN5IGxsdm1zcGlydmxpYiBmb3VuZDogTk8g
KHRyaWVkIGNtYWtlKQo+Pgo+PiBvdXRwdXQvYnVpbGQvaG9zdC1tZXNhM2QtMjUuMC42L21lc29u
LmJ1aWxkOjE4ODI6MjE6IEVSUk9SOiBEZXBlbmRlbmN5IGxvb2t1cCBmb3IgTExWTVNQSVJWTGli
IHdpdGggbWV0aG9kICdwa2djb25maWcnIGZhaWxlZDogSW52YWxpZCB2ZXJzaW9uLCBuZWVkICdM
TFZNU1BJUlZMaWInIFsnPj0gMTguMSddIGZvdW5kICcxNS4wLjAuMCcuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPj4gLS0t
Cj4+IHYzOiBBZGRlZCByZXByb2R1Y3Rpb24gaW5mby4KPj4gICAgIEFjdHVhbGx5LCBJIHNhdyB0
aGUgaXNzdWUgZmlyc3Qgb24gMjAyNS4wMi54IHdpdGggdGhlc2UgY29tbWl0cyBjaGVycnktcGlj
a2VkOgo+PiAgICAgLSAzMTcyNjBmMzM2YjY1ZmYwYjQxYTk1Mzg4MmNiOGNjY2I3ODllMDEwCj4+
ICAgICAtIDhiNWRkNDljNWIyZWI1MmU3MWJhOWRmZjY3YjFiYTU0ZDBlMDBhYzMKPj4gICAgIC0g
NDg5MDQxNWFhOWU5MThiZGJiNTI0MTRlMGU1M2YyOWU5MzMxNTI5MQo+PiAgICAgLSBiMDhiYzVi
OWU5NDI2OWFkYjRhMWM1NzcxYzhjMjZjOGM4N2U1YjVhCj4+IC0tLQo+PiAgcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBiL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawo+PiBpbmRleCBkYjQ2ZDdiYzdjMi4uYjUzMDBkZjJiYTMgMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+PiArKysgYi9wYWNrYWdlL21lc2EzZC9t
ZXNhM2QubWsKPj4gQEAgLTI5Miw2ICsyOTIsOSBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0Ez
RF9WVUxLQU5fRFJJVkVSX0lNQUdJTkFUSU9OKSx5KQo+PiAgSE9TVF9NRVNBM0RfVE9PTFMgKz0g
aW1hZ2luYXRpb24KPj4gIGVuZGlmCj4+Cj4+ICtIT1NUX01FU0EzRF9DT05GX0VOViA9IFwKPj4g
KyAgICAgICBMTFZNX0NPTkZJRz0iJChIT1NUX0RJUikvYmluL2xsdm0tY29uZmlnIgo+PiArCj4+
ICBIT1NUX01FU0EzRF9DT05GX09QVFMgPSBcCj4+ICAgICAgICAgLURnbHZuZD1kaXNhYmxlZCBc
Cj4+ICAgICAgICAgLURnYWxsaXVtLWRyaXZlcnM9JChzdWJzdCAkKHNwYWNlKSwkKGNvbW1hKSwk
KEhPU1RfTUVTQTNEX0dBTExJVU1fRFJJVkVSUy15KSkgXAo+PiAtLQo+PiAyLjQzLjAKPj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
