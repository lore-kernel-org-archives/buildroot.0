Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B5FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6614C404A5;
	Sun,  5 Nov 2023 04:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6614C404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I89tKjPJhXQk; Sun,  5 Nov 2023 04:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40FDD4042D;
	Sun,  5 Nov 2023 04:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FDD4042D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E6C1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1FA414C9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1FA414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sM6dxiiITpVS for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:35:12 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB96441499
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB96441499
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7a68b87b265so111644639f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699158910; x=1699763710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bul+mYaStSl6PXs3CwfX64Openp5rFboqzookQw14w0=;
 b=uV/k7skhVrfuHOKrQYIAYIkra3CXLvZ6/D/kDBT5Ygfm2+5EqL4eTFSHJwnPjDrg7/
 iZpOFjNP01DnSJ/ukpGtWfkmNScL5yuJ3vw6sdY2QKlJAXarYlY294TtiN17pRXSPv7C
 gDqbRaReion10opVGZaqYWjr0gNqJGCZVSDCTjFLpz2OXCS2bOeL+IT6fkKCT9bNGtoZ
 51cHbpXJvFg8o9EB/XbzIOueaF/URyW2DKIpQ5UuCENgorl+BIRXXnduhERT0AuXIJFp
 aRsT2ASgAjYbtMMW167wMvFYqVlWKjI9eOPZfAiOPGgO59ScMa1TadekWhVw3wCszlcU
 3y0Q==
X-Gm-Message-State: AOJu0YzwQABM9lvIndpIusJovC3O00ZqMZQviNJF+sHFG0QcRe0Rx0vU
 5A/o8TtXJAZSHqsmqdOeiutTIF1LAyg=
X-Google-Smtp-Source: AGHT+IHMuM4tI/kJ691DrfmtWcweM2VAaGWI49U5D+lAYzPRmP9bGxupnl32CfufjDDI4J7LIwNK0Q==
X-Received: by 2002:a05:6602:2acf:b0:79e:4abd:7be3 with SMTP id
 m15-20020a0566022acf00b0079e4abd7be3mr32661475iov.15.1699158910463; 
 Sat, 04 Nov 2023 21:35:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 f4-20020a6bdd04000000b0077a1d1029fcsm1584348ioc.28.2023.11.04.21.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:35:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:35:08 -0600
Message-Id: <20231105043508.2812013-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699158910; x=1699763710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bul+mYaStSl6PXs3CwfX64Openp5rFboqzookQw14w0=;
 b=b0pUweTprvxtoqY4nwwFH3OUHxShCpUtB4t9tytOpd0421dfqxPew+vVDuoSQlccVh
 vZe+LQZ5lqWtzPy93FsQVj6IW+HVABCftmKgWyvZbHO6b/g03/9ty7ZgBbGQLCsJBv83
 ym7wFVKMN3ThA+IeUd2k15rwUqEeB9y9FzB6Vdr6GzpneoiKJv95TlST4hn/sAAgoaZI
 eVSDTEP+T3E1IgTLKgA8CEMqURuCjEtlyxQq8MfhxhSP9ZZSFuP6Jvri8Kla7SYjjW4E
 2eoEjEHJonJWhNmOhKFYJd+/9B2v1SniWOus7UGLDFNpYZciXcvHZeElbpqDJEAIZVll
 /hPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b0pUweTp
Subject: [Buildroot] [PATCH 1/1] package/python-daemon: bump to version 3.0.1
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-daemon/python-daemon.hash | 6 +++---
 package/python-daemon/python-daemon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 005a969207..695b8fb9b3 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,6 +1,6 @@
-# md5, sha256 https://pypi.org/pypi/python-daemon/json
-md5  b7397fe73d516dc14921500a1245b41c  python-daemon-2.3.2.tar.gz
-sha256  3deeb808e72b6b89f98611889e11cc33754f5b2c1517ecfa1aaf25f402051fb5  python-daemon-2.3.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-daemon/json
+md5  4c369b8c6d3de956d8f9dfb2c872c284  python-daemon-3.0.1.tar.gz
+sha256  6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5  python-daemon-3.0.1.tar.gz
 # Locally computed sha256
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.ASF-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index aa8019f4be..f4d4205a31 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 2.3.2
-PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/d9/3c/727b06abb46fead341a2bdad04ba4a4db5395c44c45d8ba0aa82b517e462
+PYTHON_DAEMON_VERSION = 3.0.1
+PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/84/50/97b81327fccbb70eb99f3c95bd05a0c9d7f13fb3f4cfd975885110d1205a
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
