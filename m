Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94590C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 06:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67DA60ECA;
	Sun, 29 Jan 2023 06:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67DA60ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxoSyaQLEMV8; Sun, 29 Jan 2023 06:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BA660EC2;
	Sun, 29 Jan 2023 06:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BA660EC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8121BF82F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 06:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73AE960EC2
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 06:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73AE960EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezPTCY0aptQU for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 06:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B6060E80
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B6060E80
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 06:48:44 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id l15so185748ilj.5
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WknLzTr2dLWa4zcR2cMPgmsJCzjRJ55OF48C7Xe7+w4=;
 b=0bd6L8ICusLkb+BDxW6OESpiIQS/hAsdRtMpzPm7ZsoLDpko95XtmHyMtM5Fe67bee
 WVk4xNayd54fdZ26QTBES8oL7tJ/6xOfr+PcfzQKoCwqSjRzSECFmCDSxSRa0hWVokQZ
 2bgnwCVL7wDFXLk5jZE1OxGG7QWUT8EiHWg89SSWThSCXaBLsQ1jh6V+XEbo/S5A10b1
 0aE2+ElNAzusEDHuhZmZlPH9tzz38SYeIbXWN190LXlbOcMTFVNmgUuVgJThvMRgESfp
 B0wjFW6NpkV+GHwaqyFxCdWwcnC1Uepni7zaT11B3mvh6Oyt7bkghz7wOVDfRTVyuJhR
 rB/w==
X-Gm-Message-State: AO0yUKXElz8ZGmAo1JZ+zpZZIZOW0Q/Ex5Qy1FL7AqYFHSMg6++Pn4ns
 jeDf5R2ykcJz7ROiMwPbQri85yEnrdTAkQ==
X-Google-Smtp-Source: AK7set8rsR3oo+Fj8PAN5g2RpCYLTVqedCN0Lfze7TQWgaiXWXo9+I3Q+XbBVWIZv0Mov92TIUJKTQ==
X-Received: by 2002:a05:6e02:20e1:b0:310:ac52:1cf6 with SMTP id
 q1-20020a056e0220e100b00310ac521cf6mr9809490ilv.29.1674974923107; 
 Sat, 28 Jan 2023 22:48:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v14-20020a92cd4e000000b0030edf556846sm2923014ilq.35.2023.01.28.22.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 22:48:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:48:41 -0700
Message-Id: <20230129064841.2831082-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WknLzTr2dLWa4zcR2cMPgmsJCzjRJ55OF48C7Xe7+w4=;
 b=MsGyJTbJ2s9tDQZLOrNB7khV5v/YRAvscZmaRvvNVYWbnRG87LUJMsEWFQz8Wh+3IN
 kAi/mNEBF8dDnJ5k571MS+KaXgJIx+AjXUZiV00GJhI9F0TzEaA53tglhLHarX/Qf8yw
 Tigp7zFsMlPJHGuog5/y0CWrJA+wyXfw1YD9K2oxj7QtSlFVYfEoL7Woj+wRL+uCAh74
 sqZY7gAQAMP9vqmtkhu/P3gd0+7Jd8GGwAJ8RMLnY60maLc7L+efH1pqgu5P2s+Re5iV
 trOPH65lfo5QuMI/8GM6GDUkL83bEnReglRu8CfzX9j94SnQhP7JGxQtVRZBHHx751il
 rmCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MsGyJTbJ
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 2.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 4e9e96398a..f378436beb 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  8d0f10b807144a86b54841cfab2620a9  greenlet-2.0.1.tar.gz
-sha256  42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67  greenlet-2.0.1.tar.gz
+md5  e6637d59015cba7e86f2111e6aa8168b  greenlet-2.0.2.tar.gz
+sha256  e7c8dc13af7db097bed64a051d2dd49e9f0af495c26995c00a9ee842690d34c0  greenlet-2.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 232e2820f8..40f05f667e 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 2.0.1
+PYTHON_GREENLET_VERSION = 2.0.2
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/fd/6a/f07b0028baff9bca61ecfcd9ee021e7e33369da8094f00eff409f2ff32be
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/1e/1e/632e55a04d732c8184201238d911207682b119c35cecbb9a573a6c566731
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
