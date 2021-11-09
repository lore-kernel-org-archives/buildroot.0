Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E006DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CDE610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68CDE610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D6B4046A;
	Tue,  9 Nov 2021 22:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOQqqyvHMUvv; Tue,  9 Nov 2021 22:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 683A04043C;
	Tue,  9 Nov 2021 22:51:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4D21BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A08181767
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyDGFLYmUNd6 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 144D981766
 for <buildroot@busybox.net>; Tue,  9 Nov 2021 22:51:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r8so585668wra.7
 for <buildroot@busybox.net>; Tue, 09 Nov 2021 14:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=e3J+RN0G73W8chVkdQjJjTWBGwest3nZmmcopACzgT0=;
 b=cOxXRMnabfozCx4Ioco6XRoUQ6qr8EWIfjWyHWfyOvhL30FpXv5rtf95oq9wfvs993
 2JLKq6ODLLjPYcM/S+T6Cmt9MtQZ1XYzM0gZ/pPStlv5V0K1tHzmFclfaeBk2Ll1dIVL
 gvaGwzaAXtpJH2Zqqna7Cip5x7Lrb3KPSyPlPIOR3xjPRmNvakgDPkhnlZawObgM1yNo
 zM16fea2WxWHT/ke1UeZXxCKguWrfO9TdMspfPuMyEXzwpuvdFhE1kp9jsiL9AKrCbd8
 nJSzuEFVSNdhB18rBk9bT6ZBU9CatvRVXkJZTIxHGZX9TyXnl9hxXYmxYTQVIpYaOcA9
 qDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e3J+RN0G73W8chVkdQjJjTWBGwest3nZmmcopACzgT0=;
 b=QCSfFSSk5kgog59CGz/URcTzNtvb6R9PqIhTVaQFqoO8iUivxZWhqkBWyB9GVuPz8V
 v/WQoflonXXsNLoNuseD0B+c0WKLJNrYoAlUgbmy0JU91lle11y4r+pzXSGUZ139ZzkY
 j1ME+WjDzzSvlv1Yu8aBNFNcgl+n8mr0LjfJWeIBOmGkEaU5U5NHEM/b5aQcC+13F7gc
 QoBt83K7JnD5tmPHGM3qtmmsNoOI4rxa3C74lnLblt0fnerzRNXxohBL99umYDfOGBoZ
 D6M3d09kJXNBhChn5Gxq+8YMW4f48tYZTITp4HBkJVKpfNXxzIQoLkjHFuCozHJ4xVI9
 2GKQ==
X-Gm-Message-State: AOAM532Kk1Pb7h1s7FzijfVKcAJNe/vWv5ufOcK8IWdYs7msGRpAovWx
 d7ishscRIgHzW9AHASPnUX/hA51zCyk=
X-Google-Smtp-Source: ABdhPJxI3xD0dYIeRMq7ywt2ch5eqkzHur2+ZZxlhtOVPYBvttoPLRVglHDmf7I5bdHuewVRLKEy9A==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr13619974wri.348.1636498293032; 
 Tue, 09 Nov 2021 14:51:33 -0800 (PST)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id v10sm3149430wmc.20.2021.11.09.14.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:51:32 -0800 (PST)
