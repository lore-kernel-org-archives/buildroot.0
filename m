Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF86AC43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905A2812A5;
	Thu,  3 Nov 2022 21:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905A2812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBtOEmRXWIzs; Thu,  3 Nov 2022 21:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9DBC813DC;
	Thu,  3 Nov 2022 21:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9DBC813DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93D2A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD8F40BC6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD8F40BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WegWa69644k for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43C5240520
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43C5240520
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33BBF87C43; Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:12:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5adf96d5bd3a580ab47e74ef8988594435a18a20
X-Git-Newrev: a353cf87367fa2df22b8f0e55dee4d48a6f91ea8
X-Patchwork-Hint: ignore
Message-Id: <20221103211336.33BBF87C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/numactl: link with -latomic if
 needed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a353cf87367fa2df22b8f0e55dee4d48a6f91ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.0.16 in
commit e9bc980d93a189a16e7320bd254b906c87ca9f87:

/nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'

Fixes:
 - http://autobuild.buildroot.org/results/a92c1c60518d3fe08f3f808f9cc812031e85a4e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-link-with-latomic-if-needed-again.patch   | 41 ++++++++++++++++++++++
 package/numactl/numactl.mk                         |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/numactl/0001-link-with-latomic-if-needed-again.patch b/package/numactl/0001-link-with-latomic-if-needed-again.patch
new file mode 100644
index 0000000000..54d55656ec
--- /dev/null
+++ b/package/numactl/0001-link-with-latomic-if-needed-again.patch
@@ -0,0 +1,41 @@
+From 692abb6d751a41c7f0206771ecd454933750256e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 13:28:02 +0100
+Subject: [PATCH] link with -latomic if needed (again ...)
+
+numactl unconditionally uses __atomic_fetch_and but some architectures
+(e.g. sparc) needs to link with -latomic to be able to use it. So check
+if -latomic is needed and update numa.pc accordingly.
+
+This linking was made by e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 but
+wrongly reverted by 10c277c20768be9a563f75265bcd7e73954763ad resulting
+in the following build failure on sparc or microblaze:
+
+/nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
+libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/54b7567d804d9abff56f47cd26bae774c1e38669
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/numactl/numactl/pull/144]
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8510fc5..ebf9917 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,8 @@ AM_CONDITIONAL([RISCV64], [test x"${target_cpu}" = x"riscv64"])
+ 
+ AC_CONFIG_FILES([Makefile])
+ 
++AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
++
+ # GCC tries to be "helpful" and only issue a warning for unrecognized
+ # attributes.  So we compile the test with Werror, so that if the
+ # attribute is not recognized the compilation fails
+-- 
+2.35.1
+
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index b2f349255f..157f953c51 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -10,6 +10,8 @@ NUMACTL_SITE = \
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
+# We're patching configure.ac
+NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
