Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4311CC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A692860F9E
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A692860F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D52E83A7F;
	Mon,  2 Aug 2021 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXS9MMh0tA6T; Mon,  2 Aug 2021 16:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E8783A83;
	Mon,  2 Aug 2021 16:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD7B1BF34B
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F8283A83
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhzzCIBNw6s9 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 16:22:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60E4D83A7F
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 16:22:55 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hw6so17882873ejc.10
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1bKh8084VJXmzGB3xu+sPIXcvHqVqqBXTpOMtwP670=;
 b=aPogBN8Hf/Z1b594isVOzWcUL2Sp1uZgfRKfWLONAonzRN7PfmXu0pln81d16FN5Vs
 tO5sOzBsW58UZ8v9XuSEkmVcrtcYYLmBYNcDQzB+wjNbp92baUMZnzbkRFgJZtEJ9293
 EztA6uYE+59gQowbiEOgRA8Gf5NnbzFENf3tV0MVJZD7LAQVUy+UZkAXBGaY4sj6mNrQ
 yFm0HJVYT0tnGaEkOyDPiKMnh72IBMMHfKmvjwcC5PFDTfj3lU5Rn0Vlgeyao366ofdK
 lGDUmFL5CSHwxiLdB1BGshaLu8WvfsSBpm/HHxFbVvhT74Af6/o32LsEDYmxLUATQfn/
 +jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1bKh8084VJXmzGB3xu+sPIXcvHqVqqBXTpOMtwP670=;
 b=KB3/FL2Zgo/XNg6Iobu1u+ZZ59H/JsLDFMotRsZfYWlKDQRL2VUIm4Nma8vklnxf+I
 Uss+FJO6nmo5HyxKfN5iIUTUcBOIUZgKxooZjkZY8Qus2FrO0OxLdJuTiR4B/XURaJoH
 a+10jh97xSjfd5hcjcrVZZogIdFtDx8/zksXMPI0uXUqDp5SiOFDXR+e07oOGqrQHgQL
 WRlvSvVelwV5jb7AOKSavrNFVUttILuY/Ck1mEx54e/x2W1GfgA7xAwiztDIN2q/NXAE
 vGV43xf7bAtRqG2ZyYUlWaxeU7dE52WAR9meRvlGYX9PO7XUcf0nz74skIxxamNAi0lj
 F0QA==
X-Gm-Message-State: AOAM533nu6fScGCimer9sfmC5xjsC4TZKE6Y7N9dAfrVpD32HjjduS0H
 yG7cAXAxRqIphTHY+VmkCX91/NUVZprpUEIyHxQ=
X-Google-Smtp-Source: ABdhPJxYG05YziDL404yy1mdWPcrcgixI0k0l50xM4Vy9S2AW3K33wN4znkMTcPq9hQeE65X+y+o2A==
X-Received: by 2002:a17:906:368e:: with SMTP id
 a14mr16727155ejc.60.1627921373474; 
 Mon, 02 Aug 2021 09:22:53 -0700 (PDT)
Received: from localhost.localdomain
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id b25sm6485928edv.9.2021.08.02.09.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:22:53 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 18:22:43 +0200
Message-Id: <20210802162244.620782-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC 1/2] docs/manual/migrating.txt: add section with
 general migrating tips
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is based on Arnout's experience with migrating Buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/migrating.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 92e487c71e..9fd7d7e676 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -8,6 +8,34 @@ Some versions have introduced backward incompatibilities. This section
 explains those incompatibilities, and for each explains what to do to
 complete the migration.
 
+[[migrating-approach]]
+=== General approach
+
+To migrate from an older Buildroot version, take the following steps.
+
+. For all your configurations, do a build in the old Buildroot
+  environment. Save the full +.config+ and
+  +build/packages-file-list.txt+.
+. Review the specific migration notes below and make the required
+  adaptations to external packages and custom build scripts.
+. In the new Buildroot environment, run +make menuconfig+ starting from
+  the existing +.config+.
+. If anything is enabled in the Legacy menu, check its help text,
+  unselect it, and save the configuration.
+. Review the CHANGES file to see if any of your packages and features
+  are affected by the changes.
+. Build in the new Buildroot environment.
+. Fix build issues in external packages (usually due to updated
+  dependencies).
+. Compare the new +packages-file-list.txt+ with the original one, to
+  check if no required files have disappeared.
+. For configuration (and other) files in a custom overlay that overwrite
+  files created by Buildroot, check if there are changes in the
+  Buildroot-generated file that need to be propagated to your custom
+  file.
+. Run +make savedefconfig+ and verify that what is selected really is
+  what you intended to enable.
+
 [[br2-external-converting]]
 === Migrating to 2016.11
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
