Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15785C47089
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4D274016B;
	Sun, 27 Nov 2022 13:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D274016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RIFtl2LFVG4F; Sun, 27 Nov 2022 13:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC34840223;
	Sun, 27 Nov 2022 13:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC34840223
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4781BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165AB40890
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 165AB40890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QV5INP7XxKvn for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29FC94087E
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29FC94087E
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:35 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so5361787otl.7
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RsaJkD9zF+ft/7LfN43iIO2QTUVxbhJdTXJA+3gnVXE=;
 b=aqDpgzyV8QesqvzdzFteENxAA+cNwI+C/LsPih1OEHDuu1yUbzmZspP+FBj80o1Bbv
 YWhnwzIY9UQ38Nxp6wc0Hw9PjXCOzl2g2E/eCYwOPqbXFsHpTrD/cGBaQPQrf8w0hcJu
 3S/q1zprgyCUvbxn/Lf93B2opnZN61oOd1WEoIdgGQXookkvnMdW6w20m6pDQGrvGdZB
 pld3LdVS/Ua9nvPDLzH+F/XXgrWVZCT5ZPwIVAFf4vVsNZhviaN6EmunXRL8SNzF4QpC
 EMW2yoDcevu17wKiCHmJlkC3+lT9vJgox+SutdDYxB4KJ6p4QDdW4LGE9DH2VuO26GDH
 9TSw==
X-Gm-Message-State: ANoB5pnt9lqpmAx1tjcNd02iSZzAFFixB5omda1siCuW+nHJrJJy+Lt1
 5EKoPOHMcBo5BhuLbLwDnZvb6mXhm74=
X-Google-Smtp-Source: AA0mqf68UNLQ2/IR5vrCNMgLq2C5qgPp57Q9C+27lIdf8p33ao7qJNBglJ/EECfq6q5vGJBf6DMMwQ==
X-Received: by 2002:a9d:75c8:0:b0:66c:607e:4afa with SMTP id
 c8-20020a9d75c8000000b0066c607e4afamr14491804otl.50.1669554514246; 
 Sun, 27 Nov 2022 05:08:34 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:33 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:27 -0300
Message-Id: <20221127130739.1862398-14-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsaJkD9zF+ft/7LfN43iIO2QTUVxbhJdTXJA+3gnVXE=;
 b=jCzFi1pqiQAgfjLSGqg5QK0LT5F0YeywN0Nf9EtoTA51xSpnF2p1vuH2hbuFni0WeK
 acXGJ7eaW43FQIHeCcsvkIqFOFUWvmvAXh5MN8Vgr0q7MQM+Prmjimq6h402eX/2hUiV
 8umLCQ4u0k/CM6sb8p1dAxCtvAgaEO8jFH7GRspRt3fMGlu+tFVcH+VL2+Nq2hADgV/t
 GiK1P4bMJ5B74/ZQI+pieIwqz5dDDN05NvQmqzh4B8QDDqUEPpDPJmMvMb9ixdaZFOYD
 bU6ALAC7DRhFxY25ZPAZDLgtvU9bdov6tFB9eUE22khOrGo1ualOeH+rWWOSkbU8vYOY
 PpXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jCzFi1pq
Subject: [Buildroot] [next 13/25] toolchain/toolchain-buildroot: add comment
 about using virtual package infra
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "9a8ec9195c toolchain/toolchain-buildroot: migrate to virtual
package infrastructure" made the packages toolchain and
toolchain-buildroot to use the virtual package infra even they being
generic packages.
This works because on package/pkg-virtual.mk when a package do not
define neither _PROVIDES_ or _HAS_ symbols, only _IS_VIRTUAL is set to
YES and _VERSION and _SOURCE are set to empty before relaying the call
to inner-generic-package.

Add a comment explaining why the virtual package infra is used in these
cases.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 3 +++
 toolchain/toolchain/toolchain.mk                     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..6da64b7c77 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -14,4 +14,7 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# Not really a virtual package, but we use the virtual package infra here so
+# both the build log and build directory look nicer (toolchain-buildroot-virtual
+# instead of toolchain-buildroot-undefined)
 $(eval $(virtual-package))
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 18f1dbea1a..ac60a7b248 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -47,4 +47,7 @@ endef
 TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 endif
 
+# Not really a virtual package, but we use the virtual package infra here so
+# both the build log and build directory look nicer (toolchain-virtual instead
+# of toolchain-undefined)
 $(eval $(virtual-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
