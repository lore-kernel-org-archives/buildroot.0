Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E074C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 09:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2EA41506;
	Wed,  6 Aug 2025 09:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vrcq00qZm2VR; Wed,  6 Aug 2025 09:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F0434122C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F0434122C;
	Wed,  6 Aug 2025 09:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25B0BD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 104054122C
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiehEXcOu6ZU for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 09:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA83F40FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA83F40FB4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA83F40FB4
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so3575468f8f.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 02:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754471308; x=1755076108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BmbKA6IWHSxR1gK4wOpvEmkqL1hKTfRAbgPhHrgzDDA=;
 b=OQBQa/29vGUORV7/uQxiIIWHpnNsD/c0xI/K+uWKCltnXDQdY5rDxQn2P0W6hkMNoJ
 a0S0c1/VT5DQwaCHwGLOX/Iaq2zLTT5N5bAfY536GDbotzwAb3oTdrqeohf1uYJ5s0Bm
 Y5LlEyaAaJLblF2pOWI/jE8/3YbsJanHU8YwrbsGUrxWbDiGcbI5iG6rX1nBI11/64ev
 CMV+v/lO+pdhIm62luWd1vx5tHGyitwLD0RuNE2ah59PEHLRm47oYRLEXGv+iTmbYIU/
 QzdPFMxgEhPxcpwgnwE08Z76/cxscnPsXiigvCq3P78JEgPlc6QJG0cutfJ7153aR+yT
 u+NQ==
X-Gm-Message-State: AOJu0YzYJp3NaKLBGdxI82Pzi1vatahwR5n2bPT9L41WgBO1YRJIsQSF
 Y239/TYNXNEXbv7y5sSgLq1YYcdHSnMoHvlHUcrIJLIfEKvwwl4fQl9fBcZkDakC8GHuYCCmSO3
 hwqhf
X-Gm-Gg: ASbGncvnEYepnzqfwiBMNdRdVzKWA6YASWv4VwQZbK68qBgFUZNJrC6uc0BZyaThcxx
 OPagDxLrja66QnWJ65fDHkB/ALkZ8G+GQiDnYIN9DwIJJEVed7dA50Fyyimaiqt25z464Q5X/G+
 k1J4OSCYbw1ktmMPFJ+9WqPFeIvnK5Cvx/fIj6vOpZtftwLW7stWi72yiYlx0+5Cue0edGoIseg
 bx8E/tFbZd7c7ChCENoOZ9BuYlDX5e/EkrQPMccCTGfhVT0T4fXapgsdWJWJdn1vR/ckw7E1Sot
 Xyv74bEhOfywNm7FlmI/GY39RF0l8h6c/Tx4iT52zVE9RnEbwH8H7zDukGAWtPBbTqm+YYMGt6U
 JvypvlmyIUTKj7ezAzted6oygN6y+ML9/yliCp546hnXLeT4rrpjwJBjsf6h4XtGkX9whHHnIyu
 x2iKawf0LjKuzR
X-Google-Smtp-Source: AGHT+IHetE9UX4zhIhzBoVHpmCTyOR0LLmoNWAWAP7pSCwBa4dooa+1u/QH8RQtmjPDxYEMFUQGv3A==
X-Received: by 2002:a05:6000:2004:b0:3b5:dc07:50a4 with SMTP id
 ffacd0b85a97d-3b8f418b286mr1658494f8f.2.1754471308284; 
 Wed, 06 Aug 2025 02:08:28 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0683045sm12713859f8f.41.2025.08.06.02.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 02:08:27 -0700 (PDT)
