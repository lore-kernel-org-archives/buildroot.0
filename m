Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D811CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AC261141;
	Tue, 17 Sep 2024 23:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOhB9Tl8omAq; Tue, 17 Sep 2024 23:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AB96115E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7AB96115E;
	Tue, 17 Sep 2024 23:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE811BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07B1781E1B
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hw-FuIf0JKq for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1480C81E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1480C81E19
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1480C81E19
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:30:04 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82aab679b7bso201936339f.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726615803; x=1727220603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kn/4ad+WvI5+n5g35V0OSp5AlXwY+C1iMBssv//6myk=;
 b=rX+6mIWUUP1ygyyc1Y9Ep1v0ANqOCpF5vMbXx8wmGNedP5rdGlPAUVHXHI85fqw0Fs
 XXDg86/D7zZtYPN1SeSqI9SyGV9KnM7JgFNp6WCPkfp5o2P5YhBAPaIMIZFDxb1Ng99e
 b+qqAZVApRXdPxZMvsTikXlwSU3AM99AN6k2zdy+QSVjRtNMKxgnNWqZtFOOOAhl1osg
 3CnWDUZOm9RhvzEZceaFBsV5BRVyGvVM61/BacDrJs1Z57ktdZS+o6O376JNXaxmxj22
 fCJjBSbwJyKxNTzPgYL1qIod4DtlSQDXVknZLWFMZbQa7HvMp1jY6CfokwPq8hviJ9h/
 EqrQ==
X-Gm-Message-State: AOJu0YyKd1SlFH1QZUOWdbi138NKGeaqzWzzd7mG8cmK2EKM/sNBvv1y
 8ak8mJoLuu19MSl4nds3itCIecXHkdSJPAh4h6dOe5hk8WWQFYhOggzp4u/w
X-Google-Smtp-Source: AGHT+IHSbLUUCckaCrHH2ik5lCOrWGPdCH8qGEcoRWyUEMGdLmpTVqcgrioPiMg0uYjmuVtyOqPlmA==
X-Received: by 2002:a05:6602:15cb:b0:82c:d744:2936 with SMTP id
 ca18e2360f4ac-82d1f80b5demr2260013639f.0.1726615803227; 
 Tue, 17 Sep 2024 16:30:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49356363sm227773339f.50.2024.09.17.16.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:30:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:30:01 -0600
Message-Id: <20240917233001.398469-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726615803; x=1727220603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kn/4ad+WvI5+n5g35V0OSp5AlXwY+C1iMBssv//6myk=;
 b=UlGOT389ZSHHwQiN4zZs3sP1Jb1uEYLAi0+aIFPMr3AQuS/y/HRvY5TuwBNbehJ1uV
 tEElQEBAWAfO1syv4Pc9j4BAZEJLzb1hemyZY53ubUIvg+/HyegXpudTy3oyFZFswQLv
 8AeKjEy6oao/MYBS8n23sDlLFLn3Ys/m2iQ2QJdZ7MY5F4rSRr20Z1Q77N5Y09MHTYp9
 T/YOBAUmDNwWkzLOsFzZUjebTXWtHqoWyTJAb4cyetfnxHyXbW2vp2zkKuRiLQS6xUL6
 TVTa4unnlCXnrh7POkZLvxiFAYDW1XiAXq9/95IYrgrj5bOriKeYluadZs7r9NN5mJ+I
 Rg8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UlGOT389
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 1.2.2
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index a4e207e4e4..e4e6a8f181 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  9675d7b278f4533b9b75701e6e87390b  build-1.2.1.tar.gz
-sha256  526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d  build-1.2.1.tar.gz
+md5  f80cc64db8e7fd8f8403a5e8a0562d4d  build-1.2.2.tar.gz
+sha256  119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c  build-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index d8a23ddd8b..9404f08302 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.2.1
+PYTHON_PYPA_BUILD_VERSION = 1.2.2
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/ce/9e/2d725d2f7729c6e79ca62aeb926492abbc06e25910dd30139d60a68bcb19
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/dd/bb/4a1b7e3a7520e310cf7bfece43788071604e1ccf693a7f0c4638c59068d6
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
