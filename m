Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8A0C35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63752600C9;
	Sun, 15 Sep 2024 04:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVlQostcVfLe; Sun, 15 Sep 2024 04:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7041B605C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7041B605C0;
	Sun, 15 Sep 2024 04:17:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 772931BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 654A740137
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmuYfqwHFmdU for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B5634007B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5634007B
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B5634007B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:17:20 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-37636c3872bso7718085ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726373840; x=1726978640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tHFxzFLoSXJvB7hn1BFLZHVgmuI6XD6aihy9K9ZPNtM=;
 b=fvQBfOW1N0W/hdgXT4n9f20uXaqMwp1RIDbSlusSrb7ogWXBSJWiDyae7bir9hxAJJ
 aZPadq6qLmFdDf0+DIg0hSHnWVUOEDM0WkkJowfdq51uEKyHWODjIiaoZPQ0K5YuurKN
 Qy6R+kmq509q6RrzA68oI9bFtKxJ9ZZGMNjGmyFsrxIdJBHZOxzlTNArXQnVo7vfdozm
 gbu4Wo8D6/MJdLOtiyiff7ENYwK11rZIAEEr5QupQbcmIQsIDG17y2RSllDr0h3pn+YU
 iGTzibEEnJPzjV112eQVQanKajqS8Sh+0KX8qG6BJSyiznxLOzDSFOdBFUiUMG9cTTal
 f3aQ==
X-Gm-Message-State: AOJu0Yx23Agky6jks/bt+nghErAkeyIiGn6u4TdSf+KtRcYsz4q2ggWt
 01cKkdGzQZrMg/LonjhHI5A/zcYuPTC5ltWkx5gPB8FQiw1wEj3SZA+Plg==
X-Google-Smtp-Source: AGHT+IE1GQDCruTQ92r0wYP6V28lf+RbbgAGODpoi9gD+j4UfjzpaqAW5XtLLUXxzlv1brlzpwUN9A==
X-Received: by 2002:a05:6e02:20e4:b0:3a0:8ec0:2f22 with SMTP id
 e9e14a558f8ab-3a08ec03144mr56775775ab.7.1726373839480; 
 Sat, 14 Sep 2024 21:17:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13db4sm737781173.109.2024.09.14.21.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:17:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:17:07 -0600
Message-Id: <20240915041707.1390172-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726373840; x=1726978640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tHFxzFLoSXJvB7hn1BFLZHVgmuI6XD6aihy9K9ZPNtM=;
 b=XWaxbk+h1fvHbkzsEp+QihUvcxAQ3Uh8tKAkSnXElcGx9IYKU7FfSh9hwxqnK+LuxF
 Aws2OcLzbxJ6cTd4uxaIAKlYfecSFEOt5/yax9c94shX9RETh596D2o9rm2AySbOsezE
 4Lw2ihpjp4+h9lcD5+sPdRFy+UAS6YAZTCJw6/3Pi+AZKr5g74ppsj1glVE657y5OfX8
 De0skLgNJBfA4rY0gJdvYBoE6T/zVOvwg2s5aSmjUEtt8JAm3tMZfaOGXtEXhIa0F1ol
 H0GYZAUCyAGu+IL8WoiforqcfXyq4DpSJwaDo08613USX9PawFNTzig4Hm3suXmp5KhE
 xGtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XWaxbk+h
Subject: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 3.2.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 10ba469d5a..141d075851 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  1675bdeeb821441b8b4c35e0a7ba861c  python-crontab-3.0.0.tar.gz
-sha256  79fb7465039ddfd4fb93d072d6ee0d45c1ac8bf1597f0686ea14fd4361dba379  python-crontab-3.0.0.tar.gz
+md5  7ff9f13749104faa73f353a0d4ae9087  python_crontab-3.2.0.tar.gz
+sha256  40067d1dd39ade3460b2ad8557c7651514cd3851deffff61c5c60e1227c5c36b  python_crontab-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 21a9edef9b..7946f56829 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.0.0
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/fb/6f/14adf2570e83c90f3f5af1af5225a70f914ba9e7ab9d08e675c5f6887102
+PYTHON_CRONTAB_VERSION = 3.2.0
+PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/e2/f0/25775565c133d4e29eeb607bf9ddba0075f3af36041a1844dd207881047f
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
