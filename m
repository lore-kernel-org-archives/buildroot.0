Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84360CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480A080874;
	Sun, 22 Sep 2024 07:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zavjCUd0zX9q; Sun, 22 Sep 2024 07:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438178002A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438178002A;
	Sun, 22 Sep 2024 07:11:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 948D91BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83E0181449
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rflqMurpeiWp for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96FBB81447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96FBB81447
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96FBB81447
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:11:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso176186339f.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726989079; x=1727593879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfAUhSLF1w7lu74hDX9Z4RPTwUwIH3YJvc7Y3MFzTPo=;
 b=eVs5aCly1/mq7q2HaIsJpz2ks+AUEbqu7VrySbRFBS8FLDfzRVhNtwk5ZdwLKkurJb
 Tym7ls1eD5V1WwehYGO0FjfyAhl8a+U9i+ozPVTgcL2IPfsLxkuSHHwqig1NHBdYUsCq
 MoU8+alDKqyHIwhzfB4lFgsEu/fBOGvsvLGVeLTPBmXxbKnpkdkVkCytg8/InomjcbgJ
 TiyRzUkNUc0e86WKQTpZ5522q8DkqMhUgs7kyTO0E1K9PFxuZQ+lI0vAbCF3oyIB+e5V
 KBppFidJ4EqcXK+Z1hkkd71p9SOw/35SGU0fbFqaM4biKBDa/CxJ4nWpUHczMOnuCJco
 wPBQ==
X-Gm-Message-State: AOJu0Yzl780S6tlhtGR/hYo2WkM9ulZIgzovtERk2cCpEeeWazm3m3lf
 DCs8z4DBhBtXCRGMr0LGlraVZ8RXIoIktu3zBGHtJbrcVWMEhyD+1bH5FQ==
X-Google-Smtp-Source: AGHT+IFriBAbTgfZbIW755LBBJQbkK3j/9olBD1u18cHwvzRoR6cIiae2IXfzLFxUpmRQ8cpk8OPFQ==
X-Received: by 2002:a05:6602:6c0e:b0:81f:75bf:6570 with SMTP id
 ca18e2360f4ac-8320b2804camr661836639f.5.1726989079326; 
 Sun, 22 Sep 2024 00:11:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49356363sm477240039f.50.2024.09.22.00.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:11:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:11:17 -0600
Message-Id: <20240922071117.992784-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726989079; x=1727593879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FfAUhSLF1w7lu74hDX9Z4RPTwUwIH3YJvc7Y3MFzTPo=;
 b=YpcFH6uqQCtJJ1/9o18gll83BizGnxAZNRPzIxNVf9NesMj/Z0s1W9LnqlVnF0tMvT
 9rB1KRIfpB/yeglpgj0oEvBiAas9tNchiLDeLeQpjEaTmcuWKHf3g+iIEwhYoTDBHv8w
 3myZ+4DWzthx4+3AcS1GfXHNds705GOymdf8r+n1oCWM37upc9Hkm2RVK8dVjuA1PLCq
 DZYKTqmm+Ei6Iparxdy9aYWjQbT2lR0WSZkHrwCd0QeOdiqan93jDUROcYmc5ulLJ7DL
 OoAhZqLHhB+6I/Dhm2DMQ0lrOX3DjVYj+YzZ1RQcufS1vw6D+gF57DNqninFI/KUmjTI
 qHEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YpcFH6uq
Subject: [Buildroot] [PATCH 1/1] package/python-zc-lockfile: bump to version
 3.0.post1
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
 package/python-zc-lockfile/python-zc-lockfile.hash | 4 ++--
 package/python-zc-lockfile/python-zc-lockfile.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
index 181adda1bb..97f05ddd3f 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.hash
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
-md5  3895445752278ddcc4578658c3c9a492  zc.lockfile-2.0.tar.gz
-sha256  307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b  zc.lockfile-2.0.tar.gz
+md5  5e902492de505a0f98e49b1e31cf2bc2  zc.lockfile-3.0.post1.tar.gz
+sha256  adb2ee6d9e6a2333c91178dcb2c9b96a5744c78edb7712dc784a7d75648e81ec  zc.lockfile-3.0.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
index a4621e6d06..60648afc29 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.mk
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZC_LOCKFILE_VERSION = 2.0
+PYTHON_ZC_LOCKFILE_VERSION = 3.0.post1
 PYTHON_ZC_LOCKFILE_SOURCE = zc.lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
-PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/11/98/f21922d501ab29d62665e7460c94f5ed485fd9d8348c126697947643a881
+PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/5b/83/a5432aa08312fc834ea594473385c005525e6a80d768a2ad246e78877afd
 PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
 PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
