Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D134C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 11:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7CF2401AD;
	Tue,  6 Aug 2024 11:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9D-XgQVZGPj; Tue,  6 Aug 2024 11:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994344033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 994344033F;
	Tue,  6 Aug 2024 11:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C01641BF306
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADC744033F
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EVb2ktwLyjf for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 11:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79D87401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79D87401AD
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79D87401AD
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 11:11:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so6408911fa.2
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 04:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722942714; x=1723547514;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4m0uNSATVvDbDkhCfaIDglKtbfqgMhm7F6sXvat5ttE=;
 b=UneIck67TQHPygwF8VbzBSZFcYXPv0GWUKmlvvUvlhp2uHBLWuUeXpiS7Qs/ahLe4y
 97PspE5nxt82/FFjcWco7/h4lU7kZVzCw2MNmM/+FMy9RT5k7UJQgBgupNU9fV7TazWb
 fE6s77lRv/lWiue+m8mI6bpmByX3ctZ8V28OYBHLutfT9mDPQVwsUEHQ1gias1p+wLdd
 4j5r5cqjZfv17XQIAziAAykPP8iX6eCGuSX0JuYt+3HLEOdXeyWm4Z3YxSuy2NGCq53l
 hANbIewKT4nqFVC/2rZmw8RD0ZE4OWyp+TT+OkIwjk658ZoX1CfwMHzRS7UoKANaiSBM
 VPRA==
X-Gm-Message-State: AOJu0YyUzMwqsniz97KdI9dd8sqwa/n4ZEkguSwx5+DmSNRztiMWv9gn
 BYoVJm2gpbIWALMzhpnUDV6kIzlJIwuipvSb3CZzgA6i9buulKKf
X-Google-Smtp-Source: AGHT+IGb2E6+clSS3+xHwGxjl4oOdkTtCiLKxrIswhqOuJhrRTZzQCCQYBBubJwf095FyBLxsirXVA==
X-Received: by 2002:a2e:81c1:0:b0:2ef:2638:48cd with SMTP id
 38308e7fff4ca-2f15aafdbfcmr85564451fa.30.1722942713631; 
 Tue, 06 Aug 2024 04:11:53 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e26021esm14240641fa.119.2024.08.06.04.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 04:11:53 -0700 (PDT)
Message-ID: <6eb776eb510eeb72b346b2457dbc3210c127e63c.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 06 Aug 2024 13:11:52 +0200
In-Reply-To: <20240804222232.56c2130a@windsurf>
References: <20240804060003.735172-1-troglobit@gmail.com>
 <20240804094647.876936-1-troglobit@gmail.com>
 <20240804222232.56c2130a@windsurf>
