Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00EC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B6281441;
	Sun,  6 Jul 2025 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7jGEjM3ijvg; Sun,  6 Jul 2025 16:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4210818CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F4210818CA;
	Sun,  6 Jul 2025 16:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C65D12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3549605CF
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogmTQnkUWygG for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFD506089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD506089A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFD506089A
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:57:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso15366875e9.1
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 09:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751821036; x=1752425836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifuVIP2k4MAyoElnkxdMwN8ZnxdkKmk85f3Tx6j4lzQ=;
 b=m2myv+7gSLM6F28enDaLv29Cvx6do4hXME+cFhGPto4Qv0gJKbmmQO5hGhIRiyHijF
 SNi0o5WV00cokfCm2EKsTmgYG/QVehhFknUyj6IwQ3KQg7qqB/vGPlpMEURgxsAnxu6E
 WVG8DWyLXpdpT+88VdKcI5hFqntCBiCiHhmdnCua0MWrUNbdgx5LpoGucIdP6cFbK7Fs
 PCyDqY9yL6AJruPmE66adUU8YR79HJLGCBjwUSMhnRIACHE8jefi7C974TTwYgGY1qtB
 QqxOMSmnrL6TbeawrPwS8xXCtfdX5MCJ/plVjW75ihryksXCW4qJM4PvhGdtVvi2B3BN
 xfnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCXgk+pVC76OFKkgRh3DO1CKautPT9pTqGYy1Xhf8tvP+XomAsEPfMfwMSWzqNIdH9ficOVBy0B8I=@buildroot.org
X-Gm-Message-State: AOJu0YwV2DbCaZ+VWxfmq4itJWG/azR14N8GeRtEHQLPUT8yLQvMf8Y2
 vxaocgmm9Im83T9Ijflu9boOrbMpZXhAaCk02/AiIH139aSCH9oSolpQgXqHcjTj+e0=
X-Gm-Gg: ASbGnculet1D/Gpot+RiJwkzNodJTGdMCQHl1+YIFutb+qTTM7XkiUeAi49N+2zXnzF
 XfEa6ViC3e7002l+9hTS4Rq+ZEpgpsiAJqP4Vq5qvC8moY2SqMeNbkv23sKC1SZFGM1XV7R7HgR
 7b0N4V7AKC99kNVmoBTfA4fWdrLCdkojOwSwhvI2GQthR8ks8hjUA5zczYyNMorKmqPP0w1uCW6
 llaWTFY+fRhYQ8Aa5uACTtp41HAOogn1P8RDpR1cgcmz2Fiklo2dOqOhpXNjb3NunS7g9JoR8DO
 PSC+HrDnDuxkik6FPIrpYQuudrMCBvfokru9TV3QN/uPO1BOKwZEe+nLEwWj6T1aWR55O9gUmZ3
 LM4YlrKPqKgMF/ylaGuu3OXy4VDuL5NEYkHnj0QsijM/2hDLYI2q2PpB2KX1PngPLJzswdNu9T5
 oA7rpWOkvxJGfoQfq/4DJvC1Do
X-Google-Smtp-Source: AGHT+IFmgjDHw5Oa2B1i5CLxVOZjjYB4IU/eOsISLTYqIgR+d6UXuVvL/adqz6xMuTiz+wSbTk3Jcg==
X-Received: by 2002:a05:6000:2382:b0:3b3:a6d1:6b57 with SMTP id
 ffacd0b85a97d-3b49aa7da87mr4750363f8f.44.1751821036543; 
 Sun, 06 Jul 2025 09:57:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030ba54sm7824524f8f.8.2025.07.06.09.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 09:57:16 -0700 (PDT)
Message-ID: <ec07dae5-1714-4058-8fdb-f45217331d11@smile.fr>
Date: Sun, 6 Jul 2025 18:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Simon Dawson <spdawson@gmail.com>
References: <c649e56a-9d61-4db5-bb5f-71195ff17e0a@grenoble.cnrs.fr>
Content-Language: fr
In-Reply-To: <c649e56a-9d61-4db5-bb5f-71195ff17e0a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751821036; x=1752425836; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ifuVIP2k4MAyoElnkxdMwN8ZnxdkKmk85f3Tx6j4lzQ=;
 b=jWCXWa4M6ZvEA+YSgxkqbTfu85Ht20ZO4qRcaDs7fLG2gupI3rLjoUZpI2g0BuAxmD
 lX9WS3ocWHSsd/O1eOKXHTn3cabORxNvLQ8jxmd6PuS1ChKqejxB+HNT6cP/IkZTGWIB
 NFBaRwquf1MzL79tfmgndoL/YdUIJfR7SurnI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=jWCXWa4M
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/at91bootstrap3: fix build with
 host GCC 15
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

