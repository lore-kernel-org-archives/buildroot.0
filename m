Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59558CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CCA60C1F;
	Sun,  3 May 2026 14:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkSlxWhY9J-T; Sun,  3 May 2026 14:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F320560D78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819756;
	bh=Byp32TbIP4AlJw4AT3XhcKy/4b2AoSCJqdOFhqIJDDs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OnUt9LVt7szrrv0gdtopemj6nFwSt0bLfJssPS21hpbN9QzwCrwB/6X+p5rpT8bIH
	 uitWc4PiLTy7Y6I20YXjO6xYy+FGdPuqFbvzehRIbh0pPnpOxBpiF9OZnJTqUku6Ue
	 +Qb7B5hwNWniia5nJtnTzfGI7+p3kZ7b2MKyUQ/KILXtmGFH38zFDFNvtH58F0dpye
	 +txf6aMB5GoB/E1617lf9mlFu/Wh+Jq9W0Q2DrPlunyBHmoc920fyjlWTXs48JGouN
	 I56gozeL4lmiDCQlPkwp/LNPCzGuY+YkQrUwMFr9S4WMMj0uzLrsuOSNA00c+/TnJg
	 ruz0zniqg08Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F320560D78;
	Sun,  3 May 2026 14:49:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D52BD190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7E1E414C6
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OaFDBQaMEgo for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5117C4149E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5117C4149E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5117C4149E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52C80A4C0296
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:49:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40976)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJY85-000000001nT-1t2o
 for buildroot@buildroot.org; Sun, 03 May 2026 14:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 16:49:05 +0200
Message-ID: <20260503144908.2807535-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777819749;
 bh=FXt7Zov9OFZt5VEn7Efny9061miInzRTiGXniVLyvFo=;
 h=From:To:Subject:Date:From;
 b=p6wxWIjlsU0K9l9N7rbxJNwl6l2hOZQNLO1R9Lo8OuhbNov+33U453E5NuL7tnHS5
 jkwt1jbvtfHfpoQr/+jXmXdwXNAO/PJ/Q/SGNeVvpe+cQUdghNPM8Ob+MlK7aG5Eul
 mZyU9KHQhGzlAuFjJuMi4t4+qhAGE4OjCL1Pbd/VgvpbUBRI8vN5o7ybJ9Hi/vnRTN
 G2MZZK5Xj6s0WtnVPggTc4A6AfkqPUmhylzCkmDlQ6EtRbg4LrTGlI4mUzLUsGikPh
 yBNUF9rZ/sPhoEFd+Saplo8TqWA9dVcDoP5YzYg+IoToepptZaLulzdFKYCJMLlsjF
 xii/VuQQrbFCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=p6wxWIjl
Subject: [Buildroot] [PATCH 1/4] package/gdb: link with libatomic if needed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
gdb-14.2: https://autobuild.buildroot.net/results/32f/32f5715285ca46370df2ab35c38d16dbdbde5d21/
gdb-15.2: https://autobuild.buildroot.net/results/386/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41/

Support for gdb 14.x was added to buildroot with commit
a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e so a backport to LTS branches
should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
