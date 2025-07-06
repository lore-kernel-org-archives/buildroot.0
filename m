Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD2C83F09
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 20:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B269682217;
	Sun,  6 Jul 2025 20:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwR-iIcfIC_q; Sun,  6 Jul 2025 19:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA302822DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA302822DF;
	Sun,  6 Jul 2025 19:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FC7F19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91B504027C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 19:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkR0TZ-VNUP0 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 19:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C30F440261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30F440261
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C30F440261
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 19:59:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso15981355e9.1
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 12:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751831995; x=1752436795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NEfYE194q+cD4gJbTsX+uCXzMXCnKZw+j/Q3W/DwCY=;
 b=OVoqEThklS+be5B816iV+ysdbdzzAWQUgHG2UEf9+JCc3svVml+rcaX4jsaWQ9KPv8
 ZP5R16MV1KZyB3YYAi8k3y4YD0z0fxusSvwnZJKkb3w45EPnN1r6schmIqi4v7OLKh4w
 It0M7f3GytnZllIwX5apEoJkXfvO9FP+Y5f9zRrVHRa7c8tD9cjBdwDMfxrQmeFH/JD/
 4CGAsrM7SZ9kMsnFOWFTV9piUsjdCRJmAUWNgpMwb7WlcI+gJKAHe90x1pvg+0sIxbMt
 uB/0NDYSCwvcg7nwJi6c2GamOvgt0fBV8joYpEFWCMDlwxqSV+DDzcCa+NXIZVi7vqyr
 zZ9Q==
X-Gm-Message-State: AOJu0Yz/Frrwx5WuLLA+VDSnbHTdB/UlaAG1I+IjU2e8XGsRHoGax6le
 7YEKKNA3YlF/rAlT0TWkmQIDHbd3o1y9M2kSH6u7u2v2TKQ+QtMWZOujSFaFMO/675I=
X-Gm-Gg: ASbGncuMBIqDYapF3UcrFOMGgKNER5hUcLFk8GlAcNruy3XRSCg0M4fIEOATDGFYaLo
 HfCI04eDQVmkUSM4FNTbx+WwSIS2mXzAGWYnaOVXhdUiSf66At2/0j1RFpSrz27rpo8Nfl7/esO
 UGSkRqrouRTPB3Cc3pSDZ0bfNMowBEPWSdIWEn9CnYlmP2uSQb6yGDUizF+TiGelQpwOMmyYoYW
 y7CP8OMzmCup4xjMl5OHTr4RuJn/SzcZeVES+6WYjyjMxKRl/4z7zr9pilYRjs1C2g/hnd09+r2
 0gSbsK3pUK63gDxi4fMNtLDlZlT9gXDfzHR5WYIkXuR3nt0Uo+zX7nEazdG4eVriWNfKPrpQHMQ
 WpwCLGg8D/WrXe03keFlgMGjWexK5nUrhE473Q9xbP6IjcC7yfkPH9kfO67EzIYIaVBU3N4bgq7
 98QrFgrB5dHqzdB/pbpIzoIeaS
X-Google-Smtp-Source: AGHT+IFpHZSOmy0iBqH2glVNh4uA5nhTQmt2JsHOx3A/dqooWxXCWimQFhoSNkMzuB3aftTElmAP8A==
X-Received: by 2002:a05:6000:4282:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3b49a9ff531mr5548991f8f.12.1751831994543; 
 Sun, 06 Jul 2025 12:59:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b96731sm8343099f8f.55.2025.07.06.12.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 12:59:54 -0700 (PDT)
Message-ID: <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
Date: Sun, 6 Jul 2025 21:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, yann.morin@orange.com
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
 <20250706171341.azx6v4b6k524gmsw@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250706171341.azx6v4b6k524gmsw@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751831995; x=1752436795; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5NEfYE194q+cD4gJbTsX+uCXzMXCnKZw+j/Q3W/DwCY=;
 b=s3NXkOmG1ZaOAOupdZ2ojhRK5fTFGngJRoAPAYc+dVKXwViQEwPb/gMW4diP2J5VHN
 bQ/13Gi518BUbyrpMQnp5yWRwKnMelRVEPyWktwC54MlWS9OW4U0QMtafNR5T0Uq4xzW
 9bdplvc10lOzoY3na4wf3sYx/LymQL4frPWJU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=s3NXkOmG
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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

