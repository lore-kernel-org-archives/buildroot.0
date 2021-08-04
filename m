Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B860C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:22:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A5B60184
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A5B60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B054035E;
	Wed,  4 Aug 2021 11:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jawXBkh2srVx; Wed,  4 Aug 2021 11:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809E540176;
	Wed,  4 Aug 2021 11:22:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7631BF327
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 488C540176
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAxSLHD_-RFm for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69088400F8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:22:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k4so985399wms.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=R49VTtXNVYE08G5Drkww9jyI9q8UgSf/d00XL7sTNCQ=;
 b=Yw8HKCLV7BTSv8J1y0cmpG8rn81xPiiQLFtumg6RqIex+ZPdYA9BR45U4WqPaLGdgX
 9trqgcr51HeWpPT+30uLBSVbMlSjFlJ2Nu4apNgAi1vqGZ/0SbJgendAO3mOB8tTPr6K
 v29/lb19BEI+LI1FxiYkCOwgf/vbSES0oMDEwfHusB66LKTXr+v7of9B25VfnOrntBCQ
 efHskMngiKhiv0lk66t4AMTdsShzYSWXHjVWNJLtTN9GE+FcRH0LQfTjfcS/B2cJQvIO
 6eQgud7o147JFcnSA8mP3uJCiaKa0zOhrKYdPdh6NvH0yXBW57lXbBbsWCpOnFViZ6Ce
 qhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=R49VTtXNVYE08G5Drkww9jyI9q8UgSf/d00XL7sTNCQ=;
 b=W1k/sPGQ3jaE5UsSuw8f90w4ATr/2mVti/9KJWPKQg1kToiXjismZm0ZOGiz1EUeZG
 +uRus6oG+rBFzF90D0ZNCXnN4H0ScYZdnOFdxunaL7pSAGoIHcx92KnCC9Pdeysl/Wbo
 iHBh0pgYZNc0EUKSBs9yAX9526s/U5j8A5kxXgwbEWY4Syd1FrOM5syZPTA/Lp339pOV
 9/uI30VWeV53q5oa4BCTKf35QpwVwq1OxiMikqjQUKJGGtU/Zfo9bdj4sqc0vEBRy8wC
 lxnu5t7UCTrJ6Qe30ygy1sopgIzkVT6Q8bv6M/ZcM96zn7wOfb6EdyHpdramT5dcn1mW
 wQLQ==
X-Gm-Message-State: AOAM533N1td9NPI1F4RwfDAM8pRFsZ4N5HZ4ysdq6LEjsf0AL+3Upl1M
 UL0VmvIc79JQK/zfKv1bAhU=
X-Google-Smtp-Source: ABdhPJxAd9Sz5tRbYu6MjkI4aX+/I0v9RP1zyHY5aLkWBCR8rPRZ0/0t4pzgx4zoDeD/GgQarQAsaQ==
X-Received: by 2002:a7b:c412:: with SMTP id k18mr2887380wmi.145.1628076123505; 
 Wed, 04 Aug 2021 04:22:03 -0700 (PDT)
Received: from smtpclient.apple (89-87-110-57.abo.bbox.fr. [89.87.110.57])
 by smtp.gmail.com with ESMTPSA id y66sm2007496wmy.39.2021.08.04.04.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 04:22:02 -0700 (PDT)
From: romain.tisserand@gmail.com
Mime-Version: 1.0 (1.0)
Date: Wed, 4 Aug 2021 13:22:01 +0200
Message-Id: <FCD28833-3B71-45C0-B50F-616321BE4B19@gmail.com>
References: <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be>
In-Reply-To: <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18F72)
Subject: Re: [Buildroot] An issue with alsa-plugins + alsa-utils
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org,
 cedric.chepied@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhhbmtzIGZvciB0aGUgaW5zaWdodCAhCkkgYWN0dWFsbHkgc3R1bWJsZWQgb24gdGhpcyBiZWNh
dXNlIG9mIHRoZSByZWNlbnQgYWRkaXRpb24gb2YgYWxzYS1wbHVnaW5zIHBhY2thZ2UuCgpCZXN0
IFJlZ2FyZHMsClJvbWFpbiBUaXNzZXJhbmQKCkVudm95w6kgZGUgbW9uIGlQaG9uZQoKPiBMZSA0
IGFvw7t0IDIwMjEgw6AgMTI6NTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5i
ZT4gYSDDqWNyaXQgOgo+IAo+IO+7vwo+IAo+PiBPbiAwNC8wOC8yMDIxIDEyOjEyLCBHbGViIE1h
em92ZXRza2l5IHdyb3RlOgo+PiBIaSwKPj4gCj4+IFRoaXMgaXMgYW4gaXNzdWUgb3JpZ2luYWxs
eSByZXBvcnRlZCB0byBtZSBieSBSb21haW4gVGlzc2VyYW5kIG9uIERpc2NvcmQ6Cj4+IAo+PiAx
LiBhbHNhLXBsdWdpbnMgY29waWVzIHNvbWUgZmlsZXMgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUv
YWxzYS9hbHNhLmNvbmYuZAo+PiAyLiBhbHNhLXV0aWxzIHJlbW92ZXMgdGhlc2UgZmlsZXMgZHVy
aW5nIGluc3RhbGxhdGlvbiAoIHxybSAtcmYKPj4gJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvYWxz
YS87fCkKPj4gCj4+IENlZHJpYywgY2FuIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2s/Cj4+IAo+PiBJ
IHRoaW5rIGEgZ29vZCBvcHRpb24gbWF5IGJlIHRvIG5vdCByZW1vdmUgdGhlIHwkKFRBUkdFVF9E
SVIpL3Vzci9zaGFyZS9hbHNhL3wKPj4gZGlyZWN0b3J5IGluIGFsc2EtdXRpbHMubWsgPGh0dHA6
Ly9hbHNhLXV0aWxzLm1rPgo+IAo+IFBldGVyIGRpZCB0aGUgInJtIC1yZiIgMTEgeWVhcnMgYWdv
IGFzIHBhcnQgb2YgdGhlIGZpeCBmb3IKPiBodHRwczovL2J1Z3MuYnVpbGRyb290Lm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTU3Mwo+IGJ1dCBJIHRoaW5rIHRoZSBpbnRlbnRpb24gd2FzIGp1c3QgdG8g
bWFrZSBzdXJlIHRoYXQgeW91IGNvdWxkIHVuY29uZmlndXJlIHNvbWUKPiBvcHRpb25zLCByZWJ1
aWxkIGFscy11dGlscyBhbmQgaXQgd291bGQgbGVhdmUgb25seSB0aGUgY29uZmlndXJlZCB1dGls
cy4gVGhhdCdzCj4gYSBzY2VuYXJpbyB0aGF0IGRvZXNuJ3Qgd29yayBhbnl3YXksIHNvIGl0J3Mg
T0sgdG8gcmVtb3ZlIHRoZSBybS4KPiAKPiBSZWdhcmRzLAo+IEFybm91dApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
