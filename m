Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D56C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:26:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3EC61042
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 14:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F3EC61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC394043F;
	Fri, 13 Aug 2021 14:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wia9KOSY1gFd; Fri, 13 Aug 2021 14:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA66640465;
	Fri, 13 Aug 2021 14:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 244281BF2B3
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBAB401FC
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fiLmg02_gai for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 14:26:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C2C1400EB
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 14:26:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z9so13470034wrh.10
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bAKt7Lgk0508tJbvs9pry5vFuVHqrQLTFqT0e108AmM=;
 b=WmO2UOp859Nub6blKO7MFLbjRDbeIeuUxw6IXMJtwmcbz4KDMeVtnTgGTWhX5vxsPx
 J1yMiAxBjj/y46b28xqXW+6JiQiMJrXLoL8hXzC9O1h1faLj7UDQhs6AYYWTcLkwqmHx
 kEp37swfgP87q500CAtZX8bUUinViezDxQkieL02jyYyUiAIhhwz/Uzi+PGLYi7no8J8
 AbU3Mk0LzRs3lpJGFbVROlBjfuMm5dplt6vCHYvsPpitIID09uleyvMZRQgErxI7cwTG
 z+xIJESUt+PgbVzHqBD13Yhz1gDG02kUDMne2Vo1oQY7xbqQ9L62yCSQJl5yqlKrVwP/
 8UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bAKt7Lgk0508tJbvs9pry5vFuVHqrQLTFqT0e108AmM=;
 b=m8jUoIpkl1CFL6QE4veX7N1hEwcCeJX4T13cZuts/QYxkZgomAEgQsKphEY+0ntMtu
 XR/eMnnUdE7lxbpj4hEbxaQjCV0QJq7TaU1Ccrnpusoxrn+F/4mkDjsMIvZHpb7+pqD9
 9rOFtj5KHiStG+4w/LZHvu2XGJHZL8kPRsZ9nZQBSES1dDH5KB4VyMcBBsmlKxpI4v1Y
 F2NXh4Fu146iCZdPTHMVIaFysxiMW9O28lHfKY7ftC0XHatzhtOoq3ZmQemYo2YOoB/Z
 DSpbzAtfwHNBeH7x7TrYx3JXWaOcxXtW5hKEi12wAmYuj0nL2TWPNKU/Qv04r3ofYL3s
 WkuA==
X-Gm-Message-State: AOAM533fa6TPljhFGsKeTsU9tzL5Jthj1oEN7Oj+jaHGQN9Ut1XDtE93
 PR748+w0afNMY4QsLM5F75CBWDV2GlWMWw==
X-Google-Smtp-Source: ABdhPJyhmsln8HZmqNIJBQ/6s1r4tMhbvEuYwvsS29c/O58IjRMITztYQIBYQLz0uCVigCtP8v9jRQ==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr3427400wrq.377.1628864799311; 
 Fri, 13 Aug 2021 07:26:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id k14sm1384021wri.46.2021.08.13.07.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 07:26:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 16:26:26 +0200
Message-Id: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix build of gdb on riscv
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of gdb on riscv without host-gdb is broken since commit
4ecd247ead22a6cfb87a4ffafc4be05201328aef because BR2_GDB_VERSION_10 is
never defined if BR2_PACKAGE_HOST_GDB is not selected resulting in the
following build failure:

/bin/bash: line 0: cd: /tmp/instance-0/output-1/build/gdb-10.1/gdb/gdbserver: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/ce47d616ee79d5f735779570ebc3b4a9c0f64c6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdb/gdb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 17e10e8b16..152ea16401 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -29,6 +29,12 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
+# recent gdb versions (>= 10) have gdbserver moved at the top-level,
+# which requires a different build logic.
+ifeq ($(BR2_PACKAGE_HOST_GDB):$(BR2_riscv),:y)
+GDB_GDBSERVER_TOPLEVEL = y
+endif
+
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
