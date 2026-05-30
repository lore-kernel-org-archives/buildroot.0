Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D852FCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AAF48134A;
	Sat, 30 May 2026 10:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ek_0goJH8vYo; Sat, 30 May 2026 10:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925A48231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135790;
	bh=sKpQC8UIE17KGsz7oOSQEOUQu6QpTH01hTA0+hx9a4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VzJ1yvGA2GTQuTdJtMCyviyJ4P8dHnvG2BnX1u0AB7oMZr1yDzAtAeLPhZsmnogxF
	 hIwLhbSb0H2JVp8t3KKusFWAwZmbUtb/lB74Erc7qtfryC41drItSUae6wJwjdRaFX
	 ZX0wwkNaMiZDGchW00dvLg5L4pVyM7U27EU6xvmPMf2zdjkrsNuUJSv4Gm7hPIsERj
	 o9aMvzKy/uprtp7++82fiVLKifhN5RDvOmi+UvMQYsPnlF5kpbkV/xKTH6Sbivy86P
	 dWnbq+QCKHSH6f9SY3fOO5EBduDi1It+DKrDULCFW73YMsJAU7YFLeK+mu5xFnoFy7
	 LwOAnA4m8ou3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925A48231B;
	Sat, 30 May 2026 10:09:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 314C7218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11B0440879
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ObBXL6r6qKF for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46CB9407D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46CB9407D2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596A487145; Sat, 30 May 2026 10:09:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:04:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b9a32dc7282787ab9d5a09afcb19241d7d600fb
X-Git-Newrev: b2dda651348161c271cc05bf9698f213f20b59f0
X-Patchwork-Hint: ignore
Message-Id: <20260530100934.596A487145@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdill: fix build with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2dda651348161c271cc05bf9698f213f20b59f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Adding -std=gnu17 was recommended in upstream PR:
https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080

Fixes:
https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libdill/libdill.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index bea9aaeecb..453031a471 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -13,6 +13,13 @@ LIBDILL_INSTALL_STAGING = YES
 LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBDILL_CONF_OPTS += --enable-threads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
