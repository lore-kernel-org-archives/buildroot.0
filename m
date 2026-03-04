Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A331EFCE2A
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357DB40C0A;
	Wed,  4 Mar 2026 18:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fM9j1i0TwLFh; Wed,  4 Mar 2026 18:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD7740C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772647708;
	bh=N8GWjOMQUlllHp0+ecBmqhAPcjwav+gCW8uH1478T20=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hChLPsRmkHYEGdUE0m1SHUyQHD5sBsEFOHfGGiTo7xcqzwrbW1v/psz86oTr/U0zz
	 vSeNEyHSpqsTjO284hzuOUtLmvSJv++0/Njcy2KR2nqYSoDtfM0zJm58tJX7nI0Dbp
	 OiiAnXTZ+T+3scI9ZCqC2+joxW/ExVWQ4pwKFZ1Ut3FfkEzXl6k7N0P4YlKJ/yezT9
	 sLJaODX0I0T7n8Sml4JIWsL8Accxaa4sTOrvtkyc4cXIP1UZTjs2QnpNyrNt7HKi4t
	 2FRL1DtJ4Wm+DpigXgSkaxnAI2No+7smEBax8rmcO0H/M5N4cPMaMMzlQVYG3u6kBn
	 iLl70mjgD+DpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD7740C02;
	Wed,  4 Mar 2026 18:08:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91DB41EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E1460B24
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8dBtI5FHI_h for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACDD960B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACDD960B21
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACDD960B21
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:08:25 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-40f387a688dso1738408fac.0
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 10:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772647704; cv=none;
 d=google.com; s=arc-20240605;
 b=LYoV8Yo8ScDZKr05UB1/I54f7nWrPQDvs0gYz1sh6OFW/vlZfKsqm9L4W42sdPvNcE
 iYkKw8KALumzqj1f5HI2j5Izpk0cIjBBUQcqbib6d1y2tY+f3s6mWCVwgShoe3VkJtZM
 z67JBcqUSuznSPtnocV3EsOt8BKe4QRS5uAGsFxheacrxTOudKNKJaNvWMHzZaxqaKJt
 RJ/9R0K1+ar8AX13k05LU149lWEnwphC+FgwhPmjVOzFfZ1iH7Vu8hKFo0l4P3Mz+6c3
 9wR4w9M2Rl5kvu5T+enj9tLkttLrPNYbPxVxRifKGBat5/wVbRoPORvGKiFixW4lVQOS
 c0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZT325wFxBtgJzfiWj5BMgkmZf2ZHaq2eLOWdqVbjKig=;
 fh=t109lWVKkCtWRxFZrah/iuXaqNyg9EGqwBxGKsSJvEI=;
 b=fTb4iXT0bco7G3He/0D8ESUCaGmx19lB5JH7ruCAws5mZWvIXYKg9hnYxpCxov8g4t
 Tqha2u4CEh8fI2RiktZtx0ErMiYqaSPnIxt/uKyKj/JcKN/t8D7qiyGnb0BPp2+TYV6e
 d1tOqnSJTDHGkfs2QY9MSFhK3tFalm0nHrXH8cvqRrbW45p8spJxw5WgP68C1DQUB8fy
 RRmRBGw8L3JqDF8j5Uu1sw9qMTq+zmtMJAzIG0CA7Bf+ZjzUdnD/JtS0fGO+vNHV3peq
 c3zDt7QmcERdcV/sbjOpyLmF0S98LpwsqZkY60YeTmgXdWaLB8P+IIYSstXdiueA9Tfk
 GiqA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772647704; x=1773252504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZT325wFxBtgJzfiWj5BMgkmZf2ZHaq2eLOWdqVbjKig=;
 b=Zaj/IzlJk1Y3SFNfZ9FY8Pfk++L7FNGQZC1OibXOwCUlb42riASuSHCQmvl/P+LnMh
 sJP8wy5SpSRIDlme1dv6JH1erYjWP8RpPaqWXbXqG2SON42wQpzvFun6akxwL7PIrNRY
 zZQ+Jxj1qvkbONEawZvKwatMSPpswgyKXdPcVtL/+pzqxT37ua8EnPCtfPnceoQNMJ9J
 YIL+FEhLR39iC7mGXk8NS/rTMAUYRMZiZO+Ma6rAUx2YNxlX7x6oGMb3zuqlRnZNrmOw
 NDRX3h5DqTYYOQA77nkacjGNUdMnaMxtT3yqAeIorwIrV1JnteNq/Wq8pULanAaPXwy6
 0K0w==
X-Gm-Message-State: AOJu0Yzc+LkJxhZKPMIHK7WExAolm8DwT2oimD/Uhi5d0ikbClamn68G
 Omu2Pr5Kkq8ON+BjFEmsd0jQMogn42arPQH1eiqGKtsbVx5+Ne5X/avdcFvkAHlpkNnkR+Q8eIw
 Q/k0Uat34x56syzIQOAPofyQmHO1LrgU4/H27QhY=
X-Gm-Gg: ATEYQzyR+gGnqRPfN2vD3kGIHlv59+6gVko4Ext0gjQwyuS4INXwhPkklWcaZ9fnszm
 4Zq62X+AR2GUCTf/H1GyofYmecobdW2FQ2V2FhH74/ITa5hXOMdew9M+tCdwzcY0Fof4osrWMJ4
 q7hp4s3YvWLY7cpJYQrW8U9YH6TV3Ztw4w30FwtG5+E2eCTiFiCH1fiBZjtoxhKJKiuCZ6UbuOm
 w4j6xoGYpTwKcuC6T0lC3Qc7CWoajvLo/TYoITrzHao0x0Xbob9fofIG4QZOHNqsFRDLCZcdlX5
 DE4Uzw==
