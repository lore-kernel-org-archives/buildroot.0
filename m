Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA8C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C372440937;
	Thu,  4 Jul 2024 08:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id um1d9fl-gTvx; Thu,  4 Jul 2024 08:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4648408F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4648408F2;
	Thu,  4 Jul 2024 08:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 495E11BF2C9
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3710881006
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXduYYaNcBiz for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 08:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DC0E81EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC0E81EB5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DC0E81EB5
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 08:00:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3627ef1fc07so216318f8f.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720080056; x=1720684856;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xYH4QRe+FuQOBuas3++m/P97xoYKS1oMTN6lLzMqrTg=;
 b=tDH0DEJqK2IYivv2r7cMOW+AjZNeQmjeKX8jb+ZL0rOvBmRy8PecSlUdIr0w733Fze
 In4aEbCB60+JSSo1t4ISNy3zaL1ceXeyOJx2BdfftKn9rrqX0OGKMvv7b69pLe085F+r
 abMpZDQ4UMADka6XkJ4E72eyuuBimr8h1PiSY6XnxigueK2uB2yUKOfL/NOuVJPr9Vbs
 rj2c/KEkNQaT8F2a7pL9rz/mPbSjAthzpa4+dzS8JgTcvvwm3ZEcYfmepq/HTtEB95KN
 XVSegj+9zwK+0tqSHHU47mk8+AEl/EhZtVSNMem+TOix+sjPYP27pVOZr2Ij+yw4Zlj2
 WKHQ==
X-Gm-Message-State: AOJu0Yy13Xk/lJdSpOWJXcJwTQiOcMQoAPzWnJn9bi+ihGblboHvDYF8
 8poyrqvYnHDN0OZ3zybw2CVaNwSY5EjJbYx7AEGDehZim93+eL51suBz75UWqdc=
X-Google-Smtp-Source: AGHT+IHwmPXHfSCHQOam1c2skxBp33fRDQmFx+7q5LycPOUtYhi+5xQ38A9B04pFm8o0zNLwcrZVCQ==
X-Received: by 2002:a5d:5045:0:b0:367:437f:177f with SMTP id
 ffacd0b85a97d-3679dd66ce7mr661860f8f.55.1720080055599; 
 Thu, 04 Jul 2024 01:00:55 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678877f19dsm6239661f8f.43.2024.07.04.01.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 01:00:55 -0700 (PDT)
Message-ID: <8b5aaedd-ed7f-47c9-8632-9fd901351e11@mind.be>
Date: Thu, 4 Jul 2024 10:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de> <ZoRf7pXimhw4wh-s@landeda>
 <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
 <c53f5d9b-2402-4759-ba38-ebc639c11f29@gmx.de>
Content-Language: en-GB
In-Reply-To: <c53f5d9b-2402-4759-ba38-ebc639c11f29@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720080055; x=1720684855; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xYH4QRe+FuQOBuas3++m/P97xoYKS1oMTN6lLzMqrTg=;
 b=BAe2HhYq/BERWf4CKvkkbiI9d19V3Ywfr7Z8CHQ0CW0Hq8D1jDNMsTyQCPvAVomZ3n
 90qjGo+SEhWVQqy3h3zItjFbLzLI7c0TZxcyG1uzJ8pEZNDW5W9+bbm+63kHkH/o6ftg
 CwaRFZlfXR3ft/HYAne2d4sQrUyagTmIvtPI8ZjmbzdXhJBVy7kaOIDbi+z72FjH6wgs
 EJcRU3xJd3Y7cXTTHXap91hGeZdwiC9Qi5JPTZcFokVC6a5XajuyP4WIJXpt+hqQP0P5
 +I5y2z0onMbKt+a8lYaGIa6oAFQpkQAEcm7haYzeq2S2yHTvQ+ooPFOAXQ+5Lz4H/lje
 /llQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BAe2HhYq
