Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED22ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B470C81A58;
	Sun, 11 Sep 2022 21:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B470C81A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLKWbgke5aC8; Sun, 11 Sep 2022 21:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D5F817BA;
	Sun, 11 Sep 2022 21:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D5F817BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D56B01BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD38A60674
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD38A60674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j3ns3T37Snx for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:05:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774A4605A9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774A4605A9
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:05:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id l8so485430wmi.2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=9AIbShpNMhtXN9QgXveR7UTB0qlqtuWAvfDv1pj/0m8=;
 b=HptMDydlgmpdHC5BsUnADnQ0fJusOh5ryNfChnOAEtXkY+ZND3R7jHYnbrKXbY7T1z
 dMNANjD2JKesU4uUmD32LSXr5ahndCmigJeHtNGZSW+0fksJjonLJF776Vyi6UGMAmXH
 U5mltyDBJUVjpa37oyQx1AGWatwIKbucPzYKVk2IHgoEtbxVvl/+j0G7SVyV3DfoQ7Zl
 G+2aNKp0idQMjj+Ej0wTou+ftM7OXxE08Hd4ZrGbsgv6eGzmtd+1K4Ndli2xYsn0WWKX
 p9v0VHV3epIC6WqJs8ng8ziuTUuQOTIOCH+AhUTIfOPaDCSNLNItvVuYL6NiJcuRqqeQ
 OMzA==
X-Gm-Message-State: ACgBeo3TJVdveqJfVt+xOqSelzntkmCl3n0JGL+ZVZdSDJYmOJ0RsW5s
 8kZUb5SvfG3D2e53QGtNm0KWYsJqdiY=
X-Google-Smtp-Source: AA6agR6ZUjdhyuCIjJyND2tanAY3yMCa0+1g2TmvyejYojqxAge/dwEirCa0VknPhnKPJulo62XbOw==
X-Received: by 2002:a05:600c:3d05:b0:3a5:dd21:e201 with SMTP id
 bh5-20020a05600c3d0500b003a5dd21e201mr11856790wmb.132.1662930309342; 
 Sun, 11 Sep 2022 14:05:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6786000000b00228cbac7a25sm5674696wru.64.2022.09.11.14.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:05:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:04:59 +0200
Message-Id: <20220911210459.122463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=9AIbShpNMhtXN9QgXveR7UTB0qlqtuWAvfDv1pj/0m8=;
 b=IChs4ADupys1iQN1Rb0qTbszSGbNIG7ICK4+PqGM4Me+JG74lE+75Zrx9mJqp14ukw
 u88xJ64ewW2WOn8eTO7R29mm0SDb6ZnRv/V5tf7bDDqMbLfI9veJoZAB6kS3LsCEZyYa
 BsF0r2pO5w1dpvWSmn9AFnU0/4vNGb6zpBx5ri3jHOTJzdErhStM5Vzaa2SDDmGKEaf1
 rNrnRa4qOfiIS3GQCm75zOArP5k0wYqSk5oC/xiq31ihkNqUQ3KDylBmSRDnOF94Db8l
 LVPvmAaEgWCTyh8b5+CiUcIjKYfZcj4xQgpKWp6oMvZX3ETGxqDJQGwFOsM86plp3pUS
 IxBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IChs4ADu
Subject: [Buildroot] [PATCH 1/1] package/libnice: bump to version 0.1.19
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/libnice/libnice/-/blob/0.1.19/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnice/libnice.hash | 2 +-
 package/libnice/libnice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 55785cd5ff..83b28a9ad9 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-sha256  5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4  libnice-0.1.18.tar.gz
+sha256  6747af710998cf708a2e8ceef51cccd181373d94201dd4b8d40797a070ed47cc  libnice-0.1.19.tar.gz
 
 # Hash for license files:
 sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 5889b24ba2..2b223bedd3 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.18
+LIBNICE_VERSION = 0.1.19
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
