Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF26FCD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ACA741B3B;
	Fri, 15 May 2026 14:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rudFQXIwrs-S; Fri, 15 May 2026 14:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13D04178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778854918;
	bh=wmaXgWmetDLPlFl1YQdb6Y/Um1Xp4oU9k8aA8SakQX0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AKtxcu+q3C3yei0mUxtVFOv4SzOMGS36HrjOkbM7gcFhW02qA0ht+9c3+PUdwRdcL
	 Vf2Pkp/9TGmXJMemTcJs8aHGuhwsFx/h2+XN5ruMd+skq3UyJd7fm2kuU/sagHPdLr
	 VIrIwiKMXijVsaeeWenHanuWYgIEaqdlL2RsN11ii7TvfcEwWqv40NG42qJvY6THjb
	 cGRA0bnMn0y3KCMRcryjWidSbARumpyC192CHlyW3D6f6/xABV1Jd/cvIfo+WA6Dbf
	 UcBXWVP2etINPU9aF9Nr+CI+HaHjlT0LlF6HMgb0RKhJb1i84RqWEcGquSy6kcBaL9
	 XVKQDvIpvl/ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13D04178D;
	Fri, 15 May 2026 14:21:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5893E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAEB684274
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9CHXcm_AXMM for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80DCF84273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DCF84273
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DCF84273
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:21:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so663442f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 07:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854914; x=1779459714;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kv5b8PpE0Shv+ONpxwAo05Enzk8xMKF6gwRlHSFN/Pg=;
 b=EupAeeVIwFteDAQpYbN5ugUGzVAVYM20EgfZ68viGUG0ETA3R8vkm1ChQCT/l96mIi
 g5T0esq36g3jupLXhilo0O7yMDPkTTVNk3lP+muituEAxknP3S1bFhjIn0DCmRXKdG15
 Z5DpnCJtWM2Z0pG2q28dv38imOFLiVrVgLHr4D7NM2rF7BpHlGUmVEk8KmmeRraKCAE9
 yPLuE/1S6banRvzgJ4cHhGj4swtGclHb3cItjsRti35Zuv3Abw6PZBwt0ucrXg3W5DnC
 kpaZrwWMDGdTof8S6Y0qzDxuXYgwd3ih48UiN8fGbfgyGZy3cd7tQMTee7OtTTM5sXtQ
 qu2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/b2SCdlzSblPcxc5L1iPFwe5HVS/vyJPCDKZ/FfuLVzAeBeLzxf+WnTrUue6Ezt3gtyKAlIjl/TcM=@buildroot.org
X-Gm-Message-State: AOJu0YxMQIOhM+eRctNRPn3nq9CH7UC22pkYcJmclaCA/JgoQYufO0rz
 5A+MK4CV3dedm5+EFtyOPRXiViH0k174egMHuJEA2Qg/cDuE2UsNHH/uyBVDOjvejFU=
X-Gm-Gg: Acq92OH2rMWfSEZMnXfumO95bJmW+0fkQAF0r7E0/zTgEe3jCk8xho2hcxmryLZEeRZ
 ueZAkoc1bYQX8d9LjjPKUXzS3JddKACGj2ezuPVsneJz3/PG/oj9NEzjUitMHm9i5Ob99SJVcTU
 UFreZ7MRmeHuH/3fZ4/5oD5n9mRN6Djiy6jDKhgSTTIhQ+NzkAM0tnFpJ3Var6QTWmt2A30wu5d
 0hBpADoDUcNL6SzHj5N5qgglor5NOwOoOYY+s5FGUYBKrlqwdrXLqOv1ztQ4B8DWGZzNuCdc+Yk
 Exlu2fh8Ikae6wLb2zdc6sX/ECCT4Xd9gHisR8Tr0rrbirycDO8Q3BDSFfxxgz2ZuXaWT+19qjN
 SfZZgS6xRG+bJlWkzP9XxcaaXj/Tj38ElmlP8aQuoDIB397aVcO1EEVBd0z/tnzLMvmmGcpxYcB
 P2KLly058uSbBW4KrfgeTWUSklvytayaUaIbmKV/7Osiq//Bf9+NNDqDWOCdSVN4E0rs9O1W9rs
 njyUP8EmzB8qCJxQfhUh4s35+X//xwtWsfxJMRa7H4+gKgQ82rhmQp/NQqd1biC37qjvb457Asu
X-Received: by 2002:a05:6000:4b07:b0:44f:69f4:39b5 with SMTP id
 ffacd0b85a97d-45d9502e84dmr13401109f8f.29.1778854913951; 
 Fri, 15 May 2026 07:21:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d16sm15702185f8f.6.2026.05.15.07.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:21:53 -0700 (PDT)
