Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689CE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552D981E25;
	Sun,  1 Oct 2023 16:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552D981E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LTgcj1AVKyg; Sun,  1 Oct 2023 16:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471B081E27;
	Sun,  1 Oct 2023 16:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 471B081E27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7A91BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D822440133
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D822440133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5by41MFGmKa for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044F2400CB
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044F2400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E60F783DB8; Sun,  1 Oct 2023 16:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:31:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19372d52ab42be240561583896554e5eb29db72c
X-Git-Newrev: 43da0b8f78c890750a84d5085ba8163d51876c52
X-Patchwork-Hint: ignore
Message-Id: <20231001163133.E60F783DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/llvm: add llvm dump
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=43da0b8f78c890750a84d5085ba8163d51876c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LLVM_ENABLE_DUMP required by mesa3d rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm-project/llvm/Config.in | 6 ++++++
 package/llvm-project/llvm/llvm.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
index ebb0fca66a..4ee84b3bcc 100644
--- a/package/llvm-project/llvm/Config.in
+++ b/package/llvm-project/llvm/Config.in
@@ -57,6 +57,12 @@ config BR2_PACKAGE_LLVM_BPF
 	  Build BPF target. Select this option if you are going
 	  to install bcc on the target.
 
+config BR2_PACKAGE_LLVM_DUMP
+	bool "enable dump"
+	help
+	  Build LLVM with dump functions even when assertions are
+	  disabled.
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 556a2f8c35..6598d8b6c1 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -228,6 +228,13 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 endif
 
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+ifeq ($(BR2_PACKAGE_LLVM_DUMP),y)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=ON
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+endif
+
 # Compiler-rt not in the source tree.
 # llvm runtime libraries are not in the source tree.
 # Polly is not in the source tree.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
