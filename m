Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D62CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 07:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D9161ADF;
	Thu,  4 Sep 2025 07:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNXDMdxGeekX; Thu,  4 Sep 2025 07:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADCF61B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ADCF61B6E;
	Thu,  4 Sep 2025 07:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B94D3106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ABAA4203A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BSApW-MGxTU for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 07:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C07DC42029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07DC42029
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C07DC42029
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:37:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso4650205e9.1
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 00:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756971418; x=1757576218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JpyHUDzUA1f4sHeG4vCmmWtN/7AAx4bPAvbhDvlRRnM=;
 b=eH0oxPdlqClRqhppwW0CllQ/XeB/OsKyEr7rWnbZPPv6M7KkxlYk60RPFfSYdcg5o8
 IM7lbMWG4G/eoyBndmpZ4CQE9iW9UJeJIwzFrpyTjxJSMvlFJsCvinPhn9rRLczJcV6I
 3pn13myRLC5Rxro8/LfXZihc3ucPmeDm/+/E3JYImU3SDmyjvSPBbQqX3r0pcyDTNMAi
 i0JLv0SIhK+F6YvgVXJfCzCmF+wpaKA9etNHi7M7gwmii/tWd1Y1NJMw5wImoe0ez3qD
 276tFDNrK1AZnct2oLvsSo5TKPzTuZ1XN47AzPfGH/IFNcVFfmTARDQk2cyQh5Ajz917
 g8hQ==
X-Gm-Message-State: AOJu0Yy/ooYPT14+VWjX6Tw2BjMhR1CGq0gA8LUSlS3N5o79hVJP1kYo
 ziYVIMIRVnojiuoSG9B9zCJghvr+ZrHZPU1lUWziBiER7T8DEx5R16GddYb6QAn5jqvw2I0xek+
 6SSpWRz4=
X-Gm-Gg: ASbGncsT9hO3pO2mzNQOfHg7Ucf9F3nZc3U9S/YKVPwfJnEp9byRB2FusXd7oWzZl2x
 Co/4qEJNrIKfOlf0NrWMXbviCh6+aCTNPSKrhWbWoW8NpGejrCzvfL01ZFkZxHCSEHkK4cqL8Oa
 yCRowAd7M6b9rvynn5zyK6NyxbgzfOa+BQ1TTbsMAYgOpXYYharGQGaOpcwsbgUpt2/cUa+VcYl
 KeKmfyXd8Wa/vwHKXEgChaRNs/9OteQs2+ze3ynKNcgZUt0+c/kQl6CmjsYeNPb5CqsrWaOmTYb
 aqbTp8rivEWbqpR3GxD1dGZDm9G7GOHikwul7eTIciXdGnA04yFvKS/EEgFMvl0Klpx5pxxldim
 Ks9iKIcPrgrveHjBSGQy/zcu6v0ZZwAv8ZyHEOm7Um72ApvrDa3uo41AkgnvdqrgajC9xd3pr4j
 m2zr+xfTsjZ4hgIqqPu47Gdmfcr+GQK+61M5Mrm3SSsu+Bxcrnr5cgOYwi0u+6lgjP/a4gxEA=
X-Google-Smtp-Source: AGHT+IGnDqBeSgluRSPae0+dlzuRyXf+iQVvVAYohnr7jwBReK803xoGDNN7wkEPxZOWAumo3b0Swg==
X-Received: by 2002:a05:600c:3545:b0:45b:7a93:f108 with SMTP id
 5b1f17b1804b1-45b855261f1mr154896725e9.3.1756971418255; 
 Thu, 04 Sep 2025 00:36:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b93fae643sm118789405e9.3.2025.09.04.00.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 00:36:57 -0700 (PDT)
Message-ID: <ea9fcf51-723e-4333-ba79-4dbc2591c00c@smile.fr>
Date: Thu, 4 Sep 2025 09:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250823204043.244589-1-thomas.petazzoni@bootlin.com>
 <d4bf892c-8d46-4749-97d6-889bb49479db@smile.fr>
 <20250904092403.5337e110@windsurf>
Content-Language: en-US
In-Reply-To: <20250904092403.5337e110@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756971418; x=1757576218; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JpyHUDzUA1f4sHeG4vCmmWtN/7AAx4bPAvbhDvlRRnM=;
 b=THjtL8EzSrY1AumskU89tlmlUNeBqSbmxncOkk4wtdGkLXZBLOswaDKPwXWSINjyUh
 Bxxbuyl4JEmWd6/xbIyS/OwEwi8/hw8hKkZqsyEYeWQa2tAp/c63tzA5aN5TrxDXxtzu
 4PyrL10MrfT9moX6r3z3rfBOFwGQuvcnVLw9E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=THjtL8Ez
Subject: Re: [Buildroot] [PATCH] package/wayland: tweak wayland-scanner.pc
 after installation to fix SDL2 build issue
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

SGVsbG8gVGhvbWFzLAoKTGUgMDQvMDkvMjAyNSDDoCAwOToyNCwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTdW4sIDI0IEF1ZyAyMDI1IDE0OjEx
OjMxICswMjAwCj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+
IAo+PiBJdCBzZWVtcyBvYnZpb3VzIHRoYXQgL3Vzci9iaW4vd2F5bGFuZC1zY2FubmVyIHNob3Vs
ZCBub3QgZXhpc3Qgb24gdGhlIGJ1aWxkCj4+IG1hY2hpbmUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1
ZS4gSSBkaWRuJ3QgY2hlY2tlZCB0aGF0IGJlZm9yZSB0cnlpbmcgdG8gcmVwcm9kdWNlCj4+IHRo
ZSBpc3N1ZSBzbyBzZGwyIGJ1aWxkIGZpbmUuIE1heWJlIC91c3IvYmluL3dheWxhbmQtc2Nhbm5l
ciBpcyBpbnN0YWxsZWQgb24KPj4gYXV0b2J1aWxkZXJzPwo+IAo+IEFzIHlvdSdyZSBwcm9iYWJs
eSBhd2FyZSB0aGVyZSBpcyBub3Qgc3VjaCB0aGluZyBhcyBhICJzdGFuZGFyZCIKPiBjb25maWd1
cmF0aW9uIGZvciB0aGUgYXV0b2J1aWxkZXIgd29ya2Vycy4gRWFjaCB3b3JrZXIgaXMgdXNpbmcg
aXRzIG93bgo+IGRpc3Rybywgd2l0aCBzb21lIHNldCBvZiBpbnN0YWxsZWQgcGFja2FnZXMsIGRl
cGVuZGluZyBvbiB3aG8gcnVucyB0aGlzCj4gd29ya2VyLiBTbyBzb21lIG1heSBoYXZlIC91c3Iv
YmluL3dheWxhbmQtc2Nhbm5lciBpbnN0YWxsZWQsIHNvbWUgbWF5Cj4gbm90Lgo+IAo+IEFuZCB0
aGlzIGlzIGFjdHVhbGx5IGEgX2dvb2RfIHRoaW5nLCBhcyB3ZSBkbyB3YW50IGEgdmFyaWV0eSBv
ZiBob3N0cwo+IHN5c3RlbXMgdG8gYmUgdXNlZCBmb3Igb3VyIHRlc3RpbmcuCgpJJ20gdG90YWxs
eSBhZ3JlZS4gSXQncyBqdXN0IGEgY29tbWVudCBhYm91dCBob3cgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZSBlYXNpbHkKdGhhdCBjb3VsZCBiZSBhZGRlZCBpbiB0aGUgY29tbWl0IGxvZy4gSSdtIGZp
bmUgd2l0aCB5b3VyIHBhdGNoLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRob21hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
