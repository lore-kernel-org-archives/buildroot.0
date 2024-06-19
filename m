Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26EEC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B67821C7;
	Wed, 19 Jun 2024 20:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3pOBa4cjDqE; Wed, 19 Jun 2024 20:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB309821F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB309821F6;
	Wed, 19 Jun 2024 20:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD9C1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C5A04036F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evqp-Qi02o6V for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CD31401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD31401FE
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CD31401FE
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:45:10 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c9d70d93dbso86163b6e.3
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718829909; x=1719434709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DlfYAorgAzRB7K2HOMupAkjWIIuRVzgaMxuWPjANi8A=;
 b=uHE6WbiEEDuCRK/HtZ3gGO9ot/kb+TzKGo4AeHxzrDf7M40GUUIEVam/7hLwZpazm3
 7s29AUc3+uAgkd/5O/IkSLXzwCQphii2V1HoYFDAPLKJTtPZ+2NyYEfUFrTcvFS1WERG
 xiAlWg0h7BCszvqXiIBl3gdyu7Bs6UlibtItNGJ1smGS5k3ljNWxJdpUla5VMOEQricQ
 paBT0utoADC5ezs5shrdTne7yr6vdwZgsh3ot0IKNj62Noc0jiYRI26N28s946hogpDv
 MEEoGqDnZ/zxOf8VJX/5xqIHWdKL5cKKGOjNniOTOOv3oxXjce+X+Ydx4zMcI/tWG5Fl
 qomg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWkQiUITumpearMI9BNQtWH/Pg926NuimICWTanFPo/Fkwb+KP70cIDQ0aX2bM7VlemdWpkByIjD/wAnqAwXKI/W5dTMzzNw==
X-Gm-Message-State: AOJu0Yz3X9/KxjS5+ToWKu9wMDfrqAwfYyK+TTQv1gQwTrpAme81ZBmE
 lETXXna7gu/r9uO0YnEthbMq9GKKNTqszOY/GAttPtySmxhw8APubBwB/g==
X-Google-Smtp-Source: AGHT+IHB3Dl8Sbi2IVY6Q9I+RVQX+/SWh9CF+iTO+J63cYY5KwJeVtUg8dJsV+WJTHCBYdeQZW3ufw==
X-Received: by 2002:a05:6870:164d:b0:254:9837:47c8 with SMTP id
 586e51a60fabf-25c94d6d8cdmr4004065fac.49.1718829909142; 
 Wed, 19 Jun 2024 13:45:09 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2567aa7b3dfsm3912770fac.31.2024.06.19.13.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:45:08 -0700 (PDT)
