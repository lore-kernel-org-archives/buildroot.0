Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C12C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A976805A4;
	Tue, 16 Jul 2024 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOvk3wNI3eAs; Tue, 16 Jul 2024 10:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F51680849
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F51680849;
	Tue, 16 Jul 2024 10:40:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A60081BF59C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 10:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93E28608C9
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuwgKLPcgd0O for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 10:40:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7D7D607C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D7D607C9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7D7D607C9
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:40:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so650754366b.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 03:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721126408; x=1721731208;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lx0f4VqiQQYjUmELqhSkLg4oO0HYXVfENTC1cJX2/Mo=;
 b=c9d/o6IWpASMeyXX2iqX3njYgwNdBo4GfNh2GkcNvHyZvXh9yLKy2egWqc/B3W1Fhx
 iVoffET0iknWgd9X9YO2k8N3ai34IRKSe2/VsqvuFC5NWpEQ7N29kdciQUYOT7mYfvF9
 LoZLCGL2Tm9U5nJYJuDtOc+0EurgFYFLhnWYuLLkUtT6TJ4hdixgYz0WecT8RzSoIoZc
 28dttHoFSweAmnXfKxoRH53YHh28EQ9Jlj72hk0BBZzwV1QCAddRmf+k5OXIbVkiQ3Lc
 zWDNBe+IqM5EY6HhPy9lixRVgZ7/zlWswyiaJ2X0Nr5cFJ68tzbSJ6Tu8fKZYTqRedgL
 F5eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX0LO0WseZLC9gxOFzrZaa7Z0j6by3UAFjz5WcUJIhSp4uRUo0wS4CXsv7Xl5340b8djf4mrJ+49/J7j86XlxqXb3zf0Zrew==
X-Gm-Message-State: AOJu0Yy5Cp4DWSCZ6c8wevQDwydEXSZdyTvyhgRPEuAcC1HqzMHjTsoS
 YApuaI7OaLHy+UUI/aFJQxmP3bX+djUyqj9l0w4LOLIjhbPk8EQNVsv5MASk
X-Google-Smtp-Source: AGHT+IEb8C/zs9ry1u4viBcGMEP4Gc6whI6xMYXkI3CZBXG/ss/Vsuw9A8y9FU9I994LhNrprmdpng==
X-Received: by 2002:a17:906:d214:b0:a77:eddf:a49c with SMTP id
 a640c23a62f3a-a79ea46aae8mr126300766b.41.1721126408170; 
 Tue, 16 Jul 2024 03:40:08 -0700 (PDT)
Received: from gimli.local (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7f1f0csm293192166b.123.2024.07.16.03.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 03:40:07 -0700 (PDT)
Message-ID: <02e5180ddafe94a9a3d48fdb1dcc8cc2221abeb8.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Jul 2024 12:40:07 +0200
In-Reply-To: <878qy14rqg.fsf@tarshish>
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
 <20240710231351.32389974@windsurf>
 <cb3adec204d2306b78347de3d5e5b9185103fc1c.camel@gmail.com>
 <878qy14rqg.fsf@tarshish>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721126408; x=1721731208; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lx0f4VqiQQYjUmELqhSkLg4oO0HYXVfENTC1cJX2/Mo=;
 b=l0h8Gx2eY1C4u5/WxKeLtiar+jsJkU6bAn2r9JzwRmaJGqdD9x5pdjh8qICNXs+RL/
 /sHzRTgqt7qOu/y7dZHGGG0vWeYsHQVU6w196pO+n1mXY7QsJx7GKSBDz8Ine5vlH03t
 KG+44K75tJEW8lcXWj4vxgdWWd/uN4h/5gP0g7FlTS2YRPCTZdjiV3IEovoWE0b1DL83
 QVH4hEEm9OtI+8HJOQx4VO+pHZF2/5cT8BgfYxf9y8H9pMl5SfAXM4hBdvlz8UCcP9Kj
 lzuCs3hhj8kIU7x8rFOstFONIXPdKeHzYCPTG+GPRsypdisqovAZETWv2IyOE9skAmcJ
 2asQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l0h8Gx2e
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Tue, 2024-07-16 at 12:21 +0300, Baruch Siach wrote:
> Hi Joachim,
> 
> On Tue, Jul 16 2024, Joachim Wiberg wrote:
> > On 2024-07-10 at 23:13 +0200, Thomas Petazzoni wrote:
> > > Applied to master, after adding a reference to the autobuilder
> > > build failure. Thanks!
> > We have the same issue also on 2024.02.x, as of 2024.02.4 builds
> > with libssh break unless you update your defconfig.
> Commit fed58dac5dea (Revert "package/libopenssl: no-engine") should
> have fixed that in 2024.02.4. Are you sure libssh build is still
> broken?

Just retested, and you are 100% correct, the libssh build on 2024.02.x
is *not broken*.

So sorry having wasted everyone's time!

All the best
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
