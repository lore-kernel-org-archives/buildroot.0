Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26BCC83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 14:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD0240BEC;
	Fri, 18 Jul 2025 14:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIv-ljlpSXVK; Fri, 18 Jul 2025 14:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F95640BE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F95640BE1;
	Fri, 18 Jul 2025 14:53:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6559A236
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B5F940BB8
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7knEnn0CbRS3 for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 14:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F2AC40BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2AC40BAD
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F2AC40BAD
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:53:38 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso1997052b3a.1
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 07:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752850418; x=1753455218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CUWcfM4r7QGxmOA4nB7XYwXhV4A3emiTtOOjz7mJz9E=;
 b=RdwNzkQ+lKSYu0hlV9EPTNk9JU0B2DbD8wtx+SpRIClOBaM0Ue8tMF5QKrGgIg3nu6
 9tZhWsBmW1Cwzgqg0x6LFAdOBMLYCX5SEUbQDgqKB9Gq9l5FitB3ebl8Sq0EKgIZUs4o
 9tvjAPahVLxcl8FtrkZT1TQyKu9SePborRahbJ1rGTliiuo4N9xv3C/6V6GqxTgQzL9n
 6be2Bd+RLj1q7JM+OnbyHIXWdWln1TabyR4on4J+pbHijSxdxCstHOL6m6vk86di9Vor
 QjCy7Ji+WBaohkiCwS2tFDZy4cuTdECOhLQQJghD2qUY26UI+/Vo2VmdylndVXcBKT/D
 TITA==
X-Gm-Message-State: AOJu0Yx2LVB0vTdZfGlm6n325XaLMWd0W9yGUF3/kQzBcdSfoei1gJQ5
 B4o4Y+QOt+0XNytYrikG3kaILvWnqHqZU5Eh+EpU7L3dl9+mewZdMU3wZIJQSw==
X-Gm-Gg: ASbGncug6tZOxF8cx+bPSh/PdAkJu8GtZHZZcdKxDZCLGPHXFd9ZEof4f6o38x0Odsz
 wSByBtyRCgXlI0UNNW0hwVK0mc7JgUM0q1HuoiwjJPsZe+x5iA5jzzpJl+yNWFR0rll1P/SV4WU
 Z3Lg5sk1e8NTQwOKvU2V6uvhXnMP7uVR9PucyOWH7Jx92FgsiPc1gWEFvfZAjZYaGA1BQtH3jqP
 CZ7n2KpAFQuxGSWMSnj6PECxFyVai/KYBXDMQrhi7VWK4MQaY8cXqA3FsKM2+J9f6QFip0isvqg
 tE9Ng3hFkaBew8E0SpAfphXjwest4moWYlVAKbXkd2/h3hL1dISv4EIpQzR+GVDVG2R3peOQfIs
 n0soeLUXj/5gndUf1TRbUDBqZ1Nr54VCPfb4=
X-Google-Smtp-Source: AGHT+IHDn23X7jrlcPNavzvSXwrDhJjrRtBoD7F65WiNFwkq3X5AxaU3MhGPoPX1vetwPsv0pvJdgw==
X-Received: by 2002:a05:6a00:a8a:b0:748:e1e4:71d9 with SMTP id
 d2e1a72fcca58-75724e7a7f9mr13122904b3a.22.1752850417520; 
 Fri, 18 Jul 2025 07:53:37 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d55c8sm1419601b3a.62.2025.07.18.07.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:53:37 -0700 (PDT)
Message-ID: <6879b51d-6ff3-4182-9650-8f1441f0b0d1@gmail.com>
Date: Fri, 18 Jul 2025 08:53:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20250417190544.1075310-1-lancethepants@gmail.com>
 <87msbb3rm6.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <87msbb3rm6.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752850418; x=1753455218; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CUWcfM4r7QGxmOA4nB7XYwXhV4A3emiTtOOjz7mJz9E=;
 b=cRaftvuQS/AvRx55mfYQIIgszVTuf4le4THKEV5Sxgg2SOpbUHohLOXC/L9N+yIaJA
 4BENqOWezr2j4Zm5xAV1lM/wkLR83pl7IKSov09BoPV3y+NZYivlmdlXIAtgcAAGkqMw
 Qhsbi/wyD8UubtP5emWHaFeEfU25DC6rmEL3SVgmSyOggzEDXmB8w4o37qpuDTA9J/TO
 377hYH4QOWeteyjO8sYiHSdHazO32dt/P2vnfDcvcs+s4tIyjmi5/zqOYMR+A+CGEp4D
 1iKfP6zFb+tgS3GJ/6HWQHQaGuGLIe8H7owu3WcN2uZppYeVufPZeGCRfS5dLtiY6wfw
 IY3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cRaftvuQ
