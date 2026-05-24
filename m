Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EBBCD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC36183AE8;
	Sun, 24 May 2026 17:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pUPgzedni3d; Sun, 24 May 2026 17:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A9D883AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779642096;
	bh=WY+BBWSp4kJ1Mh/D2moN2aZukGHiLSeihSUiiVy3OCo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FRp+2mZ1IYcbpsyNe0/wn67EZ/22JQJP5Su23Hxy7cjeCIGipWTTozPGcLR7ltgX5
	 c3Z0DMjVDxGnLwRv5rVHriQND9LC2bDbdsYkMl+qYyfFez+s8i196Y7S3wSZ271v8T
	 X0Zf6Vr+Uw4UxqVQZ0q4ZQj4pWRK/2ezEqFAhgk+uxgipxLsx+Vil6xFcsLHXh38WB
	 bDvmFkXiE80U9D50NFeATe7ewJBkiuHgEj9bE2dcu7abPF1v+AlAcjUlLlYcVaWlo2
	 ZAZ4nrVJZrtcYUFgMD2MhKaB03eV3Y550SezCnvFLHrPnGldOmxzzPcdi8Cz7Cxwoj
	 k87xjCoDKW+MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A9D883AD9;
	Sun, 24 May 2026 17:01:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D510F69
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A95411C1
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3rdhIXfCyau for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBBA7411CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBA7411CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBBA7411CC
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:01:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AEDBA4C0DA1;
 Sun, 24 May 2026 19:01:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRCCf-000000007Bm-2UUl;
 Sun, 24 May 2026 17:01:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 24 May 2026 19:01:29 +0200
Message-ID: <20260524170129.3211403-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779642090;
 bh=JL5TSDT7leR39R3HN7rYnnpbfwYuKeGwtQfF5VqCbI8=;
 h=From:To:Cc:Subject:Date:From;
 b=fn0NdyniqefOBsQlD2pxOIqxx+5kMfUCoxQmx+z1GAg0cPc1zv1L1MAPWQiOmyl7d
 6aWI5tGwGqdStbNtTHIFf/yxAKaHgM8EAohPHrwsDt22zF1MRIQWuCBJDbUGsIwvac
 FK8qNVmdS931rA35MDRyH/RtB4RgB3a6fwcLd6ol1oeeWVr9E7arbQ9L7MRNoU65Tz
 5TkC56K9i1mxHDH5YjRcPu6LKP07dyLEcNsSSX+8aZ0GsUl2QCHSsZoqQzD7v9gNHy
 CfcioBJ04OgFm5Y6OdM1EjGiKMNOtg6qHTNIXhr91qz92AsnDU/YtM/C8Cmnl5js/v
 MTOk1cnH4eJGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fn0Ndyni
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix powerpc build
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

Added two upstream commits to fix build errors on powerpc.

The build error also occurs with kexec 2.0.30 on the 2025.02.x branch
so a backport to LTS branches should be considered:
https://autobuild.buildroot.net/results/2ec/2ec0d85c658f8264fcc4eef2deb6c67671e3e7ae/

Fixes:
https://autobuild.buildroot.net/results/53b/53bafc454533aeafc21116a99d87391b3049e12a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-function-signature-of-comparefunc.patch | 42 +++++++++++++++
 ...rations-in-read-memory_region_limits.patch | 54 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 package/kexec/0001-kexec-tools-powerpc-Fix-function-signature-of-comparefunc.patch
 create mode 100644 package/kexec/0002-kexec-tools-powerpc-Fix-pointer-declarations-in-read-memory_region_limits.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
