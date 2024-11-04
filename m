Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E01ED1BDF1
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70228101D;
	Mon,  4 Nov 2024 20:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEJh2LAy_4UK; Mon,  4 Nov 2024 20:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAEB48101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEB48101C;
	Mon,  4 Nov 2024 20:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E60503B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5E1881011
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1FV_-XH2fYr for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4DB880F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4DB880F2F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4DB880F2F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:41:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d5aedd177so2922376f8f.1
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 12:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730752888; x=1731357688;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJuRO80dpWZAZkwNA+87wpjUHCnXwLwo6j79tT6ZUiU=;
 b=NnAFUZiDyl9IysDxq5/jO0ue4cd3/lNvkByZAl0XHB/cigBKqqTryb/RV3W70V8tmE
 ooKaSfDWRWvcDMB16/g7jpkX9ciXGnni+foIWb8V4qFX7q5iklw2BK1CKdnZ3nbd5RwU
 VjDnL6eAy1LlHyKEW5PHrzsdw3lblXwrEX6AZWYU7JBwHE40CbQhWdx9z4V78d61s5VN
 fcot7RrrhygnNR3c+ZMoBn9+5BWq5I+k+jBdMUvbTXCLwh0iIp5MuQzFPQxEtBhv8Rf/
 vNkr1uJkOPA/v26Lb+rF6rKL6kv/DQPVyb1y7lEtmQ87U4EcXTwr52YdroyUiBv/swph
 dBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViz5l6vPn2VYtjEKl4LX78ZE+pvxvxYQni24KVhyNyGveSvcApsLniEY7lUG38/lwrd5yxSEoF/20=@buildroot.org
X-Gm-Message-State: AOJu0Yzub+By69CfjOD9PDUOysu6T6eF7DfoQG21IwhJXDljrAU8W6Li
 WGT8zun5zSmV5UebxEDsWetymqJNKaNmkT5okXajEDAgsxniZQY+iDGDULDO0qc=
X-Google-Smtp-Source: AGHT+IGmHa0OQgafnTc8XIp9VnlnYqbtHicPoDpT5wWo53nq8Ge1iZovbHa1RdW/aChwURs5vD2HCQ==
X-Received: by 2002:a5d:5f93:0:b0:37c:c9ae:23fb with SMTP id
 ffacd0b85a97d-381be907af0mr14044724f8f.40.1730752887676; 
 Mon, 04 Nov 2024 12:41:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e741dsm14064564f8f.50.2024.11.04.12.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 12:41:27 -0800 (PST)
Message-ID: <7a9d46a4-14f1-4312-9479-25436418a9e7@mind.be>
Date: Mon, 4 Nov 2024 21:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Asaf Kahlon <asafka7@gmail.com>
References: <20241101154326.366638-1-james.hilliard1@gmail.com>
 <a85af86f-e7ba-4f56-b33d-df10e1781694@mind.be>
Content-Language: en-GB
In-Reply-To: <a85af86f-e7ba-4f56-b33d-df10e1781694@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730752888; x=1731357688; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HJuRO80dpWZAZkwNA+87wpjUHCnXwLwo6j79tT6ZUiU=;
 b=TfF0d69G/bRWBdNyQI9SSLuDXr7DWYROE6kOKMNUXPepMqBOlu8K+9cHQfhcnb9yQ+
 Xv1Tk1S2r+5VbB7frMDjhhxRxf6Ebw0ghi5uRmdNH57SjHNOl1LLTy1g3PFx/2nG39Qj
 AhqRIAzoDGbGdzbQ+EPn0BdpsBWat8KowzZX7wejGrLZtQg2kXuAcAh+X5rkqVszLic7
 ZKIU813mA3hwBQUYRar9iFzdVXQYLCZ6cCG0SvbGhA2QYanGZ12opWnh72ZhNR8mcULV
 SfiMu53XOvOUpOmdbncjf7ZZ3FWh0++aBj8Q7vRt5NDwllMjVP2q0tGHXmrFe/TCvIpG
 hLJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TfF0d69G
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump
 to version 2.6.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA0LzExLzIwMjQgMjE6MzgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwMS8xMS8yMDI0IDE2OjQzLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gTWlncmF0ZSBmcm9t
