Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40311C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB3083D55;
	Fri,  4 Jul 2025 06:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcReZJBQT4rz; Fri,  4 Jul 2025 06:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB79B820CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB79B820CB;
	Fri,  4 Jul 2025 06:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4193F1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 332BC81A8E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYJum8wkAH4h for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DAA481AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DAA481AF3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF0A85E0C; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:53:49 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c7221c53dfd1f0b65f7c975470ff2669c15187c8
X-Git-Newrev: 52589e9dd716d88366c6327a03d2233a340384fd
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.7BF0A85E0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Makefile: unexport TOPDIR
 to fix gnu-efi >= 3.0.18 build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=52589e9dd716d88366c6327a03d2233a340384fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

gnu-efi fails to build if TOPDIR is exported in the environment since the
move to version 3.0.18 in commit 9efeb7e914 ("package/gnu-efi: bump to
version 3.0.18").

The reason is the change in TOPDIR logic introduced by upstream commit
31913f8489 ("Make: make TOPDIR actually work and get rid of unused CDIR"):

https://github.com/ncroxon/gnu-efi/commit/31913f8489f8e6eb624b6447d2e5cf1f6367bebf

export TOPDIR=foo; make gnu-efi
...
/path/to/buildroot/output-gnuefi/host/bin/aarch64-linux-ld: cannot find
 /path/to/buildroot/output-gnuefi/build/gnu-efi-4.0.0//apps/../aarch64/gnuefi/crt0-efi-aarch64.o:
 No such file or director
make[2]: *** [Makefile:89: apps] Error 2
make[1]: *** [package/pkg-generic.mk:273: /path/to/buildroot/output-gnuefi/build/gnu-efi-4.0.0/.stamp_built] Error 2
make: *** [Makefile:23: _all] Error 2

As a workaround, unexport TOPDIR like we do for other sensitive environment
variables.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2b5544ab7a5fbab27086525831d468d2200a46c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 8cafcaf834..e98ce34891 100644
--- a/Makefile
+++ b/Makefile
@@ -428,6 +428,7 @@ unexport QMAKESPEC
 unexport RANLIB
 unexport TAR_OPTIONS
 unexport TERMINFO
+unexport TOPDIR
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
