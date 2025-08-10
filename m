Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE4BC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCBF40CD4;
	Sun, 10 Aug 2025 17:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXmS6dgUOL5g; Sun, 10 Aug 2025 17:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF2E40D69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF2E40D69;
	Sun, 10 Aug 2025 17:14:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC36F31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D253E40CD4
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIJAIeeA-L25 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C269740D69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C269740D69
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C269740D69
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:14:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b8db5e9b35so2166979f8f.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754846060; x=1755450860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1hbIYfW2OPzTSh/VeWxyejZ2Bu9k6HOAc+nkTlH1i84=;
 b=crvsZPGQnC7IDunPVI0Q9UI9cThQ5OqEXw84OuzPuaVfk6FgkU5QaTVc4mNYcUcu1u
 9Im164dTl3HfP30w57SMUyMUTDP9KSh5uIDaY7pEkR7rwxO4jzF3ktIxBo9kOyfaRy3D
 9ku5Y2oesmE1eMirDI4n/VIHqoBTLu1xI0tPcWG7lykLHvzgr5rvTVVOjm5Ksh7Ynmzd
 n8WGIb7kLDB0/y5qcAS/u5dYujLJgi+uCUfCB1rN3IW1Qp7en75HuT75YurKP2eirtc0
 rxp6rDM7yspV1ExhxHSSDN5Cg/OlB2RpUhJKObcPkdkpZFxfHUxd2JnDFHcO3BPXDcQN
 fZbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDEtZWtumAi/ZoGul/ql/Djg7B566K1kkf4ZjX1IGhUPDK9vSiaEqZg0pFR4uJ35+seO6f6JbWUxk=@buildroot.org
X-Gm-Message-State: AOJu0YzVdeiBV1BlsWFHQfpLPndprJlsh0Y3G8cOBLNtD7wiCAv/aoA1
 XvKE9yZrc7fMym1K21myYgFLYA9GjqnKtfCUfscDkRjgNHH9wQ9oJ9D0mVsJBsUSbplP45VjauL
 qvTQg
X-Gm-Gg: ASbGncs3bsfEkwnUU6K6ya+ETZ3yknodV6jMepUNalK/75gjAZutFXB13mDRZtfJzRF
 dEYU3A0AyvFskEi6CK+QtZBOyuN/gWNfJDKbS1Co+rCRGpeD6xlDaVSBcg0t0C16UI9zbckRgtZ
 jyft4tux2d+rqPniM730JiFS/igS4QDtUzYDsRSoO7KKErLhoROMs0t2+c+asfEt+zKSC1rxKJa
 IZqTd+F6xjXuswU6Lz7K67czGY+Ddz4ce/XC3pm8sVvW4pwIlF0ukVghwewIdGnwNzu+3JCzrA/
 NZW5ijDhiOLSrpkYHuNnNaWlwQ5d0bEwIfpAh38yu/aglickeXxyDPIQ2BCGmtEu7X/ZesWojkV
 PUiXmMz4LD/2Wzy+CaTv6YCHm6YjniTwkdJQoXjYRl+PIn03FWa+P5fM5xqqbrC+YC8Qu17a64L
 Y+CzIHKN3T6hhtLUoXqAvzNznPgCXMlWTgXyypapky86dnnf3yrDDKHzWrnN4gfxMHMR127D7b1
 lUrnhP1Ng==
X-Google-Smtp-Source: AGHT+IFtQ5jzkYzp9JoTsxieR3sbXV0UiD3EUAy8K9lulitdtl47jwEqfwHiVAAg6g6TfgMLbYz/ZA==
X-Received: by 2002:a05:6000:228a:b0:3b7:99cb:16f6 with SMTP id
 ffacd0b85a97d-3b900b572f7mr7900760f8f.53.1754846059574; 
 Sun, 10 Aug 2025 10:14:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075805csm273290945e9.4.2025.08.10.10.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 10:14:19 -0700 (PDT)
