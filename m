Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8F5C00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8245F410D3;
	Thu,  4 Aug 2022 05:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8245F410D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APXX7YccolIf; Thu,  4 Aug 2022 05:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F19B40186;
	Thu,  4 Aug 2022 05:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F19B40186
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31A471BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BF460BB2
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19BF460BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tje5BveT4iVP for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:40:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B5060BAC
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49B5060BAC
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:40:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so4431488pjk.1
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/gL7JFZZc1CyFpYSbKms3Gvsv+NjpzsVblqP/PaVfc=;
 b=XjarPD6mjz6Wn9ITqJxHq/og7sAlVre58hvi7CQ21FUKUDHBy5CGqdkXGoLdSSyZPm
 rxBQ9HabVrdBwZjpYJgoaJk6gJxnjEIoxpkPi5K88ZLFksKKXUSQi74gfUwtbPcB1Tb6
 s6Sd6DE+xr+JRqPUh5BuKl7n+xAhZR05OKs233qFzgFGLadL6ZMck9Qzvv/Tdvach4UW
 6O2lZDPqnwstV4xJjqKg8UkKx66Al7Df5TPBYKQPrtaj9QVqxsi63ZAN6jzVTO0boLtW
 HepypblDB1KoxPygZJ86RShzC5xtl5nNgGNqU0ZoBp4uYD5nYlETFtG39K/BlNIxxKTY
 XJtQ==
X-Gm-Message-State: ACgBeo3Ety7/c+F9ylsnyCOL4MSEEPcqjUfKZT8ID8bb91LLQiH9xR0D
 ZG/Xrx+B84zeiSb6TjVw6cbv489OOED+kA==
X-Google-Smtp-Source: AA6agR5gsmmREbB8ICJGsykdtkjGny7cE/EF+qLpHJnERo4zUHQ4QAX68S6hhU5IFgYyr3fBIl2yUg==
X-Received: by 2002:a17:902:8644:b0:16b:ea77:a6cb with SMTP id
 y4-20020a170902864400b0016bea77a6cbmr293819plt.59.1659591641135; 
 Wed, 03 Aug 2022 22:40:41 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j4-20020a655584000000b003db7de758besm236576pgs.5.2022.08.03.22.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 22:40:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 22:40:37 -0700
Message-Id: <20220804054037.3040748-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.1.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the third release of the 1.1.z series of runc, and contains various
minor improvements and bugfixes.

https://github.com/opencontainers/runc/releases/tag/v1.1.3

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index f8133d13c1..d94a0c20ca 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc7640f6  runc-1.1.2.tar.gz
+sha256  fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533a63  runc-1.1.3.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index b87d07acca..aef52de618 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.2
+RUNC_VERSION = 1.1.3
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
