Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C3CEFCE4D
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 22:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38652409CF;
	Wed,  4 Mar 2026 22:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQsoRXc16Jhn; Wed,  4 Mar 2026 22:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A2040998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772663373;
	bh=KLWZjGe/ZtOZgP8IlSckeVKvDDPFI4hVnukLPnYPDyo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AOwR8YMHyc7TCfOWXMmRxJ5pjSbx4/CWcbSDK0ClSvKVZ/hZuwT6hLZwUR3co/U4k
	 5ZcXSvjfdHYL0oGTHshs+tPtuNhhsr8GZz4Vd90nqVTSBeJis5yhAE66Y/MeJ8bTA9
	 Y7l2L3wCICfpDHd7DFwKv+vYiEJqs2taf+VrK5RE0dk4A++PdKBA+4AD7IrfW0NOjt
	 HauBGifvX27MapHCtcATl2mgUGHy2eIJd0mluvtJ0tf3LA+SmYMFeCV8izkeTL5Hn5
	 CxRf5kRmEK4ZEn8YAHx8NPyF6rbzN/fhEUWpdoHuJLUcdFGhphZ5sbzL6m190vJhCy
	 q97I7IJUcNuBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A2040998;
	Wed,  4 Mar 2026 22:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 604C8223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 22:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520054067C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 22:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66LWFWXHlefJ for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 22:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2997040618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2997040618
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2997040618
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 22:29:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so4357095f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 14:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772663368; x=1773268168;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LaielkxPwnPyYjpMgCP8xmQ7VTnooB0ShZB8bHdWrY=;
 b=K7p+2Nq3Qbr6U/1RjrSMiPa7aHUVAz10pBvCtGlGPlCrnYHBft58jb80sXQis19pzu
 Io5UpODTq77MPn2Vj1DKuCzxKCqblsyUYTJMYfONI/Vm3flGMGbhRtltP9J/uUMLeSy4
 3ztd3S5YNvLT+yfWyvCDmxRJyavIUGXLw1DRq3dO+yPwXWxnuUfX0hTmB2+9Kq1yjBc2
 Aw7oTzzIp4h/Aih2CMhJGU6TTcwclHoI13vm3gxmCN37QerD0i65AD6hvfnVLwVNDxoj
 Gd30PZowQ18bXIWzzoCZ9iEcmR8K+MQyGh1Sk3hVvL/ltk8vCDdvrtwHa/sr0lAGpxGU
 tWBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3zMusbwnP86hYypOAUGetYYyYLC3qd7yXP9idFQ8TzdLvfkd6uEKi6yLTwgBoRX+edvEueRBDfGA=@buildroot.org
X-Gm-Message-State: AOJu0Yyd0dWdCvNv3nk4chKcFQbo29vF0eEELEY4HU284BclYJQPMnnH
 ljJ9my4r22uom7pRLOfmzAoCw3RQIF7X+KAeZpKyXNsSOZbb+pYAY3yqbKwIVXJsBNE=
X-Gm-Gg: ATEYQzxXSPV7DEDaxIYieITE+iHjBoqOL9HnFDRirnvwz1NZqXNDZxhzLqU64cB1t9f
 xK+TMGID1xhpAXxSNYCXpg6E5jeLeG/a+Ecz606/SYXGM6PEnKkkSnZIEQiceBJ+fCqYNbmRtCQ
 TaGMV74AZAMsmPIepeNVr8UPfGhw6NmHieWaVLTUBcXZM9Fkdg2ducOKj7fRwJrzo3aAu39Qw3U
 hlI79CkmCEVJNkekDsohlWfOa+1LKpBp4Rc+yI1nls3q791ssC3x7vdEvAs921It+iezzHA3Sv/
 A2+eQ6qu9tnL9tDaMfXXy7EHdECOEak4BDOuYsTXITfTVpm0WxPCBoSE1D2zsaqr7xz0W08oE+N
 KNNd1b1zHwpakVZ3eOlF+ne1zTEa1bhzzugpJTXEAe3yzo2uWx8p6oWEhF7MXFrdnAYl1G5jBcm
 J4Z4zvmCYljbXS/68BHcVQnKmYr9LkKi5vP0Ae0Rs23xwrfQm1PS68NrWiEqh3OM7Wui+X56gxj
 nAtcUNucUc5AxNtCPeKDLJ9cDdW1MW6gNvBRSFedOTDLJDOyOisX1okHvyka7WnJg==
