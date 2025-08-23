Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C3FCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 21:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A770614B0;
	Sat, 23 Aug 2025 21:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wN6iUy6Y81vP; Sat, 23 Aug 2025 21:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27471614AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27471614AD;
	Sat, 23 Aug 2025 21:54:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B5E19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204158002E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCC9nDpqT9iE for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 21:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A94183576
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A94183576
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A94183576
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:54:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c763484ccdso391569f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 14:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755986057; x=1756590857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jGhFDlEVePbBA509X2LbHKyC83TDYq1lb9yyhgo8eQQ=;
 b=dSrUa146ezuSkwgMM0guTjAQkNnnpkM184nXY1848Javlb3B4Kd3fkLb8c3wOjxgOp
 mE6FCUmbb2hffQ1u+ZzmZhduCEx1/UeZaT9HpDvG1ai9VE964EHFEiKun0Wrq9Iiorpy
 SQglAEhDRaudFZ9pkSab3O1i7HyYdfN1FpWT1xz0jdCe6TWo6f5FhyW2L/QWryUO2fiM
 42giFMj7xV+Y16lO659nDasvXy+I+4g0APDLa+To10a/9+3Km8a/o9S/S1u++ttTyCgd
 oE49pxgjdpq19hFHuPOKjMDJ75HHGX02iq/uMoaPmLUOY5iS3BXmwQUKQAMeHBGiScTG
 dsmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyDnicZo8vvyD1qI4zZt61Uyk8sEKLoApfmDF/P0w4c17QsjCdDdmxPWw1JQ4HCZTrNEwUB6t7OYY=@buildroot.org
X-Gm-Message-State: AOJu0Yx4/CfS78XwVMMlpL8p0IpnpRfCJv6wLb8DxWd/iWF7zEbpH8Eh
 mxaJuFE5Kd6f97uCtP9dX3zvkO5rjSIJn7NI/nuK/rRPSiT76z8Jt6dieFMJqsS/c84=
X-Gm-Gg: ASbGncvzjRdHioXLjVpuBYYMDqI9rrg6Vp4g28Kg00AcXcuClmmiNzUkiIlJ6BSi+Zp
 dfJ0J2apx1c3qC8tV7loipR2KbBNakKb+GoVJ853TgQiFFCnD5yxT7PGbVE2mTakrJT37EBLfuI
 vCpY3D7P+kvs14fjpHdr7GWUIuySZhxqpt8yO2vQv6PB+R+QD8Wt+aqIS0AcegyUABjy13RWMEu
 9IKHZ2cg/hSYxHk4QWXPd9BT5jL1SrLJHvI2CcYkCzB8xe9uawo2ih16nLCsDrKj3HGGUK4c755
 Orliz0s0haDZlqYDo8lp6bl4vSNNUwoQBw27UPfWQ4sZg2TAlwnHuuBw+3IuI8JuyMFZXwGHSuz
 BG+W5nSNUirjb+V7rlXKVQCAsysJ5Z1S4fPyv5Djyw9qrVvDiaByHavBDq/4NuYqYgF6B1BQInK
 S4m5SDruvLbMCshHel0nEOW6JU4Gc8pj+XwOMusZxh29nnr0M6XTe+PpCYm9Je/rfWzUR6SlM=
X-Google-Smtp-Source: AGHT+IGDj+BGHhrUTkdG6iCiNuxiQvtrWHrEvjRQlJFTp1NpxtxssQw8+36SkLLc+SwIlgjprZ/LUg==
X-Received: by 2002:a05:6000:26c1:b0:3c8:9bb6:ac2f with SMTP id
 ffacd0b85a97d-3c89bb6c09emr75519f8f.26.1755986056944; 
 Sat, 23 Aug 2025 14:54:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57498d8bsm48960845e9.25.2025.08.23.14.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 14:54:16 -0700 (PDT)
