Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF78C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CCF540463;
	Sun,  8 Jan 2023 15:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCF540463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi8RQ5kp1gvC; Sun,  8 Jan 2023 15:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FE2240201;
	Sun,  8 Jan 2023 15:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE2240201
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1A21BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2EFE81CE1
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2EFE81CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jzb_JHetVJf for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:51:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF14481CDC
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF14481CDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6525876BD; Sun,  8 Jan 2023 15:51:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 16:48:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f37af1800c82ae255c202ea8cfc7e11a65d489f8
X-Git-Newrev: a0e134a05342507bd9ac47da03abca4c9c113a64
X-Patchwork-Hint: ignore
Message-Id: <20230108155101.D6525876BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: needs fexecve
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0e134a05342507bd9ac47da03abca4c9c113a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crun unconditionally uses fexecve since its addition in commit
530d6f661e506a4774b7236cb93d65f669adbc92 and
https://github.com/containers/crun/commit/ce4dfbb97a8a05bef125030eaa6c46c07a5f9344:
resulting in the following uclibc build failure:

/tmp/instance-11/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: src/libcrun/crun-cloned_binary.o: in function `ensure_cloned_binary':
cloned_binary.c:(.text+0x1006): undefined reference to `fexecve'

In 6e3f7fbc072c (package/runc: add upstream security fix for
CVE-2019-5736), we made runc unavailable for uclibc toolchains, and crun
uses fexecve for that same reason, to fix CVE-2019-5736.

So, also make crun unavailable for uclibc toolchains.

Fixes:
 - http://autobuild.buildroot.org/results/e1f4ef2b392c0e7161390ba0f97d6eef3bd12e9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crun/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 5def7001c1..fa0894e126 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
 
 	  https://github.com/containers/crun
+
+comment "crun needs a glibc or musl toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
