Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7C1E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF6F80F60;
	Mon,  6 Jan 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU8NCTTyIzv7; Mon,  6 Jan 2025 21:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75B280F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75B280F65;
	Mon,  6 Jan 2025 21:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB08FF1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C589940198
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_3BKTHXAu82 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4C9F400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C9F400A6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C9F400A6
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:27:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so15123996e87.2
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 13:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736198877; x=1736803677;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZMQBwyzgVTsAfXAAZbzIar0aIZqSGU4P2mgpaJUw6U=;
 b=SQmdX0ioqUa9cGfpUOk2D/H89zzpCCfUx9l5up3F76y/tXGGU1m8Mvr2XYiFernvh5
 xi57dTQq+bwE7W89UknTAucyCC+YORz9HFT9fSV9GcjYgDJ0qxS4dUKcoH7C87Of5Ceo
 owYhxC9g75/kjOJbtjG1Iim3LbriNNCRD5dIZJQjcLbjY9h20ML6sXE+urJxRkpliV2m
 RqqzGsv0v0mBtRaMR6S1Uxdu95vpREBSVC9BNm3gxQLlGVieeBxYhXQjFJ4Nkjm3bypn
 CxOYAABB7/aNBaWSThxrh87kP0mlNIKMPu9iNCstoqEX9+DvpLwABPDKmbjVZyewuo5H
 xtnQ==
X-Gm-Message-State: AOJu0Yxw2T1Uemyj/CzplzveQt0lExzVuLv+bIMEkqE0eNG1sXcJEV7i
 SXW//QW3GbD9I5nAI6viKbnQNoQiHtDy2FRDZAY89xY3K+kGfmSEmrLIgrPC
X-Gm-Gg: ASbGncuOd6bPWENQVr5ZasAtCmf9gwEQGGc5w7ICRzTK3vXp1VoJI0g39uM3cTv8xlS
 PtxZfa0zFNVrcvwilVwozDBYBkjYUwmTJ4aSSJiBfma6F92Sou1a4P3VNskHPwxLFZpHr8tfYfa
 uWAie7nYxZD5lLKaIAg/6bENLJ6Zj7i1mb+k5ywh4gs9MTJKgQvHU/zY10Arf/MuXbmXoEEBhYn
 qwkqQEu3wGDJuKq8Y/44/0dCrDAPa+hlxE=
X-Google-Smtp-Source: AGHT+IHZBlbT92OqFbVG3T7OiKSg9HbLxeYKCvwJeEbXjWq9BAuewV1C89jP1ffN31kz1Rbwn5k3WQ==
X-Received: by 2002:a05:6512:39cc:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-5422956026dmr20406439e87.35.1736198876852; 
 Mon, 06 Jan 2025 13:27:56 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238137cesm5008782e87.148.2025.01.06.13.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 13:27:55 -0800 (PST)
Message-ID: <ffbe8c4eb9266bd95f724307e96d9855f6a18c26.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 06 Jan 2025 22:27:54 +0100
In-Reply-To: <20250106221131.4abdc790@windsurf>
References: <20250106203459.2875914-1-troglobit@gmail.com>
 <20250106221131.4abdc790@windsurf>
