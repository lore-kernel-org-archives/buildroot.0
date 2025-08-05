Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96EC87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 23:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5257B41D34;
	Tue,  5 Aug 2025 23:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1caVBtJIKawV; Tue,  5 Aug 2025 23:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C30A41D35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C30A41D35;
	Tue,  5 Aug 2025 23:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D14D9D79
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 23:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2DF241D35
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 23:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt9CaJva3eZW for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 23:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.42;
 helo=mail-ed1-f42.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6615841D33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6615841D33
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6615841D33
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 23:37:52 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-615622ed677so8398684a12.1
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 16:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754437070; x=1755041870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEScdfJtsk4I7zwZLKzT/b8KsmU1QpBt2Xs/w5Ek69A=;
 b=UrvSW30Tw3JeoWDExpHfXvBN/k1kO6wfOkXhjPdTC6ACBAGu1b3lIlEGgDejRawbBX
 gsGoyiP/v36+KZwHYUfFK0/4YVmpGeovNdzcn6K/0dsYCSPGGPO8EXkTFeWute9J1hcv
 5Vxz51M7dJXLJ/8Kdo5KBWZZTnhO0TDpLUoQb+r0bhUSkl3w7VyAtGAgZWXb/oJho2CS
 sK37p/dSag3ixgrhZAXK23RP7tZ/OsBhECprr4cCv9KNNClpIi8Mv4M/dX563XVCLW7j
 ZXP/kLb7avkrkTH3axZL2Sq7xnNXnaeAWxsLTGaabY7TmV1OyvyMT+Vr30M9l2EGDyoB
 rWeg==
X-Gm-Message-State: AOJu0Ywa/XXXdzLsoH0SxYXJ9vMwfFbJipcmTPTc2gOsZyqgIz/S8ouU
 BW5nIvrgPKWlQ42STqVkoXxVpX9HqeE5eLGInQVxSniAt3X1mqjoNqIm
X-Gm-Gg: ASbGncvvvLWt8sCMKo5PrvMrpuNyLFoxn+GZxAm90rR9PCzC7dZI3Ya3+X7b776mFEX
 to9Ciq38aohXwALotxPWK+DLztdRvpkA5mQ619WPHhqEzzBhuSHSD0KYf+kSd7DywphE9NG95Fc
 75dyO7ePk7bYjKGKDdURXIqB5pakRPVVGZfbxu6y3uOXRRGH7P/ea3Y/you6fCzzlER0kEsu5rd
 c/i7iokfOaT78122+FFM18F6Sgk20S0C14ThR9ev0XeYc/xjBvH+Q40jtmyNi/ZHeTqPPq1UBWx
 S/z0pD1vZXbcofp0rmBLHCmw8lhHiAZQjMCksLQ1m+UcPYm7cKeoUoPROfUhfu67R4uR34HyCT7
 Qg1YxxVvWy8OyFaVdmGLy7QFCuK0eJ+e71l+Q3nlO7zjaDNh5ay6VIh0=
X-Google-Smtp-Source: AGHT+IHMVhkPZ3imqnAgsHcNCrgL+tTl4iXobEW4UME8EY4hV2D5IcC85h3u2lCaI7aE64Csl3zuJA==
X-Received: by 2002:a05:6402:3487:b0:615:6fae:d778 with SMTP id
 4fb4d7f45d1cf-6179615eb94mr631615a12.17.1754437070076; 
 Tue, 05 Aug 2025 16:37:50 -0700 (PDT)
Received: from tpx1 (ip-109-42-50-164.web.vodafone.de. [109.42.50.164])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffa3c4sm9279307a12.46.2025.08.05.16.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 16:37:49 -0700 (PDT)
Date: Wed, 6 Aug 2025 01:37:47 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250806013747.1b2835f8@tpx1>
In-Reply-To: <20250805151814.1114414-6-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-6-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH v4 5/9] package/kvm-unit-tests: bump to
 v2025-07-31
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

QW0gVHVlLCAgNSBBdWcgMjAyNSAxNjoxODowNyArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFVwZGF0ZSB0byB0aGUgY3VycmVudCB2ZXJzaW9u
IG9mIEtWTSB1bml0IHRlc3RzLiBUaGUgbWFpbiBjaGFuZ2UKPiBzaW5jZSB0aGUgbGFzdCBjaGVj
ayBwb2ludCBpcyBzdXBwb3J0IGZvciBrdm10b29sIHRvIGxhdW5jaCB0ZXN0cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gCj4gLS0t
Cj4gdjMKPiAgIC0gcmV3b3JkIGNvbW1pdAo+ICAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFzdGVyIHNv
IHdlIGNhbiB1c2Uga3ZtdG9vbCBhcyB3ZWxsCj4gICAtIGRpZG4ndCBhcHBseSB0aF9odXRoJ3Mg
ci1iIGFzIG1vdmVkIHRvIG1hc3Rlcgo+IHY0Cj4gICAtIGNoYW5nZSBmcm9tIHNuYXBzaG90IHRv
IHYyMDI1LTA3LTMxCj4gICAtIHJld29yZCBjb21taXQgbWVzc2FnZSBhZ2Fpbgo+IC0tLQoKUmV2
aWV3ZWQtYnk6IFRob21hcyBIdXRoIDxodXRoQHR1eGZhbWlseS5vcmc+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
