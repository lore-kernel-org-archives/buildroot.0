Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4C9D408AF;
	Sat, 15 Oct 2022 21:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C9D408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyJq-nbiVBOs; Sat, 15 Oct 2022 21:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74BE404D1;
	Sat, 15 Oct 2022 21:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74BE404D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A87EF1BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9129560B77
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9129560B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cJMNlinCeOt for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:09:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD9360AEB
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BD9360AEB
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:09:43 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d142so6445913iof.7
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3hbWTQsHtQbIJ4rfiMtsu+ldZhKFt2U8s6qam1nyJQ=;
 b=PAyhoTc8y1OZ2ha3wuxBSW68sjirJczaZO5FiLiD4KCA1xd0TLeRfswC8N8AMbggj4
 TmsaolZVNLScqeZFwFOuKMuJXhpvDU0doITkebOcUvIVm3pHeI4iRuQdC+mgZCVVy1Gx
 3bT+sovSAjb/Msd67k7oEX+lvJn6xNT/C6XQc3e04DL9Eon3l0zzbIKqAE0PqKtRPEbq
 52pI76Ktz4/zrpGbSeqyHGpqb5Cic0W199uDQtrvIzwgKidSeD4ub3ig719cJIK/ZrS3
 C04VjJ/NLKN7Pa2khQs/8XvALdSefiAyAWTIEpTBiJq+Mp3ACsaE+wJbC1VezejqPSyE
 7C3A==
X-Gm-Message-State: ACrzQf0muaebGcp/MOb9VHVVrVjXiM0vyP1P2Uj1JCJTbWwAaIsIIEie
 Wn3XUyZIYZjKfxt7NWGkjbp7AN005QfXoQ==
X-Google-Smtp-Source: AMsMyM7ZsuDE3h/FAnFe7PbDRrzZtanXpXLFgcP7e4z/msP8qMkDwnNGk0V8A6Fp26iXpeam20ogAw==
X-Received: by 2002:a05:6638:470d:b0:363:b953:3f18 with SMTP id
 cs13-20020a056638470d00b00363b9533f18mr2144077jab.116.1665868182009; 
 Sat, 15 Oct 2022 14:09:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v19-20020a02cbb3000000b0035a10a7e3ecsm2564551jap.74.2022.10.15.14.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:09:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 15:09:40 -0600
Message-Id: <20221015210940.4002212-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v3hbWTQsHtQbIJ4rfiMtsu+ldZhKFt2U8s6qam1nyJQ=;
 b=fDX6lHrWvdGCBJLGW2YjQDUPuQnmpm2SnQZI63AVxScJVEw3dzyJ5npGxUDHs8n+mo
 dmXRfunibs08WB0mzC8e2FFCzrOvyBmFIK0n/dYk3YYFOTljOQSaVJcu4649XlHkJ+Px
 IdeTPad4phUuen3a/YSclR9k5HJGEiluHMOGpSGdOdedLn0ypEjzYZrRUZioBw9poGjW
 YHEQdT/cnGiPLyjbIsHVcULnkuTZr+j9PC1q6Kle8sBt39w/I3PvdMhc4MhshEzzu0vQ
 TAMzmjq3DAMNICvMTdcteV6QGO/uj9aGNzkVQzga2kjWRkPiwWw/uAZCrdIcw7jFE3Za
 AYUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fDX6lHrW
Subject: [Buildroot] [PATCH v2 1/1] package/brltty: fix infinite loop in
 configure
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch to fix an infinite loop bug in configure.

Fixes:
 - http://autobuild.buildroot.net/results/82a/82af705f7ca282495461cb3994f5a7e6f64273e1
 - http://autobuild.buildroot.net/results/06c/06c9414a1ecbc1a147bc8dfddced03fc659af694
 - http://autobuild.buildroot.net/results/59e/59e36093f7e437a5a37037f7fa50ce2443c47fd3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - backport patch instead of revert
---
 ...unProgramTerminationCommands-used-a-.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch

diff --git a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
new file mode 100644
index 0000000000..0f81254e08
--- /dev/null
+++ b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
@@ -0,0 +1,29 @@
+From 4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f Mon Sep 17 00:00:00 2001
+From: Dave Mielke <Dave@Mielke.cc>
+Date: Sat, 15 Oct 2022 15:20:38 -0400
+Subject: [PATCH] shell prologue: runProgramTerminationCommands used a bash
+ command. (dm)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f]
+---
+ brltty-prologue.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/brltty-prologue.sh b/brltty-prologue.sh
+index 05b817742..6d1faf983 100644
+--- a/brltty-prologue.sh
++++ b/brltty-prologue.sh
+@@ -102,7 +102,7 @@ runProgramTerminationCommands() {
+    while [ "${programTerminationCommandCount}" -gt 0 ]
+    do
+       set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
+-      let "programTerminationCommandCount -= 1"
++      programTerminationCommandCount=$((programTerminationCommandCount - 1))
+ 
+       local process="${1}"
+       local directory="${2}"
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
