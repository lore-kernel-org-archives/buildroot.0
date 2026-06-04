Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC387CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8221D40F01;
	Fri,  5 Jun 2026 12:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bxbScGUZO_z; Fri,  5 Jun 2026 12:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC519411E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663191;
	bh=hcpziGZtT5CfMSDFbkwRXxVUmZ3FcrIop/qfYUtyhuM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fNB9wDHSnCGA6Cs75dRXln5BiYlKQvdh8OtO8anbCV8VxNX1dZ7L03XVC8ypDfJT1
	 ZqBTOhReEq/A0wFh07Nr7hKclqgVPcqWWEOLF59wRo8JbLu7Kbs5RDZQoZcRoF7qgV
	 HAbpUvhw3vKynbny3St6BEITejKWzWZnqQTBVLb9NaEdSiOHa54nhvMR1cQ5ea4KkN
	 BFx+NSNOeSBVyq81R8YqbRBQvPli+hDbg5f6lcfT2PvVFheUxxzcUrbTtIcbANNsIF
	 27CeIEbJlP9e+Ap5v5hzadKPcWJQOTfdACemBwrIXBcwxo0hWvmNbImuVoOvryDFma
	 HtcSdoMeAHxFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC519411E9;
	Fri,  5 Jun 2026 12:39:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1798E388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6A9341027
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3cq2xXuF75O for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3006D41013
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3006D41013
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A5DF872F5; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:02:11 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 516e0521e8b05103eb5112d7266a1962cb9a952f
X-Git-Newrev: df47e4fec2acecbd98a56b65316c81f74e4cb186
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.5A5DF872F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/gdb: link with
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df47e4fec2acecbd98a56b65316c81f74e4cb186
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
