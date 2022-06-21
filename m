Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E992419A0;
	Tue, 21 Jun 2022 09:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E992419A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_4f4WVYYrrT; Tue, 21 Jun 2022 09:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E9341993;
	Tue, 21 Jun 2022 09:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E9341993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27E491BF429
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D7060BC0
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00D7060BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkK16MYl3M72 for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 09:05:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2970C60AE6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2970C60AE6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 09:05:05 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso12695237pjh.4
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYZzfs0SLV5uvN3HhOcwOn3eLxuMPu5nSQA8vEED+80=;
 b=fyFT82Ow0gWOvYKUBUfNnRfjehod4PeQklMjH/6cBvobLNFpVoviYmxJsTl6ITqop0
 ohrL+RnZd3yfbXb8waEsso5oy7JJFk3FdJlKTL+u8aQ4bkStW1mC1HD6Lcws2QwI/T36
 SMDpuaLNC7MJ+GHA45LK92x0BnX5PThxGTF4RnKWWqhm29z61AF26fZ/237h9fVHjDSb
 fmaOZrPQlwPO9rV/g1HVTK6H/r5/53OSg8o5FBhO607Xqo6JErQ7NxrW04P6N43lf0ny
 F5gU1/0sBfYORxjkN5IaecHiaDMHv00EX5FSFYYdYba/Q1EJllxUEBAkeDMfdqur8OM/
 1aWg==
X-Gm-Message-State: AJIora8Livwte6PJSGpOQCEbClY2E/d+GUUgfCWrAhubTvh1dY+0HmeH
 XJhICaWsMGXhRAXkAY6kvr+Sr5b9XV9oEw==
X-Google-Smtp-Source: AGRyM1tn554swtoseN6VEr6GVicuc56czYPwn32ydXTeB/1UWVy5X0jRSBmUdmPXZN4CL1xCbs2X4Q==
X-Received: by 2002:a17:902:8ec9:b0:168:c341:847e with SMTP id
 x9-20020a1709028ec900b00168c341847emr27365903plo.170.1655802304427; 
 Tue, 21 Jun 2022 02:05:04 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:e0e9:8c58:f9e2:5377])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a17090abd9800b001ec85441515sm6233690pjr.24.2022.06.21.02.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:05:04 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 21:04:52 +1200
Message-Id: <20220621090453.3078403-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYZzfs0SLV5uvN3HhOcwOn3eLxuMPu5nSQA8vEED+80=;
 b=VlxrMo0AFQIIqpaS5Al8J4r1XPdBCz8/jtgDTl0+PL0NX9JXgx5UcSAnqNF88eWhkz
 KVOaGMNrWmeduZNIj4X6i8L3vIDT61ZdVZBpG0rMPuOHRObDvxAwFq1c8rptfPTFAiVq
 kotcJVKKXwVcA5JlyG+JdMs/q3X8CChTsMIoOwGmG2Z2yR85WwXGWZdQWoKBhSWCpvcC
 Hk0/Tk6Af1QHNkoQB7rwZH9xg0+NaxrKzWAOpBxE0FCRT4ShbJv4UzDSKqSHwBDwv4AN
 phHnAPnzM2kPlaATVS0hIV8ogngTXHOb3cF0W/i2FmXGWx0KyQtGo9S7RyyhCqkrpkmP
 SpVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VlxrMo0A
Subject: [Buildroot] [PATCH 1/2] package/syslog-ng: Bump to version 3.37.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to syslog-ng 3.37.1 and update sample config.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---

Notes:
    This obsoletes the previously submitted http://patchwork.ozlabs.org/project/buildroot/patch/20220607093243.2806482-1-judge.packham@gmail.com/

 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 64ff980593..45b94facf9 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.35
+@version: 3.37
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index ab643627e8..764ff45733 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1d0238b06b3e5987c859e5b529ecee738f75bacff04b149398b1fe8cbb121e53  syslog-ng-3.35.1.tar.gz
+sha256  d67a320cb896cd5d62f24d9e1bec138847fa4618ae13a3946cae2b75c528ee14  syslog-ng-3.37.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fc57a56820..6cad6a5ecd 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.35.1
+SYSLOG_NG_VERSION = 3.37.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
