Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F0C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5135B40448;
	Sat, 13 Jul 2024 13:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6t68JrPRsiY; Sat, 13 Jul 2024 13:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C74404CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C74404CA;
	Sat, 13 Jul 2024 13:58:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E42E1BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58B0684005
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUaDC3_yEBd0 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF27683FC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF27683FC0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF27683FC0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:58:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so1502977f8f.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879121; x=1721483921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMsTR8wrWx94X1cxexizdmHTjd8pg+ItWSCn8lcKaZY=;
 b=Z012072REikGp0NAyjCFxZqiZE8ZV9Uthg9UgiB4jwuT3DhlJreoSGwtxkl6fjTd4I
 QMHz8RyehsB4uI+sjqlKZUy2QYITwx7ENdjDORAZnbO73P38uvu/EcSnnk/iyao6oAQ2
 bGFZMxmb8wT2tfn52kI6UAEmCOyw8oXOVOkYCX0dSG7zZGIjd3FSBK/Tsg7WOqUTMJDI
 Kh2jrjCl4kPWaoVA3+rlahhM3xirIMoGdNqJDlMANw4uM0DiJZE0HiCLHrtXABwdxZzF
 NfJHMBGprUIvxecp4f65nJ+C2Ly1KuDHpcCUmixJxTsfZYs8PgRx3lphh+IuTPZguShS
 2fsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ8PBU+JPA1VHtLndW64G5qzDW4qbXXLEXW8Ko8Dgx945luoelxu/y6/W+xddazCeRJXHNBnnbLJ9GCZcoKyKVyI3CjoH3cQ==
X-Gm-Message-State: AOJu0YyiU5yApN+SDNYOdNkvx/hphjn4Co9ui8a3bBRLLrMUXHteJpmY
 bcVqTygxA9omDfyNjLnxRoxY3DxOG9IzBxrQAquVvwSHsv1YQJJMSYU/PoVfkiI=
X-Google-Smtp-Source: AGHT+IHrsujEWJ74QG9zG3WlJqWIJuC9cY7wj39gLCHDh6+HP0ts6oCqKUi04NXKNSN5kO/ZzPaHVw==
X-Received: by 2002:adf:9b1a:0:b0:367:8c66:51ec with SMTP id
 ffacd0b85a97d-367cea73a41mr9720314f8f.23.1720879121541; 
 Sat, 13 Jul 2024 06:58:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf539sm1466716f8f.47.2024.07.13.06.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 06:58:41 -0700 (PDT)
Message-ID: <5a4a39aa-fe77-43c6-8619-5096603554c1@smile.fr>
Date: Sat, 13 Jul 2024 15:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
 <20240214233028.1226645-3-kilian.zinnecker@mail.de>
Content-Language: en-US
In-Reply-To: <20240214233028.1226645-3-kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879121; x=1721483921; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UMsTR8wrWx94X1cxexizdmHTjd8pg+ItWSCn8lcKaZY=;
 b=k47TYwerEJQRpsWyj8gt3aJ+isj0V5H1NBjuTsScTJl52cVdvlx4yGK/ywJ7M59Yn6
 0Z4RtnzTi48pD0rRTSEMaq/EFnxckiY35wqB/wmpJ/Sg8qLhReHvWq+MvLN5ZZmsgPdm
 FWuiEryqs/a2VwIHbdU1b3K2IzRSs9kSw8HbU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=k47TYwer
