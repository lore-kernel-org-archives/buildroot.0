Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DB1CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C10240A5C;
	Sat, 11 Oct 2025 21:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pWbCHXPhN79; Sat, 11 Oct 2025 21:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3100E40773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3100E40773;
	Sat, 11 Oct 2025 21:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25778BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16DBB40746
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xY-Gt9JQDV8P for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DEE540743
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DEE540743
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB6F87073; Sat, 11 Oct 2025 21:51:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:48:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab906018c98e5f0838b023fa886c6c52a1cc5cf6
X-Git-Newrev: be4fb117bc7dc078c2097fe0eae6bbbfab0c465b
X-Patchwork-Hint: ignore
Message-Id: <20251011215120.2EB6F87073@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: use append-assignment
 in conditional code
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

commit: https://git.buildroot.net/buildroot/commit/?id=be4fb117bc7dc078c2097fe0eae6bbbfab0c465b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its inception in 9646e80fca28 (micropython: new package), the
ppc-specific CFLAGS are simply assigned, and since 9fd9f4e6752f
(package/micropython: define MICROPY_NLR_SETJMP for xtensa), the same
goes for the xtensa CFLAGS.

Although they are mutually exclusive (different archs) and that there is
no prior assignment, the customs are to use append assignment in
conditional blocks, to avoid accidentally overwriting a valure set
previously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/micropython/micropython.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e1e1f88d51..826247069e 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -21,12 +21,12 @@ MICROPYTHON_IGNORE_CVES += CVE-2024-8947
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
-MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_GCREGS_SETJMP=1
 endif
 
 # xtensa has problems with nlr_push, use setjmp based implementation instead
 ifeq ($(BR2_xtensa),y)
-MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
 endif
 
 # https://github.com/micropython/micropython/issues/14115
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
