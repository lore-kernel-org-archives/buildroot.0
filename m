Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2729DC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3EB402D0;
	Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ixSDU3K4gVY; Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F82408C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F82408C7;
	Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAB581BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B492E81375
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVgy9UtiULe5 for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8A208133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A208133B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8A208133B
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-413e61525c2so5494185e9.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321262; x=1710926062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHzp0iuLy/KPQSvilGPcuVm8H8OddINV+RY/VhSe5eg=;
 b=rO0Zx/lJ6q2mof7EvrWmmGSpUVa9zioRkeqOA7Df0C6KhOOi4XlsaLtJZMfGUbcqkM
 Luu5XksWYunbFlXonx3XKSJ65r8OMPQ9uFdBXFvVs1ccinya4fOT5EX2xqBj4zKN6QJ2
 WcEB1fqgvaqXMNn/nOSjKAJ54MsbOGrE1lxyYE7cWWXSnXqZe3Jcz/bJZsGCOWMTLUqa
 jgy86GgFhdFR86cH99eSz4sVb2I7QXSgqHha7WgtnoDeGrZvTZmofNa0FwaujZU2s4py
 Pmikks1ISo6spzJjiBesfNtp1uPcjLXf81/q/kDZNB4/1v5mFGBCsxlI3XCzO4UCw27g
 U4iA==
X-Gm-Message-State: AOJu0Yy34TU+1uEBMtLTpGK+iQQ0FbDi5sRtdmSx9FFLYlTczpP2M4CZ
 Y6Cr+gsZqd0XKRgvdgRMu5nQe9dzsQ5ff8Eil3f2omsM4q2ZK/sErqTs5qX3gu8=
X-Google-Smtp-Source: AGHT+IH6c7k6C+v2mDF/5JS7+QCxDJbm/+dfNuZhSw23+MmSq2GinpEWpB1oseg8kqKBKeaNV2zO3w==
X-Received: by 2002:a05:600c:5406:b0:413:e85c:e5ea with SMTP id
 he6-20020a05600c540600b00413e85ce5eamr1047547wmb.0.1710321261495; 
 Wed, 13 Mar 2024 02:14:21 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:21 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:42 +0100
Message-Id: <20240313091412.20865-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321262; x=1710926062; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHzp0iuLy/KPQSvilGPcuVm8H8OddINV+RY/VhSe5eg=;
 b=Fwr+2JWkZKTFHUhLKASpzOig9chyJGqoanodSxcV1WjnbxvClvgNL2yFaGqBIT4RPu
 ozi6Aj/EP1w50QZj+nT5hzJVZp1WCm5yXI1qwhyTXDX7t7Hx2R6oFVYLaz+EAofRZlyP
 oTW8c0m9NNvezMc/R+f1b7VpmRodJwwuqHO71MHE+t6OFSsIMu3ScdFDmCxZULS/5R+D
 CzUK3sXakvfoHcRXzdfBK4jAoYCOVEUpW1fQJHdH9+294Fwwb3OgNHjWkU7FMJ3jJjmQ
 nLQ67GAXfvVcfo4nPx7VnM2KC4ATfdwETil5LxqpavCA1A6YBrUaCVouITfxrPlguacu
 jsUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fwr+2JWk
Subject: [Buildroot] [PATCH 01/31] package/busybox: move the hush config in
 a fragment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

by this way, the busybox-minimal.config becomes more widely usable

at this time, busybox-minimal.config is the default for no-mmu
so, busybox-hush.fragment must be also a default for no-mmu

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/busybox/Config.in              |   1 +
 package/busybox/busybox-hush.fragment  |  51 ++++++++++++
 package/busybox/busybox-minimal.config | 109 +++++++++++++------------
 3 files changed, 107 insertions(+), 54 deletions(-)
 create mode 100644 package/busybox/busybox-hush.fragment

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 3c2aa515f..819cc2c4c 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 
 config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
 	string "Additional BusyBox configuration fragment files"
