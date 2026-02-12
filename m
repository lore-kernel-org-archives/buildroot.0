Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA7EEEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6593540B56;
	Thu, 12 Feb 2026 19:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEhVKqjcZHaF; Thu, 12 Feb 2026 19:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5ED40B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770922981;
	bh=sQ4Duma8qe0IVcqQXL8DBx5yTCvHdbMK5e82aKW5NLw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iQrkeu5TvZO74Z7C7JOzJ6Edmneho99R9frbVIoXbR115Nj0CF6m1T68JVgJjjN3t
	 VchcnJJjfd0f5i88TvmxEeU4eTU8KzfFFWA9ywIMyK+7owdb3gQJdJsB2p8IrPs6AZ
	 8GxUyFZ67Isf2nzuOWsFuTf/a9a7s8zGYaQStJj6U80i7rnCObp4OFwwJQ9HbngHkF
	 T/H269BDzU3jUH04sNCYmncE31CdP/oNhmXebd/PDVPEQ+udWnrLYI8PLsZSJAtj7w
	 ff183/1VUqmMzhTFwEBmxnusfLfY926iNDtP46rIHF8mFIHkzAtvEDVAzaAaEdRs4o
	 4+7YG5tB2SQnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5ED40B02;
	Thu, 12 Feb 2026 19:03:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CACEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE10E60AEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5V-wWijASVk for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2FA960A87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2FA960A87
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2FA960A87
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:02:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so904255e9.1
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770922976; x=1771527776;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SSzFGTxwvHhB0JgDExG/jfy+40/rsuS6/BzrfnLQTlg=;
 b=LGrYFbYH3UbxZwC7Rx5jMAjuEs4escLZNFNmZNrVvGOlXQ0FW7kKxHZqa8MUFQ5XnW
 pIuvUtTyOYdQ7INdElJOPUIvq+PY0rcEhl849oTaUTxbfrhBWwBlGMll+LM1bnvj+u0t
 IUz9U7+B9P1GnMuIBzEMWpWAfVUqlJGN+yirWc2CDEGv8Ea1F/vnpE3JFQe0wT0/deNq
 jE3jkWmMj3HCHEsogpaDuSOlxw5U5O3HSeSE8vL5J+wL2+I7T51inZ0o7wTv3UwRGZpY
 6+ig3jcIkn+hUQmpOYJuVbH37ByOvIpgIropOZ8yNUq6JhWwe9CnJJq2Wq6j0DIrZBLC
 /g6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/YFAIVBSaQOLFN0EoSABWfftiyQSfQqCGGCNHyYsb1hoByMu0dDqy9KWNE6MDnhEzpsNfH1TytUY=@buildroot.org
X-Gm-Message-State: AOJu0YySWbtmIefGZlc5zusLHTJYP9cQwE+ctu2KkQNwASZp+toSfWTM
 +7MjTddcRxQbQsxancclNQrOgtVzuUNZ43XZ+9zLaDoJMJmoVdULb5j5aYaIeGMYc2c=
X-Gm-Gg: AZuq6aKgZXbSwuLJvRMCgQsf1PtICJU39FiD2N29kuWXOjQ3UN5XMZEX7QQGn0ucCiI
 7NAa21kQnTS5t+PoFcRy/mjAaRI1Ri/miQPIJErwU2SyUde6i4BgdHJAyrrEUJlnZzNnmYcOKNx
 NKSQ+fOIm/cZI2oSUrTBem43sfdE3rtDjFAVWL0irxWJcqkrVgiJ2+XUwj0ODkF9W7jRfZfvCqL
 PfsLOxdGnLFXOlSk59s8iHoPJLIXNzIT0roimE3pwIPjSS6SAOjtXb097gl1pQxlTLMYKAL23Bd
 UaSA2k/QvwCZuDIfjJJ1vwNJatwz6yuM8aKODG8pEGDICu5TV1xfgmzX54rvfyYl6tKzK9be1Xx
 X85m23oxKKbYPOfHZF7ZHUkBQc9DAkjO5yrgG9XkMIH48xIghcOKqQaKo7H5f4u3A98tZp+7T8R
 hJSHSl3HwUTb4VFu2+YxBXRRlwpsWibtWeg+tXoCRIooOTcTlb/kpsySDmAssapBIZCe9RSwI0r
 qrTbKdbgyvpJ0zTbOf5r0ps0rbGjMpkbykrYSzYxOqCDBSAPbMYQxLkYWMS1ptcCQ==
