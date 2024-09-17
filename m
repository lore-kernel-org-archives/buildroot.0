Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F142DCAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3644608E8;
	Tue, 17 Sep 2024 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7P7J5msABTO3; Tue, 17 Sep 2024 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A108A608F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A108A608F1;
	Tue, 17 Sep 2024 21:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 207731BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1094026F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6-hxRPLO1J6 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:38:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1F8140118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F8140118
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F8140118
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:38:48 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82fa0ccb0cdso101393539f.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726609128; x=1727213928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JWFf/V87BP8s+bmhNgC+evslRR/CnVlo5Ik+BFFkf0Y=;
 b=Ptlgy5Uy6qbs70KrrFL2EBqOHOKSC8DujbcSCqHFEwQ3HvoNSXQPnipsRGOTtbHIS6
 RFThIr0WoyxyeNm8lHAaAqm/c3ltrdBF06O6F0gY/yDXyeRwc3zfe9IBIri7Co6Te8vD
 wMG1pngY2WHAcC1HGkpm6JslT74vj6GoZB7avxaz8kiedBBvOXThVp+xL0rTatJYcHCV
 q0o9VSJAfbU1UbGVyaoVQphac8Mdz6aYN1/jLrfQmeG2K65KnWuerJ8G/h3mVzgfiW98
 7DmKUG0n2qBKvgXyGbvWVLjUa0beezNrOimG+hhmQfZM9/k+a3bioiUUgF2NwcuQh08a
 q90A==
X-Gm-Message-State: AOJu0YwmYaCvMfpfTGNkMcFCgJXt9wZdh10fF7NxFk0JIFEcA8bVgtKv
 1kn3PE1U9nZPgeYVtVsMJIonPtn5dXYjyYinSpJ1DuVEZ3s0CTXDSqjTKQ==
X-Google-Smtp-Source: AGHT+IFW6P2luPYD6ynTBus5/ArcHphBkuaiJTi1s8kEhTkftX1OVHwLKLLHaXLQclxRg/CtglT7RQ==
X-Received: by 2002:a05:6602:168a:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-82d37842cb3mr1653316539f.15.1726609127565; 
 Tue, 17 Sep 2024 14:38:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492698e2sm230571339f.2.2024.09.17.14.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:38:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:38:45 -0600
Message-Id: <20240917213845.75584-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726609128; x=1727213928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JWFf/V87BP8s+bmhNgC+evslRR/CnVlo5Ik+BFFkf0Y=;
 b=Ri3gLWykhqjHGxb/j5IGm4sXVWkGQaqHlnBXNcZTq+h26idnly4ABfe6UD5LfdvBOx
 1ojk9QNpEFnuztTx8QQBOZSM2ulUubNscvztLvmCx0GLE0WWtL6CLeLUhKb19/Z7QYTA
 bA7akMdInSX2168V4aUgzMx+ihBh3XQKtufa2Ym/uTTjCihC+cwq+1THkBi6tLqWqUL3
 SkWXE+BZJWe4f/vDZNUIPaYQpoRkdMnehdLt73iZ+2iJ6c+N3FftbWoaVYOHx3UeuRLY
 4TlUPtVtAiO/XPwmnz8R72voDeOekJpkVxw/bTvBmYoZdDU5ZWYwlvTlFx3YLmp8ds54
 FGng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ri3gLWyk
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to verison 0.11.0
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
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index b2dac04516..f3eed45782 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  a3650927d9a84da1dc0aa1d268f21376  pydyf-0.8.0.tar.gz
-sha256  b22b1ef016141b54941ad66ed4e036a7bdff39c0b360993b283875c3f854dd9a  pydyf-0.8.0.tar.gz
+md5  271295d0295c0e5609bf142b851fa266  pydyf-0.11.0.tar.gz
+sha256  394dddf619cca9d0c55715e3c55ea121a9bf9cbc780cdc1201a2427917b86b64  pydyf-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index e9b7d229c7..5566114f8e 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.8.0
+PYTHON_PYDYF_VERSION = 0.11.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/18/dc/b607bbc7c15327c5d5ec25681a3707c847906134925d21a26ec6e7416a4a
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/2e/c2/97fc6ce4ce0045080dc99446def812081b57750ed8aa67bfdfafa4561fe5
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
