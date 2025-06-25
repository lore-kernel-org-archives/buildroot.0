Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959DBC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6036158E;
	Wed, 25 Jun 2025 17:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyszDgp2CVfh; Wed, 25 Jun 2025 17:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0A96157D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0A96157D;
	Wed, 25 Jun 2025 17:26:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED88154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9FE341F24
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBBMep-wAe9v for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E18A41F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E18A41F10
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9ED84453; Wed, 25 Jun 2025 17:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:24:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da04cfa26ce7da042c40caa94252c566f47a070c
X-Git-Newrev: 2b5544ab7a5fbab27086525831d468d2200a46c0
X-Patchwork-Hint: ignore
Message-Id: <20250625172649.2E9ED84453@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: unexport TOPDIR to fix gnu-efi
 >= 3.0.18 build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b5544ab7a5fbab27086525831d468d2200a46c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a052628ac7..c581067320 100644
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
