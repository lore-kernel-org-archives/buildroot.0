Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92977C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5880960F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5880960F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E646FC58;
	Wed,  4 Aug 2021 00:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaAiCunPI9Qg; Wed,  4 Aug 2021 00:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E56360B3F;
	Wed,  4 Aug 2021 00:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3FBE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A088C402AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQ8cCyHgUSc5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:20:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C47F8401FB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:20:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso2587289wms.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIXkzFB9Y8mfQMhPLMxYDp429NXwfPr8GQClw69+VLQ=;
 b=VfsR+aJ15IkWUD4wgl+4oLqio1DD54RQ24tkQ7nSbCABGiP1PYwl9Yqv2lOl3lWFjh
 BWBQD7bV74ADntTfdPJHJCVF9NRo+cOpySy1tnZQTp3g9NHo3YJFHBkZabDY8YdcUbmq
 qyhBcbkTCKs/UPeqTRZsJTexZnWaTrgQHq4jnRpNbs7otzSr+qECiDeMf8bMVIVKpCOi
 uyV+57JlTtg+jx6hxEYtS4LC0UH79K80IgrbI0vm9szw3RCov6nfwKOgRTgO55TnRJrs
 1kfoqqI5bRazOZJtFQsCCmIUj+wf1FnMGJKW4TlAEtGWAs1m/18+YPw2ZoNwHED9zzrl
 vtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIXkzFB9Y8mfQMhPLMxYDp429NXwfPr8GQClw69+VLQ=;
 b=mPns4QKDcttrsna9glCdZxOosczoTbIHBZKrc42jOqZItIeMkeZ8WzSj/pE3uJdDb3
 hFWGWfcftuf8H7W/ELfvE4qxlX75FucGMk77n/2fxUn3ruS/FDebH2JgkTX6QuU1gFnQ
 41BwFF2YGpxd1RtrbWh9O5Tq9E6JG+9n7OUlcybX1DXgD96catJfJ3r2rU/jhCu9vbHB
 KnDdvwWTe0gqD7nKe9OZo7hp0X9k3C7Do30uogqjsCJiK2WK9HeDODXojNekhn4hMZPN
 C4EpdW5qOAeWSNvJgXbE5EbcLS36Atfmbc3c7Axeb0FYrkrLjsUbMMzWSBDIFIwmc/Qn
 gkNg==
X-Gm-Message-State: AOAM530zXlZhvYDL5l6xl2wx4yJR8fYsvljfNjPAxdz+0X5PGWzV/qv4
 DDKAaycl8qfbhO+uI+wVlq7msbjpowWz2A==
X-Google-Smtp-Source: ABdhPJwB00LqwcIQqVSiyf3anu6aMs/Nzy2R+WlVpmwsu6s6ptOLxvyDXOhHtv5dRhJrIVjy4Yk/2A==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr6266638wmd.141.1628025607774; 
 Tue, 03 Aug 2021 14:20:07 -0700 (PDT)
Received: from kali.home (pop.92-184-97-75.mobile.abo.orange.fr.
 [92.184.97.75])
 by smtp.gmail.com with ESMTPSA id p3sm3669478wmp.25.2021.08.03.14.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:20:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 23:19:56 +0200
Message-Id: <20210803211956.345316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix static build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix static build failure raised since bump to version 3.33.1 in commit
a9e405b07976815a5b7202a5fe50c8797e754178

Fixes:
 - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ules-diskq-dqtool.c-fix-static-build.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch

diff --git a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
new file mode 100644
index 0000000000..3332b12e9e
--- /dev/null
+++ b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
@@ -0,0 +1,33 @@
+From 04c8fe720d09bd6e53c4bcea9ad72ff131925ce6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 23 Jul 2021 18:41:29 +0200
+Subject: [PATCH] modules/diskq/dqtool.c: fix static build
+
+Fix the following static build failure:
+
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x2c): multiple definition of `verbose_flag'; modules/diskq/dqtool.o:(.sbss+0x4): first defined here
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x30): multiple definition of `debug_flag'; modules/diskq/dqtool.o:(.sbss+0x8): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/syslog-ng/syslog-ng/commit/04c8fe720d09bd6e53c4bcea9ad72ff131925ce6]
+---
+ modules/diskq/dqtool.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/modules/diskq/dqtool.c b/modules/diskq/dqtool.c
+index 6105f2ec68..50be452453 100644
+--- a/modules/diskq/dqtool.c
++++ b/modules/diskq/dqtool.c
+@@ -49,8 +49,6 @@ gchar *persist_file_path;
+ gchar *assign_persist_name;
+ gboolean relocate_all;
+ gboolean display_version;
+-gboolean debug_flag;
+-gboolean verbose_flag;
+ gboolean assign_help;
+ 
+ static GOptionEntry cat_options[] =
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
