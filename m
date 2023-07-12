Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5874EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D618832A9;
	Wed, 12 Jul 2023 12:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D618832A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIRtRwUiCoA1; Wed, 12 Jul 2023 12:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BA682341;
	Wed, 12 Jul 2023 12:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BA682341
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E6B1BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0BEF40150
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BEF40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmyhBTkJJtBa for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC1340063
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AC1340063
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:52:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3143b88faebso7777317f8f.3
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 05:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166375; x=1691758375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4/I94ZuaojfJk7vrBiIgPf4DSYu2j/rfPXUyw3PdvFk=;
 b=Oo0X0KOA7yUXAuKYXFT2VHhJDXB4lPxwXa1t34mx9f4WjjjHcRlG8neQc9NzAdtHfL
 s2SOiy/MkCko7LSGz5sgCXqwWgN2P85kqyPHH+hYXRV0PclWXMGVQmWDLm6noh8SrlVY
 UXQWoSeqsvZmN4p+XIFRoj1dpROjAEhGvUZu1QyX1PdsQFZ36BSXIRV162klFjpYYDzC
 h3IqBo/7WCehF1dAxfNnHzw2nSs58oQILZUT726yUuIZGyfmA6JuSptONFKkn6nOxr0E
 HgKIqxdUc+ayFImBjhBjT32oDJMS/T9R9dnwSna0hIeOmp+4G4ZtMuF5/t5zIy7aRfFd
 q7fg==
X-Gm-Message-State: ABy/qLZUtzVVUU/J1DpngXJlDG0b5xzUVKmD9B/ralsmBPInPVljdCy8
 N4Awz4tD3yUfvyOLs2PTYaJu5+Q2FrZvVxN0pz0=
X-Google-Smtp-Source: APBJJlE0uFmzUnM2lnqzKCaauTXi5lhytY+dCmsyAktWg7vjN/Rq+2SFFDKD1/4HaxRzgoFvu5i1LA==
X-Received: by 2002:adf:fc10:0:b0:311:1dba:ca65 with SMTP id
 i16-20020adffc10000000b003111dbaca65mr18346826wrr.51.1689166375286; 
 Wed, 12 Jul 2023 05:52:55 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a056000105100b0031433d8af0dsm5055190wrx.18.2023.07.12.05.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 05:52:55 -0700 (PDT)
Message-ID: <4be832e6-521d-67a7-17c0-6f3bcac3587b@smile.fr>
Date: Wed, 12 Jul 2023 14:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230611115748.801929-1-romain.naour@gmail.com>
 <20230712120557.143513ff@windsurf>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230712120557.143513ff@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689166375; x=1691758375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4/I94ZuaojfJk7vrBiIgPf4DSYu2j/rfPXUyw3PdvFk=;
 b=EXiwS2MYSvzhdcmCKO51qgT9GZEwTFP0L1eTa0s9lDqyxQBOBvenyMOCYoHygN8kxA
 pEhuysuwY2VU+b3QFDgFWCcXzSPtc45A8O1K2FIuNbdyHPPm0zgpCfQGhuPfSTOBtrDe
 U2jMD8hfvULN/Gi7Zp5MG/JNHWO5z0Mlwpc/ob2+/wRxSiSsMP5K90PeMVSDbdX67PaR
 D9QMyVbgl4XKe30KCgklznAEkIpWtyooc4QRUJhuhQpO6G3bHMxwh7PfB6xu9d+azBpA
 wUdRNva+KPXvkYJhT8LJbJFKNvVmwKPIWfTe9ZLTCSi082R1R2F0e2ho+uTp5YGsEyqi
 sOsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=EXiwS2MY
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestGlxinfo: bump
 kernel version to 6.1.x
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

SGVsbG8gVGhvbWFzLAoKTGUgMTIvMDcvMjAyMyDDoCAxMjowNSwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFN1biwgMTEg
SnVuIDIwMjMgMTM6NTc6NDcgKzAyMDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+IHdyb3RlOgo+IAo+PiBUaGUga2VybmVsIDYuMS54IGlzIHRoZSBsYXRlc3QgTFRTIHZl
cnNpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4KPj4gLS0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2ds
eGluZm8ucHkgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBUaGFua3MsIEkndmUgYXBwbGllZCBib3RoLiBIb3dldmVyLCBkaWQgeW91
IG5vdGljZSB0aGF0IHRoaXMgR2x4SW5mbwo+IHRlc3QgaXMgY3VycmVudGx5IGJyb2tlbj8gU2Vl
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NjIx
MDQ2MzI2LiBJdCBmYWlscwo+IGF0IHJ1bnRpbWUgYmVjYXVzZSB0aGUgZ2x4aW5mbyBjb21tYW5k
IGNhbm5vdCBiZSBmb3VuZCBpbiB0aGUKPiBmaWxlc3lzdGVtIChJIGhhdmUgbm90IGludmVzdGln
YXRlZCBmdXJ0aGVyIHRoYW4gdGhhdCkuCgpUaGlzIGlzIHNvbWV0aGluZyBuZXcsIEknbSB3b25k
ZXJpbmcgaWYgaXQncyByZWxhdGVkIHRvIHRoZSByZWNlbnQgbWVzYTNkLWRlbW8KdmVyc2lvbiBi
dW1wIHRvIDkuMC4wPwoKSSdsbCB0YWtlIGEgbG9vay4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
