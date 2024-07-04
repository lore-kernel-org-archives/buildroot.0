Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA83C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4988607FC;
	Thu,  4 Jul 2024 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DHhqNBW-i_1; Thu,  4 Jul 2024 18:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F28CF6085C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F28CF6085C;
	Thu,  4 Jul 2024 18:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22AB01BF2FC
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BD70409C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypeX1HCm7-_O for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 18:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC052408EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC052408EE
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC052408EE
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 18:56:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so103024066b.2
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 11:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720119405; x=1720724205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jyQOK+VyOwAqyGiLJaAiO2o+kx9/WLbshHVRrUEvkC4=;
 b=XQNIsJMW3sX25Ki1EWVfMRkDiCG1I5j2FRw9KjM0m3dxp9FQGUUPX4KAWGAynl6o6B
 4vspf5XPLh3dMCma8lPRHwvdH0ArwMag0osCZohMWjuwgX5bxQaehObVrzkjKoB/axhW
 NDWF1bTJKrsWsooVjIMAZIIPhh0CCHxpwJxv+7iLftFtw8R0U3137St4HX1bOwyaj/A7
 aqUeRQbo26QQDhkk3ZmM2jmvfT0fXk7yEx+mcOX1K7P85ppbiJAGXhms1RnCws+J03A8
 a7tK5fXTVk0xZS7exw/gTboYddzj2fLBZ2QM8IK+FjjB3ns10dRo9r4OA2BskozTvFDu
 xgkA==
X-Gm-Message-State: AOJu0Yy/thhWiRwdBf8bfN1jsTbkwLJDtf1csbWfyHctHCQ5qIJmkQ53
 zzNoMr6YSajAEf5bL9w5ZJ3Q7r9hmwtWEPD2zmWhvWrCrLSsdfceQQlAJ6yDe+78nAozUbykofP
 o+PA=
X-Google-Smtp-Source: AGHT+IF1bJVqCw5cMkVwCb1KUkGHfA0VwlzOZ/7szCAk8JahzNNvkOSEb0SSsgmxg8OXX7D4UEFwYQ==
X-Received: by 2002:a17:906:8d7:b0:a77:af6a:8248 with SMTP id
 a640c23a62f3a-a77ba72d432mr157903566b.72.1720119404567; 
 Thu, 04 Jul 2024 11:56:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf6295csm616393566b.72.2024.07.04.11.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 11:56:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 20:56:41 +0200
Message-ID: <20240704185641.2974800-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720119405; x=1720724205;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jyQOK+VyOwAqyGiLJaAiO2o+kx9/WLbshHVRrUEvkC4=;
 b=PRjmTm5TQdEI8i0VQP1CYv1M0APoJRcEfTgumR18pyH6nsIJmSMlI8CD41z/cNcltq
 quPkm/tqa6E3tV0plfmDYkmF9jHZ33Vx0KID2GBGJX0nmbri3XY73lmZQ201G8ct6+8a
 YYlxfFWQ9sOLNmF2E+IR0Ya699052mBt9yMxE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PRjmTm5T
Subject: [Buildroot] [PATCH 1/1] package/paxtest: update the patches to be
 applied with fuzz 0
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, paxtest fails to build with output:

    Applying 0001-genpaxtest-move-log-location.patch using patch:
    patching file genpaxtest
    Hunk #1 FAILED at 35.
    1 out of 1 hunk FAILED -- saving rejects to file genpaxtest.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/paxtest/0001-genpaxtest-move-log-location.patch | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/paxtest/0001-genpaxtest-move-log-location.patch b/package/paxtest/0001-genpaxtest-move-log-location.patch
index 6447d53c96cc..fa18815d6da0 100644
--- a/package/paxtest/0001-genpaxtest-move-log-location.patch
+++ b/package/paxtest/0001-genpaxtest-move-log-location.patch
@@ -7,6 +7,8 @@ Move log location to /var/log instead of local directory.
 (For read-only filesystems)
 
 Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  genpaxtest | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
@@ -16,15 +18,14 @@ index 5a22e15..d62b15e 100644
 --- a/genpaxtest
 +++ b/genpaxtest
 @@ -35,7 +35,7 @@
-        exit 1
+ 	exit 1
  fi
-
+ 
 -LOG=\$HOME/paxtest.log
 +LOG=/var/log/paxtest.log
  [ -n "\$1" ] && LOG=\$1
  touch "\$LOG"
  if [ ! -e "\$LOG" ]; then
- 
 -- 
 1.9.1
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
