Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC9E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2E7A41571;
	Sat, 30 Sep 2023 13:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E7A41571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OePNUhBgIv8O; Sat, 30 Sep 2023 13:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C784B4157E;
	Sat, 30 Sep 2023 13:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C784B4157E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3870D1BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A1E60D6E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10A1E60D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyzXNxvfLzhB for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:30:37 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CC9760D58
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC9760D58
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405497850dbso130851315e9.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696080635; x=1696685435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfwuIroDsUk24qQdcJRh4f8GXUywcnJoQw/Pyy+so0I=;
 b=afyYedui29NeSewjbro2xipq17pJxjEQysITq87BTekSeLqC364YIa+jA0UVVs6419
 5RtqJxT9JYjNo49y7cmqqfQbxC0nzV0+Sj1V3T+sc0dagZoVSU4F+BhqYilK/rnu6iIQ
 WUTJmaAIZtTjqon2vtK9TVDqL5WJ2bwiElgpUoT19v5cEcQ4zSwZhCaVtkMomdPnZNzn
 +2TSRddnYMWI1DztoKvSodXFubWs6zCSIdaXzUzZO+7ofMVQr5hSZCKWBuJuDVeIum5H
 kK9HzeGEeVJdM47TOcGh+rOchFSIcM5jVVS6sNQj8pWGyfBgBYWSsEQwV/fLjlvnvBHQ
 s3yQ==
X-Gm-Message-State: AOJu0YwMkrzYbuikU/7dyBKe7OfTjM3WZcxK4ar/Csvfu36tilqXSsTV
 Lv1FKdiAcRe437f7Uy+NpIsoXQ==
X-Google-Smtp-Source: AGHT+IF5FJK8PaNLdE+6tmwhY7m63mduRthTF01ZJJX08TGeq8kCVNRPIKguVciS9dJsFeDZ7NhoOw==
X-Received: by 2002:a7b:c7d2:0:b0:405:1dbd:f77 with SMTP id
 z18-20020a7bc7d2000000b004051dbd0f77mr6006376wmk.31.1696080634899; 
 Sat, 30 Sep 2023 06:30:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1c7919000000b004054dcbf92asm3391020wme.20.2023.09.30.06.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 06:30:34 -0700 (PDT)
Message-ID: <f3c38dbc-22d3-2aa1-80ea-219b65d378c3@smile.fr>
Date: Sat, 30 Sep 2023 15:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr, en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot ML <buildroot@buildroot.org>
References: <20230930132145.GB2579@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230930132145.GB2579@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696080635; x=1696685435;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfwuIroDsUk24qQdcJRh4f8GXUywcnJoQw/Pyy+so0I=;
 b=DMnMl0wK8PnjxuWOK0K+4a6j337O2v/AZW/8WjylXbOyduMpl/Kx9XCJw9m9IN4WyF
 UAg6W9WpME6LlNY6RwOOECxQafdk9fgV890gl5WFOy9wqPJLKlLjir/dMDlLLO43DTFM
 SYgrG+rPyH3z9V+xfim4RbO0+ra0i/oYorh39uwS9mYXt238ky70nI0TvqevKO2bniBx
 d+nzctltpY79HVdQdqRZe6fzROV3f2pVUGnyTA4rwnsweSEfAs0bH2cO6xpN4TIuNTz5
 4txexfQUGlqAkBBGUhBoqxCVnVNb8yf28AjSB3vxZW4zezLc3TLNzrIh6SQQ5VwVWFwm
 5iNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DMnMl0wK
Subject: Re: [Buildroot] New maintainer on board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQXJub3V0LCBQZXRlciwgVGhvbWFzLCBBbGwsCgpMZSAzMC8wOS8yMDIzIMOg
IDE1OjIxLCBZYW5uIEUuIE1PUklOIGEgw6ljcml0wqA6Cj4gSGVsbG8gQWxsLAo+IAo+IFJvbWFp
biBoYXMgYmVlbiBjb250cmlidXRpbmcgdG8gQnVpbGRyb290IGZvciBtb3JlIGEgZGVjYWRlIG5v
dywgYW5kIGhlCj4gaGFzIGRvbmUgcXVpdGUgYSBsb3Qgb2Ygd29yayBpbiB2YXJpb3VzIHBsYWNl
cyBpbiBCdWlsZHJvb3QsIGFuZCBoYXMKPiBiZWVuIGhlbHBpbmcgZHVyaW5nIHRoZSBkZXZlbG9w
cGVycyBkYXlzIGFuZCBoYWNrYXRob25zLgo+IAo+IEhlIGhhcyBhZ3JlZWQgdG8gam9pbiB0aGUg
bWFpbnRhaW5lcnMgdGVhbSwgYW5kIGZ1cnRoZXIgaGlzIGltcGxpY2F0aW9uCj4gaW4gdGhlIHBy
b2plY3QuCj4gCj4gVGhlIG1vc3QgYXN0dXRlIG9mIHlvdSB3aWxsIGhhdmUgbm90aWNlZCB0aGF0
IFJvbWFpbiBoYXMgYmVlbiBxdWljayB0bwo+IHRha2UgaGlzIG5ldyBkdXRpZXMgdG8gaGVhcnQs
IGFuZCBhbHJlYWR5IHB1c2hlZCBzaWduaWZpY2FudCBjaGFuZ2VzIHRvCj4gdGhlIHRvb2xjaGFp
biBiZWZvcmUgSSBjb3VsZCBmaW5pc2ggdGhpcyBlbWFpbCEgOi0pCj4gCj4gV2VsY29tZSBvbiBi
b2FyZCBSb21haW4sIGxldCB0aGUgRm9yY2UgYmUgd2l0aCB5b3UhCgpUaGFuayB5b3UgYSBsb3Qs
IEknbGwgZG8gbXkgYmVzdCB0byBOT1QgdXNlIHRoZSBGb3JjZSB0byBwdXNoIQoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
