Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF96C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 23:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F07F60C07;
	Wed, 19 Oct 2022 23:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F07F60C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTCDT-RFl4A6; Wed, 19 Oct 2022 23:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9FC60B46;
	Wed, 19 Oct 2022 23:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9FC60B46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8E181BF419
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82A5541977
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A5541977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7s5ldu45frjx for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 23:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B75B34195B
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B75B34195B
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 23:34:27 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id b25so11800504qkk.7
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPWOXzqDEhdf35lltmgtELcsvkkPf1zhJ+GLE2h1wyg=;
 b=VPm6KO+mNNt0SekCnYuijbcOTloQjKs5YNBxQ1QQGb6tSvBLXnUxGzmQ1RgFwSMkKk
 CIqMtLDy8fbfkPOWrfzmFFo9ezzYsceMVoNbIuXg2MPDxPrgP6pFWMrotI1IWqsPz5Lf
 fBxiZe/0M7YWZRmrxEL1Thf3LYEtpV1aXZNvEBhLOIl7pqwUlsk2sV2ZQ1Z0y8uFh+7N
 3Bc5wRZ6XrMHBbN4XW4serf238bVPrQj5ae5l6LGOIEadyWQvjThGgIU/Vx2C2DOMOz+
 Ue+ugz9UO01gGptVrwcCj9bl7YHYzvv+xPX+Ad143VE9t2eauqRku9fXumC6wqpvCtFl
 eB5g==
X-Gm-Message-State: ACrzQf0ZqMAvK+IwlCDkjSTpcke4Zp1QGq2A239ISzqU/q8eaMnB5O5g
 rYz7ODNkCvD9oKaIkrzjGCf4geKCFWvV3R9P
X-Google-Smtp-Source: AMsMyM64gEqqx89vwM6GxG5a95OJZx83RchVZCYqv3Ia6Iwjbx695cHsqyx6gGhOoMHImvE5AAASIQ==
X-Received: by 2002:a37:bc01:0:b0:6ed:b53b:21c1 with SMTP id
 m1-20020a37bc01000000b006edb53b21c1mr7222071qkf.576.1666222466316; 
 Wed, 19 Oct 2022 16:34:26 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006ce2c3c48ebsm5986687qkp.77.2022.10.19.16.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 16:34:25 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 975844AA32CA; Wed, 19 Oct 2022 16:34:23 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Wed, 19 Oct 2022 16:34:14 -0700
Message-Id: <20221019233414.868133-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gPWOXzqDEhdf35lltmgtELcsvkkPf1zhJ+GLE2h1wyg=;
 b=h/VUbkMzexR0zWc1uCpg8iOyGCO2qEtKV/R4J58zM40BI1GJX1m53W5q/I92kqf81/
 noZKTLnQrcnmIm8JFf57u1aOfijrzofUNTkxKT2Hyse6n+ZvoIlKJMlkIoD+MXYd01dQ
 2Jeyd6X3SsZPCU8874BDn1ypV9LpgZGMKOZEM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=h/VUbkMz
Subject: [Buildroot] [PATCH] package/rsync: force HAVE_C99_VSNPRINTF to "yes"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We know the system will have a modern-enough C library that implements
the required snprintf() functionality. Since the configure stage can't
detect the system's capabilities (because it is cross-compiling), let's
hard-code the decision.

As a result, rsync won't be linking in its own copy of snprintf().

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/rsync/rsync.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e288033b9819..0d311aa1673c 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -11,6 +11,9 @@ RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
 RSYNC_SELINUX_MODULES = rsync
 RSYNC_DEPENDENCIES = zlib popt
+# We know that our C library is modern enough for C99 vsnprintf(). Since
+# configure can't detect this, we tell configure that vsnprintf() is safe.
+RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