SGVsbG8gRWRnYXIsIEFsbCwKCkxlIDA2LzA3LzIwMjUgw6AgMTg6NDYsIEVkZ2FyIEJvbmV0IHZp
YSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBCdWlsZGluZyBhdDkxYm9vdHN0cmFwMyB3aXRoIEdD
QyAxNSBmYWlscyB3aXRoOgo+IAo+ICAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDi
gJhib29s4oCZIGNhbm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCj4gICAgICAgIDIz
IHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn4KPiAgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s
4oCZIGlzIGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiAKPiBUaGlzIGlz
IGR1ZSB0byBHQ0MgMTUgZGVmYXVsdGluZyB0byB0aGUgQzIzIGxhbmd1YWdlIGRpYWxlY3QuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4g
LS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gYWRkZWQgbm90ZSAiW0VkZ2FyOiBiYWNrcG9y
dCB0byB2My4xMC4zXSIgdG8gdjMgcGF0Y2gKPiAtLS0KPiAgLi4uY29uZGl0aW9uYWxseS1kZWZp
bmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDggKysrKysrKysrKysrKysrKysrKwo+ICAuLi5j
b25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggfCA0NiArKysrKysrKysr
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVz
LmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAxLWluY2x1ZGUtdHlwZXMu
aC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKPiAKPiBkaWZmIC0t
Z2l0IGEvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNv
bmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaCBiL2Jvb3QvYXQ5MWJvb3Rz
dHJhcDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1i
b29sLWZhbHNlLWFuZC0ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjNmZWEzNWZjNjAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9vdC9hdDkxYm9vdHN0
cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJv
b2wtZmFsc2UtYW5kLS5wYXRjaAo+IEBAIC0wLDAgKzEsNDggQEAKPiArRnJvbSA5MDhjNjU2Nzg4
Njc1NjVhOTM0ZWE1YTk2N2JmZTdlMjA0ZDFjY2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
ICtGcm9tOiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiArRGF0ZTogV2Vk
LCAyNSBKdW4gMjAyNSAxMToxMzo0MyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUv
dHlwZXMuaDogY29uZGl0aW9uYWxseSBkZWZpbmUgYm9vbCwgZmFsc2UgYW5kIHRydWUKPiArTUlN
RS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK2luY2x1ZGUvdHlwZXMu
aCB0eXBlZGVmcyDigJhib29s4oCZIGFuZCBtYWNyby1kZWZpbmVzIOKAmGZhbHNl4oCZIGFuZCDi
gJh0cnVl4oCZLgo+ICtIb3dldmVyLCBzaW5jZSBDMjMsIHRoZXNlIGFyZSBwcmVkZWZpbmUga2V5
d29yZHMuIEFzIEMyMyBpcyB0aGUgZGVmYXVsdAo+ICtDIGRpYWxlY3QgZm9yIEdDQyAxNSwgYnVp
bGRpbmcgd2l0aCB0aGlzIGNvbXBpbGVyIGZhaWxzIHdpdGg6Cj4gKwo+ICsgICAgaW5jbHVkZS90
eXBlcy5oOjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3QgYmUgZGVmaW5lZCB2aWEg4oCY
dHlwZWRlZuKAmQo+ICsgICAgICAgMjMgfCB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9vbDsKPiAr
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KPiArICAgIGluY2x1ZGUvdHlw
ZXMuaDoyMzoyMzogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMy
M+KAmSBvbndhcmRzCj4gKwo+ICtGaXggdGhpcyBidWlsZCBmYWlsdXJlIGJ5IG9ubHkgZGVmaW5p
bmcg4oCYYm9vbOKAmSwg4oCYZmFsc2XigJkgYW5kIOKAmHRydWXigJkgb24gQwo+ICtkaWFsZWN0
cyBvbGRlciB0aGFuIEMyMy4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbGlu
dXg0c2FtL2F0OTFib290c3RyYXAvcHVsbC8xODgKPiArW0VkZ2FyOiBiYWNrcG9ydCB0byB2My4x
MC4zXQo+ICsKPiArU2lnbmVkLW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNu
cnMuZnI+Cj4gKyhjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDRhYWI2MGU2MzRkNTg4ZGZmYmQz
MTU0ZmQwY2ZjZTc4MjcyYjc1MGEpCgpJIHJlbW92ZWQgdGhpcyBsaW5lIHNpbmNlIGl0IGRvZXNu
J3QgbWFrZSBzZW5zLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKCj4gKy0tLQo+ICsgaW5jbHVkZS90eXBlcy5oIHwgMyArKysKPiArIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVz
LmggYi9pbmNsdWRlL3R5cGVzLmgKPiAraW5kZXggMTI0NmE0ZGYuLjJjMWE0MWNmIDEwMDY0NAo+
ICstLS0gYS9pbmNsdWRlL3R5cGVzLmgKPiArKysrIGIvaW5jbHVkZS90eXBlcy5oCj4gK0BAIC00
Miw4ICs0MiwxMSBAQCB0eXBlZGVmIHNpZ25lZCBsb25nIGxvbmcgczY0Owo+ICsgdHlwZWRlZiB1
bnNpZ25lZCBsb25nIHNpemVfdDsKPiArIHR5cGVkZWYgc2lnbmVkIGxvbmcgc3NpemVfdDsKPiAr
IAo+ICsrLyogYm9vbCwgZmFsc2UgYW5kIHRydWUgYXJlIHByZWRlZmluZWQgc2luY2UgQzIzLiAq
Lwo+ICsrI2lmIF9fU1REQ19WRVJTSU9OX18gPCAyMDIzMTFMCj4gKyB0eXBlZGVmIHVuc2lnbmVk
IGNoYXIgYm9vbDsKPiArICNkZWZpbmUgZmFsc2UJMFUKPiArICNkZWZpbmUgdHJ1ZQkxVQo+ICsr
I2VuZGlmCj4gKyAKPiArICNlbmRpZiAvKiBUWVBFU19IXyAqLwo+ICstLSAKPiArMi40My4wCj4g
Kwo+IGRpZmYgLS1naXQgYS9ib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAxLWluY2x1ZGUt
dHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggYi9ib290
L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5
LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjc3MmE4MDg2OTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9vdC9h
dDkxYm9vdHN0cmFwMy92NC4wLjAvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1k
ZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4gQEAgLTAsMCArMSw0NiBAQAo+ICtGcm9tIDRh
YWI2MGU2MzRkNTg4ZGZmYmQzMTU0ZmQwY2ZjZTc4MjcyYjc1MGEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gK0Zyb206IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+ICtE
YXRlOiBXZWQsIDI1IEp1biAyMDI1IDExOjEzOjQzICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0g
aW5jbHVkZS90eXBlcy5oOiBjb25kaXRpb25hbGx5IGRlZmluZSBib29sLCBmYWxzZSBhbmQgdHJ1
ZQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiAraW5jbHVk
ZS90eXBlcy5oIHR5cGVkZWZzIOKAmGJvb2zigJkgYW5kIG1hY3JvLWRlZmluZXMg4oCYZmFsc2Xi
gJkgYW5kIOKAmHRydWXigJkuCj4gK0hvd2V2ZXIsIHNpbmNlIEMyMywgdGhlc2UgYXJlIHByZWRl
ZmluZSBrZXl3b3Jkcy4gQXMgQzIzIGlzIHRoZSBkZWZhdWx0Cj4gK0MgZGlhbGVjdCBmb3IgR0ND
IDE1LCBidWlsZGluZyB3aXRoIHRoaXMgY29tcGlsZXIgZmFpbHMgd2l0aDoKPiArCj4gKyAgICBp
bmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZIGNhbm5vdCBiZSBkZWZpbmVk
IHZpYSDigJh0eXBlZGVm4oCZCj4gKyAgICAgICAyMyB8IHR5cGVkZWYgdW5zaWduZWQgY2hhciBi
b29sOwo+ICsgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgo+ICsgICAgaW5j
bHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlzIGEga2V5d29yZCB3aXRoIOKA
mC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiArCj4gK0ZpeCB0aGlzIGJ1aWxkIGZhaWx1cmUgYnkgb25s
eSBkZWZpbmluZyDigJhib29s4oCZLCDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmSBvbiBDCj4g
K2RpYWxlY3RzIG9sZGVyIHRoYW4gQzIzLgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eDRzYW0vYXQ5MWJvb3RzdHJhcC9wdWxsLzE4OAo+ICsKPiArU2lnbmVkLW9mZi1i
eTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gKy0tLQo+ICsgaW5jbHVk
ZS90eXBlcy5oIHwgMyArKysKPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAr
Cj4gK2RpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNsdWRlL3R5cGVzLmgKPiAraW5k
ZXggOTUwYjFhNDYuLjBhZDlhZTYxIDEwMDY0NAo+ICstLS0gYS9pbmNsdWRlL3R5cGVzLmgKPiAr
KysrIGIvaW5jbHVkZS90eXBlcy5oCj4gK0BAIC0yMCw4ICsyMCwxMSBAQCB0eXBlZGVmIHNpZ25l
ZCBsb25nIGxvbmcgczY0Owo+ICsgdHlwZWRlZiB1bnNpZ25lZCBsb25nIHNpemVfdDsKPiArIHR5
cGVkZWYgc2lnbmVkIGxvbmcgc3NpemVfdDsKPiArIAo+ICsrLyogYm9vbCwgZmFsc2UgYW5kIHRy
dWUgYXJlIHByZWRlZmluZWQgc2luY2UgQzIzLiAqLwo+ICsrI2lmIF9fU1REQ19WRVJTSU9OX18g
PCAyMDIzMTFMCj4gKyB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9vbDsKPiArICNkZWZpbmUgZmFs
c2UJMFUKPiArICNkZWZpbmUgdHJ1ZQkxVQo+ICsrI2VuZGlmCj4gKyAKPiArICNlbmRpZiAvKiBU
WVBFU19IXyAqLwo+ICstLSAKPiArMi40My4wCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
