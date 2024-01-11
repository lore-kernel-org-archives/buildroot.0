Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3CCC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A5A83D77;
	Thu, 11 Jan 2024 07:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A5A83D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoEFQaQAwH21; Thu, 11 Jan 2024 07:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B46883D74;
	Thu, 11 Jan 2024 07:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B46883D74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81BAE1BF2C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53A8C83D74
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A8C83D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddRxuV7-yMwy for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:41:00 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DC6783D73
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC6783D73
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bc32b0fdadso200872439f.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704958859; x=1705563659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4oEnzZWLD8r7gxgdb73UH1evXuFMXGlt0jSZSRUxjY=;
 b=PY+sfPdSUpt3g8U7zYNkYhSO/GAqhIZCO9w4l6KHu76GZ0noqKxyzsRrJSlicKM3Nq
 KZ1tKOuIINcXC7G3UhwTiJYDTY9JGylbieAhcFTn0VfsNHYKznqetF/YzAqRhlx8HHA3
 mF7ipONiarJZ5mMe8RtZs1/Jf0fzwWofX89FjSnMEHre27SC5zRGLjR4lwMZi7HXLB88
 Er4qwBSdYkesFKtgaw4GcTSugW3yStsu7MQId/0I2a9kN4mqSbTJBG7F9qouoCSTMBnL
 r6BZvxIjOm4KI5y9Eqx8UVTOl+uWA6wXUu06V2BuuhKL85lYGXN0o5x4i+lXrcuzKgF0
 Jrsw==
X-Gm-Message-State: AOJu0YyHhXKE99gKI2RpOxz5FTuX0COhTxUBPrRW1EWKlmphnOZamtnj
 Dakkbu0UBcic7i1+MEduPa4FZB2c0ek4VQ==
X-Google-Smtp-Source: AGHT+IGbJjlOli+Ke7CADc55r26I3kHxzWSo8Zp6+uX6Ww1My6HiUkJtW3Th4fKUXmJIhwB0GqkM6A==
X-Received: by 2002:a92:c265:0:b0:35d:a4a9:7bb4 with SMTP id
 h5-20020a92c265000000b0035da4a97bb4mr975710ild.6.1704958859044; 
 Wed, 10 Jan 2024 23:40:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cl7-20020a0566383d0700b0046e564817b9sm80070jab.0.2024.01.10.23.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:40:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:40:57 -0700
Message-Id: <20240111074057.3089507-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704958859; x=1705563659; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4oEnzZWLD8r7gxgdb73UH1evXuFMXGlt0jSZSRUxjY=;
 b=BnzRj4STaO5fbMdSoM7sTJ19+QDD9OonXCVOh27myn9DnRm4N6g36gQi0MlyJNo0S2
 nOQMfqC85E82idNqCLo08zhgtCrWyYBsfqbegAh3TUlfjVVFt4P0FzZ5yR0cFkrS7D54
 zJjSwEhaV+iPIthudpigbKq5x//JWiZqo5KBinNQVTgrQvC+JLcAamBQytZ4PGO7nkkr
 7Bb1YRJdSuxrILWU9zA7f/fad3hpzmexsRbxqXtrt0tkKJ9M0nCzVPTPxWxo6i/Sb4dh
 jSm4Dxq/bmmh5QiiacuvramQuI40njogNlmzPMc3UEKGqGzWoUKrLiwLPF0zRYv0cy4T
 cZ0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BnzRj4ST
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 2.4.0
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
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 9be0ad00c8..ed69ab06d1 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  ba0af4ee713cd0030c2d436091af4241  termcolor-2.2.0.tar.gz
-sha256  dfc8ac3f350788f23b2947b3e6cfa5a53b630b612e6cd8965a015a776020b99a  termcolor-2.2.0.tar.gz
+md5  1d567737d43835549d2fd1bc87ec6c7d  termcolor-2.4.0.tar.gz
+sha256  aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a  termcolor-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index 5cbedfb396..c242cfa474 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.2.0
+PYTHON_TERMCOLOR_VERSION = 2.4.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/e5/4e/b2a54a21092ad2d5d70b0140e4080811bee06a39cc8481651579fe865c89
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/10/56/d7d66a84f96d804155f6ff2873d065368b25a07222a6fd51c4f24ef6d764
 PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
