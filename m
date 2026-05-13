Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC70CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63F160838;
	Wed, 13 May 2026 21:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yE4ie57PnWB7; Wed, 13 May 2026 21:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C397E60839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778706804;
	bh=a7PL9BzKnbCm3sdpdI3g28PitXxA9mY0SgbKRvOOH3A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V7lzZTm4f+TobyI2nOq2Dr6akvg0IXomkg+pr9pdtndGObNS5rUsO7SAZcUmfvJ9t
	 vqfE7o0lZL2QM9Z3KLsOXkuVySj5vKfs2cUoZNVrv3rQZxOWKTMS9hufmx5pFkd2+j
	 nywamE2yZTfYbUXSFj6EoU7WRnJlNH+6iE3FXoK95wldxO21UZaKK7r/RcPuailgDf
	 sG6eBBH7OOeTUVdyFiL8S7lBGrd0xtpY1RmmJ0ZhJi7H/9uZwg5f+Q2r+GLhOBM49U
	 X+Ho1Q92zQn2wfp+211hTC+aCTo+OAMGwuBFVdjKv1W71S64FILx0ghktM9HJG6Ukz
	 T+wLgPaDyAxpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C397E60839;
	Wed, 13 May 2026 21:13:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B87D36F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B37C8109C
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQujalulA8bc for <buildroot@buildroot.org>;
 Wed, 13 May 2026 21:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D838281099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D838281099
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D838281099
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:13:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so45579275e9.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778706800; x=1779311600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zT22kXbZ5AtoCNfWzwj03YV980vqdH5gdAZUFzEbyzE=;
 b=PU4OJOnYj7Cmz+ojzCxa7yC85Uoss/3DXj+0ItBIWjeEREBtHsA6HTICbz6dLzWcPd
 qtce9Ca+cVqmDdQ205QrzKEWomFA+QqOOJeDFdTbXtS01+W++/d1NIZFf/udFUpPVrrv
 AdOIgNpqPHiUbLrW92M2UMWWDlXfdaTeydHsj4PKcBy76ZTIdgngdikdty+w9YY7foe9
 DQo1AFCNYqUeiGJCwHQHdnlV5/se/6EsVkrKifYLFun+uEQbPKgSGXpJLcNIvF6DiDYN
 FrvT96e2tjHEyqFZGsReGZnfSlXwvjraW8+9UlxKlQIChG8dpcgE9X01bYIa1KJr0bt+
 rQjQ==
X-Gm-Message-State: AOJu0YzUpLj1IhwKkzX7lOUvKTaUy9woYeRMnNV/0GFPQlPbbwqaDjuQ
 Ecr3wyETLmGGSHizWqi5WYVdLEop1pEbmSGmbvkTSUD1d4aE7olzfSpgaDEy5uNmLp5e2n5vpuN
 y3wmI58Q=
X-Gm-Gg: Acq92OEoP1zgd3cVLdH8qqaIzQt1Q5YN+b5gcEd/t1xsVHOyjjzA9AQw5M6jDD9A3Q7
 sxPXxomRAVrvVew4CBoYigkTON5dyAD998uJ5aXefqJ7ubodJlGh0U++mIz2ApIdKoanXmItDnz
 9GoXFwEfRnYgvtc2WfynGhY98RMpXj1EQnXPTcT0YZqdNsHNURUkEVf5zbrO6vtNFmOJ5ZcNHiq
 JgHA6lBNbknXDvUNbOnAqz407l7Az3IbvMvr43Rf+fE6+AzYQPXhb7FQt1zo55JmusEnCxSsePx
 rov8k2CQ0FkKiPQseO0tREXd80CALWzpO7LCCFzr5H91dIwKAHXaa7bqwDi+csA92uYMDA7eYW3
 beqRZwVM27UuGEx36BVRVE+tEQF2WrkRu1iDxcJHcxRRoQWpNM13d7IR6ObeuMOluTBSZKD8lTs
 E9D5F427pzkkviTq6qZZbnM96B1BmUnf13jDfPmBippWSfLJ6VlXLKZiwsvbWju+9J0LE3YsE9H
 RfAFKsBvoMak/LlRXC6z2IDYT+zxU+NLxE59uRElc4qK2IVdGg7+8yN+rnvHRRxtKa9vVDXNoee
