Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D37CC83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8461F813EF;
	Sun,  3 Sep 2023 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8461F813EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Vkwmp3YsZiO; Sun,  3 Sep 2023 16:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D078D812D9;
	Sun,  3 Sep 2023 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D078D812D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49A021BF381
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A1AE4090F
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1AE4090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGWG1ok-2xT4 for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:36:33 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F194640900
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F194640900
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bf298ef1f5so676702a34.0
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693758992; x=1694363792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IRCFmbK4C1QhZWoF5DqTLEQnFR6M3WfIxVyjCApYKb8=;
 b=XkjrEgg8xQ0+6pS85L65JTv/6wlEnD2q0MMgdSzxcN5ZvdaKdfqUp/nfnRfvJlmSrK
 oWdI6mlAo8bNDIGk6zsT3PlEZEnQ7YrzDPhhnkFCzKiT2KE6Xwxv1u1+Ri+HgzjD0Bwt
 0e6Kbez/UMxaLetyx95UJyTkIhJMI9PWfXcXR7jAsMshxubdnnHxQYOy0GwVZZ7eAdNR
 RMzWoRKhWlgAx0rLRAWnikkM/xxHLS6zsXHubGQj86DMwkMD2NVLsej/+VNGyCFytY0S
 ysGUxj1PeJ16n5Z7icgxtuIR9r37ksB1QXmCp8Y4Ju+1GzTU61paSIgR/h8c/nGRFUPe
 0s0w==
X-Gm-Message-State: AOJu0YyBR5pVoy9oHmxCFmFQnzhu2jdDZGiDBnJNS8oofW3DQxilACS7
 /nOAbzneBUrvNTKDbXJBg8JqOoGB7YU=
X-Google-Smtp-Source: AGHT+IGycc6rdG52aeU74av3+LVlQZkmz2YqRxMxDG3ADQYPBLbwSx7CB41bMtxgWLo1bAjOS/SspA==
X-Received: by 2002:a9d:65cb:0:b0:6bc:e8dd:9f4d with SMTP id
 z11-20020a9d65cb000000b006bce8dd9f4dmr7466551oth.11.1693758991872; 
 Sun, 03 Sep 2023 09:36:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a9d7348000000b006b753685cc5sm3789487otk.79.2023.09.03.09.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 09:36:31 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 13:35:06 -0300
Message-Id: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693758992; x=1694363792; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IRCFmbK4C1QhZWoF5DqTLEQnFR6M3WfIxVyjCApYKb8=;
 b=JyRf2hxJdTpVNA5A96VXEFFrMZyAPZtkLvHmxM03EBcMGr/3AmBrhWWzzIrWMy1koR
 BNQYN5LvjmL8ylGkHI2HcuMKu8oiRW3BHxjpox99jsi3CdhMmizheUlo3CDWdhWG2HPX
 9QODDr36WPnd08bmHrLsl2hqqADT7H14qrlaA57VXuQdS99h1Tk/g0J4o8DZebqpmfNf
 lVbDz/DdpcBeLQz9PWuSuAGl0QSypnp291W/TnHWzvnCkoP0ES/VfhkM8L5pxQKtBpJp
 sv/aIEVWnMAfvkPQsCxhUAPrE9R6rMFs3JOARyeEwIJZbbU8FSlD+xUABvff71f9+0Qh
 n9jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JyRf2hxJ
Subject: [Buildroot] [next v3 0/3] check-package: support inline flags v3
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
Cc: James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This small series tries to make easier to support a new type of special
comment in source files, recognized by check-package.
It is a v3 for:
- v1, 4 patches: support ignore-indent for check-package configs [1]
- v2, patch 1 Accepted in 'next': utils/check-package: cleanup line reading [2]

Patch 1 prepares the code.
Patch 2 do the equivalent to v1 patches 2 and 3.
Patch 3 do the equivalent to v1 patch 4.

Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

James, Thomas,

Please feel free to rework or even completely drop this v2.
It is an attempt to make easier to the new code to arrive in the code
base. It is NOT a way to say 'I dislike v1'.

Regards,
Ricardo

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=352915&state=*&q=&archive=&delegate=
[2] http://patchwork.ozlabs.org/project/buildroot/patch/CYYP221MB114006AE3D1C77F421E44B43A0EBA@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM/

James Knight (1):
  utils/check-package: remove hard-coded list from lib_config:Indent

Ricardo Martincoski (2):
  utils/check-package: factor-out check_disabled()
  utils/check-package: support inline flags

 package/Config.in                   |   2 +
 package/Config.in.host              |   2 +
 package/kodi/Config.in              |   2 +
 package/x11r7/Config.in             |   2 +
 utils/check-package                 |   2 +-
 utils/checkpackagelib/base.py       |  21 ++++-
 utils/checkpackagelib/lib_config.py |   8 +-
 utils/checkpackagelib/test_base.py  | 131 ++++++++++++++++++++++++++++
 utils/checkpackagelib/test_util.py  |   5 +-
 9 files changed, 167 insertions(+), 8 deletions(-)
 create mode 100644 utils/checkpackagelib/test_base.py

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
