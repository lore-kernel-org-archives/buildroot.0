Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E60C9830B
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 12:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 000D8606CC;
	Wed, 23 Sep 2026 12:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSZw2sI220-h; Wed, 23 Sep 2026 12:15:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AE0A0607D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790165704;
	b=Q8ZXSqxjm9INSvUcIfuKxjtbI58UZZo9eARTiRUWguzWjvD4uZnMf5Q18I5rQGQfGQ9j
	 dWuII2uyyBmcyeb/D7TFO6dfS6O/m2wSfFptE4Lfb6rLieVQE+vql13Cd9FWvz0iHr6fg
	 szicFbmUhamAzQSJjA8uI5bTkLv8CkGAlahhBfNBJChusJUlvzIOyMGXaI8S0FDxxkHir
	 V0KPQRly/k2sW93rOiHp661tDlDBp/ko7fP+htAvCNr++td4mdvvqqrbIDCBhxbtEtl4v
	 d24dprIuZ4JCNNcdmulWVW59+yzDf0poYVKRZGZqtmsGJ4viSzKTO4kcxBp/KfFLhzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790165704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HgcXsn1Nm2CZcMbyWJXVY5oblmxT0tA5pRC7XEe3jf8=;
	b=i9I51WqoB02lil8v8y8Gm9h8sqvICvvmqNHzQTsn90+gl4+7wk5FqaKO4E11rgkyw1h7
	 bNdQ1bLoxCKkJS18ViJ74v4SWdeCXzu7gEIxkuSjhW0KS3MxdmC7ragJxlt0LPdQcDjC9
	 LZP/I6SrpzTYBYhoHV/TwWclUawgRmtHdnPDUu2Wi5KaMxVofxnFgG2CR+oP/YPLu+Gic
	 5msCFwlTM5nz801/A9Y1Ak8CPHg9gUZ4ShdCuaLutk5pDvNIodOPF61bSVGM+t4Dmamd4
	 92UzXV0nn7gSqdGFyqq0Xr4ARmtP4NCn9UVm+UASO5EFuzMqXb0H1a2aZ2P4Sukz1xQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=FZf2phOB;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790165704;
	bh=HgcXsn1Nm2CZcMbyWJXVY5oblmxT0tA5pRC7XEe3jf8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jPFFE427Fo3eBE8bTuZVL79ZGMs/YCHmz64JA8R9x1qmRJvz5a4UBOzL/B3sKb9IG
	 6+SpyN2iM7NePAPAXgdqxk2dHG1H8o/jg9F1YoEbVsI4BzadVy/aJLp5AyZeXH+Q7A
	 WvWtlhgBTBLXsUUpCnvWv/zUAxv1+FBt0XLeD79ryhrayTfT/KHq1KBCXBFL7M2oK9
	 d0BzJ7W/D7lHCCb/RSuCLWYDH8yO5nF0ckh5VznQa6VdNm5jeSwFtLmCVRBkXEkuTo
	 ikXUvIIKAFpgpFf/cH5CbbUJppUurlwxpf9/Kt/RmY8tBI55S1tIqTybu+0vSQJjv5
	 /ZkUdhAyuiHog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE0A0607D6;
	Wed, 23 Sep 2026 12:15:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ABDA28C
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 12:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584EF607D6
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 12:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIXJ28UPiE2o for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 12:15:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 75F95606CC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.101
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790165701;
 b=Tnnf+5GEjzJtyfoFH2Jce+WXhMIOCilT2dnNvRFX+eomTf5QcstrYH/KSIGqJ4T25Juf
 NSU5ToO6pzNcj4dKEW1qlcOWeuWnSQ52dvIAv6h2W2WNStALJbC4IZNeePljfYrildxAr
 UZ2ZNDCiFF2mz79JkdtlgJ/8ZJ7C7iSQyD7uTyk6lZAOkOcTU76sLHQH6kLqMzSvYrgel
 5zbF/WjxLcqvAxkoB4NFS745+ERlagHzpOhOQSRh5CeZZZWsEj2MS+dBJ8o+el6JE4u1Z
 5LORUdO0OdLuXIBE7nf8uwT7E4vfIIWafDUVHoulsrXrraesuwBgxs3v9FBMbIxTErQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790165701;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=C/L7R/8LH741LIKFTI2vmfr4hoYeG8EzRspAB1A8eJY=;
 b=ZdDknX5RtGE/ZXurZfpfS/cClr8ROW5dK2TtlA8EIuAOnB8rX1/e06zFCJ66HVmQLS+5
 5i1dPzP39pWbvypwL1L4KZ3lVo7g4KmGbdh9Jjj2E9XuXh8EIH27v6cIqDaQBQeSGDT88
 AuSx5xQ2OirV7MQDglxr0/m122fRsTfY3y79HRTZDgnmKnSluJ1IuNnqiKgvHdRp+Lokw
 EHwJlkgre9TxGzzEJyGBts9811aRES4g7r5bLxTeeptMKuoQVOT6f3SXZolIfaYxhIE9G
 EY+MG+L7rFcNBsugeV8OaxjR9Ag6NjM1iOe3OLsjWEsLiwABecM6FydLlyPo+ftaYiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=FZf2phOB; 
 arc=none smtp.remote-ip=62.149.156.101
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.101;
 helo=smtpcmd10101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FZf2phOB
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75F95606CC
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 12:14:59 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 9LsFxqJ6Lqg6C9LsFxySIp; Wed, 23 Sep 2026 14:14:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790165696; bh=jFCp22jSmVW9OKggGJoH1fW15qu3Mn0FKqe3kynDKtM=;
 h=From:To:Subject:Date:MIME-Version;
 b=FZf2phOB2PimQ1otz1dHr1CBpiyNosqHtnDCWq+QNS3DdORicIR+uvyYJnA64Sxym
 aADYAiIwqn1wTSj25gfw/Tqy+XurUgIUoKNn1l7kmAdsvGJJzQkEBbgjFlLqsTx6+A
 qviBdR0mcCX4WdPEIfaQbvGZtj3593EwBOTDhl0P2/uA0ucVmwGbKMkecVCxm4qCNt
 XNKLLsZCqMass7KfczRhutDXfdxukeR0l3d4pnroha5PkCfIzKwJzf8dKiAANYNUel
 eL6SkDj8t7Zn7fjRWpnJUDHGgnNAkkE/Ywsua19yVZDihcrwuOVmviNFvOVffoLB3m
 +vOF3p8I4tWIg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 23 Sep 2026 14:14:53 +0200