Message-ID: <87d20357-7f5d-422d-9893-6ac6466f64ed@smile.fr>
Date: Sat, 23 Aug 2025 23:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250822212816.15241-1-fl@n621.de>
Content-Language: en-US
In-Reply-To: <20250822212816.15241-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755986057; x=1756590857; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jGhFDlEVePbBA509X2LbHKyC83TDYq1lb9yyhgo8eQQ=;
 b=Q4cOKuxfKj5YC4ApBJLLbv02MbyviVFBDwb2Ofky+a97O9xOLvZ+As7l7mUAiQGLcP
 isYitUAjFasR7xsyIVGhST8TxG5BrUKOvCdkCOHZHyJT3PN/iVGg6mzweib7bScXxzAn
 Wb2cVM14BzMKnJ3x9otro5xey7VZ9Mww1sDeQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Q4cOKuxf
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: mention checkpackageignore
 file
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

SGVsbG8gRmxvcmlhbiwgQWxsLAoKTGUgMjIvMDgvMjAyNSDDoCAyMzoyNywgRmxvcmlhbiBMYXJ5
c2NoIGEgw6ljcml0wqA6Cj4gQ3VycmVudGx5LCB0aGUgbWFudWFsIGRvZXNuJ3QgbWVudGlvbiB0
aGUgY2hlY2twYWNrYWdlaWdub3JlIGZpbGUgYXQKPiBhbGwsIGxlYXZpbmcgdGhlIHVzZXIgdW5k
ZXIgdGhlIGFzc3VtcHRpb24gdGhhdCBydW5uaW5nICJtYWtlCj4gY2hlY2stcGFja2FnZSIgYW5k
IHJ1bm5pbmcgdXRpbHMvY2hlY2stcGFja2FnZSBkaXJlY3RseSBvbiB0aGUgcGFja2FnZQo+IHRo
ZXkgaGF2ZSB0b3VjaGVkIHdvdWxkIGJlIGVxdWl2YWxlbnQsIHdoZW4gdGhlIGZvcm1lciBldmFs
dWF0ZXMgdGhlCj4gY2hlY2twYWNrYWdlaWdub3JlIGZpbGUgd2hpbGUgdGhlIGxhdHRlciBkb2Vz
IG5vdC4gVGhpcyBjb3VsZCBjYXVzZSB0aGVtCj4gdG8gZm9yZ2V0IHRvIHJlbW92ZSBzdGFsZSBl
bnRyaWVzIGZyb20gdGhhdCBmaWxlLgo+IAo+IFBvaW50IG91dCB0aGlzIGRpZmZlcmVuY2UgaW4g
YmVoYXZpb3IuCgpBY3R1YWxseSAuY2hlY2twYWNrYWdlaWdub3JlIGZpbGUgbXVzdCBiZSByZW1v
dmVkIGFzIHNvb24gYXMgcG9zc2libGUhIChJJ20gbm90CnVzZSB3ZSByZWFsbHkgd2FudCB0byBh
ZGQgaXQgdG8gdGhlIG1hbnVhbCkKT3ZlciB0aGUgdGltZSwgdGhlIG51bWJlciBvZiBpZ25vcmVk
IHdhcm5pbmdzIGlzIHJlZHVjZWQuCgpDdXJyZW50bHkgd2Ugc3RpbGwgaGF2ZSAxMzAwKyBpZ25v
cmVkIHdhcm5pbmdzOgoKY2F0IC5jaGVja3BhY2thZ2VpZ25vcmUgfCB3YyAtbAoxMzAyCgpCdXQg
aW5pdGlhbGx5IFsxXSB3ZSBoYWQgbW9yZSEKCmNhdCAuY2hlY2twYWNrYWdlaWdub3JlIHwgd2Mg
LWwKMTg1OAoKQWxzbywgcnVubmluZyB1dGlscy9jaGVjay1wYWNrYWdlIGRpcmVjdGx5IG9uIHlv
dXIgaG9zdCB3aXRob3V0IHVzaW5nCnV0aWxzL2RvY2tlci1ydW4gbWF5IGdpdmUgYSBkaWZmZXJl
bnQgcmVzdWx0IGR1ZSB0byB0aGUgU2hlbGxjaGVjayBhbmQgZmxha2U4CnZlcnNpb24uClRoYXQn
cyB3aHksIGl0J3MgYWN0dWFsbHkgYmV0dGVyIHVzaW5nIGNoZWNrLXBhY2thZ2UgZnJvbSBEb2Nr
ZXIgZW52aXJvbm1lbnQKKHV0aWxzL2RvY2tlci1ydW4pLgoKVXNpbmcgdXRpbHMvY2hlY2stcGFj
a2FnZSBkaXJlY3RseSBpcyB1c2VmdWwgd2hlbiBhZGRpbmcgYSBuZXcgcGFja2FnZSAobm8KLmNo
ZWNrcGFja2FnZWlnbm9yZSBlbnRyeSBleGlzdCkgb3IgY2hlY2tpbmcgcGFja2FnZXMgZnJvbSBh
IEJSMl9FWFRFUk5BTCBbMl0uCgpbMV0KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0LzFlZDA3NTIxMzIyZDVkMGVjMjYyODgzMTY5NDQzYWY5MTJkYjMw
ZjMKClsyXQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9i
L21hc3Rlci9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtdGlwcy5hZG9jP3JlZl90eXBlPWhl
YWRzI2NoZWNrLXBhY2thZ2UKCj4gCj4gU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBMYXJ5c2NoIDxm
bEBuNjIxLmRlPgo+IC0tLQo+ICBkb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2MgfCA2ICsrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2MgYi9kb2NzL21hbnVhbC9j
b250cmlidXRlLmFkb2MKPiBpbmRleCBmZmFmZjZmODU3Li5iNDg0ZjhiNTI0IDEwMDY0NAo+IC0t
LSBhL2RvY3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYwo+ICsrKyBiL2RvY3MvbWFudWFsL2NvbnRy
aWJ1dGUuYWRvYwo+IEBAIC0zMjEsOSArMzIxLDExIEBAIE5vdyBjaGVjayB0aGUgY29kaW5nIHN0
eWxlIGZvciB0aGUgY2hhbmdlcyB5b3UgY29tbWl0dGVkOgo+ICAkIHV0aWxzL2RvY2tlci1ydW4g
bWFrZSBjaGVjay1wYWNrYWdlCj4gIC0tLS0KPiAgCj4gLU5vdywgeW91IGFyZSByZWFkeSB0byBn
ZW5lcmF0ZSB0aGVuIHN1Ym1pdCB5b3VyIHBhdGNoIHNldC4KPiArVGhpcyBjb21tYW5kICh1bmxp
a2UgY2FsbGluZyArdXRpbHMvY2hlY2stcGFja2FnZSsgZGlyZWN0bHkpIHdpbGwgYWxzbyB3YXJu
Cj4gK2Fib3V0IGFueSBzdGFsZSBlbnRyaWVzIGluIHRoZSArLmNoZWNrcGFja2FnZWlnbm9yZSsg
ZmlsZSB0aGF0IHlvdXIgcGF0Y2hlcwo+ICttaWdodCBoYXZlIHJlc29sdmVkLgoKQnV0IGluZGVl
ZCwgdXNpbmcgdXRpbHMvY2hlY2stcGFja2FnZSBkaXJlY3RseSBmb3IgaW4gdHJlZSBwYWNrYWdl
cyAodmVyc2lvbgpidW1wKSB3ZSBtYXkgZm9yZ2V0IHRvIHJlbW92ZSBhbiAuY2hlY2twYWNrYWdl
aWdub3JlIGVudHJ5LgoKPiAgCj4gLVRvIGdlbmVyYXRlIGl0LCBydW46Cj4gK05vdywgeW91IGFy
ZSByZWFkeSB0byBnZW5lcmF0ZSB0aGVuIHN1Ym1pdCB5b3VyIHBhdGNoIHNldC4gVG8gZ2VuZXJh
dGUgaXQsIHJ1bjoKCldoeSBtb3ZpbmcgdGhlIG5ldyBsaW5lIGhlcmU/CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKPiAgCj4gIC0tLS0KPiAgJCBnaXQgZm9ybWF0LXBhdGNoIC1NIC1uIC1zIC1vIG91
dGdvaW5nIG9yaWdpbi9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