Subject: Re: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDI0IDE3OjQ2LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAwMy4wNy4yNCB1
bSAwOTowMSBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+PiBPbiAwMi8wNy8yMDI0IDIy
OjE1LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+Pj4gRmlvbmEsIEFsbCwKPj4+Cj4+PiBPbiAyMDI0
LTA3LTAyIDE4OjU3ICswMjAwLCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNs
eToKPj4+PiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214LmRlPgo+
Pj4+Cj4+Pj4gVGhlIHByZXZpb3VzbHkgdXNlZCAia2lsbGFsbCBzc2hkIiBzdG9wcGVkIGFsbCBp
bnN0YW5jZXMgb2Ygc3NoZC4gV2l0aAo+Pj4+IE9wZW5TU0ggYmVmb3JlIDkuOCB0aGF0IG1lYW50
IG5vdCBvbmx5IHRoZSBsaXN0ZW5pbmcgc2VydmVyLCBidXQgYWxzbwo+Pj4+IGluc3RhbmNlcyBz
ZXJ2aW5nIGN1cnJlbnRseSBvcGVuIHNlc3Npb25zLCBwb3NzaWJseSBpbmNsdWRpbmcgdGhlIG9u
ZQo+Pj4+IHVzZWQgdG8gc2VuZCB0aGUgcmVzdGFydCBjb21tYW5kLCBwcmV2ZW50aW5nIGl0IGZy
b20gY29tcGxldGluZyB0aGUKPj4+PiAic3RhcnQiIHBhcnQgb2YgInJlc3RhcnQiIGFuZCBsZWF2
aW5nIHRoZSBzeXN0ZW0gdW5yZWFjaGFibGUgb3ZlciBTU0guCj4+Pj4KPj4+PiBJbnN0ZWFkLCB1
c2UgdGhlIFBJRCBmaWxlIHRoYXQgc3NoZCBjcmVhdGVzIGJ5IGRlZmF1bHQgdG8gdGFyZ2V0IG9u
bHkKPj4+PiB0aGUgbGlzdGVuaW5nIHNlcnZlci4gVGhpcyBsZWF2ZXMgYW55IG9wZW4gU1NIIHNl
c3Npb25zIHVuYWZmZWN0ZWQuCj4+Pgo+Pj4gUmF0aGVyIHRoYW4gcGxheSB3aXRoIHRoZSBQSUQg
b3Vyc2VsdmVzLCBjYW4gd2UgdXNlIHN0YXJ0LXN0b3AtZGFlbW9uCj4+PiBpbnN0ZWFkPyBDdXJy
ZW50bHksIHdlIHJ1biBzc2hkIGFuZCBpdCBkYWVtb25pc2VzIGFsbCBieSBpdHNlbGYsIGJ1dCBp
Zgo+Pj4gd2UgcGFzcyAtRCwgdGhlbiBzdGFydC1zdG9wLWRhZW1vbiB3aWxsIGJlIGFibGUgdG8g
ZG8gdGhhdCwgYW5kIGhhbmRsZQo+Pj4gdGhlIFBJRCBmaWxlIGF1dG9tYXRpY2FsbHkgZm9yIHVz
Lgo+Pgo+PiDCoMKgTm90ZSB0aGF0IHRoZXJlJ3MgYSBsaXR0bGUgZGlzYWR2YW50YWdlIG9mIHRo
YXQ6IHdoZW4gc3NoZCBkYWVtb25pemVzCj4+IGJ5IGl0c2VsZiwgaXQgd2lsbCBvbmx5IHJldHVy
biBhZnRlciB0aGUgcmVhbCBkYWVtb24gaGFzIHN0YXJ0ZWQKPj4gbGlzdGVuaW5nLiBJZiBzdGFy
dC1zdG9wLWRhZW1vbiBkb2VzIHRoZSBkYWVtb25pc2F0aW9uLCBpdCB3aWxsIHJldHVybgo+PiBp
bW1lZGlhdGVseS4KPiAKPiBJIGxvb2tlZCBjbG9zZXIgYXQgc3RhcnQtc3RvcC1kYWVtb24sIGFu
ZCB0aGVyZSdzIGEgc29sdXRpb24gdGhhdCBhdm9pZHMKPiB0aGF0IHByb2JsZW0gYW5kIHNpbXBs
aWZpZXMgdGhlIGluaXQgc2NyaXB0LCB0b286IGRvbid0IHVzZSAiLUQiIGZvcgo+IHNzaGQuIHN0
YXJ0LXN0b3AtZGFlbW9uIGV4cGVjdHMgdGhlIGRhZW1vbiB0byB3cml0ZSBpdHMgb3duIFBJRCBm
aWxlIGFuZAo+IHB1dCBpdHNlbGYgaW50byB0aGUgYmFja2dyb3VuZCwgb3B0aW9ucyB0byBoYW5k
bGUgYSBzZXJ2aWNlIHRoYXQgZG9lc24ndAo+IGFyZSBkZXNjcmliZWQgYXMgZmFsbGJhY2tzIGlu
IHRoZSBtYW4gcGFnZS4KPiAKPiBJJ3ZlIHRlc3RlZCBpdCwgYW5kIGxldHRpbmcgc3RhcnQtc3Rv
cC1kYWVtb24gbWFuYWdlIHNzaGQgdGhhdCB3YXkgd29ya3MKPiBwZXJmZWN0bHkgZmluZS4gSSBh
bHNvIGZvdW5kIGl0IGhhcyBhIGJ1aWx0LWluIG9wdGlvbiAoLS1yZXRyeSkgdG8gYXZvaWQKCiAg
RG9lcyB0aGUgLS1yZXRyeSBvcHRpb24gZXhpc3QgaW4gYnVzeWJveCdzIHZlcnNpb24/CgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+ICJoYXMgdGhlIHNlcnZpY2UgcmVhbGx5IHN0b3BwZWQiIGxvb3Bz
LiBJJ2xsIHNlbmQgdGhlIHJlZmFjdG9yZWQgcGF0Y2gKPiBzZXQgaW4gYSBmZXcgbWludXRlcy4K
PiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXchCj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4g
Cj4+IMKgwqBJIGRvbid0IHRoaW5rIHRoaXMgaXMgaW1wb3J0YW50IGVub3VnaCB0byBub3QgZGFl
bW9uaXNlIHdpdGgKPj4gc3RhcnQtc3RvcC1kYWVtb24gLSBpZiB5b3UgbmVlZCBmaW5lLWdyYWlu
IGNvbnRyb2wgYnkgdGhlIGluaXQgc3lzdGVtCj4+IHlvdSBzaG91bGQgdXNlIGEgcHJvcGVyIGlu
aXQgc3lzdGVtLiBCdXQgaXQncyBpbXBvcnRhbnQgdG8gYmUgYXdhcmUgb2YKPj4gdGhlIGltcGxp
ZWQgbGltaXRhdGlvbnMuCj4+Cj4+IMKgwqBSZWdhcmRzLAo+PiDCoMKgQXJub3V0Cj4+Cj4+Pgo+
Pj4gUmVnYXJkcywKPj4+IFlhbm4gRS4gTU9SSU4uCj4+Pgo+Pj4+IFdpdGggT3BlblNTSCA5Ljgg
b3BlbiBzZXNzaW9ucyBhcmUgaGFuZGxlZCBieSB0aGUgc2VwYXJhdGUKPj4+PiBzc2hkLXNlc3Np
b24gYmluYXJ5IHNvIGtpbGxhbGwgZG9lcyBub3QgaGl0IHRoZW0gYW55IG1vcmUsIGJ1dAo+Pj4+
IGEgdGFyZ2V0ZWQgImtpbGwiIGNvbW1hbmQgaXMgc3RpbGwgZGVzaXJhYmxlLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+
Pj4gLS0tCj4+PiBbLS1TTklQLS1dCj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC9T
NTBzc2hkIGIvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQKPj4+PiBpbmRleCAyMmRhNDFkMWNhLi5m
MWZmOWRmZWMxIDEwMDY0NAo+Pj4+IC0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9TNTBzc2hkCj4+Pj4g
KysrIGIvcGFja2FnZS9vcGVuc3NoL1M1MHNzaGQKPj4+PiBAQCAtMyw2ICszLDggQEAKPj4+PiDC
oCAjIHNzaGTCoMKgwqDCoMKgwqDCoCBTdGFydHMgc3NoZC4KPj4+PiDCoCAjCj4+Pj4KPj4+PiAr
UElERklMRT0iL3Zhci9ydW4vc3NoZC5waWQiCj4+Pj4gKwo+Pj4+IMKgICMgTWFrZSBzdXJlIHRo
ZSBzc2gta2V5Z2VuIHByb2dhbSBleGlzdHMKPj4+PiDCoCBbIC1mIC91c3IvYmluL3NzaC1rZXln
ZW4gXSB8fCBleGl0IDAKPj4+Pgo+Pj4+IEBAIC0xNCwxNSArMTYsMjUgQEAgc3RhcnQoKSB7Cj4+
Pj4KPj4+PiDCoMKgwqDCoMKgIHByaW50ZiAiU3RhcnRpbmcgc3NoZDogIgo+Pj4+IMKgwqDCoMKg
wqAgL3Vzci9zYmluL3NzaGQKPj4+PiAtwqDCoMKgIHRvdWNoIC92YXIvbG9jay9zc2hkCj4+Pj4g
wqDCoMKgwqDCoCBlY2hvICJPSyIKPj4+PiDCoCB9Cj4+Pj4gKwo+Pj4+IMKgIHN0b3AoKSB7Cj4+
Pj4gwqDCoMKgwqDCoCBwcmludGYgIlN0b3BwaW5nIHNzaGQ6ICIKPj4+PiAtwqDCoMKgIGtpbGxh
bGwgc3NoZAo+Pj4+IC3CoMKgwqAgcm0gLWYgL3Zhci9sb2NrL3NzaGQKPj4+PiArwqDCoMKgIHBp
ZD0iJCggY2F0ICIke1BJREZJTEV9IiAyPi9kZXYvbnVsbCB8fCB0cnVlICkiCj4+Pj4gK8KgwqDC
oCBpZiBbIC16ICIke3BpZH0iIF07IHRoZW4KPj4+PiArwqDCoMKgwqDCoMKgwqAgZWNobyAiRVJS
T1I6IG5vdCBydW5uaW5nIgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMQo+Pj4+ICvCoMKg
wqAgZmkKPj4+PiArwqDCoMKgIGtpbGwgIiR7cGlkfSIKPj4+PiArwqDCoMKgICMgU1NIRCBkZWxl
dGVzIGl0cyBQSUQgZmlsZSB3aGVuIGV4aXRpbmcsIHdhaXQgZm9yIGl0IHRvCj4+Pj4gK8KgwqDC
oCAjIGRpc2FwcGVhci4KPj4+PiArwqDCoMKgIHdoaWxlIFsgLWYgIiR7UElERklMRX0iIF07IGRv
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNsZWVwIDAuMQo+Pj4+ICvCoMKgwqAgZG9uZQo+Pj4+IMKg
wqDCoMKgwqAgZWNobyAiT0siCj4+Pj4gwqAgfQo+Pj4+ICsKPj4+PiDCoCByZXN0YXJ0KCkgewo+
Pj4+IMKgwqDCoMKgwqAgc3RvcAo+Pj4+IMKgwqDCoMKgwqAgc3RhcnQKPj4+PiBAQCAtNDQsNCAr
NTYsMyBAQCBjYXNlICIkMSIgaW4KPj4+PiDCoCBlc2FjCj4+Pj4KPj4+PiDCoCBleGl0ICQ/Cj4+
Pj4gLQo+Pj4+IC0tIAo+Pj4+IDIuNDUuMgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+
Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4+Cj4gCj4gLS0gCj4gRGlwbC4tSW5nLiBG
aW9uYSBLbHV0ZQo+IE1vbGx3aXR6ZXIgU3RyLiAyCj4gNDQxNDEgRG9ydG11bmQKPiBHZXJtYW55
Cj4gCj4gVVN0Li1JRC9WQVQgbnVtYmVyOiBERTM2MzQ4ODk0NAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
