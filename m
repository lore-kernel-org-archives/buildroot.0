Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604F8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A5781E67;
	Wed,  2 Nov 2022 17:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A5781E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YohHKdG5y_KP; Wed,  2 Nov 2022 17:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264C581E64;
	Wed,  2 Nov 2022 17:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264C581E64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 805521BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687AA81E64
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687AA81E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcdRDhljEKDH for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 108D081397
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 108D081397
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:31:00 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id o65so15608485iof.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=umdjnIDkdqtbz1x6WnkN9e2hNZbjYbYOlwgavDkAQQg=;
 b=X4wzUu05NgRAFBBUz1Dwy3x2f8TGDDbj6IxPRCrFOTfatHgVOHjUvjzkOcjNP7AUNR
 Mvn20Z4zlLF9pyA/h3wrZVzsRVC9zxpeyPAwlpO/qLQyf/hPfxhvCZcRJyKoUEblYhw5
 TK86F4oranEce4NiyH0gGar3Z6mhfxCjzbqNxal26TqAk+x6E1melB+YIyrknf7D3Zom
 HzyQbIll1gBAvmovVPT6Lg9ncDB2aDaReaWMObVh591DQOrA3naSNFN9bHZv8BAyYBFH
 ugyFhApS6tnNiiGoMjFHKV7bDZER7wMj8efWbz9mQwftvrae/CwmDjpqGMErlv3in1+C
 T2bA==
X-Gm-Message-State: ACrzQf3y5/rd2krqebatBhvwN9oXqTIJnpR2yPIJCqkWilqGdfrJq3td
 igkR+2YYytnYp1xwf+adtP5M5aKG6weOyg==
X-Google-Smtp-Source: AMsMyM6ygneQPgLoKBaqKsUO3ctzIpZUxQeRrgBdFHc8qmNTSCYVR4Iv79gZdm8E0Ce0/2/gyIn+fA==
X-Received: by 2002:a5e:d506:0:b0:6a4:b8b3:a6f0 with SMTP id
 e6-20020a5ed506000000b006a4b8b3a6f0mr16303081iom.138.1667410259771; 
 Wed, 02 Nov 2022 10:30:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r2-20020a92d442000000b0030009bd4f03sm4733703ilm.73.2022.11.02.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:30:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:30:48 -0600
Message-Id: <20221102173048.1202205-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=umdjnIDkdqtbz1x6WnkN9e2hNZbjYbYOlwgavDkAQQg=;
 b=iZPbgqS00jXRcyYhVBDdRPPyZCMmvr2BoBmAJV6si1H+9wvyp3P++be1O+OFyGuQld
 TXJlbObZXERLzYFGhEO0rHAgJ/c4ijT9m8tQl5J93diVBZ+Zg6CiGxeh2U4EXXDO0u+o
 YW5RYEEaEF1mrgP+w9sLnWBld99Miflu0AD9xAQGo2vG7C7s+ePwU9K3J9nrYz2/vi3+
 EWB7EgHI4na+g5iwu2gvK9UqpzSLkMRonJhEjYOhENk3F4LvSFaUJYuGTrJ2coAke8qU
 1yysGkcyC1WKPxCY90gcizvl/0yrPJHZpQ2T3ZUXx3Kxt2oZssMnJsSyrgIzc4vyhv/+
 qwDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iZPbgqS0
Subject: [Buildroot] [PATCH 1/1] package/ninja: bump to version
 1.11.1.g95dee.kitware.jobserver-1
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index ecde199844..57c10bb287 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  549c31ee596566b952c600e23eb9b8d39a4112cd5fdeb2e5a83370669176da40  ninja-1.10.2.g51db2.kitware.jobserver-1.tar.gz
+sha256  7ba84551f5b315b4270dc7c51adef5dff83a2154a3665a6c9744245c122dd0db  ninja-1.11.1.g95dee.kitware.jobserver-1.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index bc84046414..b7bc1a4f1c 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NINJA_VERSION_MAJOR = 1.10.2
-NINJA_VERSION = $(NINJA_VERSION_MAJOR).g51db2.kitware.jobserver-1
+NINJA_VERSION_MAJOR = 1.11.1
+NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
 NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
