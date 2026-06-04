Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A53CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C1F381F70;
	Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K46B0MMlobTk; Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7765D81F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663113;
	bh=IrJfBEUjIQB7aH56oSqaWS8yZa4EXPqNrSC2q7bMiKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JOnaAEEmfNYh+CZ9fdnT/N+3fvCWEv/3nDCrLWGx9TU0wN6ZkOGkXWZ3Ljk3Y7vLQ
	 JXQ2unfZpnwD+3jw8+oPRpWaDXceXAfl9W408652cukQ227ZwRnCuktj/WlLam8/QA
	 4WqaDQQaB6XfhqN4RalZFqUOcazbTFTEuwz5FbFpRoTpPlT/LfMtZdMCdcY4Amljol
	 CN43kGv6q//dXX+cVftszuGB2YRO5S3p/hlriTylmAp+1ST88I0Ct9jazOYNs9Ar2M
	 6EYYVCZlujkYLNrVcZDptk2emCgoTsENcJIvIHAB2n2rPgDstZ4yTsRHgJmy7w3coX
	 LOgkFXGpWfPlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7765D81F87;
	Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CFB388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4AC81EA9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB68zCc1Hjzp for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C200981E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C200981E98
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC80E87B3A; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:02:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1748c12fbdd8bcc29837fb142c56a9c56d45b2e7
X-Git-Newrev: 7fcea9d89e5e640155fed001fe40e6eb58ddcb61
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.EC80E87B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gdb: link with
 libatomic if needed
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fcea9d89e5e640155fed001fe40e6eb58ddcb61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
gdb-14.2: https://autobuild.buildroot.net/results/32f/32f5715285ca46370df2ab35c38d16dbdbde5d21/
gdb-15.2: https://autobuild.buildroot.net/results/386/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41/

Support for gdb 14.x was added to buildroot with commit
a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e so a backport to LTS branches
should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 10d428f9c36204ab2262ac6c34ac227fb9f377a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gdb/gdb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index b39b103d00..4a00a29ef7 100644
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
