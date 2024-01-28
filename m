Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56414C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EFF82786;
	Sun, 28 Jan 2024 13:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9EFF82786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehc2YixHUv6Z; Sun, 28 Jan 2024 13:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F03E8275A;
	Sun, 28 Jan 2024 13:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F03E8275A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1D1A1BF863
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93311415A7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93311415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZsFs7pxPg2e5 for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:00 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A30F4159F
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A30F4159F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so27096095e9.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448058; x=1707052858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvGMsW9CAKNIjtY7yYknca1w5c1f2ovHC5T7M5XYp8k=;
 b=LeOSOHhqXeOx+PMM2fFRRd8zvfCnDlHUPmrp7dD/E6k4NUC90P9m0yF/trWuKPfrB7
 Z3lLOJ2cNCWOJftV487Vblz6Qeh2GeyeO68bjK1Bhx7j8Y4Rs3fDb++FQx6Xh4yBfY7Z
 PWpR3l6xk1KtZ3kHkUU/GEaZznGGI1KI5vybJ2FpnDEo84GFXZWAplvfrbToNJw/JBB/
 5oGz9ZVMa4p1Hzz+pZ2G+P8lF8xdbPoL+IP8Uj1eGWHuKeRVwaaw9b/bwkL4H+XX+sRO
 WDNVwq4cea/2mqZKBfS9qPxVQ8R1ukikGHSBa828Rh0aYeVhJcRzR1r9N7BE7Oss+Zb6
 LXkw==
X-Gm-Message-State: AOJu0Yzmwo2CJk+Y2lnfQCHxdmtEIo1vBOHRkR54dIthwK8LR50D8+kl
 y8shZ3kx1Fx/sp9R+XtrXrLzDvEUJaNfapXKP7vq1Ow+XPC2SBHUaH4slUJi
X-Google-Smtp-Source: AGHT+IERbcTtKEX9nIbMVzNa/dV51MHHkv5cE5w67YShrBi74YIXsGL0R9oEVVJ3yB+ovAAmWqplug==
X-Received: by 2002:adf:f48e:0:b0:33a:e38f:5016 with SMTP id
 l14-20020adff48e000000b0033ae38f5016mr2497822wro.67.1706448058175; 
 Sun, 28 Jan 2024 05:20:58 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b0033aedaea1b2sm154231wrs.30.2024.01.28.05.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:20:57 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:56 +0100
Message-ID: <cover.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448058; x=1707052858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=lvGMsW9CAKNIjtY7yYknca1w5c1f2ovHC5T7M5XYp8k=;
 b=EWWYjc2i70S+TkffZiu823tXRWaaq2NAxPfQ7j4lemlRsGrWII9HeXJhE4YGpOg0bB
 +6o2tszpoFAaMn9jguGsZR9xMBI8qfOwrhy75TC4VxwQSxE1PtNK7gph62vqwb6PQDJq
 n6pxA6aco+EcSLvfXRRz3hog8zo9NIwjLKzoTZM0laTPjzv7isZnevSpq9CoW+pfiX4Y
 hGDejoVwy/vijqnb2VeL5TBmkUrQbYIFhdU36BCsYTC2Fcziai8OKpz8IBjdglz8UfNS
 NgqGNWTVgvRI27Ykqb2bFuWC4+ygv82I71gKOfy0rZOtfnDtAEX8nyVtvVdos9XMBQ0V
 C1FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EWWYjc2i
Subject: [Buildroot] [PATCH 00/10] package: fix unmet dependencies (branch
 yem/misc-fixes)
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Laurent Vivier <laurent@vivier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, James Knight <james.knight@collins.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series brings in a few cleanups in the propagating of dependencies
across packages, to solve various warnings abot "unmet dependencies",
which are unfortunately not errors...

The situation is often a bit non-trivial to fix, especially for the
openssh and ivi-homescreen cases, and hopefully the heuristic that has
been implemented is not too strict.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (10):
      package/util-linux: propagate linux-pam dependencies
      package/ivi-homescreen: fix dependencies for gstreamer plugin
      package/openssh: fix dependencies with refpolicy
      package/re2: propagate dependencies from libabseil-cpp
      package/petitboot: fix ordering of comments and sub-options
      package/petitboot: propagate depednencies from kexec/kexec-lite
      package/python-ml-dtypes: propagate dependencies from numpy, pybind
      package/opencv4: propagate internal dependencies
      package/opencv-contrib: propagate opencv4 dependencies
      package/atkmm: propagate dependency from at-spi2-core

 package/atkmm/Config.in            |  1 +
 package/grpc/Config.in             |  2 +-
 package/ivi-homescreen/Config.in   |  9 ++++-----
 package/opencv4-contrib/Config.in  | 30 ++++++++++++++++++++++++++++++
 package/opencv4/Config.in          |  6 ++++++
 package/openssh/Config.in          | 12 ++++++++++++
 package/petitboot/Config.in        | 28 ++++++++++++++++++----------
 package/python-ml-dtypes/Config.in |  1 +
 package/qt5/qt5webengine/Config.in |  1 +
 package/re2/Config.in              |  8 ++++++--
 package/sshfs/Config.in            |  7 +++++++
 package/util-linux/Config.in       | 27 +++++++++++++++++++--------
 12 files changed, 106 insertions(+), 26 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
