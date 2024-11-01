Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BB6E6F07F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C57A380C7C;
	Fri,  1 Nov 2024 19:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEW6UvKuWRrt; Fri,  1 Nov 2024 19:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E27DD80C83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27DD80C83;
	Fri,  1 Nov 2024 19:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5D3A27E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A327A403DB
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtVswn2iET-H for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C3FB403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3FB403DE
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C3FB403DE
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:27:06 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3b2499c65so9348355ab.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730489225; x=1731094025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKZtFlJyMpvalKifnWeDdnEwhHZIHTTcwEFSeiVU27g=;
 b=HBCu3/JhhGMe/GKxlBPM2Z2dZ6rIgoZvN37/MLSfB0sbHE/ln4cJ0SAd3BtUsFDE4v
 Q5rWXdykWhjgIu9lsYy7fdYEacXyYl0DDvOaS9XHA2VpX62cV78wzE90q7TVYsbch0oE
 0Rm0ZIQLb9jC9Y/tHL59da0SHf/Lts+cZlYjK4SQ/y/jtTBIYake98NMu6j6TSuw9Yjc
 DE9eySq+d6DTsDY3Plr60vdZmYWotBnjRr9yBoxbWb62M6UV+b/ht4vW3tqhzwx3WdsX
 q0gHEBQWws0cMENRL9VZdRMWEx50DEwQdUP3hp9jH9Wj10Wlx5u1YEWxi68tVGaHesvi
 /jAg==
X-Gm-Message-State: AOJu0Yx927d7TYtE3wVnKdLmtVDwhf2L1tD2B46aY7VuUtgjvkKM7rpV
 eOvrSzJ8++YtwJvMAzOwarwVvGckdfuPI+dOWdUedytROv9HAI7Joo0Yuw==
X-Google-Smtp-Source: AGHT+IG7WbGdGN612gPxqz8TJLCdvde4dXM5mXq41L/fi3VG4XyO60WiRArYEgbLOxTJUZJT8EXKjg==
X-Received: by 2002:a92:8748:0:b0:3a5:e1f5:157c with SMTP id
 e9e14a558f8ab-3a5e1f51a2dmr103684905ab.15.1730489225264; 
 Fri, 01 Nov 2024 12:27:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b007asm9735475ab.17.2024.11.01.12.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:27:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:27:02 -0600
Message-Id: <20241101192702.1066238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730489225; x=1731094025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dKZtFlJyMpvalKifnWeDdnEwhHZIHTTcwEFSeiVU27g=;
 b=IyV3ei/GTwy15KFsAZMb3O+sy3hYoGpMF6fYniQmVKx24BIweIFo2ejHA94EAUZ4+q
 ChqXDOpS246aG7mNXDAlSJ9Mbp98Ezd6cSMzJ65MUPitXSDH63U7mqbj0jCuqD7S5E32
 oqDQCpIX4JMtpXQfCK7dZEVFCVxV6MHYOtDdXfJc8iFWqpYoFiad+xuJqg1M8QZOhPau
 e/x33ezXnSuuw4KQ+gp/5ttTmoZH7gPKrLyBsqe3yytgoRF1PfkCToMjImFwBuUsSUzV
 6IgtIoPCmVdGZNDex3Z5AOxgpVSZxwTgCGO8bzrVTHha+mNyohy5f8o8rDCHihWOb516
 LPdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IyV3ei/G
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.17.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 57028efd4b..d37b906910 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  6307e0e89f71a8252fb6abecc372d251  pyphen-0.16.0.tar.gz
-sha256  2c006b3ddf072c9571ab97606d9ab3c26a92eaced4c0d59fd1d26988f308f413  pyphen-0.16.0.tar.gz
+md5  acb06fb5953d2b5435fa8d1428d6652f  pyphen-0.17.0.tar.gz
+sha256  1d13acd1ce37a384d7612954ae6c7801bb4c5316da0e2b937b2127ba702a3da4  pyphen-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4fd1c78fcec632bc872ba7b42ba04be330029cfffa411039b48a4f2262bb8240  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 84560f8a7f..61f050c8c9 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.16.0
+PYTHON_PYPHEN_VERSION = 0.17.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/33/87/493fc9e2597923a2b02a1facc376a3bf8e682698ae177b340c0c5fd1fdec
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/66/46/3dd0ae4b52016496069af6c4fca3b5918b0281fc92678f739edb8f3eb377
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