Message-ID: <67ba0cba-8d57-5349-4f53-7c621350b835@gmail.com>
Date: Tue, 9 Nov 2021 23:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211108201054.225256-1-francois.perrad@gadz.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211108201054.225256-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luajit: fix luvi
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKTGUgMDgvMTEvMjAyMSDDoCAyMToxMCwgRnJhbmNvaXMgUGVycmFk
IGEgw6ljcml0wqA6Cj4gbHV2aSB1c2VzIHRoZSBjcm9zcyBieXRlY29kZSBnZW5lcmF0aW9uIG9m
IGhvc3QtbHVhaml0Cj4gdGhlIGJ5dGVjb2RlIGZvcm1hdCBoYXMgMiBmbGF2b3JzLCBkZXBlbmRp
bmcgb2YgR0M2NCBvcHRpb24uCj4gCj4gc2luY2UgdGhlIGNvbW1pdCBodHRwczovL2dpdGh1Yi5j
b20vTHVhSklUL0x1YUpJVC9jb21taXQvYmQwMDA5NGMzYjUwZTE5M2ZiMzJhYWQ3OWI3ZWE4ZWE2
Yjc4ZWQyNQo+IEdDNjQgbW9kZSBpcyBlbmFibGUgYnkgZGVmYXVsdCBvbiBhbGwgNjRiaXRzIHBs
YXRmb3JtLgo+IAo+IHdpdGggdGhpcyBwYXRjaCwgbHVhaml0IGFuZCBob3N0LWx1YWppdCBhcmUg
YnVpbHQgd2l0aCB0aGUgc2FtZSBvcHRpb24sCj4gc28gdGhlIGJ5dGVjb2RlIGdlbmVyYXRlZCBi
eSBob3N0LWx1YWppdCBpcyB2YWxpZCBvbiBsdWFqaXQuCgpJIGJlbGlldmUgaXQgd291bGQgYmUg
Z3JlYXQgdG8gYWRkIGEgbmV3IHRlc3QgdG8gdGVzdCBieXRlY29kZSBnZW5lcmF0ZWQgYnkKaG9z
dC1sdWFqaXQuIEl0J3Mgb25seSBieSAiY2hhbmNlIiB0aGF0IHdlIG5vdGljZWQgdGhpcyBpc3N1
ZS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRA
Z2Fkei5vcmc+Cj4gLS0tCj4gIHBhY2thZ2UvbHVhaml0L2x1YWppdC5tayB8IDUgKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2x1YWppdC9sdWFqaXQubWsgYi9wYWNrYWdlL2x1YWppdC9sdWFqaXQu
bWsKPiBpbmRleCBmYmJkOGViYzcuLmJhNWQ4NTQzNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1
YWppdC9sdWFqaXQubWsKPiArKysgYi9wYWNrYWdlL2x1YWppdC9sdWFqaXQubWsKPiBAQCAtMTUs
NiArMTUsNyBAQCBMVUFKSVRfUFJPVklERVMgPSBsdWFpbnRlcnByZXRlcgo+ICAKPiAgaWZlcSAo
JChCUjJfUEFDS0FHRV9MVUFKSVRfQ09NUEFUNTIpLHkpCj4gIExVQUpJVF9YQ0ZMQUdTICs9IC1E
TFVBSklUX0VOQUJMRV9MVUE1MkNPTVBBVAo+ICtIT1NUX0xVQUpJVF9YQ0ZMQUdTICs9IC1ETFVB
SklUX0VOQUJMRV9MVUE1MkNPTVBBVAo+ICBlbmRpZgo+ICAKPiAgIyBUaGUgbHVhaml0IGJ1aWxk
IHByb2NlZHVyZSByZXF1aXJlcyB0aGUgaG9zdCBjb21waWxlciB0byBoYXZlIHRoZQo+IEBAIC0y
Niw4ICsyNywxMCBAQCBlbmRpZgo+ICAjIGxpYnJhcmllcyBhcmUgaW5zdGFsbGVkLgo+ICBpZmVx
ICgkKEJSMl9BUkNIX0lTXzY0KSx5KQo+ICBMVUFKSVRfSE9TVF9DQyA9ICQoSE9TVENDKQo+ICtI
T1NUX0xVQUpJVF9YQ0ZMQUdTICs9IC1ETFVBSklUX0VOQUJMRV9HQzY0CgpXaGF0IGlmIHRoZSBo
b3N0IGlzIGFuIDMyYml0cyBtYWNoaW5lID8KClRoZSBsdXZpIHRlc3QgbmVlZHMgYW5vdGhlciBj
aGFuZ2Ugc2luY2UgbHV2aSAtdiBkb2Vzbid0IGFsd2F5cyByZXR1cm4gYSBsaXN0IGluCnRoZSBz
YW1lIG9yZGVyOgoKU2VlIEx1YUpJVCBGQVE6Cmh0dHBzOi8vbHVhaml0Lm9yZy9mYXEuaHRtbAoK
UTogVGFibGUgaXRlcmF0aW9uIHdpdGggcGFpcnMoKSBkb2VzIG5vdCByZXN1bHQgaW4gdGhlIHNh
bWUgb3JkZXI/CgpodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDIxLU5vdmVtYmVyLzYyNzkzOC5odG1sCgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICBlbHNl
Cj4gIExVQUpJVF9IT1NUX0NDID0gJChIT1NUQ0MpIC1tMzIKPiArSE9TVF9MVUFKSVRfWENGTEFH
UyArPSAtRExVQUpJVF9ESVNBQkxFX0dDNjQKPiAgZW5kaWYKPiAgCj4gICMgV2UgdW5mb3J0dW5h
dGVseSBjYW4ndCB1c2UgVEFSR0VUX0NPTkZJR1VSRV9PUFRTLCBiZWNhdXNlIHRoZSBsdWFqaXQK
PiBAQCAtNjYsNyArNjksNyBAQCBMVUFKSVRfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBM
VUFKSVRfSU5TVEFMTF9TWU1MSU5LCj4gIGRlZmluZSBIT1NUX0xVQUpJVF9CVUlMRF9DTURTCj4g
IAkkKEhPU1RfTUFLRV9FTlYpICQoTUFLRSkgUFJFRklYPSIkKEhPU1RfRElSKSIgQlVJTERNT0RF
PWR5bmFtaWMgXAo+ICAJCVRBUkdFVF9MREZMQUdTPSIkKEhPU1RfTERGTEFHUykiIFwKPiAtCQlY
Q0ZMQUdTPSQoTFVBSklUX1hDRkxBR1MpIFwKPiArCQlYQ0ZMQUdTPSQoSE9TVF9MVUFKSVRfWENG
TEFHUykgXAo+ICAJCS1DICQoQEQpIGFtYWxnCj4gIGVuZGVmCj4gIAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
