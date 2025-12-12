Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D96D59F53
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 23:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A839341126;
	Fri, 12 Dec 2025 23:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qsny9ZBwdEq; Fri, 12 Dec 2025 23:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD2B40B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765583032;
	bh=OclKa6raed51yjGtAZNgWIxXpzJgDjEIr05zd2Pjlac=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=ah1kX49Zz7b5KaVCQExaZiS7bjCo/LTEd249QLQInTnY+dZkUzbpkrD/sY5rtYA/T
	 hfIePaRwF57DOVnFRSi9r/5GU0jyAJiVzWUmeeYPmgpeTd9Hxxk04r1NSYSzxUOZtu
	 Ef+3l1psGuUiEG2bA1sGQMjzDCQPsgLAxM1Ar1ymg6EPw0TG0t+qyW2OHTDDW5hEXP
	 VybRLKr8BE/VMovEGgntujjkJx6WFSKAVAjlhhd+Lbb2ms1AwvQPchmt5/pTHa2jdV
	 c1FYe9QX/ilc6+7TZRgw9QZl16bkbzvF+iG7DDmS4Yy7SR46jGZpvqxuXGmbUr4c/c
	 ccW1x6ctoQ94w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD2B40B4E;
	Fri, 12 Dec 2025 23:43:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B66022C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82264018D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_iB46nTx4Th for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 23:43:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CCE34016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCE34016B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CCE34016B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:43:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477770019e4so17262585e9.3
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 15:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765583027; x=1766187827;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+fAp9RxGbHBEMMgmSYQkQ9PawNeWSTG2OQYwNk26JuQ=;
 b=JWbRKTvi8IKUWw3C/K45AVckAxkEjvGaLXzXhl8nTz0TOSu7hUgnYFLW/M3YNxZqTd
 +kwxJFczktCoSgKlC1YFXyixpnOdOLhMSotVKb3SFZcNkVpTdLplYg4ogGTrUMP/+WQi
 SCsrX7RHKVAyny9fqaspupIQP9RS+3l7nbncAOBGso05hFVRfJv6Su73jWH1ON0wPkT8
 xBm3kFaUVk1IySY3Z0nmqQwWlMC6RtVZAeMiVmBK06L18g8+UXdjnA8V3GCenuqo3ZrU
 tBLIVfcldtVjYfbWQxReMAxE1IfqcrUSkB/WVn3PXwof5sVgDHO/MK0puirg/8DZp0JM
 CrNg==
X-Gm-Message-State: AOJu0YxkD0uGEEo2WiK+rsJF/xayAIjHBmCHnCD2NbXgGxGMOb2mFr8A
 OhRQZyE1osswvwDfKD7IvOEUhQXL0hru2JAfeKlrZvsH3oNZWI56OAg+
X-Gm-Gg: AY/fxX55+jnb7lz0UE1tYFGO2t19oLmfP5SXGrchYDu6KYKrwiYK9sh5exKgRzzZ27G
 DdKnVFMmag3rIQ+gnRcJOhKiwOY5PeUYPn18p35V0ZEoXDdP2QqkvXdGHmpSSnqNa/CEBEEE66b
 GXoWp8Dz7xtvWNplDR+g5c1pMApnOnpTSaG1PI+/SGJdjg65jHVIJytome8rFfenu7jLPtmkSTB
 8Fns4WbZKaKM08e8d0A4nhz/QWR5fsnXhiSwkxgSHllXgy++Ij1l+AXZf+DA1H0fxmeoJosSv4I
 4GQsXz98s+Zp9OELvGM7slEDan5euWvo3AA8t0WPc38j2Ejrg9Pu2wF1mQRUEX0pobaNTYSHKQe
 ukpHAyZEZRFId69K6Z2J5vDmY37EavTuX01rwf9oYnHlzdnjznTlSopm5olaBcs0EyW23UpHn2Y
 Wjbz5NKrmsKdwSSmPt1+Sj2Pqg7sOpIfQwVSkcd0JrdRrcLDi3
X-Google-Smtp-Source: AGHT+IGAec2W5lv6RtLN2IYZ1GoiNR12KI3MgztnrdMwq4VElF4PHVX7y5tsyh5MxlcFsa9G4Cqymw==
X-Received: by 2002:a05:600c:3f19:b0:479:398d:4bbf with SMTP id
 5b1f17b1804b1-47a8f8c08a4mr30961695e9.13.1765583027250; 
 Fri, 12 Dec 2025 15:43:47 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4ae4d3sm20182495e9.5.2025.12.12.15.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 15:43:46 -0800 (PST)
Date: Sat, 13 Dec 2025 00:43:44 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20251212234344.GA178673@pevik>
References: <20251212225057.GA173789@pevik>
 <69C776C6-313F-47DD-A59F-DD7A9BE0F1B3@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69C776C6-313F-47DD-A59F-DD7A9BE0F1B3@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765583027; x=1766187827; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+fAp9RxGbHBEMMgmSYQkQ9PawNeWSTG2OQYwNk26JuQ=;
 b=T4dnjdPPAc6qAjHRR5WeMIoAlhTEV9m5KWbm0OI4ecONOpDyafxonu8aTB6LR9EuDL
 KGsGpzyQ94k5hNIcBE+CFkJajTtHkGG8rzv4JVU5BqxX9UqEO9qHgi2IgEHbTIqL6QBy
 ZXC48NYK6XdsgfpoNuTdPR0C8c+QabDoBaHeZra/xpYoQ5/rL20HZHy03gEsTJPCRpnE
 i1Wa2cJGG/fA5Ioxu9bdzpr7viwOsZDnj0P1pMxxMTIGWXdZyvAf0KYaWpnSIbb7JySI
 gCAopANV7MSeTFp9sdgLucb1hTXOYjWlVqW1XIgn6tT9BOI3slAHnOYL84VfddFgZedF
 Ebfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T4dnjdPP
