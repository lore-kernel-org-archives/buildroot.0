Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3756EEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E1341E62;
	Fri, 13 Feb 2026 19:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53ehf8Qm8HAo; Fri, 13 Feb 2026 19:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEDD24225A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011600;
	bh=+I6iKWVPdgcDhD9kGsM3TahRNBC2A2EIzxWjLwtRKYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i4zLttlCVZnu0iS0fUVOBb+CMocdwqxtcaxi5ktgZTwHMwPYQPJJMIuEJA2o5Gp2g
	 6Rv7ol1l5NuzbadOXhWxm+duwuIm99NlWExQfqXdgXybBf21lAKDNPcQyW3Q6/meZo
	 0A9lZoidFNQbQljWgqUCQVvxMhmSvUJqWkMgKoVmWR6vwI1381dq6+6KfS+VzjT7GE
	 8QUK1whd0Zq1A3xGY7mecIhlNxH18ebrgC9udChcsmouh70eNzaS6HYO8reT/nQaP6
	 67rzLyvV9i/fC4VskescmqUlCrrbNPc3UQPbl5+YJ/cbt9N4iV4SquVbgN1PFdDYfE
	 u/6Rci9mI8U7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDD24225A;
	Fri, 13 Feb 2026 19:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D6769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0800941302
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdAD16oDeZeF for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7BC9413C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7BC9413C7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACEDA83DBC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 84d7d2c3ac0a9a6ae3df769cbb59bc9948dded0e
X-Git-Newrev: 5fb22b1ee298742253ccf194ed0dfbf2552d2770
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.ACEDA83DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libbsd: fix build
 with uClibc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fb22b1ee298742253ccf194ed0dfbf2552d2770
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Since the bump of libbsd from 0.11.7 to 0.12.2 in Buildroot commit
c555b6565f2747047603dc8022f81b7ea14b4890, the build of libbsd was
broken on uClibc, due to changes in libbsd.

In order to fix this, we add a patch (submitted upstream), which is
based on a suggestion from libbsd's maintainer, itself based on an
initial proposal from Dario Binacchi.

Fixes:

  https://autobuild.buildroot.net/results/384022450a09b7d731e3817c812e30e15187344b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0fd48dc2651a8c60ca82bef760670b3a62ab621)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-configure.ac-add-support-for-uClibc-ng.patch | 88 ++++++++++++++++++++++
 package/libbsd/libbsd.mk                           |  1 +
 2 files changed, 89 insertions(+)

diff --git a/package/libbsd/0001-configure.ac-add-support-for-uClibc-ng.patch b/package/libbsd/0001-configure.ac-add-support-for-uClibc-ng.patch
new file mode 100644
index 0000000000..8993df9349
--- /dev/null
+++ b/package/libbsd/0001-configure.ac-add-support-for-uClibc-ng.patch
@@ -0,0 +1,88 @@
+From 5ce5a4aa22e90301816bd1f24c24be64592dc01c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 4 Feb 2026 11:54:30 +0100
+Subject: [PATCH] configure.ac: add support for uClibc-ng
+
+The proposed support is based on the comment at
+https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/32#note_3252386,
+with the following changes:
+
+- Assume explicit_bzero() is available, since it's been available
+  since uClibc-ng 1.0.47, which has been released years ago.
+
+- Assume reallocarry() is NOT available, because its availability
+  depends on the exact malloc() implementation configured in
+  uClibc-ng. See
+  https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/77c8c358b52e875c8f4568ecf6c327b95dddbd05
+  for details.
+
+Upstream: https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/33
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2a15d72..d131861 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -214,6 +214,56 @@ AS_CASE([$host_os],
+     abi_vis=yes
+     abi_wcsl=yes
+   ],
++  [*-uclibc*], [
++    api_time_macros=no
++    abi_accmode=yes
++    abi_arc4random=yes
++    abi_arc4random_stir=yes
++    abi_asprintf=no
++    abi_bsd_getopt=yes
++    abi_closefrom=yes
++    abi_consttime_memequal=yes
++    abi_err=no
++    abi_errc=yes
++    abi_expand_number=yes
++    # Available since uClibc-ng 1.0.47
++    abi_explicit_bzero=yes
++    abi_explicit_memset=yes
++    abi_fgetln=yes
++    abi_flopen=yes
++    abi_fmtcheck=yes
++    abi_fpurge=yes
++    abi_freezero=yes
++    abi_funopen=yes
++    abi_getbsize=yes
++    abi_getpeereid=yes
++    abi_humanize_number=yes
++    abi_id_from_name=yes
++    abi_inet_net_pton=no
++    abi_md5=no
++    abi_name_from_id=yes
++    abi_nlist=yes
++    abi_pidfile=yes
++    abi_proctitle=yes
++    abi_progname=yes
++    abi_readpassphrase=yes
++    # Depending on the uClibc-ng configuration, reallocarray() may or
++    # may not be available so assume it isn't.
++    abi_reallocarray=no
++    abi_reallocf=ues
++    abi_recallocarray=yes
++    abi_stringlist=yes
++    abi_sort=yes
++    abi_strl=no
++    abi_strmode=yes
++    abi_strnstr=yes
++    abi_strtonum=yes
++    abi_strtox=yes
++    abi_timeconv=yes
++    abi_transparent_libmd=no
++    abi_vis=yes
++    abi_wcsl=yes
++  ],
+   [darwin*], [
+     api_time_macros=no
+ 
+-- 
+2.52.0
+
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 557b49fca6..af285e05b0 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -13,5 +13,6 @@ LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_CPE_ID_VENDOR = freedesktop
 LIBBSD_INSTALL_STAGING = YES
 LIBBSD_DEPENDENCIES = libmd
+LIBBSD_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