X-Received: by 2002:a05:600c:34d6:b0:48a:79d8:a8d6 with SMTP id
 5b1f17b1804b1-48fd6350499mr14730015e9.7.1778706800454; 
 Wed, 13 May 2026 14:13:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd62b4d34sm5260745e9.2.2026.05.13.14.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 14:13:20 -0700 (PDT)
Message-ID: <5141fcf4-70e4-4f2a-bc3b-7e16367bdf65@smile.fr>
Date: Wed, 13 May 2026 23:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
 <90f566b2-c146-4f37-b5b2-838bccce48ef@smile.fr>
 <CAMWSM7jt8FLNmkHmee8iVGkKzj5k4XjzsufvjV9EnAgzyjLRsA@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CAMWSM7jt8FLNmkHmee8iVGkKzj5k4XjzsufvjV9EnAgzyjLRsA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778706800; x=1779311600; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zT22kXbZ5AtoCNfWzwj03YV980vqdH5gdAZUFzEbyzE=;
 b=fxjn/3vqI+A4F+Us9GFE9Md8p/8bBq/Cn1oDyEEdzGAk/bmt+mZ1xZmrscxjIbNWdN
 h1nxsqmWI3oiAYpemuV8dwdKWrd+ld751CTO98IcHpZ8T27Vsm+p/hdKUyyIIRUxTKNq
 2fRCDu5bf3dAY+NM4F1vLKJwGgSabKOOkwtsI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fxjn/3vq
Subject: Re: [Buildroot] [PATCH RESEND v5 1/5] package/libepoxy: remove
 gl/egl dependency
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

