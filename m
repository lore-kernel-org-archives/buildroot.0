Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8434D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C1D80D53;
	Sat, 26 Oct 2024 21:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Kz4UjYAfiK5; Sat, 26 Oct 2024 21:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C47EE80D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47EE80D54;
	Sat, 26 Oct 2024 21:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F098A5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5E840288
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8XQRxF551dW for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD29240166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD29240166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B405084279; Sat, 26 Oct 2024 21:26:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:25:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 868d30c654b78ba74c8627244ebee079a04c0245
X-Git-Newrev: 71f36ef9385f860683b5c39a2c3af9f821833c5a
X-Patchwork-Hint: ignore
Message-Id: <20241026212629.B405084279@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: fix musl compile issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71f36ef9385f860683b5c39a2c3af9f821833c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not totally clear which update is responsible for the
breakage. The breakage has been occurring for as long as Jan 2022.
Therefore it should be backported to older supported buildroot releases.

Add a patch from Gentoo people, also reported Upstream to fix the
issue.

Fixes:

 http://autobuild.buildroot.org/results/abf/abfe66cec3680d396c5774ba492f34599e513edc/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../file/0001-file-seccomp-fstatat64-musl.patch    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/file/0001-file-seccomp-fstatat64-musl.patch b/package/file/0001-file-seccomp-fstatat64-musl.patch
new file mode 100644
index 0000000000..ecb12fe44e
--- /dev/null
+++ b/package/file/0001-file-seccomp-fstatat64-musl.patch
@@ -0,0 +1,32 @@
+From 8c13923a8e17a02be0989649b2edc20124816729 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 15 Jun 2021 16:08:22 -0400
+Subject: [PATCH] seccomp: undef fstatat64 to avoid build failure on musl
+
+sys/stat.h in musl does this:
+
+  #define fstatat64 fstatat
+
+Counteract this with an #undef.
+
+Bug: https://bugs.gentoo.org/789336
+Bug: https://bugs.astron.com/view.php?id=473
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A under discussion
+---
+ src/seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index 5a39ee45..d2a1139a 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -205,6 +205,7 @@ enable_sandbox_full(void)
+ #endif
+  	ALLOW_RULE(fstat64);
+ #ifdef __NR_fstatat64
++#undef fstatat64
+ 	ALLOW_RULE(fstatat64);
+ #endif
+ 	ALLOW_RULE(futex);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