Subject: Re: [Buildroot] [PATCH] pacakge/nfs-utils: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_DB
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBIaSBQZXRyLAoKPiA+IElsIGdpb3JubyAxMiBkaWMgMjAyNSwgYWxsZSBvcmUgMjM6NTEsIFBl
dHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPiBoYSBzY3JpdHRvOgoKPiA+IO+7v0hpIEdp
dWxpbywKCj4gPj4gUGFjYWtnZSBuZnMtdXRpbHMgcmVxdWlyZXMgbGlidGlycGMgcnBjZGIgb3B0
aW9uLCBzbyBsZXQncyBzZWxlY3QgaXQgYnkKCj4gPiBzL1BhY2FrZ2UvUGFja2FnZS8KCj4gPj4g
ZGVmYXVsdC4KCj4gPj4gRml4ZXM6Cj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzI5YWRmMmQwNGNmNGM0NmU0OTJhZjk1ZWRhYTk2OTgzOTg1ZDZiNTcvCgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPgo+ID4+IC0tLQo+ID4+IHBhY2thZ2UvbmZzLXV0aWxzL0NvbmZpZy5pbiB8
IDEgKwo+ID4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKPiA+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9uZnMtdXRpbHMvQ29uZmlnLmluIGIvcGFja2FnZS9uZnMtdXRpbHMvQ29uZmln
LmluCj4gPj4gaW5kZXggMDJjYzdlNzhjYy4uM2UxM2JmODdhOSAxMDA2NDQKPiA+PiAtLS0gYS9w
YWNrYWdlL25mcy11dGlscy9Db25maWcuaW4KPiA+PiArKysgYi9wYWNrYWdlL25mcy11dGlscy9D
b25maWcuaW4KPiA+PiBAQCAtOSw2ICs5LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX05GU19VVElM
Uwo+ID4+ICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTcg
IyBnZXRyYW5kb20oKQo+ID4+ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJFVkVOVAo+ID4+ICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJUSVJQQyAjIElQdjYgcmVxdWlyZXMgbGlidGlycGMKPiA+
PiArICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJUSVJQQ19EQgoKPiA+IEknbSBjb25mdXNlZC4g
VGhlcmUgaXMgbm8gQlIyX1BBQ0tBR0VfTElCVElSUENfREIgaW4gbWFzdGVyIGJyYW5jaC4gV2hh
dCBhbSBJCj4gPiBtaXNzaW5nPwoKPiBJ4oCZdmUgZm9yZ290dGVuIHRvIGFkZCB0aGUgb3RoZXIg
cGF0Y2ggSeKAmXZlIHdvcmtlZCBvbiB0byBhZGQgTElCVElSUENfREIKClRoYW5rcyBmb3IgaW5m
byEKCgo+ID4gQW5kIGVuZCBsb2cgaGFzOgo+ID4gY29uZmlndXJlOiBlcnJvcjogTmVpdGhlciBn
ZXRycGNieW51bWJlcl9yIG5vciBnZXRycGNieW51bWJlciBhcmUgYXZhaWxhYmxlCj4gPiBUaGVz
ZSBmdW5jdGlvbnMgYXJlIGZyb20gZ2xpYmMncyBOU1MgYW5kIDxuZXRkYi5oPiwgcmlnaHQ/Cgo+
IEFGQUlLIHRob3NlIGZ1bmN0aW9ucyBjYW4gYmUgcHJvdmlkZWQgbGlidGlycGMgaWYg4oCUZW5h
YmxlLXJwY2RiIGlzIHBhc3NlZCB0byBjb25maWd1cmUuCkkgaGF2ZW4ndCB1cGRhdGVkIGxpYnRp
cnBjIGNvbmZpZ3VyZSBmb3IgYSB3aGlsZS4gIEdvb2QgcG9pbnQsIEkgc2VlLCBpdCB3YXMKYWRk
ZWQgYnkgS2hlbSBxdWl0ZSByZWNlbnRseSwgaW4gMS0zLTctcmM0ICh3aGljaCBpcyBhbHJlYWR5
IHJlbGVhc2VkIGFzIDEuMy43KS4KCj4gTmVlZCB0byBzZW5kIGJvdGggcGF0Y2hlcyBzb29uCgor
MQoKPiBUaGFua3MgdG8gbG9vayBpbnRvIHRoaXMKClRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlz
ISBCVFcgeW91J3JlIG1haW50YWluZXIgb2YgbmZzLXV0aWxzLiBEb24ndCB5b3Ugd2FudAphbHNv
IGNvbnNpZGVyIG1haW50YWluaW5nIHJwY2JpbmQgYW5kIGxpYnRpcnBjPwoKPiBLaW5kIHJlZ2Fy
ZHMKPiBHaXVsaW8KCgo+ID4gS2luZCByZWdhcmRzLAo+ID4gUGV0cgoKPiA+PiAgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfU1FMSVRFCj4gPj4gICAgc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVgK
PiA+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9MSUJCTEtJRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