X-Received: by 2002:a05:600c:1d99:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-4836603adfdmr62192735e9.16.1770922976486; 
 Thu, 12 Feb 2026 11:02:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a78c89sm5006835e9.5.2026.02.12.11.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 11:02:56 -0800 (PST)
Message-ID: <badd479f-f2e3-43eb-8271-e142c9426724@smile.fr>
Date: Thu, 12 Feb 2026 20:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
 <20251203-virglrenderer-v2-v2-2-2846fc1a579a@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20251203-virglrenderer-v2-v2-2-2846fc1a579a@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770922976; x=1771527776; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SSzFGTxwvHhB0JgDExG/jfy+40/rsuS6/BzrfnLQTlg=;
 b=ba6Ksc1SjdFgOFrS1Bc2+70p9Rv0WEvR5Vqo4mgrJmArHsnJzb79GAX4Vbbc1Gqzzq
 CvgFDS8025CrXiSAWQf7+ZFBT2jxS8zmzgKofSDn2vt7yBxwOzzyex0FsbL/b9jOPjnw
 mn0NQ2fbevRFpFwWqjzcCw0A7Ep/gXDvx3b9g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ba6Ksc1S
Subject: Re: [Buildroot] [PATCH RESEND v2 2/2] package/qemu: add
 virglrenderer support
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

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAwNC8xMi8yMDI1IMOgIDA1OjI5LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBBZGQgb3B0aW9uYWwgdmlyZ2xyZW5kZXJlciBzdXBwb3J0LCBhbG9uZyB3
aXRoIGVuYWJsaW5nIE9wZW5HTCB3aGVuCj4gbmVjZXNzYXJ5Lgo+IAo+IGh0dHBzOi8vd3d3LnFl
bXUub3JnL2RvY3MvbWFzdGVyL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1ncHUuaHRtbCN2aXJ0aW8t
Z3B1LXZpcmdscmVuZGVyZXIKClRoaXMgaXMgYSA0MDQgbGluay4KCmh0dHBzOi8vcWVtdS5yZWFk
dGhlZG9jcy5pby9lbi9tYXN0ZXIvc3lzdGVtL2RldmljZXMvdmlydGlvL3ZpcnRpby1ncHUuaHRt
bCN2aXJ0aW8tZ3B1LXZpcmdscmVuZGVyZXIKCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtv
Z3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmln
LmluIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvcWVtdS9xZW11
Lm1rICAgfCAxNSArKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25m
aWcuaW4gYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gaW5kZXggZmY3NDIzYmM0Yy4uZTg2ZGNm
NTdkYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9xZW11L0NvbmZpZy5pbgo+IEBAIC0xMDAsNiArMTAwLDMzIEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9RRU1VX1NETAo+ICAJICBTYXkgJ3knIHRvIGVuYWJsZSB0aGUgU0RMIGZyb250ZW5kLCB0aGF0
IGlzLCBhIGdyYXBoaWNhbAo+ICAJICB3aW5kb3cgcHJlc2VudGluZyB0aGUgVk0ncyBkaXNwbGF5
Lgo+ICAKPiArY29tbWVudCAiT3BlbkdMIGFuZCB2aXJnbHJlbmRlcmVyIG5lZWQgYW4gT3BlbkdM
IGFuZC9vciBPcGVuR0wgRUdMIGJhY2tlbmQiCj4gKwlkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0Vf
SEFTX0xJQkVHTCB8fCBCUjJfUEFDS0FHRV9IQVNfTElCR0wpCj4gKwo+ICtjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9PUEVOR0wKPiArCWJvb2wgIkVuYWJsZSBPcGVuR0wiCj4gKwlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMICMgbGliZXBv
eHkKCnNlbGVjdCBCUjJfUEFDS0FHRV9MSUJFUE9YWSBzZWVtcyBtaXNzaW5nLgoKPiArCWhlbHAK
PiArCSAgU2F5ICd5JyB0byBlbmFibGUgT3BlbkdMIGFjY2VsZXJhdGVkIGRpc3BsYXkgZnJvbnRl
bmQgc3VwcG9ydC4KPiArCSAgVGhpcyBpcyBuZWNlc3NhcnkgdG8gZWZmaWNpZW50bHkgZGlzcGxh
eSBmcmFtZXMgcmVuZGVyZWQgaW4gYQo+ICsJICBndWVzdCBvbiB0aGUgaG9zdC4KPiArCj4gKwkg
IFJ1biBxZW11IHdpdGggYC1kaXNwbGF5IHNkbCxnbD1vbmAKPiArCj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9RRU1VX1ZJUkdMUkVOREVSRVIKPiArCWJvb2wgIkVuYWJsZSB2aXJnbHJlbmRlcmVyIgo+
ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19M
SUJHTCAjIHZpcmdscmVuZGVyZXIKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOR0wKClRoZXJl
IGlzIG5vIHN1Y2ggQlIyX1BBQ0tBR0VfT1BFTkdMIG9wdGlvbi4KSSBndWVzcyB5b3UgbWVhbnQg
IkJSMl9QQUNLQUdFX1FFTVVfT1BFTkdMIi4KCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVklSR0xS
RU5ERVJFUgo+ICsJaGVscAo+ICsJICBTYXkgJ3knIHRvIGVuYWJsZSB2aXJnbHJlbmRlcmVyLCBl
bmFibGluZyBHTCBhbmQgVnVsa2FuCj4gKwkgIHBhc3N0aHJvdWdoIGZyb20gdGhlIGhvc3QgdG8g
dGhlIGd1ZXN0IHRocm91Z2ggdmlydGlvLWdwdS4KPiArCSAgVGhpcyBlbmFibGVzIHRoZSBndWVz
dCB0byBoYXZlIGFjY2VsZXJhdGVkIEdMIGFuZC9vciBWdWxrYW4uCj4gKwo+ICsJICBSdW4gcWVt
dSB3aXRoIGAtZGV2aWNlIHZpcnRpby1ncHUtZ2xgCj4gKwo+ICsJICBodHRwczovL3d3dy5xZW11
Lm9yZy9kb2NzL21hc3Rlci9zeXN0ZW0vZGV2aWNlcy92aXJ0aW8tZ3B1Lmh0bWwjdmlydGlvLWdw
dS12aXJnbHJlbmRlcmVyCgpTYW1lIGlzc3VlIHdpdGggdGhlIGxpbmsuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9GRFQKPiAgCWJvb2wgIkVu
YWJsZSBGRFQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRFRDCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBpbmRleCBmZGM4NTkxZTU0
Li4wNTI2N2RlNWU3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gKysrIGIv
cGFja2FnZS9xZW11L3FlbXUubWsKPiBAQCAtMjYxLDYgKzI2MSwyMCBAQCBlbHNlCj4gIFFFTVVf
T1BUUyArPSAtLWRpc2FibGUtdXNiLXJlZGlyCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9Q
QUNLQUdFX1FFTVVfT1BFTkdMKSx5KQo+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtb3BlbmdsCj4g
K1FFTVVfREVQRU5ERU5DSUVTICs9IGxpYmVwb3h5Cj4gK2Vsc2UKPiArUUVNVV9PUFRTICs9IC0t
ZGlzYWJsZS1vcGVuZ2wKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfUUVNVV9W
SVJHTFJFTkRFUkVSKSx5KQo+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtdmlyZ2xyZW5kZXJlcgo+
ICtRRU1VX0RFUEVOREVOQ0lFUyArPSB2aXJnbHJlbmRlcmVyCj4gK2Vsc2UKPiArUUVNVV9PUFRT
ICs9IC0tZGlzYWJsZS12aXJnbHJlbmRlcmVyCj4gK2VuZGlmCj4gKwo+ICBpZmVxICgkKEJSMl9T
VEFUSUNfTElCUykseSkKPiAgUUVNVV9PUFRTICs9IC0tc3RhdGljCj4gIGVuZGlmCj4gQEAgLTMx
MCw3ICszMjQsNiBAQCBkZWZpbmUgUUVNVV9DT05GSUdVUkVfQ01EUwo+ICAJCQktLWRpc2FibGUt
bWVtYmFycmllciBcCj4gIAkJCS0tZGlzYWJsZS1tcGF0aCBcCj4gIAkJCS0tZGlzYWJsZS1uZXRt
YXAgXAo+IC0JCQktLWRpc2FibGUtb3BlbmdsIFwKPiAgCQkJLS1kaXNhYmxlLW9zcyBcCj4gIAkJ
CS0tZGlzYWJsZS1wYSBcCj4gIAkJCS0tZGlzYWJsZS1wbHVnaW5zIFwKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
