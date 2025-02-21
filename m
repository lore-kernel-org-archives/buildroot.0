Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD2C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230FE81D24;
	Fri, 21 Feb 2025 22:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uShXdwBZhEbQ; Fri, 21 Feb 2025 22:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1880581AF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1880581AF4;
	Fri, 21 Feb 2025 22:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 854C6D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0E481AC1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EyQ0VXGT_Yl for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 195F481A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195F481A92
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195F481A92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:36:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4399deda4bfso18320475e9.0
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740177385; x=1740782185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Jd7Nr/8zaKEmya0WvltYrscp/k6vHjtYROnoW518w=;
 b=d1YbY5pEJOwvw2xd6DNstBvpOlN/ggRfboo+7odevdlhKJxBsWrBRgcqgkNazzq0Xd
 Lkc6HiXETCzCDT3bCzWUT999Uzvbu9cw4w474QLr/QjOQaim7EedV9M4OQLUN587ik5R
 kBYPsI4FzvPoiiQ5zqIE73jsnESzpFkrQWDg05CeNUKFRGCFq4/bwZNobjchaTvpkeKV
 od7BcsFfw3+lIU/4eVFD9oyCDaZmnS47AVMI4CXfAe1PKsIxsv0mOXyD2ubXb9gM8P/v
 hLAPYn9FQiXauDRJi/88I25MPWG7ss5sdTSlUVst1KbMGzQEEm9xyEbJ6rN8gaxAXfTE
 jaEA==
X-Gm-Message-State: AOJu0YxXRv9pj2KGUPMjmC6vDKGHpReE1eHIjpjb8o2V4IjWcw4r7skv
 hqhAicCx/LuDuE/Bk4dmx0beKEhtpM0dpLBU2uaND+kmW4cktZ+RvZcEExwRs/8/bSY3D3NVQ9e
 7
X-Gm-Gg: ASbGncsMSKdAGMTR1t88s7AtamPomIESghvyDyWX2oVBlfidhfqlLNcna/5DGL2GvoR
 /p55bualY94h2+tRy3TQJ9g3VO621HbIY/G+wmND71JF3QkQT2WfxNqnWC/DS/iz3EX2K1B4Lvm
 WPAPf7tBDAU3nCrOfCkLPbox+GFRxzRWZumT9SbD54ZJmI9qQj238DmrBowdXudAP0GfKUQabra
 qhjABe/aFcseinj18mhwFZ147iGVw4bly7y47D9jN22sSlXNWa6q2upxx8K+qglHEYh9W+MgoMA
 6wPe8Qb378UGm4A5EWTgyGmNgDL5tO+veAuzKc412CyarpXWlJEw6OTGfeFnP/J/HfHdaFeChlb
 RJ8vjEEJAy6gZsjEgle4U5455RaBS86jDFs3vveQS+k/lMVgkvGSQNBZfXQ9DoQ==
X-Google-Smtp-Source: AGHT+IFe5cf2mpOpkSlCkkRfLoPM0aWrQwwtgkpB++n0XmKbAShuW1roI/fbRuAMouPFiDw144aKjg==
X-Received: by 2002:a5d:5985:0:b0:38f:3ee5:fd36 with SMTP id
 ffacd0b85a97d-38f6f0af903mr4924113f8f.53.1740177385081; 
 Fri, 21 Feb 2025 14:36:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce435sm30793955e9.3.2025.02.21.14.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 14:36:24 -0800 (PST)
Message-ID: <a6c05778-aa03-4e98-84c6-e34276e3fb72@smile.fr>
Date: Fri, 21 Feb 2025 23:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-4-romain.naour@smile.fr> <Z7ctVCChIdUiW-Oz@ryzen>
Content-Language: fr
In-Reply-To: <Z7ctVCChIdUiW-Oz@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740177385; x=1740782185; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Jd7Nr/8zaKEmya0WvltYrscp/k6vHjtYROnoW518w=;
 b=ycNXAQ+wz8aTWJP2fzPI2+Y4oh8mk4OcDMbGVJnDaZvJEDc51lcD4qlo4lBgQoQqjp
 WmAxwR4qWLbQXEyV7KxEjjjhIBtzvRLWdHrnXtxYSC43LIxg2EfTMFA1oJ6pcmwSYZuD
 7H+NHCasg80ammvDEMutiY1bq7uI158suuYwQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ycNXAQ+w
Subject: Re: [Buildroot] [PATCH v5 4/6] configs/acmesystems_acqua_a5_*: bump
 to Linux 6.12.9
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