Message-ID: <20260923121453.3986966-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDIjNrMvrBF+G8I9HsFiRk1rdLcDprKclYjRLvUEXmy1uWmWkOGA1fDaQX25veXXpnhSdeQ83/mFqfJdJcJ/BWSKpwlO6qZB66KkuwJQyVMQGQZC4SjW
 7vlsWUTm3SA3NdgEeqyEnO/u6Qbc70M3hFlbdzJXY0IrrBBcaHnht+qbPdz/I+Uwem5fRtndiCf43kWLUvyash2td4tVEpWLFHGPjb4xURgrhiGYFH8k26b0
 MS0WOGVpkHrlkCkMDI6JoboIAgEMXqNx4GnIVZo2FVuto1t68Q8Ng1A8Iwz34Sfrut1avtrUJgeIB5vOGkC7jw==
Subject: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Remove patches upstreamed in this release.

Release announce:
https://lore.kernel.org/linux-nfs/5717a803-805c-409f-a9cc-d0c33a365570@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed typo on license type as pointed by Baruch Siach
---
 ...-leak-in-sm_mon_1_svc-when-existing-.patch | 40 -----------------
 ...tport-fix-missing-stddef.h-inclusion.patch | 33 --------------
 ...fs-link-failure-with-disable-nfsdctl.patch | 39 ----------------
 ...ort-Fix-switch-case-on-old-compilers.patch | 44 -------------------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  2 +-
 6 files changed, 3 insertions(+), 159 deletions(-)
 delete mode 100644 package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
 delete mode 100644 package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
 delete mode 100644 package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch

diff --git a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
deleted file mode 100644
index d3a5bf991f..0000000000
--- a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae Mon Sep 17 00:00:00 2001
-From: xuchenchen <xuchenchen@kylinos.cn>
-Date: Sat, 15 Aug 2026 13:58:16 -0400
-Subject: [PATCH] statd: fix memory leak in sm_mon_1_svc() when existing host
- re-monitors
-
-When an already-monitored host sends a new SM_MON request with a
-different priv cookie, the code sets existing=1 and reuses the
-existing notify_list entry. However, clnt->dns_name is overwritten
-with the newly allocated dnsname without freeing the old value,
-causing a memory leak.
-
-Since statd is a long-running daemon, repeated SM_MON requests with
-changing cookies will accumulate leaked strings.
-
-Fix by freeing the old dns_name before overwriting it.
-
-Signed-off-by: xuchenchen <xuchenchen@kylinos.cn>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae
----
- utils/statd/monitor.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/utils/statd/monitor.c b/utils/statd/monitor.c
-index c76589ca..76ef16f1 100644
---- a/utils/statd/monitor.c
-+++ b/utils/statd/monitor.c
-@@ -187,6 +187,8 @@ sm_mon_1_svc(struct mon *argp, struct svc_req *rqstp)
- 	NL_MY_VERS(clnt) = id->my_vers;
- 	NL_MY_PROC(clnt) = id->my_proc;
- 	memcpy(NL_PRIV(clnt), argp->priv, SM_PRIV_SIZE);
-+	if (existing)
-+		free(clnt->dns_name);
- 	clnt->dns_name = dnsname;
- 
- 	/*
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
deleted file mode 100644
index a85390cdec..0000000000
--- a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cec8eeb69dc65eb91e0cb23ebff23530d9397425 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sat, 15 Aug 2026 14:00:36 -0400
-Subject: [PATCH] getport: fix missing stddef.h inclusion
-
-getport.c uses offsetof() but does not include <stddef.h>. On glibc
-this works because offsetof is pulled in transitively, but on musl it
-is not available without the explicit include, causing:
-
-  getport.c:459:41: error: implicit declaration of function 'offsetof'
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cec8eeb69dc65eb91e0cb23ebff23530d9397425
----
- support/nfs/getport.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
-index 608e185b..6bd2f713 100644
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -27,6 +27,7 @@
- #endif
- 
- #include <sys/types.h>
-+#include <stddef.h>
- #include <sys/time.h>
- #include <unistd.h>
- #include <fcntl.h>
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
deleted file mode 100644
index f1668c5b97..0000000000
--- a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 67ed1bdb1af1c70a5fd3b377a997401b7676b827 Mon Sep 17 00:00:00 2001
-From: jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sat, 15 Aug 2026 14:20:03 -0400
-Subject: [PATCH] exportfs: link failure with --disable-nfsdctl
-
-Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
-exportfs. This is a regression from 2.9.1.
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=67ed1bdb1af1c70a5fd3b377a997401b7676b827
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ea19715..2ce1e129 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -256,8 +256,6 @@ PKG_CHECK_MODULES(LIBNL3, libnl-3.0 >= 3.1)
- PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >= 3.1)
- 
- AC_CHECK_HEADERS(linux/nfsd_netlink.h)
--AC_DEFINE([HAVE_NFSD_NETLINK], 1,
--	  [Define to 1 if nfsd generic netlink support is available])
- 
- # ensure the system netlink headers have the latest features
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
-@@ -279,6 +277,8 @@ AC_ARG_ENABLE(nfsdctl,
- 	enable_nfsdctl="yes")
- 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" = "yes" ])
- 	if test "$enable_nfsdctl" = yes; then
-+		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
-+	  		[Define to 1 if nfsd generic netlink support is available])
- 		PKG_CHECK_MODULES(LIBREADLINE, readline)
- 	fi
- 
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
deleted file mode 100644
index 692bc8bd3b..0000000000
--- a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7b886f3502977040461a8b31f5948a128f7069e2 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Thu, 20 Aug 2026 01:03:10 +0200
-Subject: [FTBFS,PATCH,nfs-utils 1/1] getport: Fix switch case on old compilers
-Cc: Steve Dickson <SteveD@RedHat.com>,
-    Giulio Benetti <giulio.benetti@benettiengineering.com>,
-    Julien Olivain <ju.o@free.fr>
-
-Buildroot distro compiles with fairly old compilers, which defaults to
-old C11 standard (some of still used compilers don't even have newer
-standard than C11). Workaround code which requires C23 with using { }.
-
-This fixes error:
-
-    getport.c:460:3: error: a label can only be part of a statement and a declaration is not a statement
-       size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
-       ^~~~~~
-
-Fixes: 1a6dcd74 ("Removed warnings in nfs_sockaddr2universal()")
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: https://lore.kernel.org/linux-nfs/20260819232049.438643-1-petr.vorel@gmail.com/
----
- support/nfs/getport.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
-index 6bd2f713..18ea0777 100644
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -456,9 +456,10 @@ char *nfs_sockaddr2universal(const struct sockaddr *sap)
- 	int len = sizeof(struct sockaddr);
- 
- 	switch (sap->sa_family) {
--	case AF_LOCAL:
-+	case AF_LOCAL: {
- 		size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
- 		return strndup(sun->sun_path, path_len);
-+	}
- 	case AF_INET:
- 		if (inet_ntop(AF_INET, (const void *)&sin->sin_addr.s_addr,
- 					buf, (socklen_t)sizeof(buf)) == NULL)
--- 
-2.53.0
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 93f8e463a1..1353a1a39d 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/sha256sums.asc
-sha256  e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed86c9d3dc4097e8c  nfs-utils-2.9.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/sha256sums.asc
+sha256  7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd8616813d1390e84e0  nfs-utils-3.1.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 6e0fb1a04c..4b7c9fc12d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.9.2
+NFS_UTILS_VERSION = 3.1.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
