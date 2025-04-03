Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31F0C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087616FBE3;
	Thu,  3 Apr 2025 15:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQCcuEHyDjDh; Thu,  3 Apr 2025 15:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC37611EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC37611EB;
	Thu,  3 Apr 2025 15:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50711119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35DFA83211
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSaNmhBU57Eh for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D4C48319F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4C48319F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D4C48319F
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:17:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso7093035e9.2
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 08:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743693478; x=1744298278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jqBDktNMnYnIwJJfJlYfCY8Xoadz2xM1X1AqSOB0X4=;
 b=DMBE1apZ/LBHIuRXYpODPUN7NFE0TUoyLZalxRoOVCh2eYHZ1QAhGw5hs/bYjF9AsY
 /oWKtOOFb1hZJDk2f5EOcqxnaasIo5XSAve1O9GC8pLFv7AKNxnSdjhET7Rr7jJzCN+J
 aOkr7JKeO0zlyfSFqk88YtfFQvuuzSSs3FuXl8Wx6dz6jW7d30SsMHPeGOZf3CDXqfhZ
 KrtKNZIxm5Q8EHiuz3HYpO4lWAC8BQkG17UHp8wSnf2XKLkuo5TSlin/n17Rq8GTkGoY
 mq810JqeKbi84yHO36AqvN8A5P5I7LrH5AXlGb8Lp96PeqoXQyAHHOfd8T4Fa95gDnj4
 K7GA==
X-Gm-Message-State: AOJu0YyBfEK3rqOLfSNiKeZh4pWFORTV/urDuIc3+BD8bgrF9iF8Y377
 07SBqFRxLy8YS5nI8b9v0amAzD1257cGn+pWkBLdfO6ZQrTwzAlE/Y/qO1724cnGYaEOd/TfLBM
 nZPM=
X-Gm-Gg: ASbGncvRa0JRmrO1pwP+WNmBMZaSmWlCaIgsWHqJBAHbUIcRLU2ZZEwQbH/X4NT4xyL
 EwbaEkDRLuJOcbZvw5VnH0bm2tLJe4KTplZ53XIYWtI+BqJrVCR/Z0dmtfHR+v4vauNNRsItjkk
 sInGJw49ClugftvDjImrp2uMzqmLH+g53BSmNY0LIyGr7esaOvwnty1zCgsdvX8d+6mLP2Git15
 oIV1+i8TxgtTh+ExBTbtB86qe+DnMU8nCC3cLeXuiTM5lhJLD6Z7+oTRVcgxlJPR+27oJ5Aza7t
 jYsvAHwidsQbnG8j5UVzYcwrssBpWtjyXDQ7R3YkvmCTB9cfuA9/X6Hyh7WpYuY6RJtO5joBnYY
 MSjXUj3pK007Owt5cyialWSu6tfPlHIgr7BU=
X-Google-Smtp-Source: AGHT+IEz4nyw+qLFntf2/ip3cj5O4jGpRZaajJ6q6qkwFC/05S4gx3tmaqMIWLV0ReIvJg/Mx2RkOw==
X-Received: by 2002:a05:600c:21d4:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-43ec9a8e72dmr13058405e9.4.1743693477852; 
 Thu, 03 Apr 2025 08:17:57 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a732asm2082453f8f.30.2025.04.03.08.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 08:17:57 -0700 (PDT)