SGVsbG8gTmlrbGFzLAoKTGUgMjAvMDIvMjAyNSDDoCAxNDoyNSwgTmlrbGFzIENhc3NlbCBhIMOp
Y3JpdMKgOgo+IE9uIFR1ZSwgRmViIDA0LCAyMDI1IGF0IDA1OjM2OjE5UE0gKzAxMDAsIFJvbWFp
biBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBVc2UgdGhlIG5ld2x5IGludHJvZHVjZWQg
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX0RJUgo+PiBvcHRpb24gdG8gcHJvdmlkZSB0aGUg
T3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUgU291cmNlIGZpbGUgd2l0aAo+PiBpdHMgdmVuZG9yIHN1
YmRpcmVjdG9yeSB0aGF0IGlzIG5lZWRlZCBzaW5jZSBrZXJuZWwgNi4xMiBbMV0uCj4+Cj4+IFJl
dmVydCB0aGUgc2FtYTVkMzEuZHRzaSBpbmNsdWRlIHBhdGggdXBkYXRlIGFkZGVkIGJ5IHRoZSBw
cmV2aW91cwo+PiBrZXJuZWwgdmVyc2lvbiBidW1wIDYuNi4xMiBbMl0uCj4+Cj4+IEFzIG5vdGlj
ZWQgYnkgTWljaGFlbCBXYWxsZSwgbmV3ZXIgT09UIGRldmljZSB0cmVlcyBzaG91bGQgdXNlIHRo
ZQo+PiBzYW1lICNpbmNsdWRlIGRpcmVjdGl2ZXMgYXMgdGhlIGluLXRyZWUgZGV2aWNlIHRyZWVz
IHRvIGVhc2UKPj4gc2hhcmluZyB0aGUgZmlsZXMgYmV0d2VlbiB1LWJvb3QsIGxpbnV4IGFuZCBP
T1QgZXh0ZXJuYWwgdHJlZXMgWzNdLgo+Pgo+PiBbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1PY3RvYmVyLzc2NTQ2My5odG1sCj4+IFsyXSA4
ZmI1MjA5ODg1ICgiY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8qOiBidW1wIHRvIExpbnV4
IDYuNi4xMiIpCj4+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvRDZVRzVa
MUhVTjlOLkdXVkhCNEw4MjNaQ0BrZXJuZWwub3JnLwo+Pgo+PiBDYzogRWRnYXIgQm9uZXQgPGJv
bmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4+IEFja2VkLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jl
bm9ibGUuY25ycy5mcj4KPj4gVGVzdGVkLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUu
Y25ycy5mcj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+Cj4+IC0tLQo+PiBSdW50aW1lIHRlc3Rpbmc6Cj4+IHY0OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9idWlsZHJvb3QvZTY4ODE3ZjAtMzEyYy00OTgwLTgzN2MtNzI2NDY1NjQ1N2NhQGdy
ZW5vYmxlLmNucnMuZnIvCj4+IC0tLQo+PiAgLi4uL2FjcXVhLWE1L3sgPT4gZHRzL21pY3JvY2hp
cH0vYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyAgICAgfCAyICstCj4+ICBib2FyZC9hY21lc3lzdGVt
cy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICB8IDIgKy0KPj4gIGNv
bmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfMjU2bWJfZGVmY29uZmlnICAgICAgICAgICAgICAg
IHwgNiArKystLS0KPj4gIGNvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29u
ZmlnICAgICAgICAgICAgICAgIHwgNiArKystLS0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAgcmVuYW1lIGJvYXJkL2FjbWVzeXN0ZW1zL2Fj
cXVhLWE1L3sgPT4gZHRzL21pY3JvY2hpcH0vYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyAoOTklKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1hNWQz
X2FjcXVhLmR0cyBiL2JvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2R0cy9taWNyb2NoaXAvYXQ5
MS1zYW1hNWQzX2FjcXVhLmR0cwo+PiBzaW1pbGFyaXR5IGluZGV4IDk5JQo+PiByZW5hbWUgZnJv
bSBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNfYWNxdWEuZHRzCj4+IHJl
bmFtZSB0byBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWljcm9jaGlwL2F0OTEtc2Ft
YTVkM19hY3F1YS5kdHMKPj4gaW5kZXggNDExZDE5NDJmNS4uNjBiZThhNjdjZCAxMDA2NDQKPj4g
LS0tIGEvYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cwo+
PiArKysgYi9ib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWljcm9jaGlwL2F0OTEtc2Ft
YTVkM19hY3F1YS5kdHMKPj4gQEAgLTksNyArOSw3IEBACj4+ICAgKiBMaWNlbnNlZCB1bmRlciBH
UEx2MiBvciBsYXRlci4KPj4gICAqLwo+PiAgL2R0cy12MS87Cj4+IC0jaW5jbHVkZSAibWljcm9j
aGlwL3NhbWE1ZDMxLmR0c2kiCj4+ICsjaW5jbHVkZSAic2FtYTVkMzEuZHRzaSIKPj4gIAo+PiAg
LyB7Cj4+ICAJbW9kZWwgPSAiQWNtZSBTeXN0ZW1zIEFjcXVhIFNPTSI7Cj4+IGRpZmYgLS1naXQg
YS9ib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggYi9i
b2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPj4gaW5k
ZXggNGIyMGEwMDlhNy4uN2E0YzRlNTdjOSAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvYWNtZXN5c3Rl
bXMvYWNxdWEtYTUvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+ICsrKyBiL2JvYXJkL2FjbWVz
eXN0ZW1zL2FjcXVhLWE1L3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+PiBAQCAtMSwyICsxLDIg
QEAKPj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4+IC1zaGEyNTYgIGI2NmE1Yjg2M2IwZjg2Njk0
NDhiNzRjYTgzYmQ2NDFhODU2ZjE2NGIyOTk1NmU1MzliYmNiNWZkZWVhYjljYzYgIGxpbnV4LTYu
Ni4zMC50YXIueHoKPj4gK3NoYTI1NiAgODdiZTAzNjBkZjA5MzFiMzQwZDJiYWMzNTE2MWE1NDgw
NzBmYmMzYThjMzUyYzQ5ZTIxZTk2NjY2YzI2YWViNCAgbGludXgtNi4xMi45LnRhci54ego+PiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcg
Yi9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+PiBpbmRleCBi
MTAyZGRlMGJhLi5hNTBlMzA2YjFiIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL2FjbWVzeXN0ZW1z
X2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL2FjbWVzeXN0ZW1zX2Fj
cXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+PiBAQCAtMiw3ICsyLDcgQEAgQlIyX2FybT15Cj4+ICBC
UjJfY29ydGV4X2E1PXkKPj4gIEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4+ICBCUjJfQVJNX0lOU1RS
VUNUSU9OU19USFVNQjI9eQo+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV82XzY9eQo+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzEyPXkK
Pj4gIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9wYXRj
aGVzIgo+PiAgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15Cj4+ICBCUjJfU1lTVEVN
X0RIQ1A9ImV0aDAiCj4+IEBAIC0xMCwxMCArMTAsMTAgQEAgQlIyX1JPT1RGU19QT1NUX0lNQUdF
X1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+PiAgQlIyX1JPT1RGU19QT1NU
X1NDUklQVF9BUkdTPSItYyBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9nZW5pbWFnZS5jZmci
Cj4+ICBCUjJfTElOVVhfS0VSTkVMPXkKPj4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjMwIgo+
PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMi45Igo+PiAgQlIy
X0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InNhbWE1Igo+PiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNf
U1VQUE9SVD15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSD0iYm9hcmQvYWNt
ZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyIKPj4gK0JSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0RUU19ESVI9ImJvYXJkL2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2R0cyIKPj4g
IEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPj4gIEJSMl9UQVJHRVRfUk9P
VEZTX0VYVDI9eQo+PiAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnIGIvY29uZmlncy9h
Y21lc3lzdGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcKPj4gaW5kZXggZGE1NGVhZjYyMC4u
NmFlOGQwMzdlNyAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV81
MTJtYl9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV81MTJt
Yl9kZWZjb25maWcKPj4gQEAgLTIsNyArMiw3IEBAIEJSMl9hcm09eQo+PiAgQlIyX2NvcnRleF9h
NT15Cj4+ICBCUjJfQVJNX0VOQUJMRV9WRlA9eQo+PiAgQlIyX0FSTV9JTlNUUlVDVElPTlNfVEhV
TUIyPXkKPj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPj4g
K0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xMj15Cj4+ICBCUjJfR0xP
QkFMX1BBVENIX0RJUj0iYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvcGF0Y2hlcyIKPj4gIEJS
Ml9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+PiAgQlIyX1NZU1RFTV9ESENQPSJldGgw
Igo+PiBAQCAtMTAsMTAgKzEwLDEwIEBAIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1
cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJH
Uz0iLWMgYm9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvZ2VuaW1hZ2UuY2ZnIgo+PiAgQlIyX0xJ
TlVYX0tFUk5FTD15Cj4+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPj4gLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNi4zMCIKPj4gK0JSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTIuOSIKPj4gIEJSMl9MSU5VWF9LRVJO
RUxfREVGQ09ORklHPSJzYW1hNSIKPj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+
PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEg9ImJvYXJkL2FjbWVzeXN0ZW1zL2Fj
cXVhLWE1L2F0OTEtc2FtYTVkM19hY3F1YS5kdHMiCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9EVFNfRElSPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMiCj4+ICBCUjJfTElOVVhf
S0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4+ICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkK
Pj4gIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+IC0tIAo+IAo+IFBlcnNvbmFsbHkgSSB3
b3VsZCBzcGxpdCB0aGlzIGludG8gdHdvIHBhdGNocwo+IHBhdGNoIDEvMjogdGhhdCB1c2VzIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19ESVIgaW5zdGVhZCBvZgo+ICAgICAgICAgICAgQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggYW5kIHJlbW92ZXMgdGhlIHZlbmRvciBwcmVm
aXgKPiAJICAgZnJvbSB0aGUgLmR0cy4KPiBwYXRjaCAyLzI6IHRoYXQgYnVtcHMgdG8gbGludXgg
Ni4xMi54eC4KCkluZGVlZCwgaXQncyBwcm9iYWJseSBiZXR0ZXIuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4gCj4gUmVnYXJkbGVzcyBpZiBzcGxpdHRpbmcgdGhpcyBwYXRjaCBvciBub3Q6
Cj4gCj4gUmV2aWV3ZWQtYnk6IE5pa2xhcyBDYXNzZWwgPG5pa2xhcy5jYXNzZWxAd2RjLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
