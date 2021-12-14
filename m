Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBA8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06423813F4;
	Tue, 14 Dec 2021 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8QMMdADEm-G; Tue, 14 Dec 2021 20:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7269280DB4;
	Tue, 14 Dec 2021 20:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7D11BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C6B1405ED
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3I3XBT414oZ for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 490B0405EA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 44D068182C; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c12b00924818d402513808e17ee92e843932834
X-Git-Newrev: 0c3ff03090dcbfce32823c046899305eb816d6d0
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.44D068182C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moarvm: fix libffi select
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c3ff03090dcbfce32823c046899305eb816d6d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

moarvm's dyncall supports powerpc64 since version 2020.05 and
https://github.com/MoarVM/MoarVM/commit/d2e84186764bd3c45e7e10547f87ffc5a06f9efd

moarvm's dyncall supports mips since version 2020.02 and
https://github.com/MoarVM/MoarVM/commit/657b536cf6e861ac0bb4bf550e8aea5042a950be

dyncall does not support RISC-V as stated in https://dyncall.org/index

Fixes:
 - http://autobuild.buildroot.org/results/027b7d15e6a6111409ed17bb29e001b6c6d9e0cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/moarvm/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index ec38047b2d..11d8ac7ebc 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -8,10 +8,8 @@ config BR2_PACKAGE_MOARVM
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
-	# dyncall does not work on MIPS; libffi needs to be used.
-	# See: https://github.com/MoarVM/MoarVM/issues/222
-	# dyncall does not work also on powerpc64 and powerpc64le
-	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc64 || BR2_powerpc64le
+	# dyncall does not work on riscv
+	select BR2_PACKAGE_LIBFFI if BR2_riscv
 	select BR2_PACKAGE_ZSTD
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