Organization: Addiva Elektronik
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736198877; x=1736803677; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/ZMQBwyzgVTsAfXAAZbzIar0aIZqSGU4P2mgpaJUw6U=;
 b=P/CJXnhXbhKnoBB/yen7XhgBPATLCYC/yAkttvo6NBIURsAOPnEjJRHEKL4QODE0oz
 +kcPM9SNNOtPRxMihkICdEWNxjHMHZyPB79oELYY+LDAjRDZpVlP9BokjJWs/XTCMNY6
 Z4yBrgHmCn3otJDelkPh/G9TX4KfGd0liAZ/ymVIAXkdFPsLT4jDuizzh3FApAQjOtYI
 iVaU57dFn3R+MbkSriekokedRAd7ccrm4NrGr8slstuyZiCTQ24KaFvWmPf+c9eQOwJD
 OiBI6ll94YZ9ISwWUrRzChodZ0zPY37Hel96fifCxBnzMMza+59Od2Drby2/ThnF4DNm
 etow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P/CJXnhX
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBhbGwKCk9uIE1vbiwgMjAyNS0wMS0wNiBhdCAyMjoxMSArMDEwMCwgVGhvbWFz
IFBldGF6em9uaSB3cm90ZToKPiBPbiBNb24swqAgNiBKYW4gMjAyNSAyMTozNDo1OSArMDEwMAo+
IEpvYWNoaW0gV2liZXJnIDx0cm9nbG9iaXRAZ21haWwuY29tPiB3cm90ZToKPiBJIGFtIG5vdCBh
IGJpZyBmYW4gb2YgdGhpcywgYmVjYXVzZSB3ZSBmcmVxdWVudGx5IHVzZSBhICJzYW5lIiBkZWZh
dWx0Cj4gZ3JvdXAgaW4gcGFja2FnZXMsIGFuZCBjbGVhcmx5IGRvbid0IHdhbnQgdG8gbWFrZSBz
dWNoIGEgInNhbmUiCj4gZGVmYXVsdAo+IGNvbmZpZ3VyYWJsZSBpbiBlYWNoIHBhY2thZ2UuIFdl
IHdvdWxkIG5vcm1hbGx5IGV4cGVjdCBwZW9wbGUgd2hvIG5lZWQKPiB0byBjdXN0b21pemUgdGhp
bmdzIHRvIGRvIGl0IGluIHRoZWlyIGN1c3RvbSBwb3N0LWJ1aWxkIHNjcmlwdCwgYnV0IEkKPiBh
ZG1pdCBpbiB0aGlzIHNwZWNpZmljIGNhc2UgaXQgc2VlbXMgbm90IGdyZWF0LCBzbyBJIGRvbid0
IHJlYWxseSBoYXZlCj4gYSBnb29kIGlkZWEuCgpJIHVuZGVyc3RhbmQgdGhlIGNvbmNlcm4sIHNh
bmUgZGVmYXVsdHMgaXMgb25lIG9mIG1hbnkgcmVhc29ucyB0aGF0IG1ha2UKQnVpbGRyb290IHNv
IGNvbXBlbGxpbmcuICBIb3dldmVyIC4uLgoKPiBCdXQgbXkgbWFpbiBjb25jZXJuIGlzIHJlYWxs
eTogZG8gd2Ugd2FudCB0byBhbGxvdyBjb25maWcgb3B0aW9ucyB0bwo+IHNldCB0aGUgZ3JvdXAg
bGlrZSB0aGlzIGZvciBlYWNoIGFuZCBldmVyeSBwYWNrYWdlPwoKLi4uIHNvbWUgcGFja2FnZXMs
IGluIHRoaXMgY2FzZSB0aGUgY29tcGxleCBiZWFzdCB0aGF0IGlzIEZyciwgaGFyZCBjb2RlCnRo
ZSBncm91cCBpbiB0aGUgcmVzdWx0aW5nIGFwcGxpY2F0aW9uLCB3aXRob3V0IGJlaW5nIHBvc3Np
YmxlIHRvIGNoYW5nZQpvciBvdmVycmlkZSBpbiBwb3N0LWJ1aWxkIHNjcmlwdHMgb3IgY29uZmln
dXJhdGlvbiBmaWxlcy4gIEluIHN1Y2ggY2FzZXMKSSBiZWxpZXZlIHdlIHNob3VsZCBhbGxvdyBm
b3Iga2VlcGluZyBkZXZpYXRpb25zIHRvIHRoZSBkZWZhdWx0cyBpbiB0aGUKdXNlcnMgZGVmY29u
ZmlnIHJhdGhlciB0aGFuIGZvcmNpbmcgdGhlbSB0byBtYWludGFpbiBsb2NhbCBwYXRjaGVzLgoK
PiA+IMKgIyBEbyBub3QgZW5hYmxlIC1mcGx1Z2luPWZyci1mb3JtYXQgZm9yIHByb2R1Y3Rpb24s
IHNlZQo+ID4gZG9jL2RldmVsb3Blci93b3JrZmxvdy5yc3QsCj4gPiDCoCMgaXQgaXMgb25seSBp
bnRlbmRlZCBmb3IgRlJSJ3MgZGV2ZWxvcG1lbnRzCj4gPiArRlJSX1ZUWVNIX0dST1VQPSQoY2Fs
bCBxc3RyaXAsJChCUjJfUEFDS0FHRV9GUlJfVlRZU0hfR1JPVVApKQo+IAo+IE5pdHBpY2s6IHNw
YWNlcyBuZWVkZWQgYXJvdW5kID0gc2lnbi4KCkFoLCBnb29kIGNhdGNoLiAgV2lsbCBmaXggdGhh
dCBpbiB2MiwgcGVuZGluZyBhcHByb3ZhbCBvZiB0aGUgZ2VuZXJhbAppZGVhLCBvZiBjb3Vyc2Uu
CgpCZXN0IHJlZ2FyZHMKIC9Kb2FjaGltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
