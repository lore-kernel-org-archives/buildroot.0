Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA2AC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 08:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E38461074;
	Thu, 24 Jul 2025 08:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czTbcqEO4kNj; Thu, 24 Jul 2025 08:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A4E46102F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4E46102F;
	Thu, 24 Jul 2025 08:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58504115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 08:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49D9D6102F
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 08:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPpLEG7rXoFc for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 08:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3260961026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3260961026
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3260961026
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 08:20:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so6859405e9.3
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 01:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753345227; x=1753950027;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Aza1R11TJra7RVTuwOKPl8usGEy3DEOnengtaUOdPc=;
 b=k8GfiTDdZxi4fgQbjsPshF0RHUhgpyeQvWL+KWMkf6OQOSNJ1yMF2HnwiqDOZq0C0K
 9XRG9fvgLFAeKKGMdQWk+z6tM3YoqtKgGIAoNLYO6q5yWm2ByrTIQ9A5fmaw9ZnrMmqU
 6lnr+n0Dm0ysF/tNHdCwT+rQAdk7nbkOFMZDSU9oBnH/wAH+HyL2CneiNiP9FHC+e8QL
 FSCsFN11wzcV4SjTFQj++mrbC+cXHK4SuRtIupIM/t5D2yAAFobkdOZ7HqNzl4Y33VxP
 lN7epyY0id6GYrVSibYGjsIpgqTaRzdN2USdV5/XeVewGO3ozDu9+YdtnBY71SlEBsZp
 BHxQ==
X-Gm-Message-State: AOJu0Yy7bXob2NW0zMIzSS3VToc1qVrbaTuTYhjO5Bu/a4q144dCEn8A
 RxNIhrw+gObt4uX2qU1fXnaHfXxowJuvm2vqw05djd016zH4Jm5cjsdmAS4YybQ/
X-Gm-Gg: ASbGnctUxGtCuqOGvXj5Q4UhVrD9B/AUqDq6ala8MeMQj638kNw4w6gHyZTXm1j6HDI
 1lHlDz6XKJrilpYVjCrZBAfqYxtHXNM3PwCRIyWKfRQI64chKOYscyphlMtIekcU5otWdaI7yAD
 r2JsdhK9aM8zYxB/p76Pg0RLYDg8V9CzVeTr4EFuvE4MP9Mxf5cgnRa4Ktn9JqMoLmD44/dJQ1b
 s1unD8UL4HC5W+JIlbPISlwEbjGWh4jzKcOhETdu4xelAjDGKyyPkzTorshdrgi3TAoNF4y3X4y
 p3cIR87jCBqtJdie3Gkxkaq+2SO2vXajGPTwmUI5g4dMr9GdUJlvJQGRW5IZSlic22lLkIs7oQc
 pO2vM9oC561OSAbVl15yZCnYn+a27X+cjfyhZJ9qyZ7zmgkBRn9btxfC9OsbxDIjxY0HDB4gwo+
 Ew3VaMfCCFxRnMf3gTprU=
X-Google-Smtp-Source: AGHT+IHnaJ7rhEYN1IJ6cSPzG9jAxQ7HjJKwIiGCIq2sAzb7rJc8oeGaRvB6cEa+rIiHXU3n++2u2Q==
X-Received: by 2002:a05:600c:1554:b0:456:1c4a:82b2 with SMTP id
 5b1f17b1804b1-4586d84cfb5mr35418355e9.10.1753345226726; 
 Thu, 24 Jul 2025 01:20:26 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d1973ff600a1ab5b988c9d795d.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:a1ab:5b98:8c9d:795d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054c562sm10369185e9.10.2025.07.24.01.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 01:20:26 -0700 (PDT)
Message-ID: <aa3e622ebb8709fdae58fed602541f23f8be418c.camel@gmail.com>
From: stefan.nickl@gmail.com
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Jul 2025 10:20:25 +0200
In-Reply-To: <CA+R_deofJALuQTwbUc8tkMddQ5vog82aYSa2EVJS_+0AkuL9Vg@mail.gmail.com>
References: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
 <CA+R_derRM8KYwv1bvaj7ZayMM=wF6AeSfAvoiidag=Luxhjdiw@mail.gmail.com>
 <59619ea5bc67adf918a35f865cb1567998641e62.camel@gmail.com>
 <CA+R_deofJALuQTwbUc8tkMddQ5vog82aYSa2EVJS_+0AkuL9Vg@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753345227; x=1753950027; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7Aza1R11TJra7RVTuwOKPl8usGEy3DEOnengtaUOdPc=;
 b=MooY06WzeoTXj2UfQk8yapo4co7ZGGt8jIya71PY78rFOjblsUhF5uJ/NGOCUi5+su
 PiUQpydqoYT1Q46gekmoeHIVQZjYFVDAQ82iYZ4Hz2CikGX7P2/WZ+qR+L1ShNLAxC4J
 K5hUAARkly+Kyf3AjkorTblb44vfpjQ2SCvnhC5pqtkMB3neHdT9tojkXHUH4n0+1xj8
 tKIUNFHn+HDwRw+ZdesuKWznoov/I1T8JKVZbqEzrK3R5Oe0SOyogikhmWa949DrpGx5
 euWbWl+y1et3ixWxSX4PuVbeB1fQBT5j0klTq563PxzDj4UMjfXjWk0STrITkWEUy6Uu
 y30A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MooY06Wz
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6positioning: New package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> > 
Hi Roy,
> > > Bernd Kuhls added this package a while back, which I later ported to Qt 6.9.1 here:
> > > https://patchwork.ozlabs.org/project/buildroot/patch/20250610122924.431830-3-roykollensvendsen@gmail.com/
> > > 
> > > If you see any areas of improvements please feel free to build on top of Bernds patch.
> > About that, my plans were actually a bit different.
> 
> We should try to not ignore Bernds work but build on top of it. His original patch was made for 6.8.x by the way. You will also find some areas of improvement by comparing your patches.

I was not aware of your or Bernd's work. I can see your upcoming qt
patches in the patchwork web interface, but nothing qt-related when I
click on Bernd's name.

> > I have already prepared an update to 6.8.3 (latest LTS version) that I
> > wanted to send out as soon as qtpositioning 6.8.1 was merged, plus a
> > minor bugfix (qt6quick3d missing a BR2_PACKAGE_QT6BASE_CONCURRENT
> > dependency).
> > 
> > Do you think we could defer skipping to the next non-LTS for a while,
> > maybe until after 2025.08 is released?
> 
> My goal has been to keep main up to date with the latest available Qt 6 version. The buildroot LTS releases will be maintained longer than before, so using the Qt6 LTS releases for those could make sense. On the other hand, aren't those for commercial users only, at some point?

It seems you're right, I had assumed they would continue to make patch
releases available post-6.8.3, but apparently they cut that off when
6.9 came out: https://www.qt.io/blog/commercial-lts-qt-6.8.4-released

> We should find a solution where we can keep main up to date but still be able support Qt6 in the LTS releases of buildroot.
> 
> There may be some guidelines for this in the manual(?)
> 
> Please post your series and the maintainers will decide on the best path forward.

Learning that LTS patch releases are only made public until the next
minor release has defeated my previous strategy, so there's no longer a
point to it and I'll just upgrade to 6.9.x when that hits master.

Thanks for your work!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