IHBlcDUxNyB0byBoYXRjaCBzZXR1cCB0eXBlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IMKgQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4gU2FtZSBmb3IgdGhlIDIwIG90aGVyIHB5dGhvbiBwYWNrYWdlIGJ1bXBzIAo+
IChhaW9jb25zb2xlIHRvIHlhcmwpLgoKIMKgSSBtZWFuIDI4IG90aGVyIGJ1bXBzLgoKPgo+IMKg
UmVnYXJkcywKPiDCoEFybm91dAo+Cj4+IC0tLQo+PiDCoCAuLi4vcHl0aG9uLXB5ZGFudGljLXNl
dHRpbmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5oYXNoIHwgNCArKy0tCj4+IMKgIC4uLi9w
eXRob24tcHlkYW50aWMtc2V0dGluZ3MvcHl0aG9uLXB5ZGFudGljLXNldHRpbmdzLm1rwqDCoCB8
IDcgKysrLS0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLXNldHRp
bmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5oYXNoIAo+PiBiL3BhY2thZ2UvcHl0aG9uLXB5
ZGFudGljLXNldHRpbmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5oYXNoCj4+IGluZGV4IDFh
NDVmMzRjZWEuLmMxYWNiMDBkYzIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5ZGFu
dGljLXNldHRpbmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5oYXNoCj4+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLXB5ZGFudGljLXNldHRpbmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5oYXNo
Cj4+IEBAIC0xLDUgKzEsNSBAQAo+PiDCoCAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBp
Lm9yZy9weXBpL3B5ZGFudGljLXNldHRpbmdzL2pzb24KPj4gLW1kNcKgIDM4ZWVjZmVkYTI2ZDMz
MjgwM2M1NDBmZDg2MTA1NTA5IHB5ZGFudGljX3NldHRpbmdzLTIuNS4yLnRhci5nego+PiAtc2hh
MjU2IGY5MGIxMzk2ODJiZWU0ZDIwNjUyNzNkNTE4NWQ3MWQzN2VhNDZjZmU1N2UxYjVhZTE4NGZj
NmEwYjI0ODRjYTAgCj4+IHB5ZGFudGljX3NldHRpbmdzLTIuNS4yLnRhci5nego+PiArbWQ1wqAg
ZWI1MGUyZjg4ZGZiNTIyOWQ3MzE5YmU1N2RjYzRlZDAgcHlkYW50aWNfc2V0dGluZ3MtMi42LjEu
dGFyLmd6Cj4+ICtzaGEyNTYgZTBmOTI1NDZkOGE5OTIzY2I4OTQxNjg5YWJmODVkNjYwMWE4YzE5
YTIzZTk3YTM0YjI5NjRhMmUzZjgxM2NhMCAKPj4gcHlkYW50aWNfc2V0dGluZ3MtMi42LjEudGFy
Lmd6Cj4+IMKgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4+IMKgIHNoYTI1
NiBlYjM1NWE3NTNlMDIwMzQ2ZDMzZDgzYmY5NzY5MTM1Yjg5ZmM2MTA1NjhhYzUzMWEwMWMyOTVi
Y2VlN2ZkOTk4IAo+PiBMSUNFTlNFCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weWRh
bnRpYy1zZXR0aW5ncy9weXRob24tcHlkYW50aWMtc2V0dGluZ3MubWsgCj4+IGIvcGFja2FnZS9w
eXRob24tcHlkYW50aWMtc2V0dGluZ3MvcHl0aG9uLXB5ZGFudGljLXNldHRpbmdzLm1rCj4+IGlu
ZGV4IDM2YWRkNDU1MjcuLjkwZTk4MmIzZmYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LXB5ZGFudGljLXNldHRpbmdzL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy5tawo+PiArKysgYi9w
YWNrYWdlL3B5dGhvbi1weWRhbnRpYy1zZXR0aW5ncy9weXRob24tcHlkYW50aWMtc2V0dGluZ3Mu
bWsKPj4gQEAgLTQsMTIgKzQsMTEgQEAKPj4gwqAgIwo+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+PiDCoCAtUFlUSE9OX1BZREFOVElDX1NFVFRJTkdTX1ZFUlNJT04gPSAyLjUuMgo+PiArUFlU
SE9OX1BZREFOVElDX1NFVFRJTkdTX1ZFUlNJT04gPSAyLjYuMQo+PiDCoCBQWVRIT05fUFlEQU5U
SUNfU0VUVElOR1NfU09VUkNFID0gCj4+IHB5ZGFudGljX3NldHRpbmdzLSQoUFlUSE9OX1BZREFO
VElDX1NFVFRJTkdTX1ZFUlNJT04pLnRhci5nego+PiAtUFlUSE9OX1BZREFOVElDX1NFVFRJTkdT
X1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY4LzI3
LzBiZWQ5ZGQyNmI5MzMyOGI2MGExNDAyZmViYzc4MGU3YmU3MmI0Mjg0N2ZhOGI1Yzk0YjdkMGFl
YjZkMQo+PiAtUFlUSE9OX1BZREFOVElDX1NFVFRJTkdTX1NFVFVQX1RZUEUgPSBwZXA1MTcKPj4g
K1BZVEhPTl9QWURBTlRJQ19TRVRUSU5HU19TSVRFID0gCj4+IGh0dHBzOi8vZmlsZXMucHl0aG9u
aG9zdGVkLm9yZy9wYWNrYWdlcy9iNS9kNC85ZGZiZTIzOGY0NWFkOGIxNjhmNWM5NmVlNDlhM2Rm
MDU5OGNlMThhMDc5NWE5ODNiNDE5OTQ5Y2U2NWIKPj4gK1BZVEhPTl9QWURBTlRJQ19TRVRUSU5H
U19TRVRVUF9UWVBFID0gaGF0Y2gKPj4gwqAgUFlUSE9OX1BZREFOVElDX1NFVFRJTkdTX0xJQ0VO
U0UgPSBNSVQKPj4gwqAgUFlUSE9OX1BZREFOVElDX1NFVFRJTkdTX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFCj4+IC1QWVRIT05fUFlEQU5USUNfU0VUVElOR1NfREVQRU5ERU5DSUVTID0gaG9zdC1w
eXRob24taGF0Y2hsaW5nCj4+IMKgIMKgICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
