Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD5CAC583
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE2083F0E;
	Mon,  8 Sep 2025 10:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRTgXQUu4Jnb; Mon,  8 Sep 2025 10:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1791C83F7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1791C83F7C;
	Mon,  8 Sep 2025 10:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA9E1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E52604151D
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0edLDWLa6TZ for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78AF441534
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78AF441534
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76B2483A95; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Sep 2025 12:36:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cd32013c57363a44ee266426eda6f3d0ee789c48
X-Git-Newrev: 633f0731e11ca87a141469aae28262046156980c
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.76B2483A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ipset: fix build
 w/ musl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=633f0731e11ca87a141469aae28262046156980c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When building ipset with musl libc the following error appeared on the
autobuilder in 2025.02.x:

```
ipset.c: In function 'main':
ipset.c:35:21: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
   35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
      |                     ^~~~~~~~
ipset.c:35:21: error: passing argument 1 of 'strcmp' makes pointer from integer without a cast [-Wint-conversion]
   35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
      |                     ^~~~~~~~~~~~~~~~~
      |                     |
      |                     int
In file included from ipset.c:13:
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_IPSET=y
EOF
make olddefconfig
make ipset
```

This patch adds the upstream commit [1], that fixes this issue by
including explicitly `libgen.h`. This patch is part of the master
branch since commit [2].

[1] https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
[2] 8fdbbefa08 package/ipset: bump to version 7.23

Fixes: https://autobuild.buildroot.org/results/930/930802ecc324c4cfc697191aa6a68642a4188e7b
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...implicit-declaration-of-function-basename.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
new file mode 100644
index 0000000000..c01fdaf671
--- /dev/null
+++ b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
@@ -0,0 +1,31 @@
+From 316f592ddc547c28388da4e7cb7c5c8f89cd3591 Mon Sep 17 00:00:00 2001
+From: Mike Pagano <mpagano@gentoo.org>
+Date: Fri, 30 Aug 2024 11:31:19 -0400
+Subject: ipset: Fix implicit declaration of function basename
+
+basename(3) is defined in libgen.h in MUSL.
+Include libgen.h where basename(3) is used.
+
+Signed-off-by: Mike Pagano <mpagano@gentoo.org>
+Acked-by: Phil Sutter <phil@nwl.cc>
+Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>
+Upstream: https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ipset.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipset.c b/src/ipset.c
+index 162f477..d7733bf 100644
+--- a/src/ipset.c
++++ b/src/ipset.c
+@@ -15,6 +15,7 @@
+ #include <config.h>
+ #include <libipset/ipset.h>		/* ipset library */
+ #include <libipset/xlate.h>		/* translate to nftables */
++#include <libgen.h>
+ 
+ int
+ main(int argc, char *argv[])
+-- 
+cgit v1.2.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
