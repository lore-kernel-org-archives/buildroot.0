Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26D6E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 10:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2694360A95;
	Mon, 16 Dec 2024 10:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BunOIC9SJCmG; Mon, 16 Dec 2024 10:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4117D60A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4117D60A99;
	Mon, 16 Dec 2024 10:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30766CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEE4813DA
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dukZZM80DyPQ for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 10:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28EA381E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EA381E01
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EA381E01
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 10:24:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so3795230e87.0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 02:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734344642; x=1734949442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzAJHYQkpzs+2eNLJo4mzOZXnOrxEvRUdACpKqiXsWM=;
 b=U7rnhoMnz8jGT7WpDzsww65gCS1jzn43ul3UCu8nnJJsrcorcqcVgJolwcDhXjSfM6
 Tp+GSIKAvpPGafG42ceB5eiZ7snyjYDArUHg8E9SMvnMjR+vbFc5xkZ4P868YlIyjV/k
 Vhk5sNRuv0rfWD1vdUjwFYpw4VpCtrMH3Ts85XhqKQkfMU/oImsJ6EAVWzTL+26Qqohr
 r6JRh+9vgvuDr6YCqa+KdJQY00OFufi+dpk9SK0eAahvDCKv6leBs8kewFiimc6mQFoa
 oa+DkBHD5TfnLeMdDGr1Z0daRrndIfHQLFwy24pV3JTLz9CYnjSYCzBiWnYUQlJL3H6e
 L1qw==
X-Gm-Message-State: AOJu0Yxr/YlOSIKfW4xETAy4H7Awy635iEZ8lCfxDabMQjck4+Z681J9
 MWAO6EPQmR70GlKgcxCMy/GzMwfk0G0MrOKWXG85Pel4KCNzrhk4d0Z0f5snta7uRvlxdNeCEYR
 5FFuLVDql8ReZCGWXJzCjmJgOH0Y=
X-Gm-Gg: ASbGncvZfjtzMKQFhR+Q/OJyzobbDcmFBx66Bf6XO7aSDQoeqh9q9nwZtqERnSRG7Ff
 UIxSicB0XZtR/k2a742GXMD8vLmwSaMf14vV8R6Y=
X-Google-Smtp-Source: AGHT+IG/HhlfSk+7rDtZgT04WRODznNdI4NhR/WTE4+EMfJgt63OupdEyAwE4ia3kNoZj3iqCpmRrsT1Pi0tZ9ptkP8=
X-Received: by 2002:a05:6512:3b07:b0:540:5b5c:c196 with SMTP id
 2adb3069b0e04-54099b6d59fmr3353080e87.56.1734344641452; Mon, 16 Dec 2024
 02:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20241216081158.250767-1-yegorslists@googlemail.com>
 <87o71cvyc5.fsf@tarshish>
In-Reply-To: <87o71cvyc5.fsf@tarshish>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 16 Dec 2024 11:24:32 +0100
Message-ID: <CAGm1_ktK8r+J1=ynVk22BjvA2ugDaZdL_UGcbTWKhbtz-HTaug@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734344642; x=1734949442; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzAJHYQkpzs+2eNLJo4mzOZXnOrxEvRUdACpKqiXsWM=;
 b=j5mp26zp1hLHi2gWuTe6J61yq0UR6JzFlajTZLW4bvtuoo3q5a66x+JzspQ0+WqAyL
 3C9Xdod+Z/qCnQlJlxl9J227/Wss6zC353mrUvG6u6lEt1G6wwrbHDVXbx6YpGupNWzs
 oU2oVE0Ig/AxK/ojtURlraiMYknY5K1iHSEyt7l9oZA0VKiPuQCe1i8YbhSHSHgHylFu
 vAQ9a38AzJ118FGWTsqNY7Ib0rg8/gVFJgIaOQbkisT0t0xpIHpuFDkq2uEWbf+LBgrm
 6uwGQNDUayOe5V/GKflCleybhIK1wKncmghi1+upo7/ylvGZbky7f+uClepRwSgBYH4e
 knUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5mp26zp
Subject: Re: [Buildroot] [PATCH] package/python-m2crypto: remove package
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

SGkgQmFydWNoLAoKT24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgOToxNOKAr0FNIEJhcnVjaCBTaWFj
aCA8YmFydWNoQHRrb3MuY28uaWw+IHdyb3RlOgo+Cj4gSGkgWWVnb3IsCj4KPiBPbiBNb24sIERl
YyAxNiAyMDI0LCB5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbSB3cm90ZToKPiA+IEZyb206IFll
Z29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+Cj4gPiBUaGUgcHl0
aG9uLW0yY3J5cHRvIHBhY2thZ2Ugd2FzIHJlbW92ZWQgYXMgaXQgaXMgaW4gbWFpbnRhaW5lZAo+
ID4gb25seSBtb2RlIGFuZCBpcyBub3QgcmVjb21tZW5kZWQgZm9yIG5ldyBwcm9qZWN0cy4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICBDb25maWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrKysrKysKPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxIC0KPiA+ICBwYWNrYWdlL3B5dGhvbi1tMmNyeXB0by9Db25maWcu
aW4gICAgICAgICAgICB8ICA5IC0tLS0tLS0tLQo+ID4gIHBhY2thZ2UvcHl0aG9uLW0yY3J5cHRv
L3B5dGhvbi1tMmNyeXB0by5oYXNoIHwgIDUgLS0tLS0KPiA+ICBwYWNrYWdlL3B5dGhvbi1tMmNy
eXB0by9weXRob24tbTJjcnlwdG8ubWsgICB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDUg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPiA+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tbTJjcnlwdG8vQ29uZmlnLmluCj4gPiAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW0yY3J5cHRvL3B5dGhvbi1tMmNyeXB0by5o
YXNoCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW0yY3J5cHRvL3B5dGhv
bi1tMmNyeXB0by5tawo+Cj4gREVWRUxPUEVSUyBzaG91bGQgYWxzbyBiZSB1cGRhdGVkLgoKR29v
ZCBjYXRjaC4gdjIgc2VudC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
