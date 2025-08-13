Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6965CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 22:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A8B8143E;
	Wed, 13 Aug 2025 22:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeAXdEOS-LPf; Wed, 13 Aug 2025 22:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345C9819F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 345C9819F6;
	Wed, 13 Aug 2025 22:10:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 048671BA
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6A2742B14
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBDDvUZHj7Bg for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 22:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B67D142B23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67D142B23
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B67D142B23
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 22:09:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so1894815e9.3
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755122997; x=1755727797;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kReBnpnA4AmMlCV92DVsk34StP6OHCc+oKDPIL3rCOg=;
 b=f8K/WvNvkSRHltfm7x/Hn4k7oR/344tidHhF5NP06pF4AawBGD9Mg9GOYM6lNLSvvh
 uDmH9fv74MSiHubtRFac37levDNWO5XTcSxitopmCbNiYaM9deXLicM5Seyxz5DYwTV7
 v4KF4XF1wJwpHbIUMhVwR5v9tybkekJ6jW/QrF0ETDOGFfaQrs6qvYRq8hNaz26Pb9H6
 s5rKt2CxWtpCp/fHGSidWc8zcEGDKEB8H9GbzLgLOTM9O8RmhxfDJeK4TgG9DkXnwfi6
 QE6EPWrFyyHU99aDCR5jsT/j2y25SP0WNZVTJpmRVH6fiFsjVdyRFyCR/HyfnLj0kcOJ
 8xnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwp3KK6LUivISd8vsQ2V/iIVmcj2ELTok5CAcluoWeoNoqQdk35DWR5OWs13k7do5L9pxtWRTp8d0=@buildroot.org
X-Gm-Message-State: AOJu0YzsugJcSiaG7DI7kp/w3SquUEuZUp/WkY7ltWhxTa9lrMw3bGho
 JXuAIuaeMsnTAST+pCebOKJ0m695Z2DHj4lVomoQd1d3AwM1Ck1E3bs2KdJlC2TGx4M=
X-Gm-Gg: ASbGncsehLHmBQa8I1Sr5HIubofksXfdBvtTM5BvY/cOOlbUSrWInd2VVXVPCARBFuS
 gZJHSK58HmSdQLZPG1M+ut1JUrIalzLDDZeY3b2hNoiuWhywy4XRH8rMC8fnZMeHQGdiSMZ5a9v
 KvVS1I6VaMDMUBbFmRGv6f7/mwvgV0PLE18MWJ+ydxhOPvQUEDb8vczoQXmhIapkw4a4HvorB+i
 MasgDeqxUbWbluXqXJUO3yBTGAwI3Wp+ZRhFeykoxyd3dYiTxrg5h2YIPmj3OKKd/3OLAP4QQ5f
 DkYQ6aMCkt+mfkHgrCx4jstymluKADxYkLcqeav6RTdaYrJ9sE5RSfbFzfTCvbE+eMtG5sE60D/
 5/01jM6c6IB7EAtOpWQEWQ9pam0jaoUEjN4AKP2OXRRBaPggaWPGK3p9EXJUO+E/LZnLOM3MG/R
 Cjp6s0kn7xfuwvhLj1+IMwa5+eBzO0kO5L12ZjV2E05bxkDrVMLexwLPgGTNZHT9dMx4OpCzo=
X-Google-Smtp-Source: AGHT+IGb1XaS0HnYxQfxtKex8K0yMGj9jL+1F8xHL11bGKTi5ldY3hOA0nuJunywCJSY4NXX2vWdjw==
X-Received: by 2002:a05:600c:3596:b0:456:1d4e:c127 with SMTP id
 5b1f17b1804b1-45a1b60ebd4mr2985825e9.8.1755122997521; 
 Wed, 13 Aug 2025 15:09:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b1db885sm3661965e9.0.2025.08.13.15.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:09:57 -0700 (PDT)