SGVsbG8gRmxvcmlhbiwKCkxlIDA2LzA3LzIwMjUgw6AgMTk6MTMsIEZsb3JpYW4gTGFyeXNjaCBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiB0aGFua3MgZm9yIHRha2luZyBhIGxvb2sh
Cj4gCj4gT24gU3VuLCBKdWwgMDYsIDIwMjUgYXQgMDY6NDA6MTBQTSArMDIwMCwgUm9tYWluIE5h
b3VyIHdyb3RlOgo+Pj4gV2hlbiBidWlsZGluZyBvbiBhIGhvc3Qgc3lzdGVtIHdoaWNoIGRvZXNu
J3Qgc3VwcG9ydCBhIGZ1bGwgYm9vdHN0cmFwCj4+PiAobGlrZSBhYXJjaDY0KSwgd2UgY2FuIGZh
bGwgYmFjayBvbiB0aGUgcHJlLWJ1aWx0IHRvb2xjaGFpbi4gSG93ZXZlciwgaW4KPj4+IHRoYXQg
Y2FzZSwgdGhvc2Ugc3ltYm9scyBhcmUgYWxsIGZhbHNlLCBtYWtpbmcgdGhlIGludGVybmFsIHN0
YXRlIG9mIHRoZQo+Pj4gYnVpbGQgc3lzdGVtIGluY29uc2lzdGVudC4gSW4gcGFydGljdWxhciwg
dGhpcyBjYXVzZXMgbm9uZSBvZiB0aGUKPj4+IGVudmlyb25tZW50IHZhcmlhYmxlcyBsaWtlIEdP
QVJDSCB0byBiZSBzZXQgYW5kIHRodXMgdGhlIEdvIGNvbXBpbGVyCj4+PiB3aWxsIHBlcmZvcm0g
YSBuYXRpdmUgYnVpbGQgaW5zdGVhZCBvZiBhIGNyb3NzIGJ1aWxkLgo+Pgo+PiBJIGRvbid0IHVu
ZGVyc3RhbmQgdGhpcyBwYXJ0LiBTaW5jZSBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNI
X1NVUFBPUlRTIGlzCj4+IG5vdCBzZXQgb24gYWFyY2g2NCBidWlsZCBtYWNoaW5lLCB3ZSBjYW4n
dCBlbmFibGUgYW55IGdvIHBhY2thZ2VzIGZvciB0aGUKPj4gdGFyZ2V0LiAKPiAKPiBFeGFjdGx5
LCB0aGF0J3MgdGhlIHByb2JsZW0gSSdtIHRyeWluZyB0byBzb2x2ZSBoZXJlLgo+IAo+PiBXZSBj
YW4gb25seSBpbnN0YWxsIGhvc3QtZ28tYmluICh3aGljaCBpcyB1c2VsZXNzIGluIHRoaXMgY2Fz
ZSkuCj4gCj4gSXQgaXNuJ3QgdXNlbGVzcyBiZWNhdXNlIHRoaXMgaXMgdGhlIGNyb3NzLWNvbXBp
bGVyIHRoYXQgZW5hYmxlcyB1cyB0bwo+IGJ1aWxkIHBhY2thZ2VzIGZvciB0aGUgdGFyZ2V0LiBX
aGV0aGVyIHdlIGRvIGEgZnVsbCBib290c3RyYXAgdmlhCj4gQlIyX1BBQ0tBR0VfSE9TVF9HT19T
UkMgb3IgZ2V0IHRoZSBwcmUtYnVpbHQgYmluYXJ5IHZpYQo+IEJSMl9QQUNLQUdFX0hPU1RfR09f
QklOLCB0aGUgcmVzdWx0IGlzIHRoZSBzYW1lIGtpbmQgb2YgaG9zdC1nby4KCkkgYmVsaWV2ZSB0
aGVyZSBpcyBhbiBtaXN1bmRlcnN0YW5kaW5nIGhlcmUuCgpXaGVuIHlvdSBzYXkgIndlIGNhbiBm
YWxsIGJhY2sgb24gdGhlIHByZS1idWlsdCB0b29sY2hhaW4iLCB3ZSBpbmRlZWQgZmFsbCBiYWNr
Cm9uIHRoZSBwcmUtYnVpbHQgZ28gY3Jvc3MtdG9vbGNoYWluIChob3N0LWdvKSBidXQgc2luY2UK
QlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUyBpcyBtaXNzaW5nLCBob3N0
LWdvIGNhbid0IGJlIHVzZWQgdG8KYnVpbGQgZ28gdGFyZ2V0IHBhY2thZ2VzIChldmVuIGlmIGl0
J3MgaW5zdGFsbGVkIGluIEhPU1RfRElSKS4KClNpbmNlIGl0J3MgYSBwcmUtYnVpbHQgdG9vbGNo
YWluIHRoZXJlIGlzIG5vIG5hdGl2ZSBidWlsZCBpbnZvbHZlZC4KQXMgeW91IGV4cGxhaW5lZCwg
dGhlIGZ1bGwgYm9vdHN0cmFwIHZpYSBCUjJfUEFDS0FHRV9IT1NUX0dPX1NSQyBpcyBub3QKc3Vw
cG9ydGVkIG9uIGFhcmNoNjQgaG9zdHMuCgpXaXRoIHlvdXIgcGF0Y2ggYXBwbGllZCwgd2UgY2Fu
IG5vdyB1c2UgaG9zdC1nbyAocHJvdmlkZWQgYnkgaG9zdC1nby1iaW4pIG9uCmFhYXJjaDY0IGhv
c3RzIHRvIGJ1aWxkIGdvIHRhcmdldCBwYWNrYWdlcy4gSSdtIGFncmVlIHdpdGggeW91ciBjaGFu
Z2VzLCBpdCdzCmp1c3QgdGhlIGNvbW1pdCBsb2cgdGhhdCBuZWVkcyB0byBiZSByZXdvcmRlZCAo
d2l0aCB0aGUgbGluayB0byB0aGUgY29tbWl0CmFkZGluZyBob3N0LWdvLWJpbiBwYWNrYWdlKS4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBGbG9yaWFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
