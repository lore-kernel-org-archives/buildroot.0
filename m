Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F59C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9619281767;
	Mon,  9 Jan 2023 05:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9619281767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFaPp6714RoM; Mon,  9 Jan 2023 05:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EFF8146C;
	Mon,  9 Jan 2023 05:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EFF8146C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5461BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 760EC60AF4
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760EC60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79E9Jsok0OVA for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8164C606ED
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8164C606ED
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:07:49 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id i83so4022205ioa.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5aj5BF1pcK3X6NrzQ9SsoSuwzDGcRu8bQBxWSUv3xhA=;
 b=SIIjEcX2O5CKb0Dr7oJ6RhZ+EQgKMsiHyWdCHjjd7InHwrXpXINfL7blXTdtMsXEMA
 eOU92GypGYGhXO8mXJ9sX8uQXSoslVN8dV1V0d//ADkVufnGD76vgorprw1fkpmw6/2F
 7+5zD1cGEYRswNxLGVQCj7LGNioaMi9SN3SQB3lf/bMq4l0kf0ou7Qv1Gdn54XwWS0MM
 /Xk4E1ZR5qSVZZoDDQCghF8pW/g/fdeOh9tHYgk+Zer3cy3qvEWokvfwaxvnOm65d5Vn
 haaDYJywnsezOlRChrZfuTqrAz9d5VRkOgwYuz8SM1ZUzLtOUyDIjTyxIns8v4oegPfc
 5kIQ==
X-Gm-Message-State: AFqh2krPjtTgNB6iGcBDlGsP3aZk66Kslp+YOSTV7hNiOWDU8Ne39SHO
 1qaDDAQrzkvCtArO1gS+0mVLjIEFYiIJm+Y/
X-Google-Smtp-Source: AMrXdXuXl9gAPoWSRSzeGzomigrocw4JkjRkM38+vC0D1h1c1yt9lDGJkquv+sC5RqJTUdcZYXYLuQ==
X-Received: by 2002:a5e:a707:0:b0:6e0:7dd:5976 with SMTP id
 b7-20020a5ea707000000b006e007dd5976mr55435695iod.12.1673240868473; 
 Sun, 08 Jan 2023 21:07:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w7-20020a0566022c0700b006a49722dc6dsm2880986iov.11.2023.01.08.21.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:07:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:07:46 -0700
Message-Id: <20230109050746.2539771-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5aj5BF1pcK3X6NrzQ9SsoSuwzDGcRu8bQBxWSUv3xhA=;
 b=XTat1OdcdoRR+rGdGtTSKY2kgywirHnieee9MiW/sH6PtD68XYAzs9Wbg1SMd2cqQE
 efkSf208Kx2cGM2sfwvivby4dq2yMcN56T6S2qmXBPWDpEgp7tuaMZ6xfYBh+typEpp/
 5oBklX3wh8If2d6B8849lhjYifcIp/lcTBaZQaelKq2f8EuXo+5w44CMOPvXyXoQHbtV
 s+jIx1NmScc3QJCcW8zcs8qHg402R49WDbnmKk2Gao11DSIXdVhdsGayjSPARf4V182n
 QXyovUYE9ploCxXjxrXIeOqTwWrE9HLn1ahe644wYHcOiAHsvZscvtDMfim+itRLC8vs
 zRYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XTat1Odc
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.14.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 610acb96d7..f7396cb3d6 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  6ccae578d28d18968b30a4711652fd9a  Pygments-2.13.0.tar.gz
-sha256  56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1  Pygments-2.13.0.tar.gz
+md5  447be4afb076c8325a7dc659aff5b931  Pygments-2.14.0.tar.gz
+sha256  b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297  Pygments-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index c09350c42b..9c4f0be6c8 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.13.0
+PYTHON_PYGMENTS_VERSION = 2.14.0
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/e0/ef/5905cd3642f2337d44143529c941cc3a02e5af16f0f65f81cbef7af452bb
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/da/6a/c427c06913204e24de28de5300d3f0e809933f376e0b7df95194b2bb3f71
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