Subject: Re: [Buildroot] [PATCH] package/libcurl: Also specify the CA bundle
 location
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBzb21laG93IG1pc3NlZCB0aGlzIGVtYWlsLgoKT24gNS8xNy8yMDI1IDI6MzIgUE0sIFBldGVy
IEtvcnNnYWFyZCB3cm90ZToKPj4+Pj4+ICJMYW5jZSIgPT0gTGFuY2UgRnJlZHJpY2tzb24gPGxh
bmNldGhlcGFudHNAZ21haWwuY29tPiB3cml0ZXM6Cj4gICA+IEZyb206IExhbmNlIEZyZWRyaWNr
c29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPiAgID4gU2lnbmVkLW9mZi1ieTogTGFuY2Ug
RnJlZHJpY2tzb24gPGxhbmNldGhlcGFudHNAZ21haWwuY29tPgo+Cj4gV2h5PyBXaGF0IGRvZXMg
dGhhdCBjaGFuZ2U/ClRoaXMganVzdCBhZGRzIHRoZSBhYmlsaXR5IHRvIGFsc28gdmVyaWZ5IGFn
YWluc3QgY2EtY2VydGlmaWNhdGVzLmNydC4gSSAKcmVtb3ZlIGFsbCBvdGhlciBjZXJ0cyBhbmQg
anVzdCBrZWVwIHRoaXMgb25lLgpEZWJpYW4gZGVmaW5lcyBpdCBhcyB3ZWxsLiAKaHR0cHM6Ly9z
YWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9jdXJsLy0vYmxvYi9kZWJpYW4vdW5zdGFibGUvZGViaWFu
L3J1bGVzP3JlZl90eXBlPWhlYWRzI0wyMCAKCgpBbmQgdGhlIGNlcnQgYnVuZGxlIGlzIGFsc28g
aW5zdGFsbGVkLgoKIMKgIMKgIMKgIMKgICMgSW5zdGFsbCB0aGUgY2VydGlmaWNhdGVzIGJ1bmRs
ZQogwqAgwqAgwqAgwqAgJChJTlNUQUxMKSAtRCAtbSA2NDQgJChCVUlMRF9ESVIpL2NhLWNlcnRp
ZmljYXRlcy5jcnQgXAogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJChUQVJHRVRfRElSKS9ldGMv
c3NsL2NlcnRzL2NhLWNlcnRpZmljYXRlcy5jcnQKCj4KPj4gLS0tCj4gICA+ICBwYWNrYWdlL2xp
YmN1cmwvbGliY3VybC5tayB8IDMgKystCj4gICA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliY3Vy
bC9saWJjdXJsLm1rIGIvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsKPiAgID4gaW5kZXggMjA2
NmJhMDM4OC4uNTA5ZmVlYWI2NCAxMDA2NDQKPiAgID4gLS0tIGEvcGFja2FnZS9saWJjdXJsL2xp
YmN1cmwubWsKPiAgID4gKysrIGIvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsKPiAgID4gQEAg
LTY3LDcgKzY3LDggQEAgZW5kaWYKPiAgID4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCQ1VSTF9P
UEVOU1NMKSx5KQo+ICAgPiAgTElCQ1VSTF9ERVBFTkRFTkNJRVMgKz0gb3BlbnNzbAo+ICAgPiAg
TElCQ1VSTF9DT05GX09QVFMgKz0gLS13aXRoLW9wZW5zc2w9JChTVEFHSU5HX0RJUikvdXNyIFwK
PiAgID4gLQktLXdpdGgtY2EtcGF0aD0vZXRjL3NzbC9jZXJ0cwo+ICAgPiArCS0td2l0aC1jYS1w
YXRoPS9ldGMvc3NsL2NlcnRzIFwKPiAgID4gKwktLXdpdGgtY2EtYnVuZGxlPS9ldGMvc3NsL2Nl
cnRzL2NhLWNlcnRpZmljYXRlcy5jcnQKPiAgID4gIGVsc2UKPiAgID4gIExJQkNVUkxfQ09ORl9P
UFRTICs9IC0td2l0aG91dC1vcGVuc3NsCj4gICA+ICBlbmRpZgo+ICAgPiAtLQo+Cj4gICA+IDIu
MzkuNQo+Cj4gICA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gICA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiAgID4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiAgID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
