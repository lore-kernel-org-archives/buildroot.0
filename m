Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE63C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCAC610A5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BCAC610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20012402AF;
	Wed,  6 Oct 2021 15:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7nMlvhoi5RT; Wed,  6 Oct 2021 15:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 800BC4027E;
	Wed,  6 Oct 2021 15:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE201BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D5A60EB2
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3jas-Gv_IHO for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:48:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4509760EB0
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:48:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 11C2292B8D; Wed,  6 Oct 2021 15:46:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:42:44 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bb97e879ec7d163c3993f18cbd6220d7514667a6
X-Git-Newrev: 870d6ca78227abdc6fd2c32bf3ed8382cb229285
X-Patchwork-Hint: ignore
Message-Id: <20211006154608.11C2292B8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/dc3dd: disable on
 arc
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

commit: https://git.buildroot.net/buildroot/commit/?id=870d6ca78227abdc6fd2c32bf3ed8382cb229285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Disable dc3dd on arc like we've done for riscv32 because of the size of
time_t:

In file included from getdate.y:40:
verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
  132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
verify.h:138:61: note: in expansion of macro 'verify_true'
  138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
      |                                                             ^~~~~~~~~~~
getdate.y:116:1: note: in expansion of macro 'verify'
  116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
      | ^~~~~~

Fixes:
http://autobuild.buildroot.net/results/9e2/9e2a8f0548ecb5ce9539eda007cd886ddea7dc0a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fa937f2756ab1f683df65b3445722cc4bb11f144)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index 715451beb7..bd181b7065 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
 	depends on !BR2_RISCV_32
+	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -13,5 +14,6 @@ config BR2_PACKAGE_DC3DD
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
 	depends on !BR2_RISCV_32
+	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
