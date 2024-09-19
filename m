Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801BECF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1669984B9E;
	Thu, 19 Sep 2024 18:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvjzH1T0SA_X; Thu, 19 Sep 2024 18:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E3AE84B9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3AE84B9F;
	Thu, 19 Sep 2024 18:50:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 842181BF5A3
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 723DF4143D
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaUK5T6NuKoP for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38E0E40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E0E40120
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38E0E40120
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:50:01 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso63185939f.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726771800; x=1727376600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cZT0B9Z/IO1k42ht9n2vf/uZRR3DRBH7Pu3aLKgH40=;
 b=U5iwrzG+F24rKenVMsg/ZNqYUJxvPecgcnoVuiChY29Tw0zHpPkojaAYGIxUoFNz5L
 +IIcz6aj2ZMT6G2DDn/135DJGFRCH/OwLXHHKG9CDrEpJbvRsuD5H81octP9lcyuz8pv
 DMXfxmfMEsC5QMrcBbhJulj5RBukpnqxecr7761eKW0bLaPg/jNhFzDJa5llNJtWSvrN
 mCkyzeuT6iyAydmXDCruzskVW0IYXg85UNtN0ZNEOVEyycSy25+9ApTuYhffusPhX0SH
 kHj6hpKGRqQgEWvfl/SdTGl0F+vjGzCm1GrnNnbTqG0qoKTmD7OsJhgSIxn3q0SZfMiD
 X7VA==
X-Gm-Message-State: AOJu0YwTYdd2aVE5vpPTkCIaYvoE1gO/mLaKg2HI1ArOQHlAwvYp4n1q
 H+/s4moy/hlvNty7nmhhU9+steHtFTjFTG7uDG/jLQP3p9SCgECJ3++B7A==
X-Google-Smtp-Source: AGHT+IFwtGzG15pBIUoqg94LSssrMtK6rTIQZ4zlzYx4u0ymTvjJtsDrQNI4KmrjZeBwntwdn/ZpQA==
X-Received: by 2002:a05:6602:619c:b0:82a:a43f:5bcc with SMTP id
 ca18e2360f4ac-83209d178e0mr57112239f.7.1726771800196; 
 Thu, 19 Sep 2024 11:50:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b34b6sm332369239f.23.2024.09.19.11.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:49:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:49:58 -0600
Message-Id: <20240919184958.657222-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726771800; x=1727376600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1cZT0B9Z/IO1k42ht9n2vf/uZRR3DRBH7Pu3aLKgH40=;
 b=N+pVIuge7w9a2ooTP5mqpdm/Xq79szsZyc2vROF8PsQJx6J59gKgG0JAE2aoucS3u3
 SSWgm/iGuBdJ67WjFGe1gYNMpDW3W34+tjl30edi9GiXfUy17bphVnR/3+RdmJ08UDey
 nyccUppTx/NyIPKFp3oMatzS50Josn1qob3ACRS+xNiib23IV9BoflJ0QjgV+vD59CFM
 Gil/KTqknmc/yOC29cBio0W8e9pxupo8GDOXvXaSyhySO5svAM4YwG1+7fzDGO5fxV7Y
 +ZMqyAUOsyyK5yQVnow2FTa7FCaHNYesrmbidzjp6CA4i8qOw4VNoCzgu8UhyHgYcZrQ
 zlZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N+pVIuge
Subject: [Buildroot] [PATCH 1/1] package/python-schedule: bump to version
 1.2.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-schedule/python-schedule.hash | 4 ++--
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 59c84c2002..abbf07ffb9 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5  ecb436a797e1a149bac4643330b268ca  schedule-1.2.1.tar.gz
-sha256  843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279  schedule-1.2.1.tar.gz
+md5  e9a2733aad7fb33107444a53f8b87d48  schedule-1.2.2.tar.gz
+sha256  15fe9c75fe5fd9b9627f3f19cc0ef1420508f9f9a46f45cd0769ef75ede5f0b7  schedule-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index 11be2e49d4..f78b2dcb11 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 1.2.1
+PYTHON_SCHEDULE_VERSION = 1.2.2
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/29/22/9dd374cbf76a42ece1f1f41cc8f4957f0ad512577372527cd3dd52758241
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/0c/91/b525790063015759f34447d4cf9d2ccb52cdee0f1dd6ff8764e863bcb74c
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
