Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC5EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 02:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C3AD83F0E;
	Wed,  1 Nov 2023 02:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C3AD83F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcR-TLp41fvE; Wed,  1 Nov 2023 02:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 333408443D;
	Wed,  1 Nov 2023 02:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 333408443D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1A771BF97A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A94E613BC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A94E613BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13W8_VPOYBMX for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 02:01:53 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17D11612DD
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 02:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D11612DD
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so8610631e87.2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 19:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698804111; x=1699408911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wv4hgjOZf5fPLQ0x+HVGr8R/F/6ECs5GxqWgQX9wi7Q=;
 b=Bh1OwP/jZNbfn2yi6taUiNPYnHNvSvR27Fr7KT9nOnnveOjpmQtdDBRK6a9ECrf2mf
 a8qUkbTg5GNfoKhZ927iN1ulmvNM6+qTMW0qBseIyAcMUX+bfhfhTNs+f49mPtxTQniM
 gJW7iJtP8eMkDaa1ZfMF1dfWZmxxKcMFVJKztW8IBolBfcVBzZBiX9IN0d5bAyXhIXxf
 5ZUupfbSuEEppPsUqTzgZ9UwBJ+WEatDB2o+QTkW9q+CvMo57zkxRFHKKDo1B06xamDj
 BNbV0+hkpg9A6+AzeoSlOOZtW5n70cuRlpDuOR9H5O5L13arN5n6MfOj+a5ypahtsKP8
 vTjA==
X-Gm-Message-State: AOJu0YzVl4Oq6a/swl071RJJjNL1gNEt8uVj9UIjtVNA05wu8HdXU0A+
 CQhC67Awr8Y+RvvOVYjcVuxuVFKd19Bme65B2ObMRcVa
X-Google-Smtp-Source: AGHT+IGaFKSqrPMx75SUnlcKYoANgWsLoCt8Zzf5lrO2UF7i5VrWbzczKuhqzwTVEwVmrp29CMGhfoFXihn9tibYQOM=
X-Received: by 2002:a05:6512:a91:b0:507:9f24:ad17 with SMTP id
 m17-20020a0565120a9100b005079f24ad17mr14163563lfu.43.1698804110621; Tue, 31
 Oct 2023 19:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231026181904.3218122-1-bernd@kuhls.net>
 <87o7gf1b6h.fsf@48ers.dk>
 <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
 <87jzr315sl.fsf@48ers.dk>
 <CAFkzVZbf3A4npP1DvXYkKo0dDTm_zxJMptdwR73J5EG3YpXH-w@mail.gmail.com>
 <87fs1r0y3q.fsf@48ers.dk>
In-Reply-To: <87fs1r0y3q.fsf@48ers.dk>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 1 Nov 2023 10:01:39 +0800
Message-ID: <CAFkzVZbVXmG0axBGkZ0jJyqE49EG+SbntdKkSTqo5QUo8=iS+g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698804111; x=1699408911; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wv4hgjOZf5fPLQ0x+HVGr8R/F/6ECs5GxqWgQX9wi7Q=;
 b=B6WjR4HERRSnMWf+nfnIqp1TQWC9a1tybFj9kS56dN2Us/GlqvTTQ1FuFU55d+p2tE
 F0UgxSpQmZhswajUhqb6aPcb/EpVjuBdVU8Swl27yf/zlevjt4PYJaQvjLIOUX8fkwlZ
 mMYgyHAPVjASj/YVDT5+CSiKatVD28jj0VIxCUVW+JvqI8h+mvleu9osyW5/EV8ADX8L
 r5aNQ3zXlz7m58KyIoRlrEb5Tl4KeF0HZSk+EitdqhnlhKVC4fwFy6Rpj3i3ngRK/CVT
 dfG4BjeXRoFn0gPnw2xOzOed/83328/oTh8yV1Kta4aNOZcXz1fBFRfjENRh91JIEe7l
 qh7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B6WjR4HE
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.1.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBoYXZlIHNlbmQgdGhlIHBhdGNoLCBuZWVkIGFwcGx5IHRvIDIwMjMuMDIueCBicmFjaAoKU2Nv
dHQgRmFuCgpPbiBUdWUsIE9jdCAzMSwgMjAyMyBhdCA5OjE44oCvUE0gUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJTY290dCIgPT0gU2NvdHQg
RmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBTb3JyeSwgaSB0aG91Z2h0
IGl0IHdvdWxkIGFsd2F5cyBmb2xsb3cgdGhlIHVwc3RyZWFtLgo+Cj4gV2Ugbm9ybWFsbHkgZG8s
IGJ1dCBnaXZlbiB0aGF0IHRoZXJlIGlzIG5vIGFkZGVkIHZhbHVlIGZvciAhd2luZG93cywgSQo+
IGhhdmVuJ3QgZG9uZSB0aGUgd29yayB0byB1cGRhdGUgdGhlIExUUy4gTm9ybWFsbHkgaXQgd291
bGQgYmUgdGFrZW4gY2FyZQo+IG9mIG9uY2UgdGhlIG5leHQgdXBkYXRlIGNvbWVzIG91dCB3aXRo
IExpbnV4IGZpeGVzLCBidXQgdGhhdCBpcyB1bmxpa2VseQo+IHRvIGhhcHBlbiBmb3IgMS4xLjEg
Z2l2ZW4gdGhhdCBpdCBpcyBFT0wuCj4KPiBCdXQgaWYgeW91IGxpa2UgdG8gaGF2ZSAxLjEuMXcg
dGhlbiB0aGF0IGlzIGZpbmUgYnkgbWUsIHBsZWFzZSBzZW5kIGEKPiBwYXRjaC4KPgo+IC0tCj4g
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