Message-ID: <1427dfc8-0f3d-4a5e-986b-fb16241e1ea2@smile.fr>
Date: Fri, 15 May 2026 16:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20260330152036.4180595-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20260330152036.4180595-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778854914; x=1779459714; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kv5b8PpE0Shv+ONpxwAo05Enzk8xMKF6gwRlHSFN/Pg=;
 b=q8YjL31bza/Mf0R5qras2uGN37jyKzAAfQwwDyhFzgl1FEJksc9UNIqNo+2TfLHdh8
 oMwnXUO0F6/hnxLGCSjmxHEsNP9+iIclt18WalrTOhbrKclm3QLJtf3cP//eEylKMhak
 cTGBBJRWUiKzEHb+tjllQGgfaXvtra6GajFnU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=q8YjL31b
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure on big
 endian architectures
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAzMC8wMy8yMDI2IMOgIDE3OjIwLCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IEFkZCBsb2NhbCBwYXRjaCBwZW5kaW5nIHVwc3RyZWFtIHRvIGZpeCBi
dWlsZCBmYWlsdXJlIGR1ZSB0byBtaXNzaW5nIGdjbQo+IHN0dWJzLgoKSSBzZWVtcyB5b3UgdXBk
YXRlZCB0aGUgcGF0Y2ggc2VudCB1cHN0cmVhbSAodjIpLCBjYW4geW91IHVwZGF0ZSB0aGUgQnVp
bGRyb290CnBhdGNoIHdpdGggaXQ/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBGaXhlczoK
PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOTg5OWRmNWQzMWIzMmM0
MTRmOWE5MjRhZWRiMzg5MjE3YmNiOTc5Mwo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy8zNzBiOWFiMDRjMmViOGJlYTgxZDYyMTZhOGZmMThmZTE3YTZiNWJhCj4gCj4g
U2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+Cj4gLS0tCj4gIC4uLmJ1aWxkLWZhaWx1cmUtZHVlLXRvLW1pc3NpbmctZ2Nt
LXN0dS5wYXRjaCB8IDMwICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibnNzLzAwMDIt
QnVnLTIwMjc3NjgtRml4LWJ1aWxkLWZhaWx1cmUtZHVlLXRvLW1pc3NpbmctZ2NtLXN0dS5wYXRj
aAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5zcy8wMDAyLUJ1Zy0yMDI3NzY4LUZpeC1i
dWlsZC1mYWlsdXJlLWR1ZS10by1taXNzaW5nLWdjbS1zdHUucGF0Y2ggYi9wYWNrYWdlL2xpYm5z
cy8wMDAyLUJ1Zy0yMDI3NzY4LUZpeC1idWlsZC1mYWlsdXJlLWR1ZS10by1taXNzaW5nLWdjbS1z
dHUucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjIyMzA3
YTk2YjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJuc3MvMDAwMi1CdWctMjAy
Nzc2OC1GaXgtYnVpbGQtZmFpbHVyZS1kdWUtdG8tbWlzc2luZy1nY20tc3R1LnBhdGNoCj4gQEAg
LTAsMCArMSwzMCBAQAo+ICtGcm9tIDFlNzhjMjQxNmE2NWEzYjAwZWQ0ZjBkODdkYWNjMDMzZWU2
NTcxOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ICtEYXRlOiBNb24sIDMwIE1h
ciAyMDI2IDE3OjA2OjE0ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gQnVnIDIwMjc3NjggLSBG
aXggYnVpbGQgZmFpbHVyZSBkdWUgdG8gbWlzc2luZyBnY20gc3R1YnMgaWYKPiArIG9uIGJpZyBl
bmRpYW4KPiArCj4gK0xldCdzIGd1YXJkIGdjbSBzdHVicyBhbHNvIGlmIGFyY2ggaXMgQmlnIEVu
ZGlhbi4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2J1Z3ppbGxhLm1vemlsbGEub3JnL3Nob3df
YnVnLmNnaT9pZD0yMDI3NzY4Cj4gK1NpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ICstLS0KPiArIG5zcy9saWIvZnJl
ZWJsL2djbS5jIHwgMiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbGliL2ZyZWVibC9nY20uYyBiL2xpYi9mcmVl
YmwvZ2NtLmMKPiAraW5kZXggOTk0MDcyYWNhNC4uYzJmYTY4NTI5MSAxMDA2NDQKPiArLS0tIGEv
bnNzL2xpYi9mcmVlYmwvZ2NtLmMKPiArKysrIGIvbnNzL2xpYi9mcmVlYmwvZ2NtLmMKPiArQEAg
LTM1LDcgKzM1LDcgQEAgU0VDU3RhdHVzIGdjbV9IYXNoTXVsdF9zZnR3KGdjbUhhc2hDb250ZXh0
ICpnaGFzaCwgY29uc3QgdW5zaWduZWQgY2hhciAqYnVmLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBjb3VudCk7Cj4gKyAKPiArIC8qIFN0dWIgZGVmaW5pdGlv
bnMgaWYgd2UgYXJlbid0IGxpbmtpbmcgYSBwbGF0Zm9ybS1zcGVjaWZpYyBnaGFzaCAqLwo+ICst
I2lmICFkZWZpbmVkKEhBVkVfUExBVEZPUk1fR0hBU0gpCj4gKysjaWYgIWRlZmluZWQoSEFWRV9Q
TEFURk9STV9HSEFTSCkgfHwgIWRlZmluZWQoSVNfTElUVExFX0VORElBTikKPiArIFBSQm9vbAo+
ICsgcGxhdGZvcm1fZ2hhc2hfc3VwcG9ydCgpCj4gKyB7Cj4gKy0tIAo+ICsyLjQ3LjMKPiArCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
