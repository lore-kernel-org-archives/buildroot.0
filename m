Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D869C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42A981EE1;
	Mon,  1 Jul 2024 19:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blMSVSaVJgqK; Mon,  1 Jul 2024 19:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2A581EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2A581EE4;
	Mon,  1 Jul 2024 19:03:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9C81BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0656140A56
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mC8VX3DxeSDI for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2D5A4052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D5A4052B
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2D5A4052B
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:03:45 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7f3d37d6bfdso99236839f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719860624; x=1720465424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Re2aYpUCJqLkP4CMmR67+yw1QlSBBzo93epnFizeeIs=;
 b=jvEWm4ujZ6aKXSwVybj+jamRSFTBiqKH3XW1uRZ/48Nh89CgklGGzluL15U3W8Ipvv
 LOvYfn9UlGGEDy2VnrpkJzHunYc1Ko1GykgHDEx+gaARriy1DnsoQWGx7pwMIWhBjADl
 fuvwoOXJUCqbdujbHkJKVfnSfA8mMHCY4omBGQtpkIBYSz7Ef/D/UeInh5kuhlrEQjI8
 7erAOM638ifia7ZnWK/6+GADv9xE//1ZItAGapewMs8ssByVwNVLGXko35GS3RqQWSwb
 0eaIFM4ne56CoLcceTx1zv4sV4gu7Gvq0NvgZuS6B762OeI5ptig4VZYggZ6g4yXVdRL
 Mr3g==
X-Gm-Message-State: AOJu0YzAJZu9hfIhd9hDi06QhArbZTBA+w6B3PxK3t9A/gja934OXOOs
 rNmoknnT+g03FmDdAiBrLu7SoSC34+iAEAMhxfBxFw8lL+EQQN6jBQkaNg==
X-Google-Smtp-Source: AGHT+IGDs8p22wFEBtfm6GgsUISEhM7DtxhTCuFfV+OVJKL3rAXHmLJXMeTHvEUNVWNJhj4UBTKkWA==
X-Received: by 2002:a6b:a0f:0:b0:7eb:d1c1:be67 with SMTP id
 ca18e2360f4ac-7f62ee1dcbfmr341218939f.4.1719860624267; 
 Mon, 01 Jul 2024 12:03:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61ce87f69sm214810639f.1.2024.07.01.12.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:03:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:03:36 -0600
Message-Id: <20240701190336.1761683-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719860624; x=1720465424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Re2aYpUCJqLkP4CMmR67+yw1QlSBBzo93epnFizeeIs=;
 b=XFMHnBt8oMP8tS8Z80d+c4m6pYvUr6iGMOjnZzV9JATI6AeBvWRjcBPBrk1IG4e29g
 CJLiLFkqiCpWh4HwqQFtqJVKpluiVpxyS9SGbCrfW8cLXTuPeJIRo3ZnQZuzcpKDKhhg
 j+7yYmXnlXWf5BCllvbt9udONy1dws67oLPO8TM4Qrsbi6jwI3/+I2Ez2xJLxLpdTQCM
 tafrbI68zRLvlV4ehwPkkkbhZF+SPyZblWV5J6CIi06ziJKYI8bsulyYhja8gBJjqIw3
 f/bPgpzFyGresOBNqm78PYryApCGWPIdRBa+ViM4eS21OYHQlrZVp+DI1A7QwqXLckm2
 dySA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XFMHnBt8
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.9
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
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 9b2b6d3d82..29f7f2bc88 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  a61a045b7f5e64d44dc53c73522ac4d2  python_multipart-0.0.6.tar.gz
-sha256  e9925a80bb668529f1b67c7fdb0a5dacdd7cbfc6fb0bff3ea443fe22bdd62132  python_multipart-0.0.6.tar.gz
+md5  0339000d92e78abbaac815954da6b826  python_multipart-0.0.9.tar.gz
+sha256  03f54688c663f1b7977105f021043b0793151e4cb1c1a9d4a11fc13d622c4026  python_multipart-0.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 7ffb05fa92..62ae37d749 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.6
+PYTHON_MULTIPART_VERSION = 0.0.9
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/2d/23/abcfad10c3348cb6358400f8adbc21b523bbc6c954494fd0974428068672
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5c/0f/9c55ac6c84c0336e22a26fa84ca6c51d58d7ac3a2d78b0dfa8748826c883
 PYTHON_MULTIPART_SETUP_TYPE = pep517
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