+	default "package/busybox/busybox-hush.fragment" if !BR2_USE_MMU
 	help
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main BusyBox configuration file.
diff --git a/package/busybox/busybox-hush.fragment b/package/busybox/busybox-hush.fragment
new file mode 100644
index 000000000..e1ac47cce
--- /dev/null
+++ b/package/busybox/busybox-hush.fragment
@@ -0,0 +1,51 @@
+# this fragment allows to switch from `ash` to `hush`
+#   - `ash` is the most complete, it's a derivative of the Debian `dash`
+#   - `hush` works on no-mmu systems, but its syntax is not "standard"
+
+# CONFIG_SH_IS_ASH is not set
+CONFIG_SH_IS_HUSH=y
+# CONFIG_SH_IS_NONE is not set
+
+# CONFIG_BASH_IS_ASH is not set
+# CONFIG_BASH_IS_HUSH is not set
+CONFIG_BASH_IS_NONE=y
+
+# CONFIG_SHELL_ASH is not set
+
+CONFIG_HUSH=y
+CONFIG_SHELL_HUSH=y
+CONFIG_HUSH_BASH_COMPAT=y
+CONFIG_HUSH_BRACE_EXPANSION=y
+# CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
+CONFIG_HUSH_LINENO_VAR=y
+CONFIG_HUSH_INTERACTIVE=y
+CONFIG_HUSH_SAVEHISTORY=y
+CONFIG_HUSH_JOB=y
+CONFIG_HUSH_TICK=y
+CONFIG_HUSH_IF=y
+CONFIG_HUSH_LOOPS=y
+CONFIG_HUSH_CASE=y
+CONFIG_HUSH_FUNCTIONS=y
+CONFIG_HUSH_LOCAL=y
+CONFIG_HUSH_RANDOM_SUPPORT=y
+CONFIG_HUSH_MODE_X=y
+CONFIG_HUSH_ECHO=y
+CONFIG_HUSH_PRINTF=y
+CONFIG_HUSH_TEST=y
+CONFIG_HUSH_HELP=y
+CONFIG_HUSH_EXPORT=y
+CONFIG_HUSH_EXPORT_N=y
+CONFIG_HUSH_READONLY=y
+CONFIG_HUSH_KILL=y
+CONFIG_HUSH_WAIT=y
+CONFIG_HUSH_COMMAND=y
+CONFIG_HUSH_TRAP=y
+CONFIG_HUSH_TYPE=y
+CONFIG_HUSH_TIMES=y
+CONFIG_HUSH_READ=y
+CONFIG_HUSH_SET=y
+CONFIG_HUSH_UNSET=y
+CONFIG_HUSH_ULIMIT=y
+CONFIG_HUSH_UMASK=y
+CONFIG_HUSH_GETOPTS=y
+# CONFIG_HUSH_MEMLEAK is not set
diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1e7ad1d35..cf53c1598 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1115,68 +1115,69 @@ CONFIG_SVOK=y
 #
 # Shells
 #
-# CONFIG_SH_IS_ASH is not set
-CONFIG_SH_IS_HUSH=y
+CONFIG_SH_IS_ASH=y
+# CONFIG_SH_IS_HUSH is not set
 # CONFIG_SH_IS_NONE is not set
 # CONFIG_BASH_IS_ASH is not set
 # CONFIG_BASH_IS_HUSH is not set
 CONFIG_BASH_IS_NONE=y
-# CONFIG_SHELL_ASH is not set
-# CONFIG_ASH is not set
-# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_ASH_INTERNAL_GLOB is not set
-# CONFIG_ASH_BASH_COMPAT is not set
+CONFIG_SHELL_ASH=y
+CONFIG_ASH=y
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+CONFIG_ASH_INTERNAL_GLOB=y
+CONFIG_ASH_BASH_COMPAT=y
 # CONFIG_ASH_BASH_SOURCE_CURDIR is not set
-# CONFIG_ASH_BASH_NOT_FOUND_HOOK is not set
-# CONFIG_ASH_JOB_CONTROL is not set
-# CONFIG_ASH_ALIAS is not set
-# CONFIG_ASH_RANDOM_SUPPORT is not set
-# CONFIG_ASH_EXPAND_PRMT is not set
-# CONFIG_ASH_IDLE_TIMEOUT is not set
+CONFIG_ASH_BASH_NOT_FOUND_HOOK=y
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_ALIAS=y
+CONFIG_ASH_RANDOM_SUPPORT=y
+CONFIG_ASH_EXPAND_PRMT=y
+CONFIG_ASH_IDLE_TIMEOUT=y
 # CONFIG_ASH_MAIL is not set
