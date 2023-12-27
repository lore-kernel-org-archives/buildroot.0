Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D032C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 14:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C04D40620;
	Wed, 27 Dec 2023 14:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C04D40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdU92js7-fDd; Wed, 27 Dec 2023 14:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44CAF4091B;
	Wed, 27 Dec 2023 14:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44CAF4091B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A52E11BF4D6
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 14:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75CB381EBA
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 14:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CB381EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whFeaBFGAljV for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 14:44:33 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D6CE81CDC
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 14:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D6CE81CDC
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so4409542f8f.0
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 06:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703688270; x=1704293070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIH+SJIbH4tGprYhaHRU4XphWnURgwa6vl6v+bx2ZHU=;
 b=AVsRM1nJscsX1zPTWto3h6MTjmin+at6nsGOcXDXg7O3t61ow241BjU7EHA9tXJ1p3
 0XoKQRIWUIUy+ssN+GZH8ghOPcMZ/OeohC0eNi1pauka+/SaGb3XW/Frkq1vwpiXtWeP
 A0isj/Vdde9hiC7yAktpXBq3yIMk/9TWw2ggRf2qP+TaoN0QI7h4Az7S6sqYhEKyCej6
 8ihItiXF12mXAa/I2sb2sll8wIyb7uA7jsv1KsnwrbTvfZSAsvCbCEFQVZ9OV2YRD07m
 yQrgy5iQ9ntyYT01vFrsSlhjND2LUFO9imqv7m2vFfaQ28fPjt376KvqYinfMHJMHgJK
 HYDQ==
X-Gm-Message-State: AOJu0YwejNTrci3xGi0G8yMC2lixKIWskgxlSSnSwCrJMbo8oGCvQOmN
 3sGkQ6MvqcAXMdDWNb0mxXJQaOPLGSM=
X-Google-Smtp-Source: AGHT+IE279FVHRg9iYLea3/hAPUw9JwRx3BaBwktYUOzQabtFVeMRZs6nom7PQvrcnWVUC5ZxlkBSA==
X-Received: by 2002:adf:fc47:0:b0:336:4f0a:d30d with SMTP id
 e7-20020adffc47000000b003364f0ad30dmr4806793wrs.30.1703688269593; 
 Wed, 27 Dec 2023 06:44:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e8-20020a5d5948000000b00336aa190139sm10128387wri.5.2023.12.27.06.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 06:44:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 15:44:24 +0100
Message-ID: <20231227144424.1379160-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703688270; x=1704293070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIH+SJIbH4tGprYhaHRU4XphWnURgwa6vl6v+bx2ZHU=;
 b=GTXzt9btWInXBxlXkXg8H8sUQ3cWHGoXvHvQxIKFodJnmtxfTFrOnDRp+4WYVeS8zL
 ERy+ReOW0HvqF0qjJMICRs/UW2EGLzpk/b8g8HnXAOXEZsnCipQJ72yBxPLT++LzXgr5
 CPRR2MCKesXQBOSg1ui/jYwGMGCtuaO9dLN3SXhaUttxfUCdoyPa/gQ60CvKoqDhYZkh
 kjNvQbSkSvgpwNoW5G2Whn1cqQWsZSMsVDiH+hcnaXxPjsFfM7d1Intjj8tOfPwN3UZv
 Et6OiVfMTJ+ZRE+uWUzPxJxLr7qo0R7AW95En95Taq+LjZ11i7GbPgOIhiK3Ut2Vcd0q
 fj2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GTXzt9bt
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: security bump to version
 2.1.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-1450, CVE-2023-1451 and CVE-2023-29584

https://github.com/enzo1982/mp4v2/releases/tag/v2.1.3
https://github.com/enzo1982/mp4v2/releases/tag/v2.1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mp4v2/mp4v2.hash | 2 +-
 package/mp4v2/mp4v2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index d3f0243650..4605ee6b0d 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
+sha256  033185c17bf3c5fdd94020c95f8325be2e5356558e3913c3d6547a85dd61f7f1  mp4v2-2.1.3.tar.bz2
 sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 7de837c170..ae777cdc75 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 2.1.1
+MP4V2_VERSION = 2.1.3
 MP4V2_SITE = \
 	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
 MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
