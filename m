Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F25FE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A5D610C6;
	Mon, 16 Dec 2024 21:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP6l_atCP-c7; Mon, 16 Dec 2024 21:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3D7610FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3D7610FD;
	Mon, 16 Dec 2024 21:28:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE2ECE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FFD1404C1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xsnn7ub5o0sJ for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.177;
 helo=mail-lj1-f177.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1253B4025C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1253B4025C
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1253B4025C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:28:34 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-300392cc4caso54222901fa.3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734384512; x=1734989312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVXBCLYM+QgTeh5EeHvIdnafcZGX9mxvONy4CzLjU6E=;
 b=Q9FYbrDZQRjwogEScwADwiBuXZzQF1Om4rhxVcB0/CnbjdCqee3tZVQsz2MzMs30al
 UnXHZkr2niiV5xojFEVZAXaVdA5drnTLfQPqeNZFn/7FAL3OuBQJ5+HHiBNBGu5lof3i
 dbvQi3YttzK7fFOVDZEXhRcT8boQRg5niwJEbSa6ar86OGhniXgiaDzguHevx5AAu2Fz
 fqCxzXSH1Dk47V306Y4NKGHsPH269zU4WIlCrN0PMo2ItJ9/5NZkDWm9SmuxaOFd0QVo
 SkdsPB8j6jtdY4AXVrNHtY/sd/q7W3jzc4m7Rhr0W4s6EK49UOaUeDVaetQKpil0gBfJ
 ju8A==
X-Gm-Message-State: AOJu0YzFSTEU9BGpAtoKWStkbn/1reD7H7OTTQVFkCJhbsS/bEXISYGV
 HChBKKAPFy0wek/Pv8mEwhyVdobitRTB4AfSvkOjglGjy0mWcx97YVnmY9I4
X-Gm-Gg: ASbGnculwFbGKb6p1Nn4yGQsDlcH928LZFYMxjdP4EBy49MntJ1yw+Ab+zVfP+r8Rzb
 uF9aEDgmWtmcv91r3LF+rEnKT4bqTSiNSCFbM0KwyEbjm1HGgb1qWXUB5NXUTyukuk0WHWERdjI
 /pjcRM1HEw82o1jkQl0hkpn3XedI0jebWsK/G+xFLVBSjxHDjalXCcK+t1Wg086PDnIMqDMS2wh
 TymGbWeWRPhE581HwbAhZ7KJVMQDAgWhM6d0ExkJ+ecMpQ1FzEDtWxMZ7gqNU1j5iar8xXtaWmk
 bfFz55rafgFYVTt7bo/R7g==
X-Google-Smtp-Source: AGHT+IEGhDvURXkquXe9DPUJOiuLnwrprL2AN+BAtSHExfhpJUEwsBFmmFvWtRhYA3weR7VjYVs5GA==
X-Received: by 2002:a05:6512:3d8f:b0:540:2223:9b20 with SMTP id
 2adb3069b0e04-54099b72ba3mr4251052e87.53.1734384512128; 
 Mon, 16 Dec 2024 13:28:32 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c20c59sm958181e87.254.2024.12.16.13.28.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 13:28:31 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3003e203acaso43597041fa.1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:28:31 -0800 (PST)
X-Received: by 2002:a05:6512:b27:b0:540:1b2d:8ee2 with SMTP id
 2adb3069b0e04-5408dd3744cmr4678163e87.6.1734384511745; Mon, 16 Dec 2024
 13:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
In-Reply-To: <20241216181719.770389-2-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 16 Dec 2024 22:28:20 +0100
X-Gmail-Original-Message-ID: <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
Message-ID: <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I just found out that this one is no longer building.

>>> webkitgtk 2.46.3 Building
GIT_DIR=. PATH="/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/bin:/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/sbin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
 /home/thomas/.local/bin/cmake --build
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/
-j25
ninja: error: '/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/wayland-protocols/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml',
needed by 'WebKitGTK/DerivedSources/pointer-constraints-unstable-v1-protocol.c',
missing and no known rule to make it
make[1]: *** [package/pkg-generic.mk:289:
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/.stamp_built]
Error 1
make: *** [Makefile:83: _all] Error 2

I have not a clue why
"/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/br-test-pkg/bootlin-armv5-uclibc"
is concatenated twice in the path.

The WebKit source for it,
https://github.com/WebKit/WebKit/blob/main/Source/cmake/FindWaylandProtocols.cmake,
hasn't been touched for a while.

Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
