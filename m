Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B79CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 18:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEC080F32;
	Sun, 13 Oct 2024 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGG2ouiSHhKi; Sun, 13 Oct 2024 18:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A3B810EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A3B810EA;
	Sun, 13 Oct 2024 18:56:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32C0B1BF3DF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219A640540
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEPw1o8v04R6 for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 18:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D19C1404F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19C1404F8
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D19C1404F8
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:56:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-835464abfa7so119752239f.0
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 11:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728845811; x=1729450611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFR4O9TYCtg7I5g8fM6Ptx39qo09kPOdM6+v9KBioJQ=;
 b=dd8Uln5wbX8XqvsW/DzShHC2BUEoWzuAKh9WAeZJAGDSqQZaXISrBr5Qoaawhnk8GU
 8rIS/PI2NkM7z+UI0/pEsOYcoc8c1U2ilsllC1ODnFORTL3CW8N2STWz1VXBaFS1FU4L
 3r4ompbXQF0uYE/SJNddBJ1oNAaM5byNXYQyUAolHziAklVZnqgUDZ/Ub/6+qb7yHIEM
 tnyTOY7FWPo1ZNyeFDhbgcdW2Z0GGeMmQ3jDk3pf7ZYT8L2V7x0wR1UGTBkzsIow3Z6g
 ElVspeQAW7VFbBw58vW6jtrqTtEHxiAKm0JSuPAXms972lQAIgTrGu1V3C7+VH3e5pt4
 wTXQ==
X-Gm-Message-State: AOJu0YxYtsZiZqtsd2JbVnVgu3AJNmPU4t/28BQrwxgVNVqNi6nEUzF3
 WY16y3s4+JYxGXwytjv8+fDyI4azBV5tuy0iJ67w8RRJkaP10fDUsV7SPA==
X-Google-Smtp-Source: AGHT+IHh4RBp3pytHRyYzGa4457hPCMMRULMAsMjqVZA4d4AlfBKnPj6qKwwUboBgZarPDQFVIok/A==
X-Received: by 2002:a05:6e02:160a:b0:3a0:9f85:d74e with SMTP id
 e9e14a558f8ab-3a3bcdef00bmr46014385ab.16.1728845811413; 
 Sun, 13 Oct 2024 11:56:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad9f1c3fsm1545981173.77.2024.10.13.11.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 11:56:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:56:46 -0600
Message-Id: <20241013185646.2795292-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728845811; x=1729450611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hFR4O9TYCtg7I5g8fM6Ptx39qo09kPOdM6+v9KBioJQ=;
 b=FMwc1miKXqCVxUcmIBEW+RMFy61JAHRk0OeAG5BkLtu6qKy1p7M6ZhjpVGjAY7QJBW
 91VeCashmcUPq8hvUdc6JoMAWSiX5oWMREBxS3X9W4iLKz3uvJMBb6FT5tnN2bIMXAoX
 ZkTrzlLKJdH53VEahVVbaeBVFAAIT68032joB7RmembnmmY0ODmqea6iN3Hgl4mUOxIm
 k6cA1ktaopKyqp6zyn621OCmRJ9HoV87kXVd/VeZSCI1mIyK6JXjNlOUIyJv1+Gd4pbZ
 3jf++H87ERhc6N70sGxWEdOqfggwUlnQ/xZDK54prnuYrkZdR43rCa4ND/hfBe9g+KUW
 7hCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FMwc1miK
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.7.3
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 6727fbc571..72b5b82019 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  1e1cc27f4a7911a8554190156a441089  pymodbus-3.7.2.tar.gz
-sha256  6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef  pymodbus-3.7.2.tar.gz
+md5  c7879e21035bb4fc5d22b473e097b353  pymodbus-3.7.3.tar.gz
+sha256  603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c  pymodbus-3.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index ab8f72fb8c..6833e8d58b 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.2
+PYTHON_PYMODBUS_VERSION = 3.7.3
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/a2/f1/10be9b46fa9389271eeec8cb022680ff701ef97bcdd47d0e4a1fa464c057
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/af/33/3ccba09863981b2a3977933aa583b66ab65084bcb94aae4ec94ac23c9e39
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