Message-ID: <34f53209-b0c0-4dc4-a191-4e7046323724@smile.fr>
Date: Thu, 3 Apr 2025 17:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
Content-Language: en-US
In-Reply-To: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743693478; x=1744298278; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jqBDktNMnYnIwJJfJlYfCY8Xoadz2xM1X1AqSOB0X4=;
 b=bK2YpnKCr68eUCDlpKqw+asoSfh9a9QEjSb18EiYpOCMuKYR3KuVX76ViicCuHxB88
 UhD8Eeki/rz5fvQgsRdmr6MlYp6On6+5n5sxlyEcT/1li27GhuI3XXx0ggJjVCiruCGf
 VUuCIRUR69DydGaUeskFdVydScwsiCJf/5MYg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bK2YpnKC
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_package/rust=3A_fix_bootst?=
 =?utf-8?q?rap_with_Rust=E2=89=A51=2E83?=
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpBcG9sb2dpZXMgZm9yIHRoZSB0eXBvIGluIHRoZSBzdWJqZWN0IGxpbmUgb2YgbXkg
cHJldmlvdXMgcmVwbHkuClBsZWFzZSBkaXNyZWdhcmQgaXQuCiAgCkkganVzdCB3YW50ZWQgdG8g
c2F5IHRoYXQgcGF0Y2hlcyAyIHRvIDQgc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gYQpzaW5nbGUg
Y29tbWl0LgogIApUaGFua3MKCkxlIDAzLzA0LzIwMjUgw6AgMTY6MTUsIEVsIE1laGRpIFlPVU5F
UyBhIMOpY3JpdMKgOgo+IFJ1c3QgaW5jbHVkZXMgYW4gb3B0aW9uIGBkb3dubG9hZC1jaS1sbHZt
YCBpbiBjb25maWcudG9tbCB0aGF0IGVuYWJsZXMKPiBkb3dubG9hZGluZyBwcmVidWlsdCBMTFZN
IGJpbmFyaWVzIGZyb20gUnVzdCdzIENJIGluZnJhc3RydWN0dXJlIGluc3RlYWQKPiBvZiBidWls
ZGluZyBMTFZNIGZyb20gc291cmNlLiBUaGlzIG9wdGlvbiBoZWxwcyBzcGVlZCB1cCB0aGUgYm9v
dHN0cmFwCj4gcHJvY2VzcyBhbmQgaXMgZW5hYmxlZCBieSBkZWZhdWx0IHN0YXJ0aW5nIGZyb20g
UnVzdCAxLjgzLgo+Cj4gSG93ZXZlciwgc3RhcnRpbmcgZnJvbSBjb21taXQgWzFdIHRoZSBib290
c3RyYXAgcHJvY2VzcyBwZXJmb3Jtcwo+IGEgc3RyaWN0IGNoZWNrIHZpYSB0aGUgZnVuY3Rpb24K
PiBjaGVja19pbmNvbXBhdGlibGVfb3B0aW9uc19mb3JfY2lfbGx2bSgpLgo+Cj4gVGhpcyB2YWxp
ZGF0aW9uLCBpbXBsZW1lbnRlZCBpbiB0aGUgZnVuY3Rpb24KPiBjaGVja19pbmNvbXBhdGlibGVf
b3B0aW9uc19mb3JfY2lfbGx2bSgpLCBjaGVja3MgZm9yIGFueSBpbmNvbXBhdGlibGUKPiBjdXN0
b20gb3B0aW9ucyBzdWNoIGFzIGBsbHZtLmxkZmxhZ3NgLCBgbGx2bS5jZmxhZ3NgLCBgdGFyZ2V0
c2AsIGV0Yy4KPgo+IElmIGFueSBvZiB0aGVzZSBhcmUgc2V0IGxvY2FsbHkgYW5kIGRpZmZlciBm
cm9tIHRoZSB2YWx1ZXMgdXNlZCB0byBidWlsZAo+IHRoZSBDSS1wcm92aWRlZCBMTFZNLCB0aGUg
YnVpbGQgZmFpbHMgaW1tZWRpYXRlbHkgd2l0aCB0aGUgZXJyb3I6Cj4KPiAgICBFUlJPUjogU2V0
dGluZyBgbGx2bS5sZGZsYWdzYCBpcyBpbmNvbXBhdGlibGUgd2l0aAo+ICAgICAgICAgICBgbGx2
bS5kb3dubG9hZC1jaS1sbHZtYC4KPgo+IEJ1aWxkcm9vdCBleHBsaWNpdGx5IHNldHMgYGxsdm0u
bGRmbGFnc2AgaW4gcnVzdC5tayB0byBlbnN1cmUgcHJvcGVyCj4gaG9zdCBsaW5raW5nIGR1cmlu
ZyB0aGUgYnVpbGQgb2YgaG9zdC1ydXN0LiBSZW1vdmluZyB0aGlzIHNldHRpbmcgbWF5Cj4gaW50
cm9kdWNlIHBvcnRhYmlsaXR5IG9yIHJlbGlhYmlsaXR5IGlzc3VlcyBhY3Jvc3MgdG9vbGNoYWlu
cy4KPgo+IFRvIGFkZHJlc3MgdGhlIGlzc3VlIHdpdGhvdXQgY29tcHJvbWlzaW5nIHRoZSBidWls
ZCBlbnZpcm9ubWVudCwgdGhpcwo+IHBhdGNoIGRpc2FibGVzIHRoZSB1c2Ugb2YgQ0ktcHJvdmlk
ZWQgTExWTSBieSBzZXR0aW5nOgo+Cj4gICAgW2xsdm1dCj4gICAgZG93bmxvYWQtY2ktbGx2bSA9
IGZhbHNlCj4KPiBUaGlzIGZvbGxvd3MgdGhlIHJlY29tbWVuZGF0aW9uIGZyb20gdGhlIFJ1c3Qg
Ym9vdHN0cmFwIHNjcmlwdCBpdHNlbGYuCj4KPiBOb3RlOiB0aGlzIGlzIGEgdGVtcG9yYXJ5IHdv
cmthcm91bmQgdG8gcmVzdG9yZSBjb21wYXRpYmlsaXR5IHdpdGggUnVzdAo+IOKJpTEuODMuIE90
aGVyIHNvbHV0aW9ucyB3aWxsIGJlIGludmVzdGlnYXRlZCB0byBhdm9pZCBkaXNhYmxpbmcgdGhl
IHVzZQo+IG9mIHByZWJ1aWx0IExMVk0gaW4gdGhlIGZ1dHVyZSwgd2hpbGUgcHJlc2VydmluZyBC
dWlsZHJvb3TigJlzIHJlcHJvZHVjaWJsZQo+IGJ1aWxkIHNldHVwLgo+Cj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9jb21taXQvOWRmNzY4MGVjZjY5OGJmNzA4NzYxNmI1
OTU3NzRlZTEwMjNkM2M3Ygo+Cj4gU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1l
aGRpLnlvdW5lc0BzbWlsZS5mcj4KPiAtLS0KPiAgIHBhY2thZ2UvcnVzdC9ydXN0Lm1rIHwgMSAr
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3J1c3QvcnVzdC5tayBiL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4gaW5kZXggMjljMDM1OTRk
Mi4uNjQ4MWU0MDU2MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J1c3QvcnVzdC5tawo+ICsrKyBi
L3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4gQEAgLTQ4LDYgKzQ4LDcgQEAgZGVmaW5lIEhPU1RfUlVT
VF9DT05GSUdVUkVfQ01EUwo+ICAgCQllY2hvICdbdGFyZ2V0LiQoUlVTVENfVEFSR0VUX05BTUUp
XSc7IFwKPiAgIAkJZWNobyAnY2MgPSAiJChUQVJHRVRfQ1JPU1MpZ2NjIic7IFwKPiAgIAkJZWNo
byAnW2xsdm1dJzsgXAo+ICsJCWVjaG8gJ2Rvd25sb2FkLWNpLWxsdm0gPSBmYWxzZSc7IFwKPiAg
IAkJZWNobyAnbmluamEgPSBmYWxzZSc7IFwKPiAgIAkJZWNobyAnbGRmbGFncyA9ICIkKEhPU1Rf
TERGTEFHUykiJzsgXAo+ICAgCSkgPiAkKEBEKS9jb25maWcudG9tbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