SGVsbG8gSm9zZXBoLAoKTGUgMTMvMDUvMjAyNiDDoCAyMDozNSwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFdlZCwgTWF5IDEzLCAyMDI2IGF0IDg6MzXi
gK9BTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+Cj4+IEhl
bGxvIEpvc2VwaCwgQWxsLAo+Pgo+PiBMZSAxMi8wNS8yMDI2IMOgIDIxOjM2LCBKb3NlcGggS29n
dXQgYSDDqWNyaXQgOgo+Pj4gTGliZXBveHkgaXMgYSBsaWJyYXJ5IGZvciBoYW5kbGluZyBPcGVu
R0wgZnVuY3Rpb24gcG9pbnRlciBtYW5hZ2VtZW50Lgo+Pj4KPj4+IEl0IGhhcyBiYWNrZW5kcyBm
b3IgZWdsL2dseCwgd2hpY2ggbWF5IGF0IG9uZSBwb2ludCBoYXZlIGJlZW4gbWFuZGF0b3J5Cj4+
PiB0byBlbmFibGUsIGJ1dCB0aGUgbGlicmFyeSBub3cgYnVpbGRzIHdpdGggbm9uZSBvZiB0aGUg
YWJvdmUgZW5hYmxlZAo+Pj4gZmVhdHVyZXMsIGFzIHNlZW4gYmVsb3cuCj4+Pgo+Pj4gICBsaWJl
cG94eSAxLjUuMTAKPj4+Cj4+PiAgICAgVXNlciBkZWZpbmVkIG9wdGlvbnMKPj4+ICAgICAgIENy
b3NzIGZpbGVzICAgICAgICAgICAgOiAvaG9tZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFhcmNo
NjQvYnVpbGQvbGliZXBveHktMS41LjEwLy9idWlsZHJvb3QtYnVpbGQvY3Jvc3MtY29tcGlsYXRp
b24uY29uZgo+Pj4gICAgICAgYl9waWUgICAgICAgICAgICAgICAgICA6IGZhbHNlCj4+PiAgICAg
ICBiX3N0YXRpY3BpYyAgICAgICAgICAgIDogdHJ1ZQo+Pj4gICAgICAgYnVpbGR0eXBlICAgICAg
ICAgICAgICA6IHJlbGVhc2UKPj4+ICAgICAgIGJ1aWxkLmNtYWtlX3ByZWZpeF9wYXRoOiAvaG9t
ZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFhcmNoNjQvaG9zdC9saWIvY21ha2UKPj4+ICAgICAg
IGRlZmF1bHRfbGlicmFyeSAgICAgICAgOiBzaGFyZWQKPj4+ICAgICAgIGRvY3MgICAgICAgICAg
ICAgICAgICAgOiBmYWxzZQo+Pj4gICAgICAgZWdsICAgICAgICAgICAgICAgICAgICA6IG5vCj4+
PiAgICAgICBnbHggICAgICAgICAgICAgICAgICAgIDogbm8KPj4+ICAgICAgIGxpYmRpciAgICAg
ICAgICAgICAgICAgOiBsaWIKPj4+ICAgICAgIGJ1aWxkLnBrZ19jb25maWdfcGF0aCAgOiAvaG9t
ZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFhcmNoNjQvaG9zdC9saWIvcGtnY29uZmlnCj4+PiAg
ICAgICBwcmVmaXggICAgICAgICAgICAgICAgIDogL3Vzcgo+Pj4gICAgICAgc3RyaXAgICAgICAg
ICAgICAgICAgICA6IGZhbHNlCj4+PiAgICAgICB0ZXN0cyAgICAgICAgICAgICAgICAgIDogZmFs
c2UKPj4+ICAgICAgIHgxMSAgICAgICAgICAgICAgICAgICAgOiBmYWxzZQo+Pj4KPj4+IFJlbW92
aW5nIHRoZXNlIGRlcGVuZGVuY2llcyBhbGxvd3MgZm9yIHNvbWUgYXBwbGljYXRpb25zIHRoYXQg
cmVxdWlyZSBpdAo+Pj4gYXMgYSBidWlsZCBkZXBlbmRlbmN5LCBidXQgb3RoZXJ3aXNlIGNhbiBy
dW4gaGVhZGxlc3Mgb3Igd2l0aG91dCBHTCwgdG8KPj4+IGJ1aWxkIGFuZCBmdW5jdGlvbi4KPj4K
Pj4gSSdtIG5vdCBzdXJlIGFib3V0IHRoaXMgY2hhbmdlLiBIYXZpbmcgZWdsIG9yIGdseCBiYWNr
ZW5kIHN0aWxsIHNlZW1zIGhpZ2hseQo+PiByZWNvbW1lbmRlZC4gT2sgaXQgYnVpbGRzIGJ1dCB3
aHkgdXNpbmcgbGliZXBveHkgaW4gdGhpcyBjYXNlIChoZWFkbGVzcyk/Cj4gCj4gSXQgc2VlbXMg
YSBjbGVhbiB3YXkgZm9yIGFwcGxpY2F0aW9ucyB0byBzdXBwb3J0IHZhcmlvdXMgR0wKPiBjb25m
aWd1cmF0aW9ucyAoR0wvR0xYLCBHTC9FR0wsIEdMRVMvRUdMKSBhdCBydW50aW1lLiBJIHN1cHBv
c2UgIm5vbmUKPiBvZiB0aGUgYWJvdmUiIGlzIG9uZSB2YWxpZCBjb25maWd1cmF0aW9uLgoKWWVz
LCB0aGF0J3Mgd2h5IGl0J3MgY29uZnVzaW5nIDopCgo+IAo+IEZvciB2aXJnbHJlbmRlcmVyLCB0
aGF0J3Mgc3RpbGwgYSB1c2VmdWwgY29uZmlndXJhdGlvbi4gSWYgd2UgYXR0ZW1wdAo+IHRvIGJ1
aWxkIGEgbWluaW1hbCB0YXJnZXQgdGhhdCBjYW4gcnVuIGEgVk1NIGxpa2UgcWVtdSBvciBsaWJr
cnVuIHdpdGgKPiBoYXJkd2FyZSBhY2NlbGVyYXRlZCBncmFwaGljcy9jb21wdXRlLCB0aGlzIGN1
dHMgb3V0IG1vc3Qgb3IgYWxsIG9mCj4gdGhlIGhvc3QncyBncmFwaGljcyBzdGFjaywgZGVwZW5k
aW5nIG9uIG91ciBuZWVkIHRvIGRpc3BsYXkgZnJhbWVzCj4gbG9jYWxseSBvbiB0aGUgaG9zdC4g
SSBjb3VsZCBlbnZpc2lvbiBhIHZpcnR1YWxpemVkIGd1ZXN0IHVzaW5nIGUuZy4KPiBtb29ubGln
aHQgWzBdIHRvIHN0cmVhbSBncmFwaGljYWwgb3V0cHV0IHRvIGFub3RoZXIgbWFjaGluZS4KPiAK
PiBMb29raW5nIGF0IG90aGVyIHVzZXJzIG9mIGxpYmVwb3h5LCBXZXN0b24gY2FuIHVzZSBwaXht
YW4sIEdMLCBvcgo+IFZ1bGthbiBmb3IgcmVuZGVyaW5nLCBhbmQgY2FuIHVzZSBEUk0sIHgxMSwg
d2F5bGFuZCwgb3Igdm5jIGFzIGRpc3BsYXkKPiBiYWNrZW5kcywgb3IgZXZlbiBydW4gaGVhZGxl
c3MuIE5vIEdML0VHTCBpcyBhZ2FpbiBhIHZhbGlkCj4gY29uZmlndXJhdGlvbiBoZXJlLCBpdCBq
dXN0IGdyYWNlZnVsbHkgZGlzYWJsZXMgR0wgYXQgcnVudGltZS4KCk9rLCBJJ20gY29udmluY2Vk
LgoKPiAKPiBJIGRvbid0IGtub3cgYWJvdXQgbGliY2FtZXJhLWFwcHMsIGxpYmd0azMsIGxpYmd0
azMsIHdlYmtpdGd0aywgb3IKPiB3cGV3ZWJraXQuIEN1cnJlbnRseSwgdGhleSB3aWxsIGFsbCBy
ZXRhaW4gdGhlaXIgZGVwZW5kZW5jeSBvbgo+IEhBU19MSUJHTCB8fCBIQVNfTElCRUdMLiBJIHN1
cHBvc2UgaWYgdGhlc2UgZGVwZW5kZW5jaWVzIHdlcmUgcmVtb3ZlZCwKPiBpdCBtaWdodCBiZSBw
b3NzaWJsZSB0byBidWlsZCBzb21lIGFwcGxpY2F0aW9ucyBpbiBwb2ludGxlc3MKPiBjb25maWd1
cmF0aW9ucyB0aGF0IGxhY2sgZGVzaXJlZCBmdW5jdGlvbmFsaXR5LgoKSSdtIGZpbmUgaWYgd2Ug
a2VlcCBIQVNfTElCR0wgfHwgSEFTX0xJQkVHTCBkZXBlbmRlbmNpZXMgZm9yIHRoZXNlIHBhY2th
Z2VzIGJ1dAphdCBsZWFzdCB5b3Ugc2hvdWxkIHVwZGF0ZSB0aGUgY29tbWVudCBhYm91dCBsaWJl
cG94eSBkZXBlbmRlbmN5CgotICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwg
QlIyX1BBQ0tBR0VfSEFTX0xJQkdMICMgbGliZXBveHkKKyAgZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTCAjIG5lZWRzIGxpYmVwb3h5Cncv
IEVHTCBvciBHTAoKQ2FuIHlvdSByZXNlbmQgYSB2NiB3aXRoIGltcHJvdmVkIGNvbW1lbnRzPwoK
PiAKPiBbMF0gaHR0cHM6Ly9tb29ubGlnaHQtc3RyZWFtLm9yZy8KPiAKPiBCZXN0LAo+IEpvc2Vw
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
