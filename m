Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC421CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82EC040102;
	Sun, 13 Oct 2024 20:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-8op6Y0BOts; Sun, 13 Oct 2024 20:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3697640188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3697640188;
	Sun, 13 Oct 2024 20:08:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 104B41BF3EF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2EF5404F8
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 20:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZTJSr3XT6Gw for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 20:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 931B2404F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 931B2404F6
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 931B2404F6
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 20:08:51 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a1a90bd015so9628285ab.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 13:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728850130; x=1729454930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kV9RtPfd9/rFSOASXjgPUi2OWaGJtIxXVrQOT54hpKc=;
 b=C5+Y5qLKZEhblUHePxyQGSdL0E5UunoM+GVnKJ9LI2woRCcEQm0Vrhn5TcgJibTwQh
 n34Ur+jYih7g34deUG6DrRLeEGk3oi/3fA+/vTQzG2U8o+viI3IDXzT8c3KOAPk6AXqQ
 YSmgutAcoI5YIPedN7TI06OxUSXKLSeKW8FIMylNIQFalImPG0oqES1T3J5Rhke508dc
 7BCwuKI1BZxvsLGZHORs1AorW/PhllRjn1W+wOWv6Nl3iK05TgrkCGUq3I1TpLUiccsX
 9t6SgOD8SoZVqsHaN5+Tqq7ql3oekGWJ1Ap+dZHIyIXSwmZdyZ20p98BdM5deZdsn6Py
 +sTA==
X-Gm-Message-State: AOJu0YymIbumGtZ+rX1LY1TNZpQ3E/+2ABn91163vXXTycsZwY58C835
 ZWZaezxu/nZ0u2KLkq4SUqMX4GroB3RgROftaroJr6QVOEZFbk1nWNYuPg==
X-Google-Smtp-Source: AGHT+IF5PjzlV3xknTNWisXPfVO8FMeCK1JlmnU7bbjo4Ar1yB/pZXjnP5L/bZ0aqYbyF07oitvogQ==
X-Received: by 2002:a92:ca4d:0:b0:39f:5abe:ec25 with SMTP id
 e9e14a558f8ab-3a3b5fb3181mr62576835ab.19.1728850130267; 
 Sun, 13 Oct 2024 13:08:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbd963055bsm282611173.13.2024.10.13.13.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 13:08:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 14:08:47 -0600
Message-Id: <20241013200847.2819030-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728850130; x=1729454930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kV9RtPfd9/rFSOASXjgPUi2OWaGJtIxXVrQOT54hpKc=;
 b=hxIseRKiGw/GCK47F6gmoKxiLrz9Gk3pPhxzOzAHl6eUWKXUWULpEl9ThY8F6X/Z/O
 5/Wn2R0PYA9PAsSVFZg3SiHKsHMJ1gdW5F4Nf2X80VJWB+8JpAA42cjM9Dula4KyCqcp
 vwwMBcZt8zgqQF6UYOl9g1e+qqI/4jstQIdoc4g1vx3MP/Sm7ACIcmdEmwbAn7h53ycG
 /UbHpghnRqDCjdnBTWYuHTvoBCXqx9oVTAyr5A+lfALJzjuL6+03aVlUvp3HIzTCIZqQ
 s2ftCoPABdzo2rv/RE483PMYuPGvsL4X6dotqrwFFpJ6V5yLHk3erzzh9G9DkkMGhkR6
 aYXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hxIseRKi
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2024.10.13
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
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 904ffd7167..2ed97b541d 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  717cfc0ecefe6d49ace81adac3ebe0af  trove_classifiers-2024.9.12.tar.gz
-sha256  4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4  trove_classifiers-2024.9.12.tar.gz
+md5  4560fbc4037de39ccc59121438a14af8  trove_classifiers-2024.10.13.tar.gz
+sha256  b820fc6f9544543afa15e5d9cfc426cde3b20fc2246dff6f019b835731508cef  trove_classifiers-2024.10.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 567cddec64..d7426f5a27 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.9.12
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.10.13
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/16/14/55ceb59dabf95f554b5368fdabe8d370165a25f817a23d809ad6c87a0b06
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/10/51/be10158183105d970d7bfc81401cf6076c13844a5869c24c72889f4bf658
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