Message-ID: <738bd24e-c9a3-4241-9d78-3c07a930d3c3@smile.fr>
Date: Thu, 14 Aug 2025 00:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20250811203206.1506378-1-romain.naour@smile.fr>
 <c6fab884-3590-411b-8f3a-257ba882ee15@smile.fr>
 <b66f2693c33bfae0e80e950063a3122616429ae4.camel@gmail.com>
Content-Language: en-US
In-Reply-To: <b66f2693c33bfae0e80e950063a3122616429ae4.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755122997; x=1755727797; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kReBnpnA4AmMlCV92DVsk34StP6OHCc+oKDPIL3rCOg=;
 b=FbO20BiWTCT4QA4JtkKMHiO+kDb4nxEJRteL0DJUFs+Cd9PV18E/DUSnF4XJTi+e3P
 vaNlTf4wplrmypZYcOtUyAGPVCgM5XPAlkZeCU/V9swhdUS/BDy9+pRz6W6QwZ2ic93G
 ElwsdkMXn49DCb9JT5XvYZfQXQG/LJZslTvgI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=FbO20BiW
Subject: Re: [Buildroot] [PATCH 1/2] package/thttpd: port to C99
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

SGVsbG8gSm9hY2hpbSwgQWxsLAoKTGUgMTIvMDgvMjAyNSDDoCAwOTozMiwgSm9hY2hpbSBXaWJl
cmcgYSDDqWNyaXTCoDoKPiBIaSBSb21haW4hCj4gCj4gT24gTW9uLCAyMDI1LTA4LTExIGF0IDIy
OjQ3ICswMjAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IExlIDExLzA4LzIwMjUgw6AgMjI6MzIs
IFJvbWFpbiBOYW91ciBhIMOpY3JpdMKgOgo+Pj4gQXBwbHkgY2hhbmdlcyBmcm9tIEZlZG9yYSB0
byBmaXggZ2NjLTE1IGlzc3Vlcy4KPj4+IC0tLQo+Pj4gdGh0dHBkIHBhY2thZ2UgaXMgdXNlZCBi
eSBUZXN0V2dldCBhbmQgVGVzdExpYkN1cmwsIHNvIHdlIGNhbid0Cj4+PiByZW1vdmUgaXQgcmln
aHQgbm93Lgo+PiBKb2FjaGltLCBkbyB5b3Uga25vdyBpZiB5b3VyIGltcGxlbWVudGF0aW9uICJt
ZXJlY2F0IiBbMV0gY2FuIHJlcGxhY2UKPj4gdGh0dHBkPyAgSW5kZWVkLCB0aGUgd2lraXBlZGlh
IFsyXSByZXBvcnQgIm1lcmVjYXQiIGFzIGEgZm9yayBvZgo+PiB0aHR0cGQuCj4gCj4gSGVoLCBm
dW5ueSB3aXRoIG9wZW4gc291cmNlIHByb2plY3RzLCBzdWRkZW4gYnVyc3RzIG9mIGludGVyZXN0
IGluIHRoaXMKPiBvbGQgcHJvamVjdCBvZiBtaW5lIGZyb20gbWFueSBkaWZmZXJlbnQgcGVvcGxl
IGF0IGFyb3VuZCB0aGUgc2FtZSB0aW1lLgo+IPCfmYIKCk1lcmVjYXQgaXMgbm90IHRoYXQgb2xk
IGNvbXBhcmVkIHRvIHRodHRwZC4uLiBpdHMgY29uZmlndXJlLmluIG5lZWRzIGEgcHJlLTIwMDAK
QXV0b2NvbmYgKDIuMTMpIGFuZCBzb21lIGNvbW1lbnRzIGFyZSBhYm91dCBnY2MtMiAhCgpJJ20g
Z2V0dGluZyBvbGQuLi4gYmVjYXVzZSBJIHdhcyBib3JuIHdoZW4gdGhlIGxhc3QgdGh0dHBkIHJl
bGVhc2Ugd2FzCnB1Ymxpc2hlZC4gQnV0IHNvbWUgbmV3IEJ1aWxkcm9vdCBjb250cmlidXRvciB3
YXMgbm90IQoKOikKCj4gCj4gSW4gdGhlb3J5IEkgZ3Vlc3MgaXQgd291bGQgYmUgcG9zc2libGUs
IGEgbG90IG9mIHBhdGNoZXMgd2VyZSBtZXJnZWQgaW4KPiB0aGUgYmVnaW5uaW5nLCBhbmQgSSBk
aWQgYSB2Mi4zMCByZWxlYXNlIGVhcmx5IG9uIHRoYXQgY291bGQgd29yay4gIEJ1dAo+IEkgZG9u
J3QgcmVtZW1iZXIgaWYgdGhhdCBhbHNvIGhhZCBjb21tYW5kIGxpbmUgb3B0aW9ucyBjaGFuZ2Vk
IC4uLiBhIGxvdAo+IG9mIHRoZSB3b3JrIGFmdGVyIHRoYXQgcG9pbnQgKHNvbWV3aGVyZSkgaW4g
dGltZSB3ZW50IGludG8gYWRkaW5nIGNvbmZpZwo+IGZpbGUgYW5kIG5hdGl2ZSBodHRwcyBzdXBw
b3J0LCB3aGljaCB3b3VsZCBjaGFuZ2UgYSBsb3QgbW9yZS4KPiAKPiBUaGUgcHJvamVjdCBoYXMg
YWxzbyBiZWVuIGRvcm1hbnQgZm9yIGEgZmV3IHllYXJzIG5vdyB3aXRoIGEgImxhc3Qgc2V0Igo+
IG9mIGZlYXR1cmVzIGJsb2NraW5nIGEgbmV3IHJlbGVhc2UuICBCdXQgaXQncyBhIGNvb2wgbGl0
dGxlIHByb2plY3QsIHNvCj4gbWF5YmUgSSBzaG91bGQgcGljayBpdCB1cCBhZ2Fpbj8KCkl0J3Mg
dXAgdG8geW91LCBidXQgTWVyZWNhdCB3aWxsIHJlcXVpcmVzIHNvbWUgbWFpbnRlbmFuY2Ugb3Zl
ciB0aGUgdGltZSBkdWUgdG8KbmV3IHRvb2xjaGFpbiB2ZXJzaW9uLiBJZiBpdCBwYWNrYWdlZCBp
biBCdWlsZHJvb3QsIHlvdSBtYXkgcmVjZWl2ZSBzb21lIG5ldwpjb250cmlidXRpb24gZnJvbSB1
cy4KID4gRHVubm8gaWYgdGhpcyBhbnN3ZXJzIHlvdXIgcXVlc3Rpb24sIGJ1dCBpbW8gbWF5YmUg
aXQgd291bGQgYmUgYmV0dGVyIHRvCj4gc3dpdGNoIHRvIG1pbmlfaHR0cGQgKGFsc28gYnkgSmVm
KSBvciBCdXN5Qm94IGh0dHBkIGZvciB0aGUgYWJvdmUgdGVzdHM/CgpUaGUgc2Vjb25kIHByb2pl
Y3Qgc3VnZ2VzdGVkIGJ5IHdpa2lwZWRpYSBbMV0gaXMgc3RodHRwZCBbMl0gdGhhdCBzZWVtcyBh
bHNvCmRlYWQgKHRoZSBsYXN0IGNvbW1pdCBpcyA4IHllYXJzIG9sZCkuCgpCdXN5Qm94IGh0dHBk
ICh0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uKSBzZWVtcyB0aGUgYmV0dGVyIGxvbmcgdGVybSBz
b2x1dGlvbgphbmQgYmVjYXVzZSBpdCBkb2Vzbid0IHJlcXVpcmUgYW55IG5ldyBwYWNrYWdlLgoK
TGV0cyB0cnkgdXNpbmcgQnVzeUJveCBodHRwZCBpbiBUZXN0V2dldCBhbmQgVGVzdExpYkN1cmwu
CgpbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvVGh0dHBkClsyXSBodHRwczovL2dp
dGh1Yi5jb20vYmx1ZW5lc3Mvc3RodHRwZAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJl
c3QgcmVnYXJkcwo+ICAvSm9hY2hpbQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