X-Received: by 2002:a05:6820:4b18:b0:67a:422:d34 with SMTP id
 006d021491bc7-67b1e923265mr1518212eaf.74.1772647704496; Wed, 04 Mar 2026
 10:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
In-Reply-To: <20260222134120.1893854-1-chakrabortyshubham66@gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 4 Mar 2026 10:07:48 -0800
X-Gm-Features: AaiRm52knJF2Jd7htxpm6RWAWBvVC_eB3RuBJ4eoZ3se9H29d1Yq7yFRzGyLcz0
Message-ID: <CAMWSM7jutCFFqu1m7U35cch-vzcPCWjjhF_ZxfBfOHg9s5we=g@mail.gmail.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, andrew.smirnov@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772647704; x=1773252504; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT325wFxBtgJzfiWj5BMgkmZf2ZHaq2eLOWdqVbjKig=;
 b=Z/STvff5xlmP1GFoOYpqgmuwGTl9hIp8SE0KN21XlMCgw0xPFjfAop+hGU26Fv56+F
 S/Tt6rc9ODiE/JAGv87NaTRCAuBmjo81ZNkMq0BDmEMEbPjj2rgYHKKcE1GdSUcDDmIC
 JqP+ClwOcYqDEHsYymt8mC586uMAdEkuiUgJgX7UWeh5m7yWKbQ9K3d0+9502mNJBzHm
 Pf1i3D/uSSLiNYi0rSwpP7sl671mGGWxPIzVsH4ReGmVVcGeU1upNqfcx+fv2bC/XzwR
 nonICD2y+pcXm9zBXXQ4d2jZH0ZycCBSqGINUayO4iZOrj7FAk7IlcruO0NsoUbVP6yf
 oMag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z/STvff5
Subject: Re: [Buildroot] [PATCH v1] package/zstd: add pzstd support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIEZlYiAyMiwgMjAyNiBhdCA1OjQy4oCvQU0gU2h1YmhhbSBDaGFrcmFi
b3J0eQo8Y2hha3JhYm9ydHlzaHViaGFtNjZAZ21haWwuY29tPiB3cm90ZToKPgo+ICtjb25maWcg
QlIyX1BBQ0tBR0VfWlNURF9QWlNURAo+ICsgICAgICAgYm9vbCAicHpzdGQiCj4gKyAgICAgICBk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFBac3RhbmRh
cmQsIG9yIHB6c3RkLCBpcyBhIG11bHRpLXRocmVhZGVkIGltcGxlbWVudGF0aW9uCj4gKyAgICAg
ICAgIG9mIHRoZSBac3RhbmRhcmQgKHpzdGQpIGNvbXByZXNzaW9uIGFsZ29yaXRobS4KPiArCj4g
K2NvbW1lbnQgInB6c3RkIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcyIKPiArICAg
ICAgIGRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUwo+ICsKCkknbSBzZWVpbmcgYnVpbGQgZmFpbHVyZXMgb24gbXkgZW5kIHdpdGgg
Ym9vdGxpbi1taWNyb2JsYXplZWwtdWNsaWJjCmFuZCBib290bGluLXNwYXJjLXVjbGliYyB0b29s
Y2hhaW5zLgoKL2hvbWUvam9zZXBoL2JyLXRlc3QtcGtnL2Jvb3RsaW4tc3BhcmMtdWNsaWJjL2hv
c3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvc3BhcmMtYnVpbGRyb290LWxpbnV4
LXVjbGliYy8xNC4zLjAvLi4vLi4vLi4vLi4vc3BhcmMtYnVpbGRyb290LWxpbnV4LXVjbGliYy9i
aW4vbGQ6ClB6c3RkLm86IGluIGZ1bmN0aW9uIGBwenN0ZDo6QnVmZmVyV29ya1F1ZXVlOjpwb3Ao
cHpzdGQ6OkJ1ZmZlciYpJzoKUHpzdGQuY3BwOigudGV4dC5fWk41cHpzdGQxNUJ1ZmZlcldvcmtR
dWV1ZTNwb3BFUk5TXzZCdWZmZXJFW19aTjVwenN0ZDE1QnVmZmVyV29ya1F1ZXVlM3BvcEVSTlNf
NkJ1ZmZlckVdKzB4MTU0KToKdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hdG9taWNfZmV0Y2hf
c3ViXzQnCi9ob21lL2pvc2VwaC9ici10ZXN0LXBrZy9ib290bGluLXNwYXJjLXVjbGliYy9ob3N0
L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL3NwYXJjLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvMTQuMy4wLy4uLy4uLy4uLy4uL3NwYXJjLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmlu
L2xkOgpQenN0ZC5vOiBpbiBmdW5jdGlvbiBgcHpzdGQ6OkJ1ZmZlcldvcmtRdWV1ZTo6cHVzaChw
enN0ZDo6QnVmZmVyKSc6ClB6c3RkLmNwcDooLnRleHQuX1pONXB6c3RkMTVCdWZmZXJXb3JrUXVl
dWU0cHVzaEVOU182QnVmZmVyRVtfWk41cHpzdGQxNUJ1ZmZlcldvcmtRdWV1ZTRwdXNoRU5TXzZC
dWZmZXJFXSsweDE0KToKdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hdG9taWNfZmV0Y2hfYWRk
XzQnCgpJdCBsb29rcyBsaWtlIG1heWJlIHpzdGQgaXNuJ3QgbGlua2luZyB0byBsaWJhdG9taWMg
aGVyZT8KCkJlc3QgcmVnYXJkcywKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
