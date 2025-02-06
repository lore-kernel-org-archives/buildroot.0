Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E30C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 21:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4600E803CC;
	Thu,  6 Feb 2025 21:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8D5X1BHaM7B3; Thu,  6 Feb 2025 21:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348CA80C32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348CA80C32;
	Thu,  6 Feb 2025 21:56:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF8A1CF
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA55840179
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkReRp8woqIx for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 21:56:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=dave.peckham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E10B40236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E10B40236
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E10B40236
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:56:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1413418e87.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 13:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738878985; x=1739483785;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=knqi0HuTWWP44iSUP2aYqLLN/tburxuqzEJC3/ivnkg=;
 b=SaWfi4ktTA9MyBGq90XIv0uDvtazDtCQ8k33/34vYqeCANsjqSGJAq1HHbGqUAo3gH
 rI/3ixUckJ+iWrDj9ypW6kV1Pk4ohDxVghEcDus6CS4T+rMp+1j7wD7LIj369r4yZDxC
 mhghHSmZm3/6LZw3u9ImQC+/R7xoZAhA94KsudUaW28yJoes8UB0LI1pY15CqfaAt5Pn
 g9pe9kUHhHy86tVo/G7/cyF93qp02oV3FEBTeJ6Q17+tnT4TuDT7fSBwTWb1yxdQloJM
 mTpTuNq9SHwvIFY2xHbiFpO7G/aO8e/33tTTQczIAr0CZ8lu2Ou9RWYj0T2ASFJUUQkw
 /jNQ==
X-Gm-Message-State: AOJu0Ywev81yB4YoZ47kEdhTZExD/y7GM43xWctQLkO8+jgxipNKJcjU
 7pJ0XDHYWziKLGy6qsvCma0gXLt08rMSccNnjmdOfa0S1wLZjlwj5ZP4dA/5ksvQGzyxCY9y2D4
 uiwCkx0mkv1N9Two8YPtZe/E++tTaKp00Suk=
X-Gm-Gg: ASbGncv7z+zzmn8ojnCKaw1ORT7ttnsjPAvkzPx6aJdYa36cSNOnud/ZoG7C4qmx9BC
 OK8Uk5mkWya5WNTOjCVHmhxaxXeA7Uvk9q6bLsEXNXrA1vzl3NL1TlbR13yHZW/xMNbac+zIveb
 38K/TWq/zWASKK78ScsoQyAsT2Yf4TucI=
X-Google-Smtp-Source: AGHT+IF+YE7u2zeJYK7TFh7rJ/tn9/NWxICpDdFLZ/yFxed3UT0xpXWMtN0zU1unaYtixOQi9q46rz7n98cy7pxin6s=
X-Received: by 2002:a05:6512:224a:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-54414a9d078mr127622e87.18.1738878984429; Thu, 06 Feb 2025
 13:56:24 -0800 (PST)
MIME-Version: 1.0
From: Dave Peckham <dave.peckham@gmail.com>
Date: Thu, 6 Feb 2025 16:56:13 -0500
X-Gm-Features: AWEUYZnS0no4XlpscdWuOzxZrdXhJRgMADRPtU4qcdms_OlLde9ViUqvIopV4t4
Message-ID: <CAHWkT_D+bdHGBOwG_Go_=oBeG6jfEDyZuePger5QsjNGzBUtRA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738878985; x=1739483785; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=knqi0HuTWWP44iSUP2aYqLLN/tburxuqzEJC3/ivnkg=;
 b=Z1hkK+2RcaRPWutGhbCxiZ+lfcFOe2OGpHOla9DRxg2ZlEExVzr/s5UCZxA5N2EJpi
 96hTaeiHcSxWn7uQ6WH9kLVDX6BjR3PA3SVstJeL75gR/xXPFEZDQv564k+XXVribzaG
 BBCVsBN1l1Uybedz8cROtYRkXNgDrTJj+Z0FnYnscxUakQ3OzD7PoJxRtPeMs9ltHhJ6
 Hw0gasjqagIiVLX7RO/QIgslKxYyLOdXtL8h/+CTK6tLaUydwB/Y2+WvugLq+zPNZE7Q
 psP6bu93hjwW76m1swaFpvxMuEsTDu/QrRAY9TpunOM7hMOJZZWjlBp0zq0GqKq+NaTt
 WLQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z1hkK+2R
Subject: [Buildroot] github broken?
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

Hi,

I found mail discussions up to 10 years old that this has been an
ongoing issue. I am using buildroot-2024.02.10 and getting the
following error from my .mk file.

Current API docs suggest a different URL for the archive.

https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#download-a-repository-archive-tar

Am I doing something incorrectly? Or does this need to be fixed again?
Should I submit a PR with a fix? Their API does let me get a tarball
of this particular repo.

I noticed second attempts to connect to sources.buildroot.net. Am I
meant to submit packages to be hosted on that archive?

BR
Dave

********
GO_SDL2_VERSION = 0.3.0
GO_SDL2_SITE = $(call github,veandco,go-sdl2,$(FOO_VERSION))
GO_SDL2_DEPENDENCIES = sdl2
GO_SDL2_GOMOD = go-sdl2
$(eval $(golang-package))
********

$ make go-sdl2
...
>>> go-sdl2 0.3.0 Downloading
wget -nd -t 3 -O
'/home/dpeckham/code/buildroot-2024.02.10/output/build/.go-sdl2-0.3.0.tar.gz.SDjmKR/output'
'https://github.com/veandco/go-sdl2/archive//go-sdl2-0.3.0.tar.gz'
--2025-02-06 16:41:20--
https://github.com/veandco/go-sdl2/archive//go-sdl2-0.3.0.tar.gz
Resolving github.com (github.com)... 140.82.114.4
Connecting to github.com (github.com)|140.82.114.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/veandco/go-sdl2/tar.gz/go-sdl2-0.3.0
[following]
--2025-02-06 16:41:20--
https://codeload.github.com/veandco/go-sdl2/tar.gz/go-sdl2-0.3.0
Resolving codeload.github.com (codeload.github.com)... 140.82.114.9
Connecting to codeload.github.com
(codeload.github.com)|140.82.114.9|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2025-02-06 16:41:20 ERROR 404: Not Found.

wget -nd -t 3 -O
'/home/dpeckham/code/buildroot-2024.02.10/output/build/.go-sdl2-0.3.0.tar.gz.U7u3fQ/output'
'https://sources.buildroot.net/go-sdl2/go-sdl2-0.3.0.tar.gz'
--2025-02-06 16:41:20--
https://sources.buildroot.net/go-sdl2/go-sdl2-0.3.0.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::681a:25, 2606:4700:20::681a:125,
2606:4700:20::ac43:4838, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::681a:25|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2025-02-06 16:41:21 ERROR 404: Not Found.

wget -nd -t 3 -O
'/home/dpeckham/code/buildroot-2024.02.10/output/build/.go-sdl2-0.3.0.tar.gz.XFLDXc/output'
'https://sources.buildroot.net/go-sdl2-0.3.0.tar.gz'
--2025-02-06 16:41:21--  https://sources.buildroot.net/go-sdl2-0.3.0.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)...
2606:4700:20::681a:125, 2606:4700:20::ac43:4838,
2606:4700:20::681a:25, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|2606:4700:20::681a:125|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2025-02-06 16:41:21 ERROR 404: Not Found.

make[1]: *** [package/pkg-generic.mk:179:
/home/dpeckham/code/buildroot-2024.02.10/output/build/go-sdl2-0.3.0/.stamp_downloaded]
Error 1
make: *** [Makefile:82: _all] Error 2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
