Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCEDE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A46B5407A9;
	Sat, 11 Jan 2025 17:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GjdFt7Em0_O; Sat, 11 Jan 2025 17:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7804640817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7804640817;
	Sat, 11 Jan 2025 17:23:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30560950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFFC400DD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxPmGRpmV-X0 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E681340017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E681340017
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E681340017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:23:38 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-29fc424237bso2340279fac.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736616217; x=1737221017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+1WWPdKpyRscYir22pGU6fnbptePKYQAGBDox3zBXo=;
 b=WkyNRYmaQrE3gCybvk/7NNkS0REMYNFdyA1D8034h6dQIjGOfxMZ3e6AYQU50uoSqC
 Wtc4QU0QgJuVY69v7qKesPSk3dYrq57zvm2qiXAp4OMfETNMx8X7Aa2FvGU0cXT5+MiK
 gwxCnzv/e3nIsunSBlOqmBnqi6H/grl/RMt5zv0K04LGpsyoFvSH/8pEMd21uYtGB2i2
 6BwbNi2bjEkTVrpz4EgbAFiXdAzoHABqF9li5GnxEMzE+W5GVGdjlPlZqEvIedtb5oUg
 ynD4SOe7D4GPjRHxlsMFRnpnC59AGYgi0xNTe0SIgzmTDKMkUaYh169A1NoV+vEzHIOZ
 IO0A==
X-Gm-Message-State: AOJu0YzEAvITVa7tAYQfZftY1ijCR6T1OgAsps4KSL1NhMN4vmDJ49oR
 IYbaXXtAZ6N/V2AbX7pB5AKVLUedirmFZsBBmtaN+surmnPylWAxouMxTWsEHK0=
X-Gm-Gg: ASbGncvD8J5rJmG5zr5XIFWHjgCwol6mdd/RIazQj1cL+8dIAqyMuUdOqmMEiccIl9E
 ZPlXeue+gLDB9EoMTkTJCcFCB9SnkoPLBe0Zvg2JM9MgIY132BxuUs+S/v65YAjxKyGSHz8Ii4i
 QbrlyMi5ujgVimh7XRmL2dT+DPgKxN8vyi9x23Xm+twOYeg7JYigsAJ/ry+j4YveXcGC1uPny7F
 A4/pjIhikQfFWbCYGJXbLIOJl6+fkj/teF9BpZjbESxdHWUqkI8xDpkvCHLXnQ4wMiJw+N5Y/qF
 5LXpvs4DAqYHzczjt5+56gQhxeYPW+g=
X-Google-Smtp-Source: AGHT+IFGy5kvcl7m9FCyll+ORc6sfFjitJ7TPBmF17Dbq86yB0shKfao6leVbhEIsTzuq544zOr3Ng==
X-Received: by 2002:a05:6871:a9c5:b0:29e:5dfd:1e17 with SMTP id
 586e51a60fabf-2aa06763273mr8101524fac.23.1736616217640; 
 Sat, 11 Jan 2025 09:23:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad804af737sm1998789fac.8.2025.01.11.09.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:23:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:23:35 -0700
Message-Id: <20250111172335.2912542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736616217; x=1737221017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+1WWPdKpyRscYir22pGU6fnbptePKYQAGBDox3zBXo=;
 b=Mz7lOYKgwIljiBZbr0SAVPzyah/ObL8Rfae6Jm+sZCRvHtjoQKUoENaAElFX75U4sa
 ISkipBitNxyJwbSBf+tsfdlISZKpWzBEtWoekELZ7mJ8hnZIfVotWxA/xcHpG+VncbTA
 N14tKp+D/Ao42rTaijNZ90J6nYk/RmpVdcSj/6X87k2NEQUyS++zDwjVVfVZ/ZbrPmVf
 0qj2dH1AOjYt/+hvYIATceGTaK88xFtzKdmm2pFJt/w7VeDdrhuCLECWczTAZDjw5EWx
 UPXHqCs6io8qgYGgTPk/76ubc9LZ9Y6i5eIXpJMTXIfn49BjQb42awia4W/ybOl2Qkyp
 r2Vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mz7lOYKg
Subject: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version 5.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-smmap2/python-smmap2.hash | 4 ++--
 package/python-smmap2/python-smmap2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index ee9c1ec570..6b040519ae 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smmap/json
-md5  9779723a7cbd7498d07b2c17b0d0442b  smmap-5.0.1.tar.gz
-sha256  dceeb6c0028fdb6734471eb07c0cd2aae706ccaecab45965ee83f11c8d3b1f62  smmap-5.0.1.tar.gz
+md5  1b691646da8ef92e9e178bd9b23c2540  smmap-5.0.2.tar.gz
+sha256  26ea65a03958fa0c8a1c7e8c7a58fdc77221b8910f6be2131affade476898ad5  smmap-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index e43296912d..23517c3958 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 5.0.1
+PYTHON_SMMAP2_VERSION = 5.0.2
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/88/04/b5bf6d21dc4041000ccba7eb17dd3055feb237e7ffc2c20d3fae3af62baa
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/44/cd/a040c4b3119bbe532e5b0732286f805445375489fceaec1f48306068ee3b
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
