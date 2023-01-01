Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051BC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0FF4060C;
	Sun,  1 Jan 2023 23:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE0FF4060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcQGKD9TDcp9; Sun,  1 Jan 2023 23:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01AA4405FC;
	Sun,  1 Jan 2023 23:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01AA4405FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4481BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06097402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06097402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfG5j7BoDFDl for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1154018F
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F1154018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:36 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j130so18187686oif.4
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVXnmAB1sV3EC1Tl2lJXldmg91k75Tco0xycVHQpIOM=;
 b=KjTB1UeJZYNx2xbyVSUgFJcBS8yK8lj1wGx27zRSyzgUtSzVJ1Jxa0TLMPRCMtDoN/
 O+6giuxc9pc0jg1rM8GIluped3SYesGQIFBEghEMbuZF1KsBm7Ocozu343bnglSHuB3X
 Ki46k7M/FKMMzFVFk/kG1TW7vzkDeRr7klGWxaWVQF+E51A82lOFZlKlKivMaWjqwV3B
 Hc4yQTm3f/OFs6ufzG7OzkW607lhlt0Txp64oOJasASGYvKdQFGqamiqyUhqOfWtj5ua
 LUFESp2GsaBwrx642CQ5jp1KjIsJjkCId1EJsUtHJDfqf7GMVScBPWcHQZ4qGjsI7LMI
 /Lcw==
X-Gm-Message-State: AFqh2kqaxR4f81bBv4V8ljrgzImi1+hbse3c0RxUrdlyFQ+yUrylL+Na
 reyRluEM5kLAHG4FDq/ZBrVmaUnf14g=
X-Google-Smtp-Source: AMrXdXs4imyjnEK0PnYMj/q7u2TVBKmAEopnITlQ9Z3fhauAdLJ+V9594EK7gbKUElRdPEdDO51I4Q==
X-Received: by 2002:a05:6808:2384:b0:355:1de8:de31 with SMTP id
 bp4-20020a056808238400b003551de8de31mr24573601oib.10.1672616375998; 
 Sun, 01 Jan 2023 15:39:35 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:34 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:37 -0300
Message-Id: <20230101233653.487175-14-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVXnmAB1sV3EC1Tl2lJXldmg91k75Tco0xycVHQpIOM=;
 b=G23KtrIOpq4ePC7/u3ijx5K8rOHJOOWDNTjJYmQdsRT6qMpNWLqgWkBd1YuT1KBFny
 HYSPx7jhM/btKUnkkrdc+v1zaLRf6m/eS5ywUTf/wFvdG1FbVvAgHnHTDtB5dcQ/YKvm
 d3rjw/muNGAKKTbMi+vBTPzTrrS6D8Z/NyJhM0XrrOVF81Zk0oPbZs2K4sGGenF9dQVE
 Ri6agmXA9Jq3711K9SuWqAveQL4OI8XAjelZFSIzqORtvaMQSNyRzGmJW3LJRyh/J87v
 P7QzAyinibKMRWvRwcFuv0vBMeEzgQE6+IY464gnuFdyjqtYcyd1hqt8KB0YoFumTrTx
 /kJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G23KtrIO
Subject: [Buildroot] [PATCH 13/29] package/checkpolicy: drop bogus
 CHECKPOLICY_STAGING_CMDS
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "b06110621d checkpolicy: allow compiling for target" contains a
typo that prevents installing to staging. It also forgot to enable
CHECKPOLICY_INSTALL_STAGING.

But the package does not install headers or libraries, only ELF and
manual files.
So instead of fixing the install to staging, drop the bogus
CHECKPOLICY_STAGING_CMDS.

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
My first try was to fix the install do staging:
+CHECKPOLICY_INSTALL_STAGING = YES
-define CHECKPOLICY_STAGING_CMDS
+define CHECKPOLICY_INSTALL_STAGING_CMDS

But then I notice that the package does not install headers or
libraries, looking at output/build/packages-file-list-staging:
+checkpolicy,./usr/bin/checkmodule
+checkpolicy,./usr/bin/checkpolicy
+checkpolicy,./usr/share/man/man8/checkmodule.8
+checkpolicy,./usr/share/man/man8/checkpolicy.8
+checkpolicy,./usr/share/man/ru/man8/checkmodule.8
+checkpolicy,./usr/share/man/ru/man8/checkpolicy.8
---
 package/checkpolicy/checkpolicy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index af9a58cee8..baf16fb802 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -20,11 +20,6 @@ define CHECKPOLICY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
 endef
 
-define CHECKPOLICY_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-
-endef
-
 define CHECKPOLICY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
