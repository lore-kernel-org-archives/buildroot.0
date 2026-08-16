Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD7C5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 16:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB9840568;
	Sun, 16 Aug 2026 16:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPuRq5kUhgl2; Sun, 16 Aug 2026 16:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C049440569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786898182;
	bh=s+W1lZzWPgmwXB9euniZ7PfWkeEs/3hmvToQhnV4FMM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Svib3EA4EeWirP8mxWwz+vXoJ6BnCRh0An0Ru3YWwwqgGGMYUr7mVPCsSRGzbaqUl
	 RDRU+atrjnZFGKfBkLbDOIgl+scYecXOHDPDvjV5Pa0m654vLFXPqTZtzTe+1bYlIq
	 cpGrIXgKB+Phb191LjinAgvQpST44yIVuR5ZsiniHzD1wf9WTZCBtoQgiZUGkx/9Eb
	 z/gZlTZ3ZhIESAr5rE0s498w3S8iQzil3AuCoRBzz0JDIzYJaQvZgQbgIXmrSzOPBC
	 3nSnoPaxLGySc939est8YSprILxIpok8ZjnoSZBA4iEVnRXEnLIvc/nOcTWyWr2yU7
	 6glZmdpF6x10w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C049440569;
	Sun, 16 Aug 2026 16:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30C643A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 171B540077
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a00BG-WD0udn for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 16:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 148F540076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 148F540076
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 148F540076
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 16:36:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso25345965e9.3
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786898179; x=1787502979;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GQ2t0ZSYXrVizlHeuQMcbOeF5KBb+1pGtw4vJojd0C8=;
 b=lh76tPBi6QqBmIWQOBF63mpzlvgZWssWGVcN2FU9hJaAqm5FhDuPlSqIvVQ1ns6aQX
 mMZTSxsfDEYmb7UzE9TpbsceW5CLD+FVk/Ds0CHf37vMWQEGbodKgwnvboD3n8YtkxmA
 YPuofoDFtKNtq5UE0JfXFnuRQQLqOdlsu7NdeF0+T+0skDvtPEg+smSOF19DXSVZ5Wk5
 bsdjrwoQrsKHfcjza6DvQWbKSWbL9ATvDBNaR7ecimcgLDqTR3MYoV3l3uwuMzPP4mY/
 eBBVMhDce3QxaDXH5F+OG6BUhbb2nJy7tZcaoUtGe6V7ZB5Bm6FmDMfuSMzotAIzkG6A
 BhgA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXWxW/ogvT/zS7uDaHUic53w2jwVzzdy8ZY0I1xnVpCCWPrhxGs9pa32g8h8rjb6JX6v0c9I4pLCU=@buildroot.org
X-Gm-Message-State: AOJu0YyRoy9HoK0yaypimAWqBHa8OpIOEWbNaNL10Zf3yniLeoouFxVC
 jj3+Oa8WJFEird+JmPlN42fZrAYXfTcd/YDeRw/+xlZH9tGeQXY4CmN5V/C+JHeUpiTpuvI4Ugu
 yBcQaa8A=
X-Gm-Gg: AR+sD10TDLOxNbgKsmwSwC69PYVw1y49hB1HN7ka8O51ORAnhCypPEGaOIyoFopEvnX
 rU/la7a1fP7zqHSZl/E+AVa/X7rOxOMV2f+0mL9jVdtWq23G2K/Fkx9vgsdRWbad1Mn64AWMRnG
 xcbj9auqb0NkLqPsO4tGNDj4Q/ejj6FYEJ33FUWdl2/gnHz8pKhozV0KFCYqF/LBoMgVqZuIk3C
 HtYP5igSrQVrJJ1hyMDsNUxMvUYoxVTYCvMMLBWF2ns37xuhHUEVsNSgvV6udLcyx+61VGQHwG6
 BT8e17mrG+UCDYf8bjFM4qtvvmCsCD+REBQFaGjOIcWfnDwQ6A4VQG9U4f4XJmGpgoDASqthmmy
 7NlXavsVj4EqP1r4uk/RwLGRSwn+Sc5wEU8VmB2oDoSCBWEmqUZ7Yw4xzTYy9jwmd6wB0WuVutf
 MO1rtTJfDRMO9vJChv4iU2R0x9giKnZ35bczwZY9al5BCr99QlOhzW+L+rrW3jHU1OUuZVZdtl7
 RZ869L3a93JVt+YagmOogLuoPPS/oKS6KFkM98wCiRy19DLjWbTeLBz4gr4PWtVUH0MUuwlSoWL
 LmBZGk3H4IDxeN4T54gxn6sIdeM=
