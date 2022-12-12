Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A53FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1097B401B1;
	Mon, 12 Dec 2022 09:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1097B401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OJ_kicE5zDN; Mon, 12 Dec 2022 09:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C454028B;
	Mon, 12 Dec 2022 09:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C454028B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21CFA1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F151C81249
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F151C81249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJzPDVjpOExQ for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C605481248
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C605481248
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:19:46 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso13136855pjb.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 01:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdFYsopGnviTKNvtYXge4i54NkeQJrj6pEs9fdSrZhM=;
 b=GxUH9EWpdwnFN3Be3TZUWKVDw751UV1kiGrTLvLga6d/2+1qClwpg6HaBq7p2lPwrW
 kBeIabKbpPH3q/+9p87HamZZwqeHeVX01cQEyCZCXJU9pIUyhyZGqK8i7hZ5jxx0PDK2
 fwXkYG9zroFXQda60KzOL6pE8xZLPiZ50PHGkQT+9UyaMB9B6r2PWmSWj3eYq0W/vLOo
 I43IALaKl0sEG+2KYGEu9QZhkMLpZJHQFk9Ck2Li/w8D+BmEXtmamxmYBaik7SL5RyTG
 W2aGkwdmzsfY8HYnXuVPw0JEhT5Xnrfst7gMHsy6FmXn7a2mNq1pNlvajI8G2Jua50Q6
 Ot5g==
X-Gm-Message-State: ANoB5pmb+bOILHTAQBvCZHedffBqPn5eYc9zaqfk7B6oRJj+HwfyJleP
 HqMYqiouXro66fXYQ/FowNG/zktdUmx5NaHDDhw=
X-Google-Smtp-Source: AA0mqf6PugbtV7p0HkmS0wrSTYrjIQHFzNL4xAfAySKhtQzSeWU6XNV0ii4xY8U8EgL/AcIbsJPljQ==
X-Received: by 2002:a17:902:ab94:b0:189:9d28:c829 with SMTP id
 f20-20020a170902ab9400b001899d28c829mr13027407plr.29.1670836785537; 
 Mon, 12 Dec 2022 01:19:45 -0800 (PST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169]) by smtp.gmail.com with ESMTPSA id
 m12-20020a170902c44c00b001889e58d520sm5774974plm.184.2022.12.12.01.19.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:19:44 -0800 (PST)
Received: by mail-pl1-f169.google.com with SMTP id s7so11434053plk.5
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 01:19:44 -0800 (PST)
X-Received: by 2002:a17:903:3314:b0:189:a208:d13d with SMTP id
 jk20-20020a170903331400b00189a208d13dmr43749032plb.144.1670836784470; Mon, 12
 Dec 2022 01:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
 <20221208133928.303101-3-heiko.thiery@gmail.com>
 <20221211144611.437eda70@windsurf>
In-Reply-To: <20221211144611.437eda70@windsurf>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 12 Dec 2022 10:19:32 +0100
X-Gmail-Original-Message-ID: <CAA3JqEceuWkLuDjCviOdHmi12X96+KMfPb0s2Us8a5WgwKa-rw@mail.gmail.com>
Message-ID: <CAA3JqEceuWkLuDjCviOdHmi12X96+KMfPb0s2Us8a5WgwKa-rw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdFYsopGnviTKNvtYXge4i54NkeQJrj6pEs9fdSrZhM=;
 b=qG2IijQnDaMAe+ynoEcHL1S7OAI7uJ+uVfLt4qiPm3ZAueipEGx2sF/J0QD4FhmidJ
 G1fJxEVeLGIVXPm3hQGqjHTdHn7yYtF0wvPKnB9gOyC5vn+5ER1lRV0GD1qVUQfiTMN+
 NYk7HFnAWIwQgXVsihWyR1v823IY6Be4xZPKIyiJM+WPeSSojeijYr5WhCUT3ATwuOQh
 +FPpw2M/rNu6FcCnyO6dqiXzX3YcyVW9r5Zn+X1bY4UkQ0XUubqLQKaO0WFXcD6i3rm8
 8vpb5tEDzwjK5VSC+O3r8loMHmgpOWvICfeMh8apVbafZfbvgvT3dUfIcQKKZk6K+gr+
 WHKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aleksander-es.20210112.gappssmtp.com
 header.i=@aleksander-es.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qG2IijQn
Subject: Re: [Buildroot] [PATCH v2 3/3] package/modem-manager: bump version
 to 1.20.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IQoKPiA+IC1NT0RFTV9NQU5BR0VSX1ZFUlNJT04gPSAxLjE4LjEyCj4gPiAtTU9ERU1fTUFO
