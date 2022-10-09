Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFC2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 15:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D1B408D5;
	Sun,  9 Oct 2022 15:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D1B408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_4TAZCgx54w; Sun,  9 Oct 2022 15:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 775C4408B6;
	Sun,  9 Oct 2022 15:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 775C4408B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5621BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 956FC60615
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956FC60615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAWD_xNaTYAV for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56EE3605EC
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56EE3605EC
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:46 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s10so10844902ljp.5
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m+DPmkfcjsvwpQqaxtgxPwWcikKTUktOFrun3DQ4iR4=;
 b=v9mjSYx+kplqHz82W04MhjtvwIrHXNORETEilw+tuk3fSa4TD76fYq6oXjFgQVWxUE
 qFaBG6WFNCFlY50sE55X2RZFuZ88E3lUYXVGJR9jBPn5dHXpQFmXxMg3RYCARYPqD058
 WYXX3NLSXnnN+k2CRwibUclr1bA0ZnZTTqwUWz1jGdxthm+22USmUGei4fpbjVyk75ZJ
 A05LSJZWdaBdGonFW5I+AdvUyJnthc2mMUGK++u5mvEpWCv29bJFkJVDAjkxVVqQDAmc
 2vc689iJwvpCOUw4EXn3m3W7IL+FRTZJZq2dmD5Gp2oyX2yE1UiYq8HhY1QdS+VX+GO9
 /vOQ==
X-Gm-Message-State: ACrzQf3jyw8a4KNj4eIEBuTLPc46Z4KoYyJCfSORPbCFs3tDApaoseEO
 wS+tCmIIq9AOun4cxLM2UspVvcInc6I=
X-Google-Smtp-Source: AMsMyM7zvsqUvhZkOrl2NssQx06SxyQkNjkw8xcm3R0jrLsZgUY4z1feWOf/1BnbIUiVQGgoFsJTRg==
X-Received: by 2002:a2e:9d05:0:b0:26d:cef7:bced with SMTP id
 t5-20020a2e9d05000000b0026dcef7bcedmr5478783lji.41.1665331183127; 
 Sun, 09 Oct 2022 08:59:43 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:42 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:28 +0200
Message-Id: <20221009155938.2041695-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m+DPmkfcjsvwpQqaxtgxPwWcikKTUktOFrun3DQ4iR4=;
 b=WbQwxzjQy8oh3WoMztKHwPc6F8SaqVUVnDaEPjGlhXZdatnKb6rnKHde+qUKm+3hiE
 xiZ9XVvtcwKfRzRn8WhkyNq02R1zS/YxbjCl0M1IdSK66UzNy+xpC3TKy8CVAd61xyOY
 9/QxC3Uro+kelGIsQAqjWtJo2su0fxphZGG5ifC5Rop5Ys2AbI1u0ajEtvn1kFGyFlAc
 Zl6SB6CLVvV91/RPluqAVMy9c/MnzV57NFnzsZxN1rdDY3SRkglbvvKbkSsH8asiQrgc
 se3i0rgBECJP7c/qO1EwUJd+C/NLGif2XT+kR1UjsRvpJ6s33+JIyHDvcPI5aq1/Hy8t
 w89A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WbQwxzjQ
Subject: [Buildroot] [PATCH 0/9] bump skarnet software: s6, execline, mdevd,
 etc.
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series bumps the version of several of Laurent Bercot's
packages.  The idea was to upgrade mdevd, which depends on skalibs,
but it in turn is a dependency for the other packages upgraded here.

Please note, I've only tested mdevd, the orther packages have only been
test built using test-pkg.  The following skarnet.config was used:

    BR2_PACKAGE_SKALIBS=y
    BR2_PACKAGE_EXECLINE=y
    BR2_PACKAGE_S6_DNS=y
    BR2_PACKAGE_S6_LINUX_UTILS=y
    BR2_PACKAGE_S6_PORTABLE_UTILS=y
    BR2_PACKAGE_S6=y
    BR2_PACKAGE_S6_RC=y
    BR2_PACKAGE_S6_NETWORKING=y
    BR2_PACKAGE_MDEVD=y

$ ./utils/test-pkg -c skarnet.config -p mdevd
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed


Best regards
 /Joachim

Joachim Wiberg (9):
  package/skalibs: bump to v2.12.0.1
  package/mdevd: bump to v0.1.6.0
  package/execline: bump to v2.9.0.1
  package/s6: bump to v2.11.1.2
  package/s6-linux-utils: bump to v2.6.0.0
  package/s6-portable-utils: bump to v2.2.5.0
  package/s6-dns: bump to v2.3.5.4
  package/s6-networking: bump to v2.5.1.1
  package/s6-rc: bump to v0.5.3.2

 package/execline/execline.hash                   | 4 ++--
 package/execline/execline.mk                     | 2 +-
 package/mdevd/mdevd.hash                         | 4 ++--
 package/mdevd/mdevd.mk                           | 2 +-
 package/s6-dns/s6-dns.hash                       | 4 ++--
 package/s6-dns/s6-dns.mk                         | 2 +-
 package/s6-linux-utils/s6-linux-utils.hash       | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk         | 2 +-
 package/s6-networking/s6-networking.hash         | 4 ++--
 package/s6-networking/s6-networking.mk           | 2 +-
 package/s6-portable-utils/s6-portable-utils.hash | 4 ++--
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 package/s6-rc/s6-rc.hash                         | 4 ++--
 package/s6-rc/s6-rc.mk                           | 2 +-
 package/s6/s6.hash                               | 4 ++--
 package/s6/s6.mk                                 | 2 +-
 package/skalibs/skalibs.hash                     | 4 ++--
 package/skalibs/skalibs.mk                       | 2 +-
 18 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