X-Received: by 2002:a7b:c4d2:0:b0:499:8191:62c7 with SMTP id
 5b1f17b1804b1-499879b38dcmr229409305e9.18.1786898178746; 
 Sun, 16 Aug 2026 09:36:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777caebsm218190755e9.0.2026.08.16.09.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 09:36:18 -0700 (PDT)
Message-ID: <aaef4695-4de2-4292-9185-ef021f099c70@smile.fr>
Date: Sun, 16 Aug 2026 18:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Ford <aford173@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20260710133225.484041-1-aford173@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260710133225.484041-1-aford173@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/mesa3d: add intel-virtio host
 native context config
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

SGVsbG8gQWRhbSwgQWxsLAoKTGUgMTAvMDcvMjAyNiDDoCAxNTozMiwgQWRhbSBGb3JkIGEgw6lj
cml0wqA6Cj4gQWRkIEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZF
Ul9JTlRFTCBpbiB0aGUgc2FtZQo+IHBhdHRlcm4gYXMgYW1kZ3B1LXZpcnRpby4gV2hlbiBlbmFi
bGVkLCAtRGludGVsLXZpcnRpby1leHBlcmltZW50YWw9dHJ1ZQo+IGRlZmluZXMgSEFWRV9JTlRF
TF9WSVJUSU8gc28gdGhlIGd1ZXN0LXNpZGUgSW50ZWwgbmF0aXZlIGNvbnRleHQKPiAoaTkxNSBh
bmQgeGUgY29udGV4dCB0eXBlcykgaXMgY29tcGlsZWQgaW4uIFRoaXMgaXMgdGhlIGd1ZXN0IGhh
bGYKPiBvZiB0aGUgSW50ZWwgdkRSTSBHUFUgcGFzc3Rocm91Z2ggcGF0aCwgdXNhYmxlIGJ5IHRo
ZSBjcm9jdXMvaXJpcwo+IChPcGVuR0wpIGFuZCBBTlYgKFZ1bGthbikgZHJpdmVycy4KPiAKPiBO
b3RlIHRoYXQgdGhpcyBpcyBhbiBleHBlcmltZW50YWwgTWVzYSBmZWF0dXJlICh0aGUgdXBzdHJl
YW0gbWVzb24KPiBvcHRpb24gaXMgbmFtZWQgaW50ZWwtdmlydGlvLWV4cGVyaW1lbnRhbCkgYW5k
IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxh
Zm9yZDE3M0BnbWFpbC5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IGluZGV4IGUxODQwMzkxNTAuLmFkMDJi
NWU4MjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gKysrIGIvcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gQEAgLTEzMCw2ICsxMzAsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0NST0NVUwo+ICAJYm9vbCAiR2FsbGl1bSBjcm9j
dXMgZHJpdmVyIgo+ICAJZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCj4gKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+ICAJaGVscAo+
ICAJICBNZXNhIGRyaXZlciBmb3IgZ2VuNC03IEludGVsIEdQVXMuCj4gIAo+IEBAIC0xNjcsNiAr
MTY4LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9JUklTCj4g
IAlib29sICJHYWxsaXVtIGlyaXMgZHJpdmVyIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9N
RVNBM0RfTExWTQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUgo+
ICsJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX1NVUFBPUlRF
RF9EUklWRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfUFJFQ09NUF9DT01Q
SUxFUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklW
RVIKPiAgCWhlbHAKPiBAQCAtMzkzLDYgKzM5NSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNB
M0RfVlVMS0FOX0RSSVZFUl9JTlRFTAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURF
UlNfQVRfTEVBU1RfM18xNyAjIG1lbWZkLmgKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9V
U0VTX0dMSUJDICMgaWZ1bmMsIHN0YXRpY19hc3NlcnQKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfTUVTQTNEX0xMVk0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVf
Q09OVEVYVF9TVVBQT1JURURfRFJJVkVSCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX05F
RURTX1BSRUNPTVBfQ09NUElMRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FO
X0RSSVZFUgo+ICAJaGVscAo+IEBAIC00NTksNiArNDYyLDIyIEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9EUklWRVJfRlJFRURSRU5PCj4gIAkgIFNlbGVj
dCB0aGlzIHdoZW4gcnVubmluZyBNZXNhIGluc2lkZSBhIHZpcnR1YWwgbWFjaGluZQo+ICAJICB3
aXRoIHZpcnRpby1ncHUgaG9zdCBuYXRpdmUgY29udGV4dCBzdXBwb3J0Lgo+ICAKPiArY29uZmln
IEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZFUl9JTlRFTAo+ICsJ
Ym9vbCAiaW50ZWwtdmlydGlvIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
TElVTV9EUklWRVJfQ1JPQ1VTIHx8IFwKPiArCQlCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9E
UklWRVJfSVJJUyB8fCBcCj4gKwkJQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfSU5U
RUwKPiArCWhlbHAKPiArCSAgRW5hYmxlIFZpcnRJTyBzdXBwb3J0IGZvciBJbnRlbCBuYXRpdmUg
Y29udGV4dHMKPiArCSAgdXNlZCBieSB0aGUgY3JvY3VzL2lyaXMgKE9wZW5HTCkgYW5kIEFOViAo
VnVsa2FuKQo+ICsJICBkcml2ZXJzLgo+ICsKPiArCSAgVGhpcyBpcyBhbiBleHBlcmltZW50YWwg
TWVzYSBmZWF0dXJlIGFuZCBpcyBkaXNhYmxlZAo+ICsJICBieSBkZWZhdWx0Lgo+ICsKPiArCSAg
U2VsZWN0IHRoaXMgd2hlbiBydW5uaW5nIE1lc2EgaW5zaWRlIGEgdmlydHVhbCBtYWNoaW5lCj4g
KwkgIHdpdGggdmlydGlvLWdwdSBob3N0IG5hdGl2ZSBjb250ZXh0IHN1cHBvcnQuCj4gKwo+ICBj
b25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RS
SVZFUgo+ICAJYm9vbAo+ICAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
IGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gaW5kZXggOGU2YzJlZTViOC4uODczNzdiN2Nl
NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiArKysgYi9wYWNrYWdl
L21lc2EzZC9tZXNhM2QubWsKPiBAQCAtMTY0LDYgKzE2NCwxMiBAQCBlbHNlCj4gIE1FU0EzRF9D
T05GX09QVFMgKz0gLURhbWRncHUtdmlydGlvPWZhbHNlCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZFUl9JTlRFTCkseSkK
PiArTUVTQTNEX0NPTkZfT1BUUyArPSAtRGludGVsLXZpcnRpby1leHBlcmltZW50YWw9dHJ1ZQo+
ICtlbHNlCj4gK01FU0EzRF9DT05GX09QVFMgKz0gLURpbnRlbC12aXJ0aW8tZXhwZXJpbWVudGFs
PWZhbHNlCj4gK2VuZGlmCj4gKwoKTG9va3MgZ29vZC4KCkpvc2VwaCwgc2luY2UgaXMgcmVsYXRl
ZCB0byBtZXNhIHZpcnRpbyBzdXBwb3J0IGNhbiB5b3UgaGF2ZSBhIGxvb2sgdG9vPwpUaGFua3Mh
CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKPiAgaWZuZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1f
RFJJVkVSX0ZSRUVEUkVOTykkKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0ZSRUVE
UkVOTyksKQo+ICBNRVNBM0RfRlJFRURSRU5PX0tNRFMgPSBtc20KPiAgaWZlcSAoJChCUjJfUEFD
S0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9EUklWRVJfRlJFRURSRU5PKSx5KQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
