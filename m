Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24394F5A8AB
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 18:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3610607C4;
	Mon, 20 Apr 2026 18:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgzOl8vb-Ua2; Mon, 20 Apr 2026 18:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE1E60B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776710694;
	bh=DgP49s4mFnZ9FizPAq37BNK1iBsFkGsmTHEDzbqCinU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b2PH+THaN2E6HrmHDbQ8V67+HsUanWqnl8nTtpHCPmetTs8mqWXSqLkayEVSoAWGz
	 p/qVI7aZyH97ZXGx2zEjGc6O6Hnt6Fy9Rqrd4H/6AgJJHuKlMsgnh9B3aJA9KcPswY
	 v47z8/NKi06SZaljF1Z6dvA54ZGR+sc8Kota085bnTCSkl9R18xKTFbh09UBHKMzAs
	 hJcmTIUynTP0EfCi20Akvwbaiwgzco0rJXc+jy+J2mnDkA7T7om6zJZp3bm5vzjUK4
	 c4aSpFH5j3ZmzwBk313581Ay+RuKQBh4eelRpL6YNayHfdmGlFlpAU680CeHhzL+q0
	 jiRxaJ0a95dKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE1E60B8D;
	Mon, 20 Apr 2026 18:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B11D824D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ED118078A
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay_cDl37AGqY for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 18:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA3CF80777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA3CF80777
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA3CF80777
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:44:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF2ECA4C38CF;
 Mon, 20 Apr 2026 20:44:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43970)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEtc2-000000008K8-1zPw;
 Mon, 20 Apr 2026 18:44:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Apr 2026 20:44:50 +0200
Message-ID: <20260420184450.3781485-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776710690;
 bh=+nIDYgI4DX3PIQNWwI16gE7WIdVEM9uulwywKTFDmHA=;
 h=From:To:Cc:Subject:Date:From;
 b=PrqaTXhGGTmWygpgqzba6EJYTRDYhnEKNX4Fviy+B26RMtaBO1E3Q5T29o/76DMge
 uMxafXiRib0tVu3WYE0vzmh8vI3QaQyP+m+85UYwcXkxA1jSe+Y5GBz1sI37tNOnbO
 zUju1YYgS/Dsh+ixL7TCsIt+/z+booWInXMqfWtcqIFDrBc1pQJ75vHGH4wRPanOZZ
 OrktpLlBBPFCzcLklpN6VnurrtBzLrxOxxg4cgASQoBOviEJehsMISCk13wUE5bGwB
 HPrMf0BOHtU4IlAydPT1BEPUlb8fHJ/P5yJkyJvDV6C90Rf4lsb77EEhWYn8Tb5FPP
 ngiPQFMbhDV3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PrqaTXhG
Subject: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.25.1
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

https://github.com/bpftrace/bpftrace/blob/v0.25.1/CHANGELOG.md

Added configure option USE_SYSTEM_LIBBPF to use our libbpf package,
needed due to upstream commit
https://github.com/bpftrace/bpftrace/commit/6d53738627d4f80c83f799f9e042f6bdd373a433
which was added to version 0.25.0.

This bump includes upstream commit
https://github.com/bpftrace/bpftrace/commit/c6442cde6e45945e3cfd72cb2fdbcca590454d0c
which adds support for LLVM 22 and fixes build errors introduced by
buildroot commit 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb.

Fixes:
https://autobuild.buildroot.net/results/599/59920f909d808911ea2710938271ecfab48c367f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index 4add96aee3..9990ab3cdc 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
+sha256  89d1cb7448a650eecebe52e8deb6dfa85517ae91c465bccd5246abd4588707dc  bpftrace-0.25.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7b1b41781a..e32798cb83 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.24.2
+BPFTRACE_VERSION = 0.25.1
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
@@ -30,6 +30,7 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DENABLE_MAN:BOOL=OFF \
 	-DINSTALL_TOOL_DOCS:BOOL=OFF \
-	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
+	-DUSE_SYSTEM_BPF_BCC:BOOL=ON \
+	-DUSE_SYSTEM_LIBBPF:BOOL=ON
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
