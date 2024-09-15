Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7149DC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18DDD400D3;
	Sun, 15 Sep 2024 07:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EsBRb_1Jqo3; Sun, 15 Sep 2024 07:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89CF4028E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B89CF4028E;
	Sun, 15 Sep 2024 07:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4301BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CF89607F7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b9EGFKpR4KC for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C35E607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C35E607E4
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C35E607E4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:03:42 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so10414325ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726383821; x=1726988621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jRsdh2MvIkwN2GWvSau5vonYIFCd3NAHn5t9gMyGXI0=;
 b=LGernhEMjpR6XAYmTkEG9DVoB42iRXPpX7/laZuMdwNRXhXoM2Fljv6yas0MhDAMi0
 gTnUcw7LHQ2p69hwb+4zPQVMAPtXNVJfLzmgNDhIhJicA0K1PIoWdJkqDSb+gwCWJEXT
 yMSVM6vYUK9GpmwFZ5nuUcOMtdD82KtLUXrVYfIc4qijkegjXfvgwIi5DmSlmdGowGE+
 u1RIU30hKnZilbhLhgCGRUtrQpbI+FVBfYyDiePJhKSNbeHefpIxPMKl1jAAbHzmKiLV
 kuMrVqFehH1B1caCJp0L2b0LEblKERwPzxRPwsQUk4yq8U5Z5BsiT8BIxpEmlSmqtIwk
 1M3A==
X-Gm-Message-State: AOJu0YyQpLb4GIbwcGyDeC/pgi5VvNWjfYTim5zGNBsV6Ggwd/yBDT4z
 AYV6pkOphbHJzExtKBVb1wiqxFU/+P8BfUEnPeEnI6ZLW19LL8NzwwXI4w==
X-Google-Smtp-Source: AGHT+IGVU8VKJkPoYmGQV3JAXd3EjbKB7+jPWJdbnYwHmspHsLuD52WVRGh65skErrfNnX5vzvllLg==
X-Received: by 2002:a05:6e02:17c9:b0:39f:558a:e414 with SMTP id
 e9e14a558f8ab-3a08462980bmr99255305ab.7.1726383821069; 
 Sun, 15 Sep 2024 00:03:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1bfb7sm8874115ab.51.2024.09.15.00.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:03:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:03:38 -0600
Message-Id: <20240915070338.1537430-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726383821; x=1726988621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jRsdh2MvIkwN2GWvSau5vonYIFCd3NAHn5t9gMyGXI0=;
 b=Enr4bf2XlFKD/37waESHYRM11IfJXvXiUSrrdObF6IbyKNnz+LS12Goc+OTFV6unCB
 njGARIqoqEmc62IGd8oZ+1cv3gVW3WL9dWY/cgbglCNfR6XLALHuI3orb2nmrKbaZCVq
 gYamkwgvtG48FVfl2KPyTT5SSvazWO8M0745ms2Wf7Joga62/GsOP+Z0jXvJ4+NbHAka
 qTu5If8AYvLYubsbMQuK7pmjbOSBdZHPCH8mtaVNEP7RcVv1h3yHZvAoKgeDM0eY3UFm
 cJC1D7mdQEFGHrpMipizPpxiLTJio656zOVfqEKSbF2UDaO2iNXmbFqxiAVwRzcI5TrN
 m38g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Enr4bf2X
Subject: [Buildroot] [PATCH 1/1] package/python-git: bump to version 3.1.43
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index a979871796..44b91662dd 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  db4f2a27c8abc4a7e25504e3aeab4a84  GitPython-3.1.40.tar.gz
-sha256  22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4  GitPython-3.1.40.tar.gz
+md5  350a6dd0d1d560e0af82733592e8dbb3  GitPython-3.1.43.tar.gz
+sha256  35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c  GitPython-3.1.43.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 91d6b07ab1..9975af9198 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.40
+PYTHON_GIT_VERSION = 3.1.43
 PYTHON_GIT_SOURCE = GitPython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/0d/b2/37265877ae607a2cbf9a471f4581dbf5ed13a501b90cb4c773f9ccfff3ea
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/b6/a1/106fd9fa2dd989b6fb36e5893961f82992cf676381707253e0bf93eb1662
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
