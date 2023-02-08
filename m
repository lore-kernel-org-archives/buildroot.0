Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB8C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4349C81FEE;
	Wed,  8 Feb 2023 15:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4349C81FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntNAOuHRT0px; Wed,  8 Feb 2023 15:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 716AA81FE7;
	Wed,  8 Feb 2023 15:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 716AA81FE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 687F61BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 504AF40BF9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504AF40BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LpL1NKYXfSR for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E5140465
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77E5140465
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:02:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so1718142wms.0
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvfiewAyWa+FST+m9D+XRSqPw8fb1XSz+SoNwfybYQg=;
 b=LRPZqEaoidAN08KptBdnyRPsCeKPSMDWhWCYCJaqjK7Mrkhhmevj8gNOhZcSwF5kib
 vNaFCIL0o7vw9jHd6Cv/6ApXSTBeIRHtLeVedwQmRMOX1oYCvD+49pVBTQKJTzPX7Prl
 5X0u5f329xX0bocswjiTwzuim9CCmmzX5I9uczDnv8MgWfBJNOrvt4ZKW8VdiXSiXdXz
 6ybHeH24021ABZrt7J82f/mSWTz4KrPGXIoJ98dYQgrM9j2pnh5/tGPEG0Fc7h1W5gVR
 eCoksdQhHYVOioC2gL3SMnotFLZ2J8DTNDimXOIXl7lLlQZUYpYWudfyp8YOZfEN1nkQ
 EwlA==
X-Gm-Message-State: AO0yUKWlJxSOqeDw4MXbGCRnrADqpd17yBQr6Dkpd/eyxMtfhSNOtqs4
 VZ/EbGKpBzREYlyB+oVKL27Kyw==
X-Google-Smtp-Source: AK7set9kxQWxIFayyzK/rX5aX11Y6F094yb8s/ugNGHmdJH2JDEPxyd0+UvrWuX4GNyzbCp+IJ6grw==
X-Received: by 2002:a05:600c:18a0:b0:3df:b5ae:529f with SMTP id
 x32-20020a05600c18a000b003dfb5ae529fmr6769145wmp.31.1675868529702; 
 Wed, 08 Feb 2023 07:02:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c424300b003dc492e4430sm1982042wmm.28.2023.02.08.07.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:02:09 -0800 (PST)
Message-ID: <c0aafc9e-a64b-408b-793c-6bf7ecc2221b@smile.fr>
Date: Wed, 8 Feb 2023 16:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493D84A675F9D98209AE5229F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493D84A675F9D98209AE5229F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvfiewAyWa+FST+m9D+XRSqPw8fb1XSz+SoNwfybYQg=;
 b=cLbKo/4/ffSYhxjn0gjPWXy2tT30DQXRfXrJW0+yHTFTr/eLkVqhfcU64hEuaUe/kS
 /OTvJfX3rndbc+Sbqehb+hvICI+nrYhw/eD9HnhRn3/2FO1aTtzCBfvuQqlL0k334Czw
 VgYRdTB16c5sQXU8bTBOrDq02W36hSpiTANk9U5PftAA9UkSY1J3sxIB5UWWotU9hlw7
 rrV4D46jQtNjPv9jU1P598O8IdO5Gc29V2sa60kyc8ucKWHuLyEXArLWUQbJYn32U4P7
 5ViLfE/P+rmdLnBn5yvdK1nhRdZreIDpR/TsISRL+cK6CG0Z+o5T3vH8Rgt7Lz0WTLTA
 aNIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cLbKo/4/
Subject: Re: [Buildroot] [PATCH v2 06/11] package/llvm-project/llvm-cmake:
 new package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjA5LCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVGhpcyBpcyBhIHNtYWxsIGhvc3QgcGFja2FnZSBjb250YWluaW5nIHNo
YXJlZCBjbWFrZSBtb2R1bGVzCj4gdGhhdCBhcmUgbmVlZGVkIGJ5IHZhcmlvdXMgcHJvamVjdHMg
ZHVyaW5nIGNvbmZpZ3VyYXRpb24uCj4gRm9yIGV4YW1wbGUgbGx2bSAxNSBuZWVkcyBpdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGFuZyA8ZC5sYW5nQGFiYXRlYy5hdD4KPiAtLS0KPiAg
cGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1jbWFrZS9sbHZtLWNtYWtlLmhhc2ggfCAgMiArKwo+
ICBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLWNtYWtlL2xsdm0tY21ha2UubWsgICB8IDE2ICsr
KysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLWNtYWtlL2xsdm0tY21h
a2UuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1j
bWFrZS9sbHZtLWNtYWtlLm1rCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0
L2xsdm0tY21ha2UvbGx2bS1jbWFrZS5oYXNoIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1j
bWFrZS9sbHZtLWNtYWtlLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLmI3NjAxM2U4MTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9sbHZtLXBy
b2plY3QvbGx2bS1jbWFrZS9sbHZtLWNtYWtlLmhhc2gKPiBAQCAtMCwwICsxLDIgQEAKPiArIyBs
b2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICAyMWNmM2Y1MmM1M2RjOGI4OTcyMTIyYWUzNWE1
YzE4ZGUwOWM3ZGY2OTNiNDhiNWNkODU1M2MzZTNmZWQwOTBkICBjbWFrZS0xNS4wLjMuc3JjLnRh
ci54egoKVGhpcyBjYW4ndCB3b3JrIHNpbmNlIExMVk1fUFJPSkVDVF9WRVJTSU9OIGlzIHN0aWxs
IGF0IDExLjEuMC4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tY21h
a2UvbGx2bS1jbWFrZS5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tY21ha2UvbGx2bS1j
bWFrZS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMjUyN2I5
NTA2Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLWNt
YWtlL2xsdm0tY21ha2UubWsKPiBAQCAtMCwwICsxLDE2IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gKyMKPiArIyBsbHZtLWNtYWtlCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiArCj4gK0xMVk1fQ01BS0VfVkVSU0lPTiA9ICQoTExWTV9QUk9KRUNUX1ZFUlNJT04pCj4g
K0xMVk1fQ01BS0VfU0lURSA9ICQoTExWTV9QUk9KRUNUX1NJVEUpCgpNYXliZSBmb3JjZSBpdCB0
byAxNS4wLjMgaGVyZSBhbmQgcmV2ZXJ0IHRvIExMVk1fUFJPSkVDVF9WRVJTSU9OIHdoZW4gZG9p
bmcgdGhlCmxsdm0tcHJvamVjdCB2ZXJzaW9uIGJ1bXAgdG8gMTUuMC4zLgoKPiArTExWTV9DTUFL
RV9TT1VSQ0UgPSBjbWFrZS0kKExMVk1fQ01BS0VfVkVSU0lPTikuc3JjLnRhci54ego+ICsKPiAr
ZGVmaW5lIEhPU1RfTExWTV9DTUFLRV9JTlNUQUxMX0NNRFMKPiArCW1rZGlyIC1wICQoSE9TVF9E
SVIpL2xpYi9jbWFrZS9sbHZtCj4gKwljcCAtUnYgJChARCkvTW9kdWxlcy8qICQoSE9TVF9ESVIp
L2xpYi9jbWFrZS9sbHZtCj4gK2VuZGVmCgpUaGVyZSBpcyByZWFsbHkgbm8gaW5zdGFsbCB0YXJn
ZXQgaW4gdGhpcyBwYWNrYWdlID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArCj4gKyQoZXZh
bCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
