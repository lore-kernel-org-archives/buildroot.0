Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73073C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1A860ECE;
	Mon,  8 Jan 2024 07:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A1A860ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y00EO3-tQzb6; Mon,  8 Jan 2024 07:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D12260E86;
	Mon,  8 Jan 2024 07:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D12260E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5C81BF580
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5FC40125
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5FC40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQPCTTWBM33n for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:07:28 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1988400F1
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1988400F1
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-36082f3cb05so5014265ab.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704697647; x=1705302447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jY7WPzqouCbbGmHsEMwbyLOnzsCwExf3KVPQY7DqiEg=;
 b=iFODnaDujcFMrr4sSw8sjNytnagdHyHuRoUslFi35XQpgJzJ/MlzY4q36g8eqn9r1i
 MqtUhq70jRG0z9lQHsztgqQWVdBUwZgai4IQqQ1V+49jRGrgagqiE2f6c7UODwGU+anP
 KbFZWxow9nvqjEZYWHFvkriwCkluT4E0G00t5nvnkywF9hHapHassKlKl8OCfKT6/POk
 mZBYpbTK18h25RMNkH5lHACbkJm2HwMHQskn0Oc7bOPyL8vwzfnne+2ae6sJiEhzcubZ
 Ovle4+XqYxb8tyl83RVCiiW8wOhihwjF6A+w5USnv3lK1pluSrFyq15Kxw6m9p5mpOPI
 khlw==
X-Gm-Message-State: AOJu0YzxKHeWrgnbUXLt4UES4KbOTz6g9Irq7mS9P1K8RAR36G7Ew21r
 3zt/VTdMgH9Rwl9mTv8lejaNtfzeM7fwDQ==
X-Google-Smtp-Source: AGHT+IEzO8iwDKlnynHkwyrqGZRw7UlMi8rVPbH02RqEfkYube6RYpB4FD5XX6X1XT7+y4MpiTI07Q==
X-Received: by 2002:a92:ca0b:0:b0:35f:f02f:40b7 with SMTP id
 j11-20020a92ca0b000000b0035ff02f40b7mr4249813ils.10.1704697647258; 
 Sun, 07 Jan 2024 23:07:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 c17-20020a02a611000000b0046e1f0f6d92sm682892jam.76.2024.01.07.23.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:07:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:07:25 -0700
Message-Id: <20240108070725.3469629-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704697647; x=1705302447; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jY7WPzqouCbbGmHsEMwbyLOnzsCwExf3KVPQY7DqiEg=;
 b=cQ4/1AYzM88GpJskmbnu7b/RyKT3+aFdTrelIyCu19hBo5gM5HAv4zve5Y706C6H4l
 t6EPXChNFEiYQKTeRUKVEJmr6lFdWCT/uEk0/bb5idfxGZsl9nf6S1NAGO5bWVFHqllK
 MGUgjt0vl+gAWnMz5uu6gvlFUyUdyTNyed3qiJdYsKzISmRt3+s6xDyHyvWvQQGn77aL
 aAYQSbcmdIudNVuRyVtjIB4NmkUENOgKzY1X6k4U/VoWZcCKTcyiKxoypq/0KR/Db9lN
 4xvtA9s5Nen6jpI/Lmgd+i7FsG90vuAthN7A7ZVFPtEMDKtU0pjXuCW0E63kGJlY2VfK
 Borw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cQ4/1AYz
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.14.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 4 ++--
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index dc48831c44..ab4e022564 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  3162229c2daa7c32674ed26f87b63127  Babel-2.13.1.tar.gz
-sha256  33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900  Babel-2.13.1.tar.gz
+md5  3bec3f4c842144c15d839bdde41a44d4  Babel-2.14.0.tar.gz
+sha256  6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363  Babel-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index f8d2ccd258..eb39b9aef7 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.13.1
+PYTHON_BABEL_VERSION = 2.14.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/e2/80/cfbe44a9085d112e983282ee7ca4c00429bc4d1ce86ee5f4e60259ddff7f
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