Message-ID: <307172a9-3165-4233-8d16-7d65186a751a@smile.fr>
Date: Wed, 6 Aug 2025 11:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
Content-Language: en-US
In-Reply-To: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754471308; x=1755076108; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BmbKA6IWHSxR1gK4wOpvEmkqL1hKTfRAbgPhHrgzDDA=;
 b=ZemPu8TZeP6PoXIzVMnz2lS11lUXUs1E4GuBamcu4LLZRKHiWASNMNT73XnLjngQYD
 +UKMwfCei6P6tZd/VkLcqXbprRFE2A3d47py2NwXXE5wRQvRMYqsfHjKS04MxwX5uLd0
 S39OgtLmSnfhDrmF6/pPgd3N94G7Fj1ZApyqE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZemPu8TZ
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsLAoKTGUgMDMvMDcvMjAyNSDDoCAxNjo1OSwgRWwgTWVoZGkgWU9VTkVTIGEgw6lj
cml0wqA6Cj4gVGhlIHByZXZpb3VzIG1ldGhvZCB1c2VkIHRvIGRldGVybWluZSB0aGUgLS1nY2Mt
aW5zdGFsbC1kaXIgcmVsaWVkIG9uCj4gJ2xzJyBvdmVyIHRoZSBnY2MgaW5zdGFsbGF0aW9uIHBh
dGgsIHdoaWNoIHdhcyBmcmFnaWxlIGFuZCBmYWlsZWQgaW4KPiBjYXNlcyB3aGVyZSB0aGUgZXh0
ZXJuYWwgdG9vbGNoYWluIGNvbnRhaW5lZCBtdWx0aXBsZSBnY2MgdmVyc2lvbnMgb3IKPiBwYXRo
cyBbMV0uCj4KPiBXZSByZXBsYWNlIGl0IGEgbW9yZSByZWxpYWJsZSBhcHByb2FjaCB1c2luZzoK
PiAkKFRBUkdFVF9DQykgLXByaW50LXNlYXJjaC1kaXJzCj4KPiBUaGlzIGhlbHBzIHNldHVwIHRv
IHJlZ2lzdGVyIHRoZSBkZXNpcmVkIEdDQyBhcmNoaXRlY3R1cmUgaWYgYQo+IGdpdmVuIHRvb2xj
aGFpbiBwYWNrYWdlcyBpbmNsdWRlcyBtdWx0aXBsZSBHQ0MgYXJjaGl0ZWN0dXJlCj4gaW5zdGFs
bGF0aW9ucy4gV2hpY2ggaXNuJ3QgcG9zc2libGUgdXNpbmcgdGhlIGFjdHVhbCBtZXRob2QgdXNp
bmcgJ2xzJy4KPgo+IEZvciBleGFtcGxlIGZyb20gSmFtZXMncyByZXBvcnQ6Cj4KPiAgICAgIOKU
lOKUgOKUgCAvb3B0L2NvbnRhaW5lci9teS10b29sY2hhaW4tMjAyNS4wMS4wMS4xMjM0NS9saWIv
Z2NjLwo+ICAgICAgICAgIOKUnOKUgOKUgCBhYXJjaDY0LWV4YW1wbGUtbGludXgtZ251Lwo+ICAg
ICAgICAgIOKUgiAgIOKUlOKUgOKUgCAuLi4KPiAgICAgICAgICDilJzilIDilIAgaTY4Ni1leGFt
cGxlLWxpbnV4LWdudS8KPiAgICAgICAgICDilIIgICDilJTilIDilIAgLi4uCj4gICAgICAgICAg
4pSU4pSA4pSAIHg4Nl82NC1leGFtcGxlLWxpbnV4LWdudS8KPiAgICAgICAgICAgICAg4pSU4pSA
4pSAIC4uLgo+Cj4gVGhhbmtzIHRvIFJvbWFpbiBOYW91ciBmb3Igc3VnZ2VzdGluZyB0aGlzIGlt
cHJvdmVkIG1ldGhvZC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
ZDFjNzczZGMtODM0Ni00MDc3LTk0NmEtMGQzYjRlMzBhNmM4QHNtaWxlLmZyL1QvI3QKPgo+IFJl
cG9ydGVkIGJ5OiBKYW1lcyBLbmlnaHQgPGdpdEBqZGtuaWdodC5tZT4KPiBTaWduZWQtb2ZmLWJ5
OiBFbCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgo+IC0tLQo+IFJvbWFp
biBzdWdnZXN0ZWQgdXNpbmcgc2VkLCBidXQgd2UgY2hhbmdlZCBpdCB0byBhd2sgZm9yIGJldHRl
ciBjbGFyaXR5Lgo+IC0tLQo+ICAgcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsg
fCAzICstLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rIGIv
cGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKPiBpbmRleCBhNWM4Yjk5MGFhLi4y
ZjE3YTA0ZWZjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5n
Lm1rCj4gKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKPiBAQCAtMTE1
LDggKzExNSw3IEBAIENMQU5HX0NPTkZfT1BUUyArPSAtRExMVk1fRFlMSUJfQ09NUE9ORU5UUz1h
bGwKPiAgIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9FWFRFUk5BTCkseSkKPiAgIGRlZmluZSBIT1NU
X0NMQU5HX0lOU1RBTExfQ09ORklHX0ZJTEUKPiAgIAlta2RpciAtcCAkKEhPU1RfRElSKS9saWIv
Y2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKQo+IC0JdG91Y2ggJChIT1NUX0RJUikvbGliL2Ns
YW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikvJChHTlVfVEFSR0VUX05BTUUpLmNmZwo+IC0JZWNo
byAiLS1nY2MtaW5zdGFsbC1kaXI9JChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xp
Yi9nY2MvJCQobHMgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xpYi9nY2MvKS8k
JChscyAkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8kJChscyAkKFRP
T0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8pLykiID4gJChIT1NUX0RJUikv
bGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikvJChHTlVfVEFSR0VUX05BTUUpLmNmZwo+
ICsJZWNobyAiLS1nY2MtaW5zdGFsbC1kaXI9JCQoJChUQVJHRVRfQ0MpIC1wcmludC1zZWFyY2gt
ZGlycyB8IGF3ayAtRiAnOiAnICckJDE9PSJpbnN0YWxsIiB7cHJpbnQgJCQyfScpIiA+ICQoSE9T
VF9ESVIpL2xpYi9jbGFuZy8kKENMQU5HX1ZFUlNJT05fTUFKT1IpLyQoR05VX1RBUkdFVF9OQU1F
KS5jZmcKPiAgIAllY2hvICItLXRhcmdldD0kKEdOVV9UQVJHRVRfTkFNRSkiID4+ICQoSE9TVF9E
SVIpL2xpYi9jbGFuZy8kKENMQU5HX1ZFUlNJT05fTUFKT1IpLyQoR05VX1RBUkdFVF9OQU1FKS5j
ZmcKPiAgIGVuZGVmCj4gICAKCk1heWJlIHRoaXMgY2xhbmcgZml4IG5lZWRzIHRvIGJlIHJldmll
d2VkIGFuZCBtZXJnZWQgYmVmb3JlCgp0aGUgMDguMjAyNSByZWxlYXNlLgoKQmVzdCByZWdhcmRz
LApFbCBNZWhkaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