Subject: Re: [Buildroot] [PATCH v4 2/3] package/xuantie-bins: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS2lsaWFuLCBBbGwsCgpMZSAxNS8wMi8yMDI0IMOgIDAwOjMwLCBLaWxpYW4gWmlubmVj
a2VyIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIHBhdGNoIGFkZHMgYSBwYWNrYWdl
IGZvciBYdWFudGllIGJpbmFyeSBibG9icy4gVGhlIGJpbmFyeQo+IGJsb2JzIGFyZSBuZWVkZWQg
Zm9yIHRoZSBCZWFnbGVWLUFoZWFkJ3MgU29DIChUSDE1MjApLiBUaGV5IGNvbnRhaW4KPiBhbiBG
UEdBIGJpbmFyeSBmb3IgcG93ZXIgbWFuYWdlbWVudCBhbmQgYSBiaW5hcnkgZm9yIHRoZSBhdWRp
bwo+IHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaWxpYW4gWmlubmVja2VyIDxraWxpYW4u
emlubmVja2VyQG1haWwuZGU+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgcGFja2FnZS94dWFudGllLWJpbnMvQ29uZmlnLmluICAgICAgICAgfCAgOCAr
KysrKysrKwo+ICBwYWNrYWdlL3h1YW50aWUtYmlucy94dWFudGllLWJpbnMuaGFzaCB8ICAyICsr
Cj4gIHBhY2thZ2UveHVhbnRpZS1iaW5zL3h1YW50aWUtYmlucy5tayAgIHwgMTkgKysrKysrKysr
KysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UveHVhbnRpZS1iaW5zL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS94dWFudGllLWJpbnMveHVhbnRpZS1iaW5zLmhhc2gKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UveHVhbnRpZS1iaW5zL3h1YW50aWUtYmlucy5tawo+IAo+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGI3NWE5MjczOWEuLmU5
YTk5MTBkNjkgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBA
QCAtMTg5OSw2ICsxODk5LDcgQEAgRjoJYm9hcmQvcmFkeGEvcm9jazViLwo+ICBGOgljb25maWdz
L2F2bmV0X3J6Ym9hcmRfdjJsX2RlZmNvbmZpZwo+ICBGOgljb25maWdzL3JvY2s1Yl9kZWZjb25m
aWcKPiAgRjoJcGFja2FnZS9yb2NrY2hpcC1ya2Jpbi8KPiArRjoJcGFja2FnZS94dWFudGllLWJp
bnMvCj4gIAo+ICBOOglLbGF1cyBIZWlucmljaCBLaXdpIDxrbGF1c0BsaW51eC52bmV0LmlibS5j
b20+Cj4gIEY6CXBhY2thZ2Uvd3F5LXplbmhlaS8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGJmMGZlMDc4YjkuLmIzNWNiYzQwMzgg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgo+IEBAIC02NTYsNiArNjU2LDcgQEAgZW5kbWVudQo+ICAJc291cmNlICJwYWNrYWdlL3dpcGUv
Q29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3hvcnJpc28vQ29uZmlnLmluIgo+ICAJc291
cmNlICJwYWNrYWdlL3hyODE5LXhyYWRpby9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2Uv
eHVhbnRpZS1iaW5zL0NvbmZpZy5pbiIKPiAgZW5kbWVudQo+ICAKPiAgbWVudSAiSW50ZXJwcmV0
ZXIgbGFuZ3VhZ2VzIGFuZCBzY3JpcHRpbmciCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveHVhbnRp
ZS1iaW5zL0NvbmZpZy5pbiBiL3BhY2thZ2UveHVhbnRpZS1iaW5zL0NvbmZpZy5pbgo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMThmNWRmMTQ1Mwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL3h1YW50aWUtYmlucy9Db25maWcuaW4KPiBAQCAtMCwwICsx
LDggQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1hVQU5USUVfQklOUwo+ICsJYm9vbCAieHVhbnRp
ZS1iaW5zIgo+ICsJZGVwZW5kcyBvbiBCUjJfcmlzY3YKPiArCWhlbHAKPiArCSAgVGhpcyBwYWNr
YWdlIHByb3ZpZGVzIGJpbmFyeSBibG9icywgbmVlZGVkIGZvciB0aGUKPiArCSAgQmVhZ2xlVi1B
aGVhZCdzIFNvQyAoVEgxNTIwKS4gVGhleSBjb250YWluIGFuIEZQR0EgYmluYXJ5Cj4gKwkgIChs
aWdodF9hb25fZnBnYS5iaW4pIGZvciBwb3dlciBtYW5hZ2VtZW50IGFuZCBhIGJpbmFyeSBmb3IK
PiArCSAgdGhlIGF1ZGlvIHN5c3RlbSAobGlnaHRfYzkwNl9hdWRpby5iaW4pLgoKV2UgdXN1YWxs
eSBhZGQgdGhlIHVybCBvZiB0aGUgdXBzdHJlYW0gcHJvamVjdCBhdCB0aGUgZW5kIG9mIHRoZSBo
ZWxwIHRleHQgb24KZWFjaCBvcHRpb24gdGhhdCBlbmFibGUgYSBwYWNrYWdlOgoKaHR0cHM6Ly93
d3cuYmVhZ2xlYm9hcmQub3JnL2JvYXJkcy9iZWFnbGV2LWFoZWFkCgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3h1YW50aWUtYmlucy94dWFudGllLWJpbnMuaGFzaCBiL3BhY2thZ2UveHVhbnRpZS1i
aW5zL3h1YW50aWUtYmlucy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi41NTMxYTU0NjE3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UveHVhbnRp
ZS1iaW5zL3h1YW50aWUtYmlucy5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgTG9jYWxseSBj
b21wdXRlZAo+ICtzaGEyNTYgIDkyZDJmZWU0Njg4ZGMwNTk4MzI5ZDU2Y2Y3OTYyZjM0NGQzMGI3
MGUyNjFhNGNkOTkzOWIwOTEyZjA2ZGYyNmEgIHh1YW50aWUtYmlucy0xLjIuMS50YXIuZ3oKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS94dWFudGllLWJpbnMveHVhbnRpZS1iaW5zLm1rIGIvcGFja2Fn
ZS94dWFudGllLWJpbnMveHVhbnRpZS1iaW5zLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi5iY2NmYzk1ODdkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UveHVhbnRpZS1iaW5zL3h1YW50aWUtYmlucy5tawo+IEBAIC0wLDAgKzEsMTkgQEAKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHh1YW50aWUtYmlucwo+ICsjCj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtYVUFOVElFX0JJTlNfVkVSU0lPTiA9IDEuMi4xCj4g
K1hVQU5USUVfQklOU19TSVRFID0gJChjYWxsIGdpdGh1YixiZWFnbGVib2FyZCx4dWFudGllLXVi
dW50dSxiZWFnbGV2LSQoWFVBTlRJRV9CSU5TX1ZFUlNJT04pKQo+ICtYVUFOVElFX0JJTlNfTElD
RU5TRSA9IFBST1BSSUVUQVJZCgoiV2UgbmVlZCBhIHByb3BlciBsaWNlbnNlLCB0aGF0IGF0IGxl
YXN0IGdpdmVzIHRoZSByaWdodCB0byByZWRpc3RyaWJ1dGUgdGhvc2UKYmluYXJpZXMuIFdpdGhv
dXQgYSBsaWNlbnNlLCBub2JvZHkgaXMgYWxsb3dlZCB0byByZWRpc3RyaWJ1dGUgdGhvc2UgYmlu
YXJpZXMsCm1ha2luZyB0aGVtIHByZXR0eSB1c2VsZXNzLiIgWzFdLgoKVGhpcyBpcyB0aGUgc2Ft
ZSBpc3N1ZSBoZXJlLCB3ZSBkb24ndCBoYXZlIGFueSBsaWNlbnNlIGluZm9ybWF0aW9uIHdoZW4g
dGhlc2VzCmJpbmFyaWVzIHdoZXJlIGFkZGVkIFsyXS4KClsxXQpodHRwOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMTUzMzU0NTQwOC0xMTI0OC0yLWdpdC1z
ZW5kLWVtYWlsLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwpbMl0KaHR0cHM6Ly9naXQuYmVhZ2xl
Ym9hcmQub3JnL2JlYWdsZXYtYWhlYWQveHVhbnRpZS11YnVudHUvLS9jb21taXQvZjY0ZjFjZDhj
ZjgwZmE1MDc4MmIzYTUwYTJkMzI3MmJjNTk0NTFlZAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
ICsKPiArWFVBTlRJRV9CSU5TX0lOU1RBTExfSU1BR0VTID0gWUVTCj4gK1hVQU5USUVfQklOU19J
TlNUQUxMX1RBUkdFVCA9IE5PCj4gKwo+ICtkZWZpbmUgWFVBTlRJRV9CSU5TX0lOU1RBTExfSU1B
R0VTX0NNRFMKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAtdCAkKEJJTkFSSUVTX0RJUikgJChA
RCkvYmlucy9saWdodF9hb25fZnBnYS5iaW4KPiArCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAtdCAk
KEJJTkFSSUVTX0RJUikgJChARCkvYmlucy9saWdodF9jOTA2X2F1ZGlvLmJpbgo+ICtlbmRlZgo+
ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
