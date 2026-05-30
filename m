Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD825CD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6EE852D9;
	Sat, 30 May 2026 10:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh8CBSC3b8Qg; Sat, 30 May 2026 10:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB537852D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137840;
	bh=snjeyzRhPXMybtlMd6J+eMAtGjhu9WpYrpnh6XoCs28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S0AbBraxegF4A6XPty02e0txVlc1bz+YrOJZKhWUNc7LNRdkXziCfyEz9odHku8S0
	 4wiVUMlSfaufswSaV4Rj0X3ZGa8feDbHXmT4/4a1Uw0BbP0FW5gUo6+oWiZCJhahEo
	 Apmu36KkWctqj3Uj2puD5QE47zQDO7D69KNfUHsbm9PGrsyQqET2egRCMlMjBJ4IyI
	 jv0xrno/1uUWEUJPTp/uIZ8A7/CQhJLuzMSda5spju7wIFXuFKIHMDjwwGvXcMiSyR
	 TFEtPcfKlMbzHOH1ZBPMnHV2XGPaUoBOLdy1ytK22AcjZFXci/v37660uhEcroR0r5
	 sl6nn0M/FzVDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB537852D4;
	Sat, 30 May 2026 10:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90A1D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 721EA4081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXpGJ-C9OBQw for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0B7407DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE0B7407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD9D18747E; Sat, 30 May 2026 10:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2dda651348161c271cc05bf9698f213f20b59f0
X-Git-Newrev: 10d428f9c36204ab2262ac6c34ac227fb9f377a5
X-Patchwork-Hint: ignore
Message-Id: <20260530104344.BD9D18747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: link with libatomic if needed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10d428f9c36204ab2262ac6c34ac227fb9f377a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
gdb-14.2: https://autobuild.buildroot.net/results/32f/32f5715285ca46370df2ab35c38d16dbdbde5d21/
gdb-15.2: https://autobuild.buildroot.net/results/386/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41/

Support for gdb 14.x was added to buildroot with commit
a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e so a backport to LTS branches
should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/gdb/gdb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1841002dc1..2a2fdb260d 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -116,6 +116,14 @@ GDB_MAKE_ENV += \
 GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
 GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
 
+GDB_LDFLAGS = $(TARGET_LDFLAGS)
+# Uses __atomic_compare_exchange_1
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GDB_LDFLAGS += -latomic
+endif
+GDB_CONF_ENV += \
+	LDFLAGS="$(GDB_LDFLAGS)"
+
 # We want the built-in libraries of gdb (libbfd, libopcodes) to be
 # built and linked statically, as we do not install them on the
 # target, to not clash with the ones potentially installed by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
