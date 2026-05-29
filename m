Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1498CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DF541F7C;
	Fri, 29 May 2026 08:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmZDpGo3v5gB; Fri, 29 May 2026 08:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F57421D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043328;
	bh=ipRtBZnIL/XsNWBi/ViHfz19hJeeYxHU5VKA9NLW6kI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AHie6x3ZMGLj9WEs0ICptFzVfquEP+463mx/KDDKu12BNLUcfMW85mP/NuBDJaxNP
	 h4y+IJ2YaSAXsAEPRdxYeTrlFgt3nr+9C9QZ9mJBK2IH5FP6n7ePdqKyAmvZ0OoWVj
	 ksfstO6Q2EjQ9dTIG/aQCnlNlH4n7IqgK4dVmf4l6Kg+n+Lk+BccuZl6qSMj3wHjsZ
	 wiIfDZF9e5va0wUZ+LTC7M6WdE2GI30YRJqPFndu/IX3hWN7bKcvm36sthlFSXv5W5
	 BT+gj6vya5/SPgdV3iDr4GZmGXywgeLZVOLrOIv2FVfg8bbmDw6EMN1NJ/h78fNkwY
	 reWnTqmbIY6qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F57421D2;
	Fri, 29 May 2026 08:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1016728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 500DC60C1C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra0oY6zd3Umj for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7F3605C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D7F3605C3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F81287355; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:27:01 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: af42bd7679f06ddc85416e2cb60ca78e13cc41a4
X-Git-Newrev: 19813205946b4cc768f57baa83bdb5e731cb7bba
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.9F81287355@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/kexec: fix
 powerpc build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19813205946b4cc768f57baa83bdb5e731cb7bba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Added two upstream commits to fix build errors on powerpc.

The build error also occurs with kexec 2.0.30 on the 2025.02.x branch
so a backport to LTS branches should be considered:
https://autobuild.buildroot.net/results/2ec/2ec0d85c658f8264fcc4eef2deb6c67671e3e7ae/

Fixes:
https://autobuild.buildroot.net/results/53b/53bafc454533aeafc21116a99d87391b3049e12a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8181bc6e06b55965d39126bacfafa6e2bfb2cf55)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rpc-Fix-function-signature-of-comparefunc.patch | 42 +++++++++++++++++
 ...declarations-in-read-memory_region_limits.patch | 54 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch b/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
new file mode 100644
index 0000000000..809e91e939
--- /dev/null
+++ b/package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
@@ -0,0 +1,42 @@
+From b89799f7f20d4b2476e99e95e6795450f2f1c111 Mon Sep 17 00:00:00 2001
+From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
+Date: Wed, 22 Oct 2025 13:44:12 +0200
+Subject: kexec-tools: powerpc: Fix function signature of comparefunc()
+
+Fixes the following build error on 32-bit PowerPC:
+
+kexec/arch/ppc/fs2dt.c: In function 'putnode':
+kexec/arch/ppc/fs2dt.c:338:51: error: passing argument 4 of 'scandir' from incompatible pointer type [-Wincompatible-pointer-types]
+  338 |         numlist = scandir(pathname, &namelist, 0, comparefunc);
+      |                                                   ^~~~~~~~~~~
+      |                                                   |
+      |                                                   int (*)(const void *, const void *)
+
+Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
+Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
+Signed-off-by: Simon Horman <horms@kernel.org>
+
+Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=b89799f7f20d4b2476e99e95e6795450f2f1c111
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ kexec/arch/ppc/fs2dt.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
+index fed499b..d03b995 100644
+--- a/kexec/arch/ppc/fs2dt.c
++++ b/kexec/arch/ppc/fs2dt.c
+@@ -292,7 +292,8 @@ static void putprops(char *fn, struct dirent **nlist, int numlist)
+  * Compare function used to sort the device-tree directories
+  * This function will be passed to scandir.
+  */
+-static int comparefunc(const void *dentry1, const void *dentry2)
++static int comparefunc(const struct dirent **dentry1,
++		       const struct dirent **dentry2)
+ {
+ 	char *str1 = (*(struct dirent **)dentry1)->d_name;
+ 	char *str2 = (*(struct dirent **)dentry2)->d_name;
+-- 
+cgit 1.3-korg
+
diff --git a/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch b/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch
new file mode 100644
index 0000000000..ed6c7bb392
--- /dev/null
+++ b/package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch
@@ -0,0 +1,54 @@
+From 8ac3a7e08957fcb3fa59c9fc4e9c283b9a072ce6 Mon Sep 17 00:00:00 2001
+From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
+Date: Wed, 22 Oct 2025 13:44:13 +0200
+Subject: kexec-tools: powerpc: Fix pointer declarations in
+ read_memory_region_limits()
+
+Fixes the following two build errors on 32-bit PowerPC:
+
+kexec/arch/ppc/kexec-ppc.c: In function 'read_memory_region_limits':
+kexec/arch/ppc/kexec-ppc.c:106:11: error: assignment to 'long long unsigned int *' from incompatible pointer type 'long unsigned int *' [-Wincompatible-pointer-types]
+  106 |         p = (unsigned long*)buf;
+      |           ^
+
+kexec/arch/ppc/kexec-ppc.c: In function 'read_memory_region_limits':
+kexec/arch/ppc/kexec-ppc.c:112:19: error: assignment to 'long unsigned int *' from incompatible pointer type 'long long unsigned int *' [-Wincompatible-pointer-types]
+  112 |                 p = (unsigned long long *)p + 1;
+      |                   ^
+
+Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
+Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
+Signed-off-by: Simon Horman <horms@kernel.org>
+
+Upstream: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/patch/?id=8ac3a7e08957fcb3fa59c9fc4e9c283b9a072ce6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ kexec/arch/ppc/kexec-ppc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/kexec/arch/ppc/kexec-ppc.c b/kexec/arch/ppc/kexec-ppc.c
+index d3dad0f..e173433 100644
+--- a/kexec/arch/ppc/kexec-ppc.c
++++ b/kexec/arch/ppc/kexec-ppc.c
+@@ -91,7 +91,7 @@ int read_memory_region_limits(int fd, unsigned long long *start,
+ 				unsigned long long *end)
+ {
+ 	char buf[MAXBYTES];
+-	unsigned long *p;
++	unsigned long long *p;
+ 	unsigned long nbytes = dt_address_cells + dt_size_cells;
+ 
+ 	if (lseek(fd, 0, SEEK_SET) == -1) {
+@@ -103,7 +103,7 @@ int read_memory_region_limits(int fd, unsigned long long *start,
+ 		return -1;
+ 	}
+ 
+-	p = (unsigned long*)buf;
++	p = (unsigned long long*)buf;
+ 	if (dt_address_cells == sizeof(unsigned long)) {
+ 		*start = p[0];
+ 		p++;
+-- 
+cgit 1.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
