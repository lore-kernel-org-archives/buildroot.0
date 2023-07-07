Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96FFEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 19:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AC4040583;
	Fri,  7 Jul 2023 19:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC4040583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fjXyTf_vYbE; Fri,  7 Jul 2023 19:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E4B4019D;
	Fri,  7 Jul 2023 19:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E4B4019D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3F4F1BF2B6
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 19:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AECA081E68
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 19:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECA081E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_98wJSda_xE for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 19:05:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212AE81E1E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 212AE81E1E
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 19:05:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99384a80af7so265395366b.2
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688756705; x=1691348705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoEBG95eX2rQGTxWVgchqmTFmkb3iTxjYP2h2TH4FAs=;
 b=FDm0PfQYyVGwFHybaM7y6lXUL3+TDXcvN+xIs1nQb1gETwPkJcUN1iOwD56h3iDm+y
 TSQu1VTL6XB+U+iXOW9HSezuS0YZ7PK6t4UuJtul7y91hJzQPxkrumuQm2PbM8RLyr2a
 e2GgXyO87hsztJ6/QJemdOaO++eBEx3E6KWeEExfalQH6GyqRhnk1kkU7IT+rzsb7RSL
 1IjfDQFP+8Jj23qQaD0KZljqgE+2ONJqC01iiGc4CDE6Nyj0esNwLHPUKRUb8PMgYXf2
 p6LsjVhFEKMDlexk/U5j9s6TTS/8LfDEdGYF1O+8ZdnoO0/Zfz0hnJAkYdkjtVtAHGsP
 Xxug==
X-Gm-Message-State: ABy/qLZA4Nt/dDPJX5D7NFAUu0WQ7cBsAewVgfXn0B3IzAr3liHtREyZ
 +18IG31jrLeu6vCmrkUim6bUV3y5vKIgp/zWspc=
X-Google-Smtp-Source: APBJJlFnaRrTK8ym9zi3lGmOsSaMb4ddLM/HeglZ4kFs7KZUWXcxWW/3ionfdIaBmlo+6BYe9yjTzA==
X-Received: by 2002:a17:906:208:b0:991:ed4e:1c84 with SMTP id
 8-20020a170906020800b00991ed4e1c84mr4583315ejd.25.1688756704788; 
 Fri, 07 Jul 2023 12:05:04 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 lf9-20020a170906ae4900b009926928d486sm2528563ejb.35.2023.07.07.12.05.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:05:04 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3143b88faebso2457141f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 12:05:03 -0700 (PDT)
X-Received: by 2002:a5d:63cc:0:b0:313:f18d:1f2c with SMTP id
 c12-20020a5d63cc000000b00313f18d1f2cmr5160699wrw.38.1688756703523; Fri, 07
 Jul 2023 12:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230707185106.98208-1-ckhardin@gmail.com>
In-Reply-To: <20230707185106.98208-1-ckhardin@gmail.com>
Date: Fri, 7 Jul 2023 12:04:52 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
Message-ID: <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1688756705; x=1691348705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SoEBG95eX2rQGTxWVgchqmTFmkb3iTxjYP2h2TH4FAs=;
 b=zr9ztpYU5K664FveNyRUMc7fju+wUhJCcOah/M+KE2DXzfSnuhn6R7j3t5mpwU0GOH
 wjgjerOOs/bk4Xoj+baDeFMY6Pejfnbl1YgB+RNV+qd4KOUXUExHPC2Bogiocrhri9jg
 4jvKTwqus5aViRmcMqgtYdt7GJl7lVrOWLUER97ZmUqqqkXweixzAaB/YYZvNt6rwD4/
 6/FxoYyPrw59GI6CBPD/ufZY60E226VSZapPfvuoqBZ7YdIaJFGY3ioya18gDcaSiXfV
 4iYB8o9Cc/uLio6eLo7JcrOTlaYjkRrUqnMMBYjWkKpahWRtVtpKhmyDavokrS7oAu91
 7CZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=zr9ztpYU
Subject: Re: [Buildroot] [PATCH 1/1] package/go-native: add a new download
 only package for go compilers
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hhcmxlcywKClRoaXMgaXMgbm90IG5lY2Vzc2FyeSB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVz
OgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9z
ZXJpZXM9MzU4NDUxCgpXZSBjYW4gY29ycmVjdGx5IGJvb3RzdHJhcCBvbiBhcm02NC4KCk9uIEZy
aSwgSnVsIDcsIDIwMjMgYXQgMTE6NTHigK9BTSBDaGFybGVzIEhhcmRpbiA8Y2toYXJkaW5AZ21h
aWwuY29tPiB3cm90ZToKPgo+IFRoZSBnby1uYXRpdmUgaXMgbWFpbmx5IGZvciB0aGUgYWFyY2g2
NCBzdXBwb3J0IHNpbmNlIHRoYXQgd2FzCj4gYWRkZWQgYWZ0ZXIgdGhlIGdvLWJvb3RzdHJhcCB3
cml0dGVuIGluIEMgd2FzIGRyb3BwZWQuIFNvLCB0bwo+IGdldCBhIGNyb3NzIGNvbXBpbGVyIGZv
ciBnbyBhIGhvc3QvbmF0aXZlIGNvbXBpbGVyIG5lZWRzIHRvIGJlCj4gYXZhaWxhYmxlIHRvIGdl
bmVyYXRlIHRoZSBzZXR1cCBmb3IgdGhlIG5lZWRlZCB0YXJnZXQuIFRoaXMgaXMKPiB1c2luZyB0
aGUgc2FtZSBnbyB2ZXJzaW9uIGFzIHRoZSBleHBlY3RlZCBjcm9zcy1jb21waWxlciB0bwo+IGtl
ZXAgdGhlIHBhY2thZ2VzIGluIHN5bmMuIEEgc3BlY2lmaWMgdmVyc2lvbiBjb3VsZCBiZSB1c2Vk
LgoKVGhhbmtzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
