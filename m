Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B731BC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83EF4605E8;
	Mon,  6 May 2024 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mu7Z2-WawtVL; Mon,  6 May 2024 21:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 642C2605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642C2605F8;
	Mon,  6 May 2024 21:04:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165AD1BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F5FC80DF9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf-edO2Xg_-F for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59FBE80DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59FBE80DD3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59FBE80DD3
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:03:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso2203927f8f.2
 for <buildroot@buildroot.org>; Mon, 06 May 2024 14:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715029435; x=1715634235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3MoNbfEWUkTFWZV5u+qOY8XuTkYuUazJ+gO1wnjrSho=;
 b=rEHbSH/DrzzoTiU8qHKj7szzqaTTWAyypFQOcqSn63Rw9BWQ8Y1TjZxR/T1JvL4538
 PozeD1Vr5PdcLZ9V3NGBYg1QqNP+exnsOcL9ekeWXYpcl0Q5y1Y2VMEs0rR0qnfA69Y2
 4m+mGq/D36LQIWuQpLo3EcqbuGH1FjhZ4T70MUceqTRQENyOCVM4v9XATJ24Xjtmk50B
 jbQu0tjgMbvRRNgFyfywEtHA3Cg+s/aD/LZZns8kvnMvel3lSlDHtGdaY9E4H1/Z3Ixl
 ZYymAxzZgmcuwehv/OlAnMSyxllKkbvfe8G/n7NpauoRBWWm9j23NGrevVQWYnlQrBQY
 bKYw==
X-Gm-Message-State: AOJu0Yxs8hm19Ijrl2gvJaaLy16wCYfn3kc+w2a7k3FCnTwvKIXOJDXh
 Bdg7z4UI+L1w2kJbfg5vtvMnwi1TOSLeVF7zsn3QsbHF+lNDAiR4Xpr+bQ==
X-Google-Smtp-Source: AGHT+IEvBhFM3+kA/9ZJ8L7Kkj2iW4oeh3G3yPl2KLUUFtXYV2ZFDkOoiQxregWZ8Sk0Rd8HBWMjhQ==
X-Received: by 2002:adf:b644:0:b0:33e:c91a:127e with SMTP id
 i4-20020adfb644000000b0033ec91a127emr11137096wre.63.1715029434734; 
 Mon, 06 May 2024 14:03:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 w18-20020adfec52000000b0034dd8356028sm11415977wrn.26.2024.05.06.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:03:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 23:03:48 +0200
Message-ID: <20240506210348.1285002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715029435; x=1715634235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3MoNbfEWUkTFWZV5u+qOY8XuTkYuUazJ+gO1wnjrSho=;
 b=JOW94CXTUBJO6q003ozKeXcc1TVTKVXFVhzIJub3h5vQy9WMOQvNaJV+5qW8h3WiZg
 dJ/mRN7eREaBtnSCgRI92+MZv0HY8UPYweyyp5lAqjBiJp6w6ruq0+Oc027WaXkaJ03Y
 76ktwkPQG5A0LhMv+1+U8XpAViqhwll2SS/tiRCzlwLIhZQPIfOWZ+/EUVbm14lR/Ha0
 iDYXP2vfjaUrSuPnD/D+HU0GTtDP0sF3JqNvohpBulWLSAI3HpIWaKMpiu3wx4bTXiL9
 LC2Ajs3bHeEyj2TMvw2Zmk0pMQJPdTk1hH6cDD6MCkc8L3PDodKWuj+yGv+/m7xbLuFw
 D/ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JOW94CXT
Subject: [Buildroot] [PATCH 1/1] package/mdadm: fix uclibc and musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix following uclibc build failure raised since bump to version 4.3 in
commit 99e9ff08d0705279532ca0cf3de22ea54660cbdc and
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=577fd10486d8d1472a6b559066f344ac30a3a391:

Create.c: In function 'write_zeroes_fork':
Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
      |                                   ^~~~~~~~~~~~~~~~~~~~

as well as the following musl build failure:

util.c: In function 'get_md_name':
util.c:1031:29: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'MD_NAME_MAX'?
 1031 |         static char devname[NAME_MAX];
      |                             ^~~~~~~~
      |                             MD_NAME_MAX
util.c:1031:29: note: each undeclared identifier is reported only once for each function it appears in
/home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o Monitor.o -c Monitor.c
/home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o dlink.o -c dlink.c
Create.c: In function 'write_zeroes_fork':
Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
      |                                   ^~~~~~~~~~~~~~~~~~~~

Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
 - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
 - http://autobuild.buildroot.org/results/c77ee2615e9d473e93d95c778648c7e897b7f234

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-h-include-for-NAME_MAX-definition.patch | 32 ++++++++++++++
 .../0003-Create.c-fix-uclibc-build.patch      | 42 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
 create mode 100644 package/mdadm/0003-Create.c-fix-uclibc-build.patch

diff --git a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
new file mode 100644
index 0000000000..ceaf7f923c
--- /dev/null
+++ b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
@@ -0,0 +1,32 @@
+From 8bda86099089b44129ef6206764f9de47a45f0db Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 12 Mar 2024 11:01:50 +0100
+Subject: util.c: add limits.h include for NAME_MAX definition
+
+Add limits.h include for NAME_MAX definition.
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=8bda86099089b44129ef6206764f9de47a45f0db
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 05ad3343..49a9c6e2 100644
+--- a/util.c
++++ b/util.c
+@@ -36,7 +36,7 @@
+ #include	<ctype.h>
+ #include	<dirent.h>
+ #include	<dlfcn.h>
+-
++#include	<limits.h>
+ 
+ /*
+  * following taken from linux/blkpg.h because they aren't
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/mdadm/0003-Create.c-fix-uclibc-build.patch b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..c8399be076
--- /dev/null
+++ b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
@@ -0,0 +1,42 @@
+From 52bead95d2957437c691891fcdc49bd6afccdd49 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Apr 2024 18:45:13 +0200
+Subject: Create.c: fix uclibc build
+
+Define FALLOC_FL_ZERO_RANGE if needed as FALLOC_FL_ZERO_RANGE is only
+defined for aarch64 on uclibc-ng resulting in the following or1k build
+failure since commit 577fd10486d8d1472a6b559066f344ac30a3a391:
+
+Create.c: In function 'write_zeroes_fork':
+Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
+      |                                   ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=52bead95d2957437c691891fcdc49bd6afccdd49
+---
+ Create.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Create.c b/Create.c
+index 4397ff49..d94253b1 100644
+--- a/Create.c
++++ b/Create.c
+@@ -32,6 +32,10 @@
+ #include	<sys/signalfd.h>
+ #include	<sys/wait.h>
+ 
++#ifndef FALLOC_FL_ZERO_RANGE
++#define FALLOC_FL_ZERO_RANGE 16
++#endif
++
+ static int round_size_and_verify(unsigned long long *size, int chunk)
+ {
+ 	if (*size == 0)
+-- 
+cgit 1.2.3-korg
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
