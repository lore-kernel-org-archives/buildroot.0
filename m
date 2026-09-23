Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A5EC98304
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 19:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A00782F2D;
	Wed, 23 Sep 2026 19:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ke7YGzeuTGh; Wed, 23 Sep 2026 19:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 152BD82FC9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790192909;
	b=JYcTv7xWHggU1QJsx09SL7CoNeT0OjTOJaZ4a+dN/fCNw8snWABS3yWKUUkqXDZT8yDt
	 fTi+OpUcaG9N/m4lo6QTJ8M5rS25+jMX0i+dFQR6QKYcfkYvkq8vehj6u7kZkv6AAGCMc
	 MslgSw6+q11NWokvbLjQyo4lY6sSi0+xVEU3kgbAUq7nz4ib8FONUap8CYAgWJUjnR9BV
	 rWhBV5y4wO1vc4G7QgPQCWAGSt9BrN6Ddl8RdzWLZUWC1dR7vrodUWaoMoBxGcIQtA4UF
	 Qtwh1/zhzVeEzs/DGx3Eh9H0Li+/SqpCBdQ/vivwO+ZOgnWb2eEGa1Rrba+NgYZh8fQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790192909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fIrBQAVIxf/gg2rzLD+DZ1sDSDLFxTGeJvUOBz9lcsE=;
	b=QeItj1k8AYwPLbURcmsIvl9g5x6HzgEFQkfASjPoiyI9gkinolaUskP3izMoQHDr6KHh
	 4RWl7Y63vSmH+Uc1W5hCagUIMJtRvtpMawaxQJnZxyXmqoWbt269qxgmTirFNA6hW+q3H
	 fP84e4I/bKaMlarlhXkRLBk2zpb+re6u9aqiz4y0h0cr3Gy6nH16m1yfQyN3QC86iMcD7
	 2sdnEYnNwauqssvseVO6I6EBt8CkWVbJwtFNvOpT/VIbY/P1HJzMi9r0AGH0UA8C7gkJz
	 UdtSHq0RC/+j6DSJbd9fRIxbRL94TqTYwQ13/WgWtmr2gUgMgumdrAckxZaMA2WxTXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790192909;
	bh=fIrBQAVIxf/gg2rzLD+DZ1sDSDLFxTGeJvUOBz9lcsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dn5EondBbgSHN1Hx0YYrJ0QhsjPmjPl0WaptDygfDfDNh2VKBzrj+XXnTURYPWm3s
	 nsU5/umwFq6RFEoDnn4f2BtdmKXIMang6ZVGQ8CCFGTQ4UorXoYwdqXM3n/NTMxzMB
	 PsAmFRy2mdTvsKKMTlC+YxAPoGJdxgbG0wn1fVQ2KXRIseCHMGWrd3DVAcRpdxD5wh
	 thq83lzN9TGtl8YvQDOMiM7Z7/dSTe918vCcSzIYggRWR7xL0H95xg7mwUG3jgSEVr
	 RRNx2fTKoR/piBUaMKjNUnPYctL3Etb40kNPqIvIwILKOdTDjEuxhCQkvKSDA6Yl2S
	 ZI7ZRbnMXL+Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 152BD82FC9;
	Wed, 23 Sep 2026 19:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B7053A9
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E448982F2D
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9q2l84eC7B96 for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 19:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A123582F19
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790192905;
 b=equnX6vbjjdpxdTUKt67Fd2lVnLDV2ZJHNz6QCF67/bdl+WAh7ZQ+XYZDrmkWbTuTKgb
 7zdYrFSgqU+g5xl3LQAzH77EhCfHLBko29H535TzLu+41pBZdTNXsuDx1/eVqAEbpNZro
 HwE6pGV0f6TAnoX/Dq45TAYXXB8pQ1oOy3TTryIoQGAlwtT+wfH8URuo9zy3t5EJ+wDgY
 Iinvl2JtHTPXI/NQzADLQ0RKLGFYkZk9wtFMg1gshi6gpRCobLJPC4NIMy3qz1NCThIon
 W4V0I1SrFnqjny97/MggXsD7sGj0qiFUsXS2SCac5PnMsytjXw1ImI2n3/ghrHicPLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790192905;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+rmumkvSNQ0GQ+j1HfsFAHziEcPkRNpGonEKif8t7M8=;
 b=pXwcRG8uZhcuSu1mujnJYCH59KHlQBjGkFuGS1NdZ+0UCkbWF0z121nIPvi08jWjnmAQ
 Mb+VNsw21rA86t/6t48dtScWK11maBydjvmSD4JCcAZEz/7OgfDAn4FYWpIQQkl6zsLc2
 xYcn78fUCc09EZxO3ivlB3jXw8ZitPTHe+Is2psOphxwHXqOYXogswFez2LreznXlYc8g
 a3SGr8HYwh+niNqL8/ofCGWvBRl+gugeyT9MMJkAq/JniBHSA9WiNq/XfrvLaRPkjBzzO
 EwdZfjvu2pAPeKUt8GBwdk0MU+42aCwF2oB++kd3leWGc0IVgwaui3ZV90CDkR62ipQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A123582F19
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5BD298351; Wed, 23 Sep 2026 19:47:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 21:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc5cb8f02d6e8c24645e5f623e96067f7ad79840
X-Git-Newrev: 4919a5fecfd64d8ea05a0f7fa1f5e1dd9f0aeb1a
X-Patchwork-Hint: ignore
Message-Id: <20260923194715.A5BD298351@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 3.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4919a5fecfd64d8ea05a0f7fa1f5e1dd9f0aeb1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove patches upstreamed in this release.

Release announce:
https://lore.kernel.org/linux-nfs/5717a803-805c-409f-a9cc-d0c33a365570@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...emory-leak-in-sm_mon_1_svc-when-existing-.patch | 40 --------------------
 ...02-getport-fix-missing-stddef.h-inclusion.patch | 33 ----------------
 ...xportfs-link-failure-with-disable-nfsdctl.patch | 39 -------------------
 ...-getport-Fix-switch-case-on-old-compilers.patch | 44 ----------------------
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  2 +-
 6 files changed, 3 insertions(+), 159 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
