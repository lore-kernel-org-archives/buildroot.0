Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6E9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 00:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B0BC40490;
	Thu,  9 Nov 2023 00:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0BC40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4GHYPjVCKdM; Thu,  9 Nov 2023 00:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6596F40491;
	Thu,  9 Nov 2023 00:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6596F40491
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDF111BF29D
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B752761046
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B752761046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17TUu_H8_HQk for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 00:00:09 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D52960FD7
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 00:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D52960FD7
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35961c61ffaso1264615ab.3
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 16:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488008; x=1700092808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gChjE3d1MXi7Mjo5jSpYWrs8nF6jbw+jUq5TTVon1tA=;
 b=oTeN7TLnv5mjA4hR0kb6wdaphpfFrSlfW+u1h0ngfuTxZFNkAyeODCOn06eym6S7KH
 uQHmOgqWIk75+Qrp5O+eJZ4sU28z6Q8dAGnZOY3AyXQYt1ptHAqks4mbz2aCfrdNZzmL
 GZtcYskiTwj2vUoZGUzLknlWep9VLBlas2y1wqRcpD49SJLp4DYJ1XX/YUHHhk6mF4Uq
 eKqP3+fLvfrYuwGL3IAl6X52F+Sp9tCMC06vs+xn/SKIcHW5lRUMBrC+Gpxz6AXtjX6u
 C/pddvHYXAS29k4IsdEde3ZjclpbTQsBOkiRJ/QcHFJV7jbKF0O0xrZhoDRzl1wyOMqB
 cxlw==
X-Gm-Message-State: AOJu0YxfkJqOh66epfBO6kwU8kBh0sdXdrvRMMGl0vikCQHDyVCLxMeW
 CDUJ5VHfxKye8iRcA6vwABThGnjew68=
X-Google-Smtp-Source: AGHT+IGQ0fT4/iBH9RaOROJ8Z0GQLDU2edjTPns3t7NhyIxH7YSx8YhYU+wK9thKP8kv5ReEx4xWIw==
X-Received: by 2002:a05:6e02:1c22:b0:357:47a3:adb8 with SMTP id
 m2-20020a056e021c2200b0035747a3adb8mr4194149ilh.29.1699488007869; 
 Wed, 08 Nov 2023 16:00:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 b16-20020a92ce10000000b003596a440efasm3691579ilo.19.2023.11.08.16.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 16:00:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 17:00:02 -0700
Message-Id: <20231109000002.3662026-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699488008; x=1700092808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gChjE3d1MXi7Mjo5jSpYWrs8nF6jbw+jUq5TTVon1tA=;
 b=Jqm/BuQAVzJ2wK5AE6NPzi3DDDqZyU2D0khdR75TMiyhiLhL+5ZvgHXwPsIQ1fVxBw
 ChbiAn05jpn0Oz017N7zyt1F3ADg4hNGhDQmVFzzdZziWmYfWdoNFxxXe8EViuu7+dh0
 t8oQnUcSHA7Z6W93RZhZ8Q3GlJEJ4jOb6SnktCVkoJ9RNfI3BOz+PhGi6eMfJbve3zQG
 1Kw2LzRZO51dY0UC0hq8vTOzM83+g3VlsPt1iXHHdhpPHk7/cfxdiR6W7G0Lp0+gN7Pf
 XWD47/Mt4Q2kKxtYASqGdOmV/TXmjokgEM5ffRIW6sq4hYRCjSXufFvHk8R86Rh7iZN5
 l0mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jqm/BuQA
Subject: [Buildroot] [PATCH 1/1] package/python-munch: bump to version 4.0.0
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
 package/python-munch/python-munch.hash | 4 ++--
 package/python-munch/python-munch.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-munch/python-munch.hash b/package/python-munch/python-munch.hash
index 7e32282833..a895bc9185 100644
--- a/package/python-munch/python-munch.hash
+++ b/package/python-munch/python-munch.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/munch/json
-md5  ed84c3718416c8d4d03d0a6ef46e8e0c  munch-2.5.0.tar.gz
-sha256  2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2  munch-2.5.0.tar.gz
+md5  4e70cf760e3b81dcaa6050803c1dbd72  munch-4.0.0.tar.gz
+sha256  542cb151461263216a4e37c3fd9afc425feeaf38aaa3025cd2a981fadb422235  munch-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
index 85f6803f07..c2941aa0b5 100644
--- a/package/python-munch/python-munch.mk
+++ b/package/python-munch/python-munch.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUNCH_VERSION = 2.5.0
+PYTHON_MUNCH_VERSION = 4.0.0
 PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
-PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/43/a1/ec48010724eedfe2add68eb7592a0d238590e14e08b95a4ffb3c7b2f0808
+PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/e7/2b/45098135b5f9f13221820d90f9e0516e11a2a0f55012c13b081d202b782a
 PYTHON_MUNCH_SETUP_TYPE = setuptools
 PYTHON_MUNCH_LICENSE = MIT
 PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
