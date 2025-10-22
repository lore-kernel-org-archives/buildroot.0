Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B058CCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153FB61457;
	Wed, 22 Oct 2025 16:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slv1ooOXh_he; Wed, 22 Oct 2025 16:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDF76145B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDF76145B;
	Wed, 22 Oct 2025 16:42:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F865DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC1740AE4
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRxfyLdMednd for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B3A40754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8B3A40754
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C68EF85F7D; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:39:06 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: ac4b33554402a65ed61146820258cff521d6232d
X-Git-Newrev: 9efd1a9ea89fdc56243146f1cdf9dfab16514dee
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.C68EF85F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/micropython: fix
 passing multiple CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=9efd1a9ea89fdc56243146f1cdf9dfab16514dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Before commit 50bc5aa17b32 (package/micropython: fix segfault at exit()
with gcc >= 14), only architecture-specific CFLAGS were passed, and only
one per arch. But 50bc5aa17b32 introduced a non-arch CFLAGS, for gcc
versions, so when the build happens for an architecture for which there
is a CFLAGS, and when gcc is 14 or newer, there are two CFLAGS added,
causing build failures:

    [...] /usr/bin/make [...] CFLAGS_EXTRA=-DMICROPY_GCREGS_SETJMP=1 -DMICROPY_NLR_SETJMP=1 [...]
    /usr/bin/make: invalid option -- 'D'
    /usr/bin/make: invalid option -- 'M'
    Usage: make [options] [target] ...

The fix is simple enough: just quote the CFLAGS.

Fixes: https://autobuild.buildroot.org/results/b18/b18d6fa9938c1267a771fdbcd8b4c3df812cd6b9/
Fixes: 50bc5aa17b320d91809048d5ef6a110f8c0b9157

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chris Packham <judge.packham@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ab906018c98e5f0838b023fa886c6c52a1cc5cf6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 32b361db16..e1e1f88d51 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -42,7 +42,7 @@ MICROPYTHON_MAKE_OPTS += \
 	MICROPY_PY_BTREE=0 \
 	MICROPY_PY_USSL=0 \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-	CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+	CFLAGS_EXTRA="$(MICROPYTHON_CFLAGS)" \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
