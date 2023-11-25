Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D5CC61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D686150E;
	Sat, 25 Nov 2023 05:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D686150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-ES5WcNNFXC; Sat, 25 Nov 2023 05:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECF460A8C;
	Sat, 25 Nov 2023 05:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ECF460A8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E39A81BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBF294016C
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF294016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PYJp61i4L28 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:11:57 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 835FB40160
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 835FB40160
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35ba5e00dc5so9786145ab.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700889116; x=1701493916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2k7i/PtzvaiPLK3HOF6y60QnGntY2teWsGGfDM8MjA=;
 b=FLZHoc0f3yg3Zqr34d2zUFUCkIQXb5agRnpfadYtK0M6KZzInEGfOqcfJK5fE0uPFC
 FWxnhxxJLJuyF5MUOh88NZOYs2Zx7cU0lm5/mqvqHpRY8eCUCysXiRYNqYhT8MzUbMXh
 Kwqz90ElhVVKZWwDh5P333P/P1wOsLoBAm3ixFvnvHSF9TO2vdF8qoVkM1hshyxsK6BU
 vLG2cqvPc0pBfxTEXEdKlHoWAqJUf7ieyfMvxcbVs4ZkZquiWa4BjHyxkipILwesbwN9
 Wlf2ep5pvnC7PA/fzkwm9JG1e/6rEKNoHL+GsGYB9dIR3WdicFB3+2ixbg2uCOwxi8WG
 Ty9Q==
X-Gm-Message-State: AOJu0YzYI8FmvFGMWQnaEGu2WHNMQnm/Ieyb6k+zaNzlqKzq9vqgY9Y9
 joy9yZeRjvJxuhON++PHres8uXtWEPM=
X-Google-Smtp-Source: AGHT+IEISA7BmDHYe+cpGq1ZHc44YchDCWqEG50A0jg3T80HcMEyX9wmbVaj7QE9tO47KIZ7191yaA==
X-Received: by 2002:a05:6602:2ad1:b0:798:2415:1189 with SMTP id
 m17-20020a0566022ad100b0079824151189mr398774iov.12.1700889116045; 
 Fri, 24 Nov 2023 21:11:56 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v21-20020a6b5b15000000b007b36f597d4bsm1144234ioh.37.2023.11.24.21.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:11:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:11:54 -0700
Message-Id: <20231125051154.267065-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700889116; x=1701493916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m2k7i/PtzvaiPLK3HOF6y60QnGntY2teWsGGfDM8MjA=;
 b=E1lWRRmG616y55xEr33fdMMtp+3MgVAIVYDQQiq/2qljPI1PhCd7OVdvsUxpccmgoK
 IsG0FsaMwwbxT9uyncfsONw4HN4ISKT+42+HxTmF2XiH6jLKkyGzeGj9Xe5ehuXD7UD7
 h5Ou21n7ZEueyEbUZJMC/wMQU3cS2uTcWMFK1t1eqUnhnJW6Sx+VXLsNRF8+AGy+ORa0
 9f00RCsCnqam0rUndquIxYidHFvdhCzYQF7UzmPy6KgiYsu1JtX4uY3EmGwdkPwf5N68
 zgIcdR0y+GTnRzLxyj8BCtzrBMY7RWn+3im9Cn/aK5IfoK++zk9XaDrroEV49wIrrXT0
 6u3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E1lWRRmG
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 3.2.0
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
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 828236304e..4442d82ac1 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  541238984572fb21db2da2af1d70a993  pathvalidate-2.5.2.tar.gz
-sha256  5ff57d0fabe5ecb7a4f1e4957bfeb5ad8ab5ab4c0fa71f79c6bbc24bd9b7d14d  pathvalidate-2.5.2.tar.gz
+md5  2a76cbe4e08f58087f418d150a1461b5  pathvalidate-3.2.0.tar.gz
+sha256  5e8378cf6712bff67fbe7a8307d99fa8c1a0cb28aa477056f8fc374f0dff24ad  pathvalidate-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 6ca8c0f2ad..243f541892 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 2.5.2
+PYTHON_PATHVALIDATE_VERSION = 3.2.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/60/f7/ff244fdd8ed98e98d4f9acecfe74a890e5e3245ce55253ef88db51e94652
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/27/93/e2b086c7aba96c70b5e7ef48251702fb95027638fb5a3e787d2efd65783e
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