Message-ID: <f57a9b55-f784-478c-8bee-c2e859045cca@smile.fr>
Date: Sun, 10 Aug 2025 19:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <2ebe19c757f0dd7622c127ec177e3ea391e79959.1753636325.git.baruch@tkos.co.il>
Content-Language: fr, en-US
In-Reply-To: <2ebe19c757f0dd7622c127ec177e3ea391e79959.1753636325.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754846060; x=1755450860; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1hbIYfW2OPzTSh/VeWxyejZ2Bu9k6HOAc+nkTlH1i84=;
 b=iXdmi3jKNKvaKEVbtUm4rQa8xMCU/qM0fz88bP4GXra6RNL/OaFBnkX0lvIdj5RMOY
 OopeCiw+MMbbJMdLlRtpZUWJsYVo6RLJpwKOjJtzB7ff2HTapSmo63fSdyHxvNgMjlTg
 LIBYnsrTN2ltEvMO9zzgQItzISOWyIMwm9J18=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=iXdmi3jK
Subject: Re: [Buildroot] [PATCH] package/daemon: fix build with gcc 15 and
 musl libc
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

SGVsbG8gQmFydWNoLCBBbGwsCgpMZSAyNy8wNy8yMDI1IMOgIDE5OjEyLCBCYXJ1Y2ggU2lhY2gg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IGRhZW1vbiBwcm92aWRlcyBpdHMgb3duIGdldG9w
dCgpIGRlY2xhcmF0aW9uIGZvciBub24tR05VIGxpYmNzLiBUaGlzCj4gZGVjbGFyYXRpb24gaXMg
Y29tcGF0aWJsZSB3aXRoIG11c2wgcHJvdmlkZWQgb25lIHdpdGggQyBzdGFuZGFyZHMgYmVmb3Jl
Cj4gQzIzLiBHQ0MgMTUgZGVmYXVsdHMgdG8gQzIzIHRoYXQgbWFrZXMgdGhlIGVtcHR5IHBhcmFt
cyBkZWNsYXJhdGlvbgo+IGVxdWl2YWxlbnQgdG8gZ2V0b3B0KHZvaWQpLCB3aGljaCBpcyBpbmNv
bXBhdGlibGUgd2l0aCBtdXNsIGRlY2xhcmF0aW9uLgo+IAo+IFNldCBDIHN0YW5kYXJkIHRvIGdu
dTk5IHRvIHJlc3RvcmUgdGhlIHByZXZpb3VzIGJlaGF2aW91ci4KPiAKPiBGaXhlczoKPiBodHRw
czovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvY2MzMzExYzg2ZTJiMTRiZjlhOWMx
ZWEwMDA1NmUwYjI5MGVjMTFhMwoKSSdtIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgd2l0
aCB0aGUgbmV3IEJvb3RsaW4gcHJlYnVpbHQgdG9vbGNoYWluIG11c2wKYmxlZWRpbmctZWRnZSAy
MDI1LjA4LTEgWzFdLgoKWzFdCmh0dHBzOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9h
ZHMvcmVsZWFzZXMvdG9vbGNoYWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQtLW11c2wtLWJs
ZWVkaW5nLWVkZ2UtMjAyNS4wOC0xLnRhci54egoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnVjaCBTaWFjaCA8
YmFydWNoQHRrb3MuY28uaWw+Cj4gLS0tCj4gIHBhY2thZ2UvZGFlbW9uL2RhZW1vbi5tayB8IDMg
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kYWVtb24vZGFlbW9uLm1rIGIvcGFja2FnZS9kYWVtb24v
ZGFlbW9uLm1rCj4gaW5kZXggZDc3MDllMDNlZmY0Li4wM2YyYWFkNjQ5YjUgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9kYWVtb24vZGFlbW9uLm1rCj4gKysrIGIvcGFja2FnZS9kYWVtb24vZGFlbW9u
Lm1rCj4gQEAgLTE4LDcgKzE4LDggQEAgZGVmaW5lIERBRU1PTl9DT05GSUdVUkVfQ01EUwo+ICBl
bmRlZgo+ICAKPiAgZGVmaW5lIERBRU1PTl9CVUlMRF9DTURTCj4gLQkkKFRBUkdFVF9NQUtFX0VO
VikgJChNQUtFKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgLUMgJChARCkKPiArCSQoVEFSR0VU
X01BS0VfRU5WKSAkKE1BS0UpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSBcCj4gKwkJQ0ZMQUdT
PSIkKFRBUkdFVF9DRkxBR1MpIC1zdGQ9Yzk5IiAtQyAkKEBEKQo+ICBlbmRlZgo+ICAKPiAgZGVm
aW5lIERBRU1PTl9JTlNUQUxMX1RBUkdFVF9DTURTCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
