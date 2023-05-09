Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0E2C77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B08427A3;
	Tue,  9 May 2023 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B08427A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdgCZJZfzKvg; Tue,  9 May 2023 20:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D578742742;
	Tue,  9 May 2023 20:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D578742742
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51F0D1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25825846A7
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25825846A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bF8whCO9e866 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:12:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E54C9846A6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E54C9846A6
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:12:33 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96598a7c5e0so1009567566b.3
 for <buildroot@buildroot.org>; Tue, 09 May 2023 13:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683663151; x=1686255151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WH8EqzcbljSombZI2YtbTDSmrBN0uu+H+409m8NDl9g=;
 b=ALvMTwzMh8uUwCRfa2JanTMfynT9jvfCv1F1oXBIMWEOomIabzoSTbXrSKejsFnSDA
 YwsgBMJisgA1S3CqIMrY3PuLzMoNsDMGnbgXcR1gCFkFJktExS/Zhv5uaiY1N22ok7dC
 TBqXCyXk6AJuSg9n+BWpikU553Ifmy4rt7el1ixbUu8+YeDI8imxXCMRLRUdLtoXSFFM
 ElWx8erZOhSR9q6q88NvhIz5vtn4aSwmcDO4XY2AX3zbmNlE23Ceuf9kMsWpv+ZY+Dsd
 YcwK9ASUZXq4rlxX4lcsaOFgHM+YaheZEvIaTMNai3SlWe2YRzqkQZO4ee8OCjWABivz
 iK3w==
X-Gm-Message-State: AC+VfDzyygqADtJ7iAvKXKoIUQRtlE74VSgSvG0NkgEXU2auWM8GQDi/
 9uCUi60wHMo5AIIFpgKjpvmZINB2SOZUd7KDnmxvWg==
X-Google-Smtp-Source: ACHHUZ5+zwEEvqdaRBQyF98eB0y2ye4NHNpRHdft1kfIPpltkjYQ6EulsZaKxthq50HJ6qKp601Zqw==
X-Received: by 2002:a17:907:7250:b0:966:b4b:eb0 with SMTP id
 ds16-20020a170907725000b009660b4b0eb0mr13273159ejc.30.1683663151654; 
 Tue, 09 May 2023 13:12:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00506987c5c71sm1157936eds.70.2023.05.09.13.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:12:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 22:11:49 +0200
Message-Id: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683663151; x=1686255151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WH8EqzcbljSombZI2YtbTDSmrBN0uu+H+409m8NDl9g=;
 b=W5obo4bpmyY+MDmxIi+G1kxoJocre/drhmLGssnhy9QduCklRCksQufqTHPSfK6OQi
 dGHQCdd8wx7DGfrMu7ku410LsXG1dHlUh3HutGwRUxrfaA+XUo4ksF2eFTwxvZMMLuNC
 g/+QYcctMZqb+bJAanG3FrVU47UpwiBDABvXA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W5obo4bp
Subject: [Buildroot] [PATCH 0/4] manage CAN devices on MMU-less systems
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is the result of the work done to add support for the bxCAN
controller to the Linux kernel ([1], [2]). Since these are MMU-less
systems, I had to apply some patches to the userspace tools required to
test the driver. I also submitted a patch to busybox ([3]), but it has
not been accepted yet, and I don't know if it will be in the future. In
the meantime, the rtnl-link-can application can be used.

This series allows the use of CAN devices on MMU-less systems before it
is possible to bump can-utils and libmnl to the new versions containing
these patches.

[1] https://lore.kernel.org/all/20230328084710.jnrwvydewx3atxti@pengutronix.de/
[2] https://lore.kernel.org/all/20230509-silt-gullible-a010971857fc-mkl@pengutronix.de/
[3] http://lists.busybox.net/pipermail/busybox/2023-April/090294.html

Dario Binacchi (4):
  package/can-utils: bump to version 2023.03
  package/can-utils: enable compilation on MMU-less systems
  package/libmnl: add rtnl-link-can example
  package/libmnl: simplify LIBMNL_EXAMPLES_INSTALL_TARGETS setting

 ...ograms-using-fork-on-MMU-less-system.patch | 257 +++++++++
 package/can-utils/Config.in                   |   1 -
 package/can-utils/can-utils.hash              |   2 +-
 package/can-utils/can-utils.mk                |   2 +-
 .../0001-examples-add-rtnl-link-can.patch     | 504 ++++++++++++++++++
 package/libmnl/libmnl.mk                      |  15 +-
 6 files changed, 770 insertions(+), 11 deletions(-)
 create mode 100644 package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
 create mode 100644 package/libmnl/0001-examples-add-rtnl-link-can.patch

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
