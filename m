Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9725EC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 582E780DCF;
	Sun,  5 May 2024 15:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3_bqFzAjT1Y; Sun,  5 May 2024 15:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF2280E7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF2280E7E;
	Sun,  5 May 2024 15:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32DB71BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0930D80E70
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28hsfaY1tpUY for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97E8A80DCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E8A80DCF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97E8A80DCF
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:53:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34d9c9f2cf0so927018f8f.3
 for <buildroot@buildroot.org>; Sun, 05 May 2024 08:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714924431; x=1715529231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3yZWtqye8MOOUpn0ZH7L0s5ucvItoTmhTROMo/iGvk=;
 b=qBRA/S1iAgqzr1JAwxt7GJc/WQesVtv1/2RQTBNwSf5ZszHyun/HVF3UsNUcl1ez7x
 RvBQI4Mof3Pq8uxal6tUswidwesn+t+nkpX6JLPVtPCxIZvX2A1+BZrH8u6bnUkEa9GO
 wHQEB6KsSreu/t9qIepXMYulj5GiupfxFvPqKZfNG0tEeQoYRY/ikr5NdQhhVzjuVBj1
 zPWgYS/YdEmDxVCfdLG3oSpre32CLikjgHYvjfEH8JRfq0oOFZtzXVuHFDp2dyTfcmgS
 qNJIwkNDNEqHD0xx1Nv4Ano6pN71njHsUeIrtz5gPut6JOzsoFoP9o1Dnzr2wuvrBWIL
 K7Rw==
X-Gm-Message-State: AOJu0Ywndr5dIsMHckJgwtHVum8ceYV2Qwh2lGM82G8YoNDHlluxwkRi
 iWwCuWkei0NtU5fPfzel47ZORvOEuygr2MPnFsQwO6qHu/a99nGEQ9qUyw==
X-Google-Smtp-Source: AGHT+IGLS6xbYYJQA9Pg32z1XyP622j+C6JPbGDUW4rnBG4kYyyxoaYdlDc3nvFlw5mrqwsXFuSluA==
X-Received: by 2002:adf:fc44:0:b0:34c:fa08:791c with SMTP id
 e4-20020adffc44000000b0034cfa08791cmr6349531wrs.45.1714924430974; 
 Sun, 05 May 2024 08:53:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 h4-20020adff4c4000000b0034cee43238fsm8469951wrp.27.2024.05.05.08.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 08:53:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 17:53:49 +0200
Message-ID: <20240505155349.1149835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714924431; x=1715529231; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I3yZWtqye8MOOUpn0ZH7L0s5ucvItoTmhTROMo/iGvk=;
 b=SNZY2naH6ZLPQwLplJW0B33ngvbsFe7H0QfrnqC6CpKGIKAODrKMU7Rpcg7LqAAAcu
 //nVezQpIaAnniF9oUTHAhpfr3q1XpHBJ6aAOxaAc8EfGXC3UUW56w4e5yoBYHDyRcJ0
 s/kF5tCiLq0gkASuKjVYQBcMmHOXnnlWD+2/736hROia9j5DysHT9kkTfgG76ZG7+p0M
 0+iRtTdHPM8DLhV+G1jHJVLeSeS9kH2So3wZfl37RFj/u/6EISfMONj/rkjqocWd1Lgp
 cdOQ5F7h0gOLoEiI+B+Ssn0qv1w1Mki+Tq+GUwe1iSP8DOKhmnaYhHkReVHWinDEPCKN
 dk6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SNZY2naH
Subject: [Buildroot] [PATCH 1/1] package/pppd: fix build with kernel < 4.7
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel < 4.7 raised since bump to
version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b and
https://github.com/ppp-project/ppp/commit/81ad945630120cc1c27c8bb00503be42b76ff202:

sys-linux.c: In function 'get_ppp_stats_rtnetlink':
sys-linux.c:1783:29: error: field 'ifsm' has incomplete type
 1783 |         struct if_stats_msg ifsm;
      |                             ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/82392df447f650f241f23e59e65131fb4a930010

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pile-with-older-Linux-kernel-headers.patch | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch

diff --git a/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch b/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
new file mode 100644
index 0000000000..46c293103a
--- /dev/null
+++ b/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
@@ -0,0 +1,66 @@
+From 7a3f478a4b7128d4f70ea64d99fedec766b1c009 Mon Sep 17 00:00:00 2001
+From: Jaco Kroon <jaco@uls.co.za>
+Date: Tue, 31 Oct 2023 11:47:21 +0200
+Subject: [PATCH] pppd/sys-linux: Fix compile with older Linux kernel headers
+ (#452)
+
+When compiling pppd against kernel headers which don't provide
+the definitions for the NETLINK mechanisms, leave out the code
+which uses NETLINK, so as to avoid getting compile errors.
+
+Upstream commit in Linux refers.
+
+commit 10c9ead9f3c6bb24bddc9a96681f7d58e6623966
+Author: Roopa Prabhu <roopa@cumulusnetworks.com>
+Date:   Wed Apr 20 08:43:43 2016 -0700
+rtnetlink: add new RTM_GETSTATS message to dump link stats
+
+This commit adds the #defines and structs used, so simply not compiling
+this code if the required #defines isn't there should solve the problem.
+
+Closes: #450
+
+Signed-off-by: Jaco Kroon <jaco@uls.co.za>
+Upstream: https://github.com/ppp-project/ppp/commit/7a3f478a4b7128d4f70ea64d99fedec766b1c009
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pppd/sys-linux.c | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index 561b150f2..a8d6cd95b 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -131,16 +131,6 @@
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/if_link.h>
+-
+-/* Attempt at retaining compile-support with older than 4.7 kernels, or kernels
+- * where RTM_NEWSTATS isn't defined for whatever reason.
+- */
+-#ifndef RTM_NEWSTATS
+-#define RTM_NEWSTATS 92
+-#define RTM_GETSTATS 94
+-#define IFLA_STATS_LINK_64 1
+-#endif
+-
+ #include <linux/if_addr.h>
+ 
+ /* glibc versions prior to 2.24 do not define SOL_NETLINK */
+@@ -1776,6 +1766,7 @@ get_ppp_stats_ioctl(int u, struct pppd_stats *stats)
+ static int
+ get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
+ {
++#ifdef RTM_NEWSTATS
+     static int fd = -1;
+ 
+     struct {
+@@ -1825,6 +1816,7 @@ get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
+ err:
+     close(fd);
+     fd = -1;
++#endif
+     return 0;
+ }
+ 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