Organization: Addiva Elektronik
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722942714; x=1723547514; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4m0uNSATVvDbDkhCfaIDglKtbfqgMhm7F6sXvat5ttE=;
 b=V1x/Cov7O+4c1LMarNFHjdIiyCMMTU2RvUSLbQDdhHgSx8H+3oVLwHOvZxNJGpwba6
 BbsyCj1YJNabr8EDlUyIGhU/ucjd8FAwo3tbjjGErKLlwiU5aXM3dPh/ydm/LdvPP/Ew
 cpCzmuHjX5WKHPopYBRBXWQYnYinHhJaVLjzO0N+edTX1uDz3oWs6TCpanQnh3nkdy/t
 7x1XwsWw0tV/j+S9mfHnQoyJl5X8vRqwpybpUw6YI27kV9YC0BWDO3cICxTcW+LYtVl4
 fP+XfkcFzJJC0B+qg2T3/gS5Ox+PF6DZeKCOTwp19aH7TdzhblAldKHNbrNV9XS+4lZI
 V68w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V1x/Cov7
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdlog: add menuconfig
 option to select formatter
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzIQoKT24gU3VuLCAyMDI0LTA4LTA0IGF0IDIyOjIyICswMjAwLCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IE9uIFN1bizCoCA0IEF1ZyAyMDI0IEpvYWNoaW0gV2liZXJnIDx0cm9n
bG9iaXRAZ21haWwuY29tPiB3cm90ZToKPiA+IEFkZCBhbiBvcHRpb24gbWVudSB0byBzZWxlY3Qg
dGhlIHNwZGxvZyBmb3JtYXR0ZXI6IGV4dGVybmFsIGZtdAo+ID4gbGlicmFyeSwgZXh0ZXJuYWwg
dXNpbmcgaGVhZGVycy1vbmx5LCBDKysyMCBzdGQ6Zm9ybWF0LCBvciB0aGUKPiA+IGJ1bmRsZWQg
KHZlcnNpb24gbWF0Y2hlZCkgZm10IGxpYnJhcnksIHdoaWNoIGVhY2ggcmVsZWFzZSBvZiBzcGRs
b2cKPiA+IGlzIHRlc3RlZCBhZ2FpbnN0Lgo+ID4gCj4gPiBUaGUgZm9ybWF0dGVycyBhcmUgbXV0
dWFsbHkgZXhjbHVzaXZlIChzZWUgdGhlIENNYWtlTGlzdHMudHh0WzFdCj4gPiBmaWxlKSwgc2Vs
ZWN0aW5nIHRoZSAnaW50ZXJuYWwnIG9wdGlvbiBkaXNhYmxlcyBhbGwgdGhlIG90aGVyCj4gPiBv
cHRpb25zIGluIHRoZSAubWsgZmlsZSwgdGh1cyAiZW5hYmxpbmciIHRoZSBidW5kbGVkIGZvcm1h
dHRlci4KPiBDb3VsZCB5b3UgcHJvdmlkZSBzb21lIGRldGFpbHMgb24gd2h5IHdlIHdvdWxkIHdh
bnQgdG8gc3VwcG9ydAo+IGRpZmZlcmVudCBmb3JtYXR0ZXJzPwoKSSByZWFkIHVwIGEgYml0IG9u
IHRoaXMuICBUdXJucyBvdXQgc3BkbG9nIHN0YXJ0ZWQgb3V0IHdpdGggdGhlIGJ1bmRsZWQKKHRl
c3RlZCkgZm10IGFuZCBsYXRlciBhZGRlZCBhbiBvcHRpb24gdG8gdXNlIGFuIGV4dGVybmFsIG9u
ZS4gRnJvbQp3aGF0IEkgY291bGQgc2VlLCB0aGVyZSBoYXZlIGJlZW4gc2V2ZXJhbCByZWdyZXNz
aW9ucyBjYXVzZWQgYnkgdGhpcywKY2hhbmdlcyBpbiB1cHN0cmVhbSBmbXQgdGhhdCBkaWQgbm90
IHdvcmsgd2l0aCBzcGRsb2cuICBJbiBDKysyMCB0aGV5CmFkZGVkIHN0ZDo6bG9nZ2VyIHN1cHBv
cnQsIG1lYW5pbmcgc3BkbG9nIGNhbiBub3cgYmUgdXNlZCBjb21wbGV0ZWx5CndpdGhvdXQgZm10
LCB3aGljaCBzZWVtcyB0byBiZSB0aGUgZnV0dXJlIGRpcmVjdGlvbiBvZiB0aGUgcHJvamVjdC4K
Cj4gSW4geW91ciByZXBseSB0byBCYXJ1Y2ggeW91IHNhaWQgeW91IHdhbnRlZCB0byBwYWNrYWdl
IFJvdXNldHRlLAo+IHdoaWNoIHJlcXVpcmVzIHRoZSBidW5kbGVkIGZtdC4gSG93IGlzIHRoZSBi
dW5kbGVkIGZtdCBkaWZmZXJlbnQgZnJvbQo+IHRoZSBleHRlcm5hbCBvbmU/CgpUaGlzIHdhcyB2
ZXJ5IHVuY2xlYXIuICBJIGhhZCB0byBnbyBiYWNrIHRvIHRoZSBvcmlnaW5hbCBkZXZlbG9wZXIg
d2hvCmRpZCBvdXIgaW50ZWdyYXRpb24gYW5kIGNoZWNrIHdpdGggdGhlbS4gIFR1cm5zIG91dCBp
dCB3YXMgbm90aGluZyBtb3JlCnRoYW4gc29tZSBsaW5rZXIgaXNzdWUsIG5vdCBwcm9wZXJseSBw
dWxsaW5nIGluIHRoZSBmbXQgZGVwZW5kZW5jeS4gIFNvCndlIGNhbiBpZ25vcmUvZHJvcCB0aGlz
IHBhdGNoIHNpbmNlIGF0IGxlYXN0IHdlIGRvIG5vdCBuZWVkIGl0IGFueW1vcmUuCgpTb3JyeSBm
b3IgdGFraW5nIHVwIGV2ZXJ5b25lJ3MgdGltZSEKCj4gQWxzbyB1c2luZyBhIGNob2ljZS4uLmVu
ZGNob2ljZSBoZXJlIHdpbGwgbm90IG1ha2UgaXQgZWFzeSB0byBwYWNrYWdlCj4gUm91c2V0dGUs
IGJlY2F1c2UgeW91IGNhbid0ICJzZWxlY3QiIGFuIG9wdGlvbiBvZiBhCj4gY2hvaWNlLi4uZW5k
Y2hvaWNlLCBzbyB0aGUgUm91c2V0dGUgcGFja2FnZSB3aWxsIG5vdCBiZSBhYmxlIHRvCj4gc2Vs
ZWN0IEJSMl9QQUNLQUdFX1NQRExPR19GTVRfSU5URVJOQUwuCgpIdWgsIGRpZCBub3Qga25vdyB0
aGF0LiAgT0ssIGlmIHNvbWV0aGluZyBzaW1pbGFyIGNvbWVzIHVwIGxhdGVyIHdlIGNhbgpyZXZp
c2l0IHRoZSBjb25zdHJ1Y3QgYW5kIHBvc3NpYmxlIGFsdGVybmF0aXZlcy4KCkJlc3QgcmVnYXJk
cwogL0pvYWNoaW0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