-# CONFIG_ASH_ECHO is not set
-# CONFIG_ASH_PRINTF is not set
-# CONFIG_ASH_TEST is not set
-# CONFIG_ASH_HELP is not set
-# CONFIG_ASH_GETOPTS is not set
-# CONFIG_ASH_CMDCMD is not set
+CONFIG_ASH_ECHO=y
+CONFIG_ASH_PRINTF=y
+CONFIG_ASH_TEST=y
+CONFIG_ASH_SLEEP=y
+CONFIG_ASH_HELP=y
+CONFIG_ASH_GETOPTS=y
+CONFIG_ASH_CMDCMD=y
 # CONFIG_CTTYHACK is not set
-CONFIG_HUSH=y
-CONFIG_SHELL_HUSH=y
-CONFIG_HUSH_BASH_COMPAT=y
-CONFIG_HUSH_BRACE_EXPANSION=y
+# CONFIG_HUSH is not set
+# CONFIG_SHELL_HUSH is not set
+# CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_BRACE_EXPANSION is not set
 # CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
-CONFIG_HUSH_LINENO_VAR=y
-CONFIG_HUSH_INTERACTIVE=y
-CONFIG_HUSH_SAVEHISTORY=y
-CONFIG_HUSH_JOB=y
-CONFIG_HUSH_TICK=y
-CONFIG_HUSH_IF=y
-CONFIG_HUSH_LOOPS=y
-CONFIG_HUSH_CASE=y
-CONFIG_HUSH_FUNCTIONS=y
-CONFIG_HUSH_LOCAL=y
-CONFIG_HUSH_RANDOM_SUPPORT=y
-CONFIG_HUSH_MODE_X=y
-CONFIG_HUSH_ECHO=y
-CONFIG_HUSH_PRINTF=y
-CONFIG_HUSH_TEST=y
-CONFIG_HUSH_HELP=y
-CONFIG_HUSH_EXPORT=y
-CONFIG_HUSH_EXPORT_N=y
-CONFIG_HUSH_READONLY=y
-CONFIG_HUSH_KILL=y
-CONFIG_HUSH_WAIT=y
-CONFIG_HUSH_COMMAND=y
-CONFIG_HUSH_TRAP=y
-CONFIG_HUSH_TYPE=y
-CONFIG_HUSH_TIMES=y
-CONFIG_HUSH_READ=y
-CONFIG_HUSH_SET=y
-CONFIG_HUSH_UNSET=y
-CONFIG_HUSH_ULIMIT=y
-CONFIG_HUSH_UMASK=y
-CONFIG_HUSH_GETOPTS=y
+# CONFIG_HUSH_LINENO_VAR is not set
+# CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
+# CONFIG_HUSH_JOB is not set
+# CONFIG_HUSH_TICK is not set
+# CONFIG_HUSH_IF is not set
+# CONFIG_HUSH_LOOPS is not set
+# CONFIG_HUSH_CASE is not set
+# CONFIG_HUSH_FUNCTIONS is not set
+# CONFIG_HUSH_LOCAL is not set
+# CONFIG_HUSH_RANDOM_SUPPORT is not set
+# CONFIG_HUSH_MODE_X is not set
+# CONFIG_HUSH_ECHO is not set
+# CONFIG_HUSH_PRINTF is not set
+# CONFIG_HUSH_TEST is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_EXPORT is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_READONLY is not set
+# CONFIG_HUSH_KILL is not set
+# CONFIG_HUSH_WAIT is not set
+# CONFIG_HUSH_COMMAND is not set
+# CONFIG_HUSH_TRAP is not set
+# CONFIG_HUSH_TYPE is not set
+# CONFIG_HUSH_TIMES is not set
+# CONFIG_HUSH_READ is not set
+# CONFIG_HUSH_SET is not set
+# CONFIG_HUSH_UNSET is not set
+# CONFIG_HUSH_ULIMIT is not set
+# CONFIG_HUSH_UMASK is not set
+# CONFIG_HUSH_GETOPTS is not set
 # CONFIG_HUSH_MEMLEAK is not set
 
 #
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
