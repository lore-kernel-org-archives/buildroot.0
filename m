Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC6CA100C
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D689F81E59;
	Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbn4gbZT2Nix; Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8ACC840A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8ACC840A9;
	Fri, 30 Aug 2024 20:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0931BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6866261479
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ie-NmjpcN6B for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 20:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5301961461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5301961461
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5301961461
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 20:26:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so18382435e9.3
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049580; x=1725654380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DL3Y4TBP9eXXv3rgKaBPBP/Jl4D4WMQzujLmimsBV4s=;
 b=iSQMHyEzBjMlG9k1LGWVDzZWhn+F14vMaeTr84EVDcQyPVJ2o5CqnabxorCju1gSz2
 BEcyQdmgDkFB45hkmXigFUZWAGh/ggConFQcvenxJ1BJ6Mwlo47qnsBJV2kpwcpdRys6
 BcYuFSJtA2ul1tSGb0Yu28yFYjuOmiSx/xQBvFUrR2u++Cn1opOm+ktg9Yi/pVthN3P6
 9oHWE74HtJM5P6b8na4j5lH720QOVMfxpXsrzL0OTorVHOSRpqO8ifmlTXZq3fNA1vdA
 XMuapO05tZmmZZ0oCiTG57Gm4jVOq6DAjdRxqrnXmgi1PwxqNEOEuvi8v1P6X0O8zGFI
 umHA==
X-Gm-Message-State: AOJu0Yw9xYqGEBt5neXO/XD0x/QFjsLFWYbe7fGdoN/Bih4QDbOvpu/H
 YIkcu6rmJCmsZzRYdyHSuHcAExwRRC5/eENsfGLNLZPDKeFEgfBgGQYtPw==
X-Google-Smtp-Source: AGHT+IEfcq6V8UUX7TCtus6hvLk6Wc5iXeHM/nYrcVKyvEM5v6nEhmnJUF91RPbwFdSVvP9D3gExiA==
X-Received: by 2002:a05:600c:310b:b0:427:dac4:d36 with SMTP id
 5b1f17b1804b1-42bb02444aamr59536635e9.7.1725049579917; 
 Fri, 30 Aug 2024 13:26:19 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbef54b23sm18185525e9.44.2024.08.30.13.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 13:26:19 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 22:26:18 +0200
Message-ID: <cover.1725049576.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049580; x=1725654380; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=DL3Y4TBP9eXXv3rgKaBPBP/Jl4D4WMQzujLmimsBV4s=;
 b=BD7w/2M31RtAgF9KQXwJibWBlQBx41gWE06Tw6iKNdWuROQ05LAvEBYu66XHmiZW1C
 sZdF6H+vVHHfxCyADAbqmRvGnOMBsXUOcHUHyVMiX8rFGdefkzlfV70YXnqV/TnINhJK
 a8dd0qP2+/BxJkrxwsEOIAo+Z4LzpeMdowDOf73TWf6Uk+5lpZdT9n1zMP5uWcfnBSk9
 aZiehbl0IpupMK0KiMZt2D4nm+jmgvRswNYB2SageZZlRL84yLajIQQdWKrKYtf9MBkJ
 QYR+bMmv3ULtxZj1fhvsHPZD+ieR2MUkFdpeq5itoWJq+nGoV+GYNjuhwfzQdAYqJZ+1
 hn1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BD7w/2M3
Subject: [Buildroot] [PATCH 0/3] system: extend the list of init systems
 (branch yem/init-choice)
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This little series is a proposal to follow on the discussion with Dario
and Thomas, about Dario's series adding tiny-init:
    https://lore.kernel.org/buildroot/ZtF1pHPZqUkUit8N@landeda/T/#mc1ef6288de44b9d35d382187ae14edf3185aa0c5

Note that, contrary to what was said in that discussion, there is no
need to add a build dependency from Busybox to tini, as tini does not
install itself as /init or /sbin/init, so will not be conflicting with
Busybox.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      system: change label for BR2_INIT_NONE
      system: classify init systems
      system: add tini as init system

 package/tini/Config.in |  1 +
 system/Config.in       | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

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
