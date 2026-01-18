Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8462C9830C
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EF3D80A47;
	Sun, 18 Jan 2026 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4uwgzkhVK2h; Sun, 18 Jan 2026 21:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA61E809C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768771893;
	bh=3SimNYKQa/sPXqrAuZCiqWCEaANfIIECC5LepfwghLk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qj2VvzAZ2nJzHUKdxWB+joPe4M2zzXu5yBQ5gW4nex95r5AF+wHYLl1uTnMOyD2us
	 F56fdF2/RYyemCj0Ai4G3+hUUJ/SbLI61YznIgGCg/sg1L9nGN12LTURN5w9WE/iTY
	 NAkHCnQwQPgAsuPM4mbJCo06Yd5uLR/GNXZPRfw7XLB3G30cRr9bgKRPVFFxCzPXte
	 as21U48EVh6zHD/JlrroWQQR5BfZjMExg+RJ2DKX2/m0DQ7pQQwpUBuIQV5Py/d/VN
	 KqWvOPtRc83vdyzPi4riUFFTYEBYE6zm36EU/C/Ig9qXwSGOLajYYdcMoWekn1WsDs
	 lZb/1Lo6qr5OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA61E809C2;
	Sun, 18 Jan 2026 21:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FD9160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D849B40291
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7GVoQyT46lV for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 21:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFB0740280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB0740280
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFB0740280
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 21:31:30 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5AFAE2003C6;
 Sun, 18 Jan 2026 22:31:25 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 22:31:20 +0100
Message-ID: <20260118213120.69615-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118213120.69615-1-vjardin@free.fr>
References: <20260107234505.0810d964@windsurf>
 <20260118213120.69615-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768771888;
 bh=l9SUYKtvixx02ofyVUfGFut7Eo2HB90t6MbD3qQPnOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MNFXts7XflWEmZrqTtUkICv3oMq/HcwXucVx750CYSSuFWT3AidAVsoTd1DhWlvta
 me9tNRLMRQI0s5Jb2AJPcvpvP0wyYgrPbCVJG+LqDimxQYuNms3LCR6lak8tyQfaKo
 3VBh8w1cbgW5SPfdbghzgJz5sv7GUW6aGGvkIrUm/2yN778w4NZPX72KP2Lng0JfBQ
 w9lG9R3xufzL35+XR28TL1jWJrUP6HmVitSOFL31cvAfjxHtY9ooLcrSWe/wbvr7ed
 4pYtinM2OxiUPu6mK9CiIoxXpvr0SDAHa83o3uXvjKkCDzJG/YOkNA0Lhr52JQWH39
 bfmfp4ab4/ZKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MNFXts7X
Subject: [Buildroot] [PATCH v1 1/1] package/sysrepo: fix build on riscv32
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On riscv32, glibc doesn't define SYS_futex (only SYS_futex_time64),
causing the build to fail with:

  error: 'SYS_futex' undeclared

Use pthread-based condition variables instead of futex on this
architecture by setting -DSR_COND_IMPL=sr_cond_pthread.

Fixes:
  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

The issue affects all sysrepo versions on riscv32 glibc configurations.
Since the 2025.02 LTS branch has sysrepo 3.6.11 which also has this
issue, this fix should be backported.

Upstream: https://github.com/sysrepo/sysrepo/issues/3346
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/sysrepo/sysrepo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 59dc59a5df..329c0ee7c6 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -26,6 +26,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+# riscv32 glibc doesn't define SYS_futex (only SYS_futex_time64)
+# Use pthread-based condition variables instead of futex
+# https://github.com/sysrepo/sysrepo/issues/3346
+ifeq ($(BR2_RISCV_32),y)
+SYSREPO_CONF_OPTS += -DSR_COND_IMPL=sr_cond_pthread
+endif
+
 define SYSREPO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysrepo/S51sysrepo-plugind \
 		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
