Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B252BC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 00:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FA3A4049A;
	Thu,  9 Nov 2023 00:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FA3A4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgDW1W2iQ-6J; Thu,  9 Nov 2023 00:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BDD440491;
	Thu,  9 Nov 2023 00:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BDD440491
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAACB1BF29D
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3BF781FEB
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BF781FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2RWp90sN_BZ for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 00:02:48 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 852F581EDB
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 00:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 852F581EDB
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-358ff34cd9eso1311075ab.1
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 16:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488167; x=1700092967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WKbEr6LjeNWV3CzXDAjOix/FYfx1QXs+HztnjN7gqmQ=;
 b=Ch8tOK+Gqwekiw9gUrGfiRKgUV2c2ma30kLulnc8qnHSNeA4eD+SxRG7H9o2Tvd5+D
 bP3IQ7KLpPiup3Cg6S5UuvoWQZr5q5yQmBfIpDBsuN9M6BMfEJ3uLTg03094h5lluFtv
 ZbYxpjoRKpFPjjtbTXo//U/JiLVOg4KsA61lAa0aiMBUszrUPxUc5K0U0K7werrdN2oh
 0RIu64KXAnepDDChhUZh2u2HHuvfqMkz1khQTebqGDKH3xnsIozLoqvY0wi/8leneITW
 ZIRYBGIgrJ5vglB2pUDI+oX2K4eCpNZvy/PY6zW1/mogZ+YM3lGoFZxzvL/fj5ni8DCu
 szEw==
X-Gm-Message-State: AOJu0Yy/8w8OQTT+cxUUgDjk7Xo67RfBOREZioY+zJf3amj7jT0SwsAN
 ZrxHVBLQEQAe7jMHGIYTh/9nf5Ro9Lk=
X-Google-Smtp-Source: AGHT+IHAaV2xRnuRxgPVHz4os3BziuLXy/7mdSptssPC35pvLLPTUQS0aGKTKp1vzctB+NuXCNT79Q==
X-Received: by 2002:a05:6e02:152c:b0:357:ca98:3db2 with SMTP id
 i12-20020a056e02152c00b00357ca983db2mr3808011ilu.21.1699488167060; 
 Wed, 08 Nov 2023 16:02:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k16-20020a02a710000000b00439fa6ff6a9sm3444930jam.70.2023.11.08.16.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 16:02:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 17:02:45 -0700
Message-Id: <20231109000245.3663712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699488167; x=1700092967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WKbEr6LjeNWV3CzXDAjOix/FYfx1QXs+HztnjN7gqmQ=;
 b=j0pSrsZLeMWFykwxJsCLkV83eniCPF6mIs9Ig/FRP5CBXpucuJtlWwnLbT4HqWZhIU
 zrqRkOVjKFI6uQ/Kn26Uf1mD/ArlxCVhjZMOdWqp1uhJzBl82K9vPv1XqG5MaKs5iHvT
 unugrz1WQrOdcALO86JmKXiQ1YDm3D41WXStouE6Y1I7P8TMbTz1ffB4c7yAC5wz6cVq
 opN/3GWYsbeU4AKwhwUT2r8htfSIjDGDaQ9NU3Xi5vVnOhYDm0hUJX3iD44cwLpnsLr5
 11rFxm7J9d0MBFsHFlUEB6W3KcahYINBoPMkfhgI2mB+dW7F6Q3ogHK+pAt3y03Xls9s
 TAoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j0pSrsZL
Subject: [Buildroot] [PATCH 1/1] package/python-mutagen: bump to version
 1.47.0
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
 package/python-mutagen/python-mutagen.hash | 4 ++--
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 2e1a588936..b2d846e7b1 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mutagen/json
-md5  648c9f38b8ef46ffb0d5135524650b87  mutagen-1.46.0.tar.gz
-sha256  6e5f8ba84836b99fe60be5fb27f84be4ad919bbb6b49caa6ae81e70584b55e58  mutagen-1.46.0.tar.gz
+md5  aa2d0d73e71c5daa1a730f7b94272357  mutagen-1.47.0.tar.gz
+sha256  719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99  mutagen-1.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 07ac9542c6..d42ed27e49 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.46.0
+PYTHON_MUTAGEN_VERSION = 1.47.0
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/b1/54/d1760a363d0fe345528e37782f6c18123b0e99e8ea755022fd51f1ecd0f9
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