X-Received: by 2002:a05:600c:8b67:b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-4851989c82emr60851695e9.29.1772663367701; 
 Wed, 04 Mar 2026 14:29:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b03db76bsm30735250f8f.18.2026.03.04.14.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 14:29:27 -0800 (PST)
Message-ID: <d67eee31-3ab8-4b2a-9fa6-b0fd849614e2@smile.fr>
Date: Wed, 4 Mar 2026 23:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>
References: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
 <20260219-virglrenderer-v3-2-e2ff1a23be3f@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260219-virglrenderer-v3-2-e2ff1a23be3f@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772663368; x=1773268168; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5LaielkxPwnPyYjpMgCP8xmQ7VTnooB0ShZB8bHdWrY=;
 b=ANxwhJvtP/X3w985cFyryG70PK7ksypjkgeCyq6TczUL1nFmaJaTjpgYHLebCaORAu
 cESc7E+aV54/s/LWNSRM3drGet/e7M8KqCluZO3wta6A5k/GNqUa0A3gYwWheNK5uBXe
 E65IwySHDiigslc62n9lEfvDTjSQ63NiFHOOM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ANxwhJvt
Subject: Re: [Buildroot] [PATCH v3 2/2] package/qemu: add virglrenderer
 support
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

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAyMC8wMi8yMDI2IMOgIDAyOjIzLCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBBZGQgb3B0aW9uYWwgdmlyZ2xyZW5kZXJlciBzdXBwb3J0LCBhbG9uZyB3
aXRoIGVuYWJsaW5nIE9wZW5HTCB3aGVuCj4gbmVjZXNzYXJ5Lgo+IAo+IGh0dHBzOi8vcWVtdS5y
ZWFkdGhlZG9jcy5pby9lbi92MTAuMC4zL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1ncHUuaHRtbCN2
aXJ0aW8tZ3B1LXZpcmdscmVuZGVyZXIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQg
PGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcWVtdS9Db25maWcuaW4g
fCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvcWVtdS9xZW11Lm1r
ICAgfCAxNSArKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25maWcu
aW4gYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gaW5kZXggZTE2ZWFmZTQ0Ni4uMjU5MjEzNjhl
OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9x
ZW11L0NvbmZpZy5pbgo+IEBAIC0xMTYsNiArMTE2LDM0IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9R
RU1VX1NETAo+ICAJICBTYXkgJ3knIHRvIGVuYWJsZSB0aGUgU0RMIGZyb250ZW5kLCB0aGF0IGlz
LCBhIGdyYXBoaWNhbAo+ICAJICB3aW5kb3cgcHJlc2VudGluZyB0aGUgVk0ncyBkaXNwbGF5Lgo+
ICAKPiArY29tbWVudCAiT3BlbkdMIGFuZCB2aXJnbHJlbmRlcmVyIG5lZWQgYW4gT3BlbkdMIGFu
ZC9vciBPcGVuR0wgRUdMIGJhY2tlbmQiCj4gKwlkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfSEFT
X0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9IQVNfTElCR0wpCgpPbmUgY29tbWVudCBwZXIgb3B0aW9u
LCBlc3BlY2lhbGx5IHNpbmNlIEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIgYWN0dWFsbHkKZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCR0wgb25seSAoc2VlIGJlbGxvdykuCgo+ICsKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfT1BFTkdMCj4gKwlib29sICJFbmFibGUgT3BlbkdMIgo+
ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19M
SUJHTCAjIGxpYmVwb3h5Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRVBPWFkKPiArCWhlbHAK
PiArCSAgU2F5ICd5JyB0byBlbmFibGUgT3BlbkdMIGFjY2VsZXJhdGVkIGRpc3BsYXkgZnJvbnRl
bmQgc3VwcG9ydC4KPiArCSAgVGhpcyBpcyBuZWNlc3NhcnkgdG8gZWZmaWNpZW50bHkgZGlzcGxh
eSBmcmFtZXMgcmVuZGVyZWQgaW4gYQo+ICsJICBndWVzdCBvbiB0aGUgaG9zdC4KPiArCj4gKwkg
IFJ1biBxZW11IHdpdGggYC1kaXNwbGF5IHNkbCxnbD1vbmAKClRoZSB0d28gbmV3IG9wdGlvbiBz
aG91bGQgYmUgYWRkZWQgaW4gdHdvIHNlcGFyYXRlIGNvbW1pdC4KCj4gKwo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfUUVNVV9WSVJHTFJFTkRFUkVSCj4gKwlib29sICJFbmFibGUgdmlyZ2xyZW5kZXJl
ciIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9I
QVNfTElCR0wgIyB2aXJnbHJlbmRlcmVyPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX09QRU5H
TAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIKCklmIEJSMl9QQUNLQUdFX1FF
TVVfVklSR0xSRU5ERVJFUiBpcyBzZWxlY3RlZCB3aXRoIG9ubHkgQlIyX1BBQ0tBR0VfSEFTX0xJ
QkdMCmVuYWJsZWQsIHlvdSBjYW4ndCBzZWxlY3QgQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJFUiBo
ZXJlIHNpbmNlIGl0IGRlcGVuZHMgb24KbGliZWdsIG9ubHkuCgoibGliZWdsIGlzIGluIHRoZSBk
ZXBlbmRlbmN5IGNoYWluIG9mIHZpcmdscmVuZGVyZXIgdGhhdCBoYXMgYWRkZWQgaXQgdG8gaXRz
Cl9ERVBFTkRFTkNJRVMgdmFyaWFibGUgd2l0aG91dCBzZWxlY3RpbmcgaXQgb3IgZGVwZW5kaW5n
IG9uIGl0IGZyb20gQ29uZmlnLmluLiIKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArCWhlbHAK
PiArCSAgU2F5ICd5JyB0byBlbmFibGUgdmlyZ2xyZW5kZXJlciwgZW5hYmxpbmcgR0wgYW5kIFZ1
bGthbgo+ICsJICBwYXNzdGhyb3VnaCBmcm9tIHRoZSBob3N0IHRvIHRoZSBndWVzdCB0aHJvdWdo
IHZpcnRpby1ncHUuCj4gKwkgIFRoaXMgZW5hYmxlcyB0aGUgZ3Vlc3QgdG8gaGF2ZSBhY2NlbGVy
YXRlZCBHTCBhbmQvb3IgVnVsa2FuLgo+ICsKPiArCSAgUnVuIHFlbXUgd2l0aCBgLWRldmljZSB2
aXJ0aW8tZ3B1LWdsYAo+ICsKPiArCSAgaHR0cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL3Yx
MC4wLjMvc3lzdGVtL2RldmljZXMvdmlydGlvLWdwdS5odG1sI3ZpcnRpby1ncHUtdmlyZ2xyZW5k
ZXJlcgo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfRkRUCj4gIAlib29sICJFbmFibGUg
RkRUIgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0RUQwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Fl
bXUvcWVtdS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gaW5kZXggOTdmOGUyMjA5MS4uZTI1
MDEyOGRmYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2th
Z2UvcWVtdS9xZW11Lm1rCj4gQEAgLTI3NCw2ICsyNzQsMjAgQEAgZWxzZQo+ICBRRU1VX09QVFMg
Kz0gLS1kaXNhYmxlLXVzYi1yZWRpcgo+ICBlbmRpZgo+ICAKPiAraWZlcSAoJChCUjJfUEFDS0FH
RV9RRU1VX09QRU5HTCkseSkKPiArUUVNVV9PUFRTICs9IC0tZW5hYmxlLW9wZW5nbAo+ICtRRU1V
X0RFUEVOREVOQ0lFUyArPSBsaWJlcG94eQo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAtLWRpc2Fi
bGUtb3BlbmdsCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfVklSR0xS
RU5ERVJFUikseSkKPiArUUVNVV9PUFRTICs9IC0tZW5hYmxlLXZpcmdscmVuZGVyZXIKPiArUUVN
VV9ERVBFTkRFTkNJRVMgKz0gdmlyZ2xyZW5kZXJlcgo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAt
LWRpc2FibGUtdmlyZ2xyZW5kZXJlcgo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfU1RBVElD
X0xJQlMpLHkpCj4gIFFFTVVfT1BUUyArPSAtLXN0YXRpYwo+ICBlbmRpZgo+IEBAIC0zMzAsNyAr
MzQ0LDYgQEAgZGVmaW5lIFFFTVVfQ09ORklHVVJFX0NNRFMKPiAgCQkJLS1kaXNhYmxlLW1lbWJh
cnJpZXIgXAo+ICAJCQktLWRpc2FibGUtbXBhdGggXAo+ICAJCQktLWRpc2FibGUtbmV0bWFwIFwK
PiAtCQkJLS1kaXNhYmxlLW9wZW5nbCBcCj4gIAkJCS0tZGlzYWJsZS1vc3MgXAo+ICAJCQktLWRp
c2FibGUtcGEgXAo+ICAJCQktLWRpc2FibGUtcGx1Z2lucyBcCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
