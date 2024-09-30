Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0931CF6491
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 08:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DFEF60017;
	Mon, 30 Sep 2024 08:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GszBQSsyCw6; Mon, 30 Sep 2024 08:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605E8605F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605E8605F4;
	Mon, 30 Sep 2024 08:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2C61BF42E
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E5D605F4
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 08:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpwBMLxLMHM0 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 08:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DF01605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF01605F1
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DF01605F1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 08:40:53 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2781cb2800eso1997416fac.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 01:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727685652; x=1728290452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JO2g3i3rYsI+eyDCqVCQPWzvIs8wzl0sFm3uK1PzGVo=;
 b=cHjKn7NLMkjxdnI9dbuXCgqa/yFLTnr22i3zrtVC1NpOyM7LtdSivHNbnP7bpOTjCh
 8RSpmVixLgyXLgsixiFibQqZBZEXKd5fZqNS+JNEUmIlwS27PD8aQWetu5FEdpkoBc2I
 LnsJohlgDDIINyJnKNH1hHQk76uXO7hyx7Gm9MszvvWlusYMPhwwFJlGbEVz9YunLT79
 4Om7LTXCU5Gox1cC6Zxmyr+wRKiUcQsLhg6grd8D4QJO/q5Ud7m3TRV81DQSg6U/uZLo
 ORWOLHhLUSiqhXCga6QQDqcG8ISgQO1wnbixOo5uVLgZQ6xvHPxCREIehYYR2btyd2U+
 TbXQ==
X-Gm-Message-State: AOJu0YwV5qDmf6sMuKUi8Nvz1b/0EmtBXreYFCcCeebLyNZMunk1hV4u
 dgVkHRQpKD04dXwde3zHF846Hs4fV6ckZGibkg9Fk5DzrZFEZjAB3+qEdEHHfzAZ14/HonhoAok
 e
X-Google-Smtp-Source: AGHT+IENPZkMvNwqPVnkEtnlnIcRahMu9VBk1UP4Uj5dJpv+VpbO2xkkCzCVyU55xfzUqRrG3GAz3A==
X-Received: by 2002:a05:6870:ac08:b0:270:276d:fb54 with SMTP id
 586e51a60fabf-28710a9119amr6209275fac.21.1727685649168; 
 Mon, 30 Sep 2024 01:40:49 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com.
 [209.85.160.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2870f81b022sm2640616fac.32.2024.09.30.01.40.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 01:40:48 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-286f85d254eso2036285fac.3
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 01:40:48 -0700 (PDT)
X-Received: by 2002:a05:6870:fba1:b0:286:f2cc:7a71 with SMTP id
 586e51a60fabf-28710b98aacmr7220032fac.32.1727685648131; Mon, 30 Sep 2024
 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240820002836.2563288-1-james.hilliard1@gmail.com>
In-Reply-To: <20240820002836.2563288-1-james.hilliard1@gmail.com>
Date: Mon, 30 Sep 2024 01:40:36 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ogf67rUHNWnLu8KFMJTdBMpAYBGb2GYhP1pJYL8D0_4g@mail.gmail.com>
Message-ID: <CA+h8R2ogf67rUHNWnLu8KFMJTdBMpAYBGb2GYhP1pJYL8D0_4g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1727685652; x=1728290452; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JO2g3i3rYsI+eyDCqVCQPWzvIs8wzl0sFm3uK1PzGVo=;
 b=W46tkoQcdNBO+EBQ1H0Sxh7w8HlpcTjGPdRHxrfFvERA81msJdlJL+TjtUANAn0eXv
 Ys+C4p48V8hGa3Sc7s29YnQEJ4yUJsDp1lG0T1XQ6rxoy8RCgXFvVu4L7kmgc1slQYDf
 2VpvkYUE78iMpdCyJKUK6z1Cw0itv2gwQhfaxQN+8y5roaIR9T2vhqz4A/wxdfz/HQ64
 SEQh8RnhuMjY8cTyUhJBNOqikRBE7TnsMzKIlKNGjG25kdIz1cQV7J+zg4mmT8gR0wH8
 q2DfoBHGCWsOk5N3sMepPXbaqjDz0ubXbP2s64jB5nBBiNRsmsATi+t5MjtL2tcEme/c
 rxjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=W46tkoQc
Subject: Re: [Buildroot] [PATCH v5 1/1] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsCgpPbiBNb24sIEF1ZyAxOSwgMjAyNCBhdCA1OjI44oCvUE0gSmFtZXMgSGlsbGlhcmQK
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IC0tLQo+ICBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgfCAgMSArCj4gIHBhY2thZ2UvdGFpbHNjYWxlL0NvbmZpZy5pbiAgICAgIHwgIDggKysr
KysrKysKPiAgcGFja2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLmhhc2ggfCAgMyArKysKPiAgcGFj
a2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLm1rICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysr
Cj4gIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS90YWlsc2NhbGUvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3RhaWxzY2FsZS90YWlsc2NhbGUuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS90YWlsc2NhbGUvdGFpbHNjYWxlLm1rCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBT
dGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+CgpUaGF0IHNhaWQsIHRoZSBsYXRlc3QgdmVy
c2lvbiBpcyBub3cgdjEuNzQuMQoKPiArVEFJTFNDQUxFX1ZFUlNJT04gPSAxLjcyLjAKCkJlc3Qg
cmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
