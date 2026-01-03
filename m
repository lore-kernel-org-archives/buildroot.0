Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0DFC6182
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265A44066E;
	Sat,  3 Jan 2026 19:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la1glEmHomHx; Sat,  3 Jan 2026 19:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17ECA4058E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767469962;
	bh=U/yCcI/kYFu8QfwwfWTLga/oGOe0A9ZLfbU+3ESMmqc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VEiE0R3uk7eV2UpoYIfvyMbjEPR0m4Pc20QBpAybHHxXQigv4wHEtB2icAg4mevt8
	 2lRfwRy9c4gc3NogyiVdbWjlsz3NBrCFnz4K0BLG5ZNk2nyHGJmNJ/CvSJozNlU9db
	 xPB/KpdRpgRdA2IhpD/PUEiJRaoLO1m4SuKQ6pdubvsNMRUL0kVSnyjL+NObvjYP6e
	 SiVrWoJfNpyFfWI5GWnx+VcTROdS+R3H7yCaUDY3HFwN/LCqrTzxrio17+pl/0YKLA
	 fzGuxlcYmZ2kD9fKLEa/FnS5B4f+cqvSOEqQLNl4q4Kz9a3chUvOzy3L2u/EXR4bf0
	 gMeoBcV6nfjng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17ECA4058E;
	Sat,  3 Jan 2026 19:52:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E1E249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDAE2400AC
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCJkCPjiWyVy for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 19:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6D1A40098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6D1A40098
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6D1A40098
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:52:39 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-3ec47e4c20eso7989233fac.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 11:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767469957; x=1768074757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLTfH9rrE4w7Neia2FqUby6CblRIOuh2BBilyeYGG1c=;
 b=PdH2Jp3fI4RudoPfnjUUWmRw6Q47whBQzxwLChI+6H1fl5upzXJJaqARwEHGZ46wti
 EQYFjr4atvXxK+EAAuX0fxYaUwHRbk5TCjdlyuxBkJsIR3cA9iOb1PBKFgGr9Aa/jRqS
 k1ljVK5uGS+gvMqeVDRdb3w9GxkUTojTz41sCjvkxFREpqfxz6Tm8HvisuSVUtOa64c6
 oeqpZSbWXUCRuAvxY2OPjQhQ2EBTb43wh5rIVdOUcEgMIWYCsJFH9NzTNpYH2dhk94ux
 Qi3qMCwMcewyVVul1GO1+QTVZGuHSPeb3O6y7lKgashtS9gPqglWALgdaNIxoeV2pRaV
 toAA==
X-Gm-Message-State: AOJu0Yxgxxsd/KiZY6hik/q9EwpQxmoHUMmMxpCXdEj1a0XRo05BBwfj
 8zZE2d3Hq1JMaAJEeoxVR9cGToDR6IQHMQtnw+pZUK79xbrbY0cdDLuAutQmpZI6
X-Gm-Gg: AY/fxX5szPjNLakg+oiUaLBZEyVR7uevsKQZBMXzMK+7Q764pZr/8PK/1ERIyZrtY7e
 qvq32X2X31pLL6+kZKywdL2kqSDWnNcM7jAdqE6w6Bx87ClPRuhlLIORp04BzgXT09ntDhsVPj9
 /oqMlQi/HlyYp8cZq7nrMQsc4nUVIKdBwYh1fhX9vyoYfGWzzfdhGfM6iZvkOp360QM5975wVFc
 IAc4PvQUQACwnJpYJhfXLtDai3U08FZD0xTzEz+xHZ+uZc279JB9HMfJwWjGlnZ1TzCuD/K8pPU
 h+0RtZQuQucw0488lrpWOHYhstXs7ipRQLVkqd9GnXwk/7vt+Grj6HIEhjhjlA7R6NJMLLJ3UJb
 U0mNuv59bHhxmcsDC5putyvNiByYJKW5OWvCA9ZwHxWdXrvoHHLXZ7WizO5Bs91YwYDHYMXrsrG
 HMdKv6VXlkCbf6vsftR266yp027uthFg7Cx0Ci406jslwYUT48sTL4/evQF1tnif4g67c/lqV3k
 qJdBziJEgofGzk/SnMrtwCyMpVzgzI3Nm5ywpJugLeBMIcFqyinmtY=
X-Google-Smtp-Source: AGHT+IHsLe0SdTW1Ul4g3JoV3x3iroktnijytB9H4xOTp1TrHha8ohHklNDks4yadM9eWTvY1QCtkg==
X-Received: by 2002:a05:6820:2916:b0:659:9a49:9024 with SMTP id
 006d021491bc7-65d0eaff132mr15800440eaf.81.1767469957569; 
 Sat, 03 Jan 2026 11:52:37 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f3f9d15sm28116109eaf.4.2026.01.03.11.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 11:52:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 12:52:35 -0700
Message-ID: <20260103195235.2281048-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767469957; x=1768074757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hLTfH9rrE4w7Neia2FqUby6CblRIOuh2BBilyeYGG1c=;
 b=VuFuvB/t4uEoGivAlVVTw7NNOFJdJjHUFisHQ42SWYXncUkVSRfCpY+TU3SNv/vX5O
 +VdDf8vRE53vVTG1wfmYLS+TqebffSO05tSqOZH4pBzKYXyv/unMSBa08MoFqxLdJ3mq
 hJ4e5YO0eJrwJzIAZRJ31hCtxVzmop1PrctWBOJmz09gFg2JtTjoqSKpNobxw+eGEY3I
 nkWtnK96brumkv6N1Sub705EqBc27owbxrtcyIIh82NOozx+K9H4vMU+f7rMZ//29wCD
 sS8R870jjYCoFfhxvfwlBp+RNlDC5nu+Qme9ZLvZOLxWDakRr8ftu5ar8iy4pGuRr36V
 JJBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VuFuvB/t
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.20.2
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 30bd3b1c97..64930ad418 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  273703b56caed22470cda2a528182fef  filelock-3.20.1.tar.gz
-sha256  b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c  filelock-3.20.1.tar.gz
+md5  c422db4828e34fcadac68449fafd5cb2  filelock-3.20.2.tar.gz
+sha256  a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64  filelock-3.20.2.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index ec958869a0..83699377e1 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.20.1
+PYTHON_FILELOCK_VERSION = 3.20.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/a7/23/ce7a1126827cedeb958fc043d61745754464eb56c5937c35bbf2b8e26f34
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c1/e0/a75dbe4bca1e7d41307323dad5ea2efdd95408f74ab2de8bd7dba9b51a1a
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
