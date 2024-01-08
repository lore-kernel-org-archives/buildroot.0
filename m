Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E6FC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423C241365;
	Mon,  8 Jan 2024 22:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423C241365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nwQPJU0u9AN; Mon,  8 Jan 2024 22:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D2F410B2;
	Mon,  8 Jan 2024 22:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D2F410B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57B201BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DFDE60E7B
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DFDE60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvjfGvyEpffP for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:18:09 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F90060AFC
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F90060AFC
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3bbd6e37af4so2242531b6e.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 14:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704752288; x=1705357088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4EHeLa5aj0xpRNxx4k+JMQY9ZzL4oMo6XdL0MNV1A8=;
 b=edPfG9Bvm/5QIK5L6AwJ4dvu7cxpt3kBjUCWINkaBzkvCDr34jQuHjDxKLqPxkcHFf
 uLIp8eq7f7Xp8t7rtLv2jhj83l7H7sOyEMn5ggPnaUIGFxbGEuTfA1GnkyLxzP9o4c1Q
 PcB8Rljt6Km0a2ED4lOFwlXed3q4Bg3SykljDTbYoF+JwsxUBliCb1nRXWTWhg0qE0gq
 xKCGqFpOcCflw9ggc6BkUkCJVDVaWqHgTJeBnvQvx4LTdanV1SSPCYuV+H4pr0R5mcTc
 RFVYCAin8gXVDedVRVeipI/BLy8My209kUsbvvXkEK8iBszsnGf5WeZsfMTJSL1KPn5X
 EGiw==
X-Gm-Message-State: AOJu0Yzif9XvlsH0wCC3d6P8yfmQvROS6iuPZtkr+jTv/q9NQBFOKDjY
 AnzWdfePJ7yHAnkbGOqpgSdbco6XulIv6jCiERvvy5imdKD3aw==
X-Google-Smtp-Source: AGHT+IHkPGPzHBhqIYlaDkDG9ASztXAgekXb4FG9ei1sbEcxPyII/Fpdmc1uI/uLBF3/dstzVaTPeTQaLDMaczYEQRU=
X-Received: by 2002:a05:6808:3a0e:b0:3bd:3023:d282 with SMTP id
 gr14-20020a0568083a0e00b003bd3023d282mr2860851oib.110.1704752287815; Mon, 08
 Jan 2024 14:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20240108013056.39493-1-patrick.oppenlander@gmail.com>
 <87bk9w2v2v.fsf@tarshish>
In-Reply-To: <87bk9w2v2v.fsf@tarshish>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 9 Jan 2024 09:17:56 +1100
Message-ID: <CAEg67Gmdn+qf_DqpA66un5oBgu3iqkejBVE9mBVpRqWrmpQ1rw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704752288; x=1705357088; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4EHeLa5aj0xpRNxx4k+JMQY9ZzL4oMo6XdL0MNV1A8=;
 b=Q6IluSITsnyuMMRI6EKkjOz+YWKdtuQXKVJT6LzOyLIb8Lp6n7ZNuy9Y0dpiZwOVmm
 0EB+OCsGuMi5LlOwMovd4cs1A+Kw1KAcOundhnLErp09AdIUcC6zoZag947p2VgWFkei
 BE1GR6CeAY+6ZLA/ODM1toXXlinEV9Xq2pmrFY9KI01ZT/Nd35ZLRxiL6pv9dxO23fUb
 Z8de8Zg32O0r628VrwcesawQNaHQeAisx2JSstWb5Fnwxdxv5sNteD+XhsLn9gVWPI2c
 Ow+tcet3QAuD0+PTGbnhuS/5om2Wy/mKKQlHuk1ZW3zjTKGRYTEI5CRh3+ntp6BPwrAM
 fDIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q6IluSIT
Subject: Re: [Buildroot] [PATCH] package/minisign: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKT24gTW9uLCBKYW4gOCwgMjAyNCBhdCA1OjMz4oCvUE0gQmFydWNoIFNpYWNo
IDxiYXJ1Y2hAdGtvcy5jby5pbD4gd3JvdGU6Cj4KPiBIaSBQYXRyaWNrLAo+Cj4gT24gTW9uLCBK
YW4gMDggMjAyNCwgcGF0cmljay5vcHBlbmxhbmRlckBnbWFpbC5jb20gd3JvdGU6Cj4gW3NuaXBd
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZDZiZTQxYjJm
ZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9taW5pc2lnbi9taW5pc2lnbi5t
awo+ID4gQEAgLTAsMCArMSwxOCBAQAo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAr
Iwo+ID4gKyMgbWluaXNpZ24KPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+
ICsKPiA+ICtNSU5JU0lHTl9WRVJTSU9OID0gMC4xMQo+ID4gK01JTklTSUdOX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLGplZGlzY3QxLG1pbmlzaWduLCQoTUlOSVNJR05fVkVSU0lPTikpCj4gPiArTUlO
SVNJR05fTElDRU5TRSA9IElTQwo+ID4gK01JTklTSUdOX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4gPiArTUlOSVNJR05fREVQRU5ERU5DSUVTID0gaG9zdC1saWJzb2RpdW0gbGlic29kaXVtCj4K
PiBEb2VzIHRhcmdldCBtaW5pc2lnbiBuZWVkIGJvdGggbGlic29kdW0gYW5kIGhvc3QtbGlic29k
aXVtPwo+Cj4gV2hhdCBhYm91dCBob3N0LW1pbmlzaWduPyBEb2Vzbid0IGl0IG5lZWQgaG9zdC1s
aWJzb2RpdW0gdG8gYnVpbGQ/Cj4KPiBUbyBhZGQgZGVwZW5kZW5jaWVzIHRvIHRoZSBob3N0IHBh
Y2thZ2UsIHNldCBIT1NUX01JTklTSUdOX0RFUEVOREVOQ0lFUy4KClRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQuCgptaW5pc2lnbiBuZWVkcyBsaWJzb2RpdW0KaG9zdC1taW5pc2lnbiBuZWVk
cyBob3N0LWxpYnNvZGl1bQoKSSdsbCBzdWJtaXQgYSB2Mi4KClBhdHJpY2sKCj4gYmFydWNoCj4K
PiA+ICsKPiA+ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiA+ICtNSU5JU0lHTl9DT05G
X09QVFMgKz0gLURCVUlMRF9TVEFUSUNfRVhFQ1VUQUJMRVM9MQo+ID4gK2VuZGlmCj4gPiArCj4g
PiArJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4gPiArJChldmFsICQoaG9zdC1jbWFrZS1wYWNr
YWdlKSkKPgo+Cj4gLS0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4gPX0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9
Cj4gICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDov
L3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
