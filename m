Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92092C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF2660E3F;
	Sun, 18 May 2025 21:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItpK0JDqW7fz; Sun, 18 May 2025 21:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D2860B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D2860B91;
	Sun, 18 May 2025 21:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C115193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA6160B91
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPavQB-9qzSb for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E5A460B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5A460B7D
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E5A460B7D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:13:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-742c2ed0fe1so1035279b3a.1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747602789; x=1748207589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQ9C3YKj45QALmqOnmCDeACR64fSYmMfCc9m2843Lq8=;
 b=SZCCzkxKRM3eN2V5A5abrhcPoudjSB1FeWz32garPW58lWKTIJzp+0jpgD6KxhC41B
 5pCJJZAEGxpMKACDMwH1VW/1kiwYSguhB2W1P1vAh1kbFoNdWeNs/NczdeKY2/abd/uH
 Kb9cd97WI4KuEi0veTLWd6undndxWrTZx1aRQtqTlxL3dlv1d3stFSFKHieWQB/4j1AQ
 X2VeJ15WBGSmrJgbBZZvEk9kQSzDLl9a/g4PeXAsXQMra2/pHA7ezMwqSNZqu2XHQlXe
 kiUmHMfRwIkaC56Mc0nBPoOz2gEs7Pvdt6EchEerSiN5UTIxv5iPceljy6e7xlcihSyz
 cWYg==
X-Gm-Message-State: AOJu0YwYNnUMgbOdRb8Vpmz/h+m0533as+Hpk9DUL0Br1CIjjrEM5Ca2
 OVtHKHmv/FmdMOvrG+kM6jopTK9uSH3be2r7A4LZv2SqGeD8eVQogAHqqZ4C4+lx
X-Gm-Gg: ASbGncsHkwY344klAc5o6c+kITvSh/FH3L56qYEpKCPSwp/1svDfkGli5lVBOumhuET
 uSWQ5gZy+uTtazdpxXkfcKOnyoh33/RjmYapkebS6moDgkxJdwqkFADoJLGwJIDxYEwzc9rSjdU
 F8wMEd26B/H71a0f1iXoz4KM8ixMxZkPjnN0UI09JMb9BrAXEe+4t2hVHIrDXiYNuqbW1cgpzB8
 8+YmW3XHcIGotKS6tKvJbWFLLnxxI0900yjqsB+SFyhS5yCoob6mYxf60s4uBMJEeZSvJunK5kI
 jy1SO68L3pYTiYE1DSWh5Pz4HNRzQeaZCegTQvCggNeT1oQa11v4PT9ltfcgblofJOuQCEjVs6M
 ci2Bs1/zTF/TCnaJEKAfhOknRoYjMF/5+5aGpdg==
X-Google-Smtp-Source: AGHT+IHwdcOTZ4N3u2o8YRUhkn802u09NYagx4A0nyRh3iEGoOquSoSHNnfcKrPJp8GTGwbSW4AOVA==
X-Received: by 2002:a05:6a00:18a2:b0:736:4644:86ee with SMTP id
 d2e1a72fcca58-742a97f49eemr16074807b3a.14.1747602788785; 
 Sun, 18 May 2025 14:13:08 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970baefsm5056270b3a.50.2025.05.18.14.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 14:13:08 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 14:13:05 -0700
Message-Id: <20250518211305.222842-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747602789; x=1748207589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ9C3YKj45QALmqOnmCDeACR64fSYmMfCc9m2843Lq8=;
 b=SyEa28fHZUuUP/LaK11RbZy1+nGHsvXTOL80aCqWqAVbdo4ZfGLuZ9NMRgI+Da4whE
 MuWqb9TeazkkXDoGbvsiycgqvpgwQHW9pQjsBI5MNq0nMq7G7j9mdp4Xeo9Ee21bIigh
 gVlhqdv80rAkh3XA8WklroCqUSJ4B8EQKTmIl3vXxV5cNOoWKL2yfn2CMK2tG1kqn8Qz
 wFoHW6tOZLq0f3vF1oJhaW3lhn01Ud1w8QxFF9JLMVp90FOvvJI18eDhQo9BWOmV+6f1
 qF1AcErqhyAJkd1oYvoFCvtwfOLg3crOPnKo5LepjRyWRRvzaBujbF3Y8XyTDOpQO0Cl
 wPmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SyEa28fH
Subject: [Buildroot] [PATCH 1/1] package/gperf: bump to version 3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00013.html
https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00004.html

Changelog:
https://git.savannah.gnu.org/gitweb/?p=gperf.git;a=blob;f=ChangeLog;h=7966fcd0384f833f8b7d8ebdf9c5c90c22b4e48c;hb=d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/gperf/gperf.hash | 4 ++--
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 1ea48c454b..9615c4e62b 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz.sig
+# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz.sig
 # with key 93C08C88471097CD
-sha256  588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2  gperf-3.1.tar.gz
+sha256  fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8  gperf-3.3.tar.gz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 4b928a0ebd..cf0694f9f8 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.1
+GPERF_VERSION = 3.3
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