QUdFUl9TT1VSQ0UgPSBNb2RlbU1hbmFnZXItJChNT0RFTV9NQU5BR0VSX1ZFUlNJT04pLnRhci54
ego+ID4gLU1PREVNX01BTkFHRVJfU0lURSA9IGh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3Nv
ZnR3YXJlL01vZGVtTWFuYWdlcgo+ID4gK01PREVNX01BTkFHRVJfVkVSU0lPTiA9IDEuMjAuMgo+
ID4gK01PREVNX01BTkFHRVJfU09VUkNFID0gTW9kZW1NYW5hZ2VyLSQoTU9ERU1fTUFOQUdFUl9W
RVJTSU9OKS50YXIuZ3oKPiA+ICtNT0RFTV9NQU5BR0VSX1NJVEUgPSBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbW9iaWxlLWJyb2FkYmFuZC9Nb2RlbU1hbmFnZXIvLS9hcmNoaXZlLyQo
TU9ERU1fTUFOQUdFUl9WRVJTSU9OKQo+ID4gIE1PREVNX01BTkFHRVJfTElDRU5TRSA9IEdQTC0y
LjArIChwcm9ncmFtcywgcGx1Z2lucyksIExHUEwtMi4wKyAobGlibW0tZ2xpYikKPiA+ICBNT0RF
TV9NQU5BR0VSX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkcuTElCCj4gPiAgTU9ERU1f
TUFOQUdFUl9TRUxJTlVYX01PRFVMRVMgPSBtb2RlbW1hbmFnZXIKPiA+IC1NT0RFTV9NQU5BR0VS
X0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBsaWJnbGliMiAkKFRBUkdFVF9OTFNfREVQRU5E
RU5DSUVTKQo+ID4gK01PREVNX01BTkFHRVJfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGRi
dXMgbGliZ2xpYjIgJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykgaG9zdC1saWJ4c2x0Cj4KPiBT
byBELUJ1cyBpcyBubyBsb25nZXIganVzdCBhIHJ1bnRpbWUgZGVwZW5kZW5jeT8gV2h5PyBJZiB0
aGF0J3MgcmVhbGx5Cj4gdGhlIGNhc2UgdGhlbiBwYWNrYWdlL21vZGVtLW1hbmFnZXIvQ29uZmln
LmluIG5lZWRzIHRvIGJlIGFkanVzdGVkLCBhcwo+IGl0IGNsYWltcyBELUJ1cyBpcyBhIHJ1bnRp
bWUgZGVwZW5kZW5jeS4KPgoKVGhlIGJ1aWxkLXRpbWUgZGVwZW5kZW5jeSBvbiBEQnVzIGlzIGV4
Y2x1c2l2ZWx5IHRvIHJlYWQKImludGVyZmFjZXNfZGlyIiBhbmQgInN5c3RlbV9idXNfc2Vydmlj
ZXNfZGlyIiBmcm9tIHRoZSBwa2ctY29uZmlnCigvdXNyL2xpYi9wa2djb25maWcvZGJ1cy0xLnBj
KSBmaWxlIGluc3RhbGxlZC4gSSBhZ3JlZSB0aGlzIGlzIG5vdAp2ZXJ5IHByZXR0eSwgYXMgd2Ug
ZG9uwrR0IHJlYWxseSByZXF1aXJlIGEgZnVsbCB3b3JraW5nIERCdXMsIGp1c3QgdGhlCnBrZ2Nv
bmZpZyBmaWxlIDovCgo+ID4gIE1PREVNX01BTkFHRVJfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4g
PiAtTU9ERU1fTUFOQUdFUl9DT05GX09QVFMgPSAtLWRpc2FibGUtbW9yZS13YXJuaW5ncwo+ID4g
K01PREVNX01BTkFHRVJfQ09ORl9PUFRTID0gXAo+ID4gKyAgICAgLURwb3dlcmRfc3VzcGVuZF9y
ZXN1bWU9ZmFsc2UgXAo+ID4gKyAgICAgLUR1ZGV2ZGlyPS91c3IvbGliL3VkZXYKPgo+IElzIHRo
aXMgbmVlZGVkIGV2ZW4gd2hlbiAtRHVkZXY9ZmFsc2U/IERvZXNuJ3QgLUR1ZGV2ZGlyPS91c3Iv
bGliL3VkZXYKPiBiZWxvbmcgaW5zdGVhZCB0aGUgQlIyX1BBQ0tBR0VfTElCR1VERVY9PXkgY29u
ZGl0aW9uYWw/CgpObywgdWRldmRpciBpcyByZXF1aXJlZCBldmVuIGlmIC1EdWRldj1mYWxzZS4g
VGhlIHJlYXNvbiBpcyB0aGF0CnVkZXZkaXIgaXMgdXNlZCB0byBpbnN0YWxsIHRoZSB1ZGV2IHJ1
bGVzIGZpbGVzLCBhbmQgTW9kZW1NYW5hZ2VyIGhhcwphIGJ1aWx0LWluIHVkZXYgcnVsZXMgcGFy
c2VyIHVzZWQgd2hlbiB0aGUgZGFlbW9uIGlzIGJ1aWx0IHdpdGhvdXQKdWRldiBzdXBwb3J0IChl
LmcuIGRlZmF1bHQgaW4gb3BlbndydCkuIFRoZSB1ZGV2IHJ1bGVzIHNwZWNpZnkgcG9ydAp0eXBl
IGhpbnRzIGFuZCBvdGhlciB0aGluZ3MsIE1NIHdvbid0IHdvcmsgZmluZSB3aXRob3V0IHRob3Nl
IHJ1bGVzLgoKLS0gCkFsZWtzYW5kZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