Message-ID: <3dff7ff6-86fa-4861-862e-5081f56e191b@gmail.com>
Date: Wed, 19 Jun 2024 14:45:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240605212001.1724218-1-lancethepants@gmail.com>
 <10907897-c3bc-48c9-9d11-b8966b58a612@mind.be>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <10907897-c3bc-48c9-9d11-b8966b58a612@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718829909; x=1719434709; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DlfYAorgAzRB7K2HOMupAkjWIIuRVzgaMxuWPjANi8A=;
 b=f5joaGrPoq2Iatly/M/Yki0kMLiSRIxKmsec/GMyTzCXRuL9RQ+d6yd6IZVYkyAdZ7
 2VblH0OYdO/UkMUAsGbcdGSNDXMV+vzu/FWbaZSiU9Z7u+jdlgIoYZ/mpQrHx1O1fmLc
 jiurOLBdAB9nj4UUE21vIBhw52QFMvwPZkDKBxHav60Mi9giHW8KsDwob5N269lS4JG9
 3P4xAHULwuPIuK3yYDleSr8LR24wdtog3i45KAe6zv8BQ2FvQS864qkMAWdxUsyoeLUT
 CNyPf9vCDHE23uCi29xUrocn7jjtGxgY0OpQcKQF9gyFepQUHFJ0Pwcaa2oM7MtDz3TI
 ryJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f5joaGrP
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with GCC 14.x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZC4gVGhlIHBhdGNoIHdoaWNoIHlvdSBpbmNsdWRlZCBp
biB5b3VyIHJlcGx5IApkb2VzIGhhdmUgYSAiU2lnbmVkLW9mZi1ieSIgbGluZSBwcmVzZW50LsKg
IEFsc28sIHRoZSBsYXN0IHJlbGVhc2Ugb2YgCnN5c2xpbnV4IHdhcyBpbiAyMDE0LCBhbmQgYnVp
bGRyb290IHNlZW1zIHRvIGJlIGNhcnJ5aW5nIG1hbnkgcGF0Y2hlcyAKYWdhaW5zdCB0aGF0IHJl
bGVhc2UsIHNvIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHVwc3RyZWFtIGlzIHByb2JhYmx5
IApub3QgYWNjZXB0aW5nIHBhdGNoZXMgYXQgdGhpcyBwb2ludC4KClRoZSAiRnJvbSIgd2hlbiBz
ZW5kaW5nIHRoaXMgcGF0Y2ggZG9lc24ndCBtYXRjaCBteSBuYW1lIGluIHRoZSAKIlNpZ25lZC1v
ZmYtYnkiIGFzIGFub3RoZXIgbWFpbnRhaW5lciBtZW50aW9uZWQgaW4gYW5vdGhlciBwYXRjaCBJ
IHNlbnQgCmluLCBidXQgdGhpcyBvbmUgd2FzIGFsc28gc2VudCBiZWZvcmUgSSByZWNlaXZlZCB0
aGF0IHJlcGx5LgoKTGFuY2UKCk9uIDYvMTkvMjAyNCAyOjI1IFBNLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSB3cm90ZToKPiDCoEhpIExhbmNlLAo+Cj4gT24gMDUvMDYvMjAyNCAyMzoyMCwgbGFuY2V0
aGVwYW50cyB3cm90ZToKPj4gQWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0
IHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyAKPj4gZXJyb3IgdW5kZXIgR0NDIDE0LngKPj4KPj4g
Li4vLi4vLi4vY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xp
bnV4X2RlYnVn4oCZOgo+PiAuLi8uLi8uLi9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYzo5MTo1
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gCj4+IG9mIGZ1bmN0aW9uIOKAmHByaW50ZuKA
mSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4gwqDCoMKgIDkxIHzCoMKgwqDC
oCBwcmludGYoIkR5bmFtaWMgZGVidWcgdW5hdmFpbGFibGVcbiIpOwo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+Cj4+IC0tLQo+
PiDCoCAuLi4vMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNowqDCoMKgwqDCoCB8
IDI1ICsrKysrKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3Qvc3lzbGludXgvMDAyMC1wdWxsLWlu
LXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoCj4+Cj4+IGRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4
LzAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaCAKPj4gYi9ib290L3N5c2xpbnV4
LzAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaAo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi42NzExYzdhYTc4Cj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvYm9vdC9zeXNsaW51eC8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2gK
Pj4gQEAgLTAsMCArMSwyNSBAQAo+PiArRnJvbSBkZmEyNzA1MTAwYTg5M2JjMDE3ZDIzNDA2ZGFh
OWEzODNmYmMzYzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogbGFuY2V0aGVw
YW50cyA8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+Cj4+ICtEYXRlOiBXZWQsIDUgSnVuIDIwMjQg
MTQ6MzE6MzggLTA2MDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gY29tMzIvbGliL3N5c2xpbnV4L2Rl
YnVnLmM6IGFkZCBtaXNzaW5nIHN0ZGlvLmggCj4+IGluY2x1ZGUuCj4+ICsKPj4gK0ZpeGVzIGJ1
aWxkaW5nIHdpdGggR0NDIDE0LngKPgo+IMKgQXMgY2hlY2stcGFja2FnZSByZXBvcnRzLCB0aGUg
cGF0Y2ggaXMgbWlzc2luZyBhIFNpZ25lZC1vZmYtYnkgKHRvIAo+IGluZGljYXRlIHRoYXQgeW91
IGFyZSBhbGxvd2VkIHRvIGNvbnRyaWJ1dGUgaXQgdW5kZXIgdGhlIHN5c2xpbnV4IAo+IGxpY2Vu
c2UpIGFuZCBhbiBVcHN0cmVhbTogaW5kaWNhdG9yLiBXZSBleHBlY3QgeW91IHRvIHN1Ym1pdCB0
aGUgcGF0Y2ggCj4gdXBzdHJlYW0gYmVmb3JlIHlvdSBzdWJtaXQgaXQgdG8gYnVpbGRyb290Lgo+
Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4gKy0tLQo+PiArIGNvbTMyL2xpYi9zeXNsaW51
eC9kZWJ1Zy5jIHwgMSArCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+ICsK
Pj4gK2RpZmYgLS1naXQgYS9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYyBiL2NvbTMyL2xpYi9z
eXNsaW51eC9kZWJ1Zy5jCj4+ICtpbmRleCBkOWFiODYzZi4uZThmNTNkNTcgMTAwNjQ0Cj4+ICst
LS0gYS9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYwo+PiArKysrIGIvY29tMzIvbGliL3N5c2xp
bnV4L2RlYnVnLmMKPj4gK0BAIC0xLDYgKzEsNyBAQAo+PiArICNpbmNsdWRlIDxsaW51eC9saXN0
Lmg+Cj4+ICsgI2luY2x1ZGUgPHN0cmluZy5oPgo+PiArICNpbmNsdWRlIDxzdGRib29sLmg+Cj4+
ICsrI2luY2x1ZGUgPHN0ZGlvLmg+Cj4+ICsKPj4gKyAjaWZkZWYgRFlOQU1JQ19ERUJVRwo+PiAr
Cj4+ICstLQo+PiArMi4zOS4yCj4+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
