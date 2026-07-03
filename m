Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF572C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61BCF60872;
	Fri,  3 Jul 2026 19:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gwtZtjlKNc2; Fri,  3 Jul 2026 19:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9CA605DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783105520;
	bh=Sbv24h+GvbB33SPU1bv3rvwDRZ4UDr1I3NC54EZdsks=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xf5O1DW71weSJlHTWLZYiL1nwxX4b9djsMz+VOkzc9l3gSjvO6wvMspaHSoxvMjYS
	 we1pYWN25nTAvfw+8i8hUhDdGQaTP+j8f+cBLzBEKUxAechGzhxt4nXLLLxpykN6NY
	 1163qeQLgfE7su3H1sY7boomvGUT9X3bjHO5jYoN2WZvshJ6ujMeZL/z83BDRqH9eH
	 rc9Gq5f52btpm4JH+jb6lD/WPUsJlSP17Y4h+mSqY7KEFQpsW2DA+BTJ0L7d/1T5cW
	 pRqGnFsggvHY6AmSwbY0t7YiF4w+LhbjUvNveT4VvJKRjEZpGhpiEfSQawIWWMROwY
	 5UfBXJO6SiAGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9CA605DD;
	Fri,  3 Jul 2026 19:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E616B316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3E760805
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRYamk2zguCs for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC31160679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC31160679
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC31160679
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:05:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCEA7A4C08D9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:05:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40392)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjCN-000000004Zw-2IWz
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:05:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:05:15 +0200
Message-ID: <20260703190515.3688255-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783105515;
 bh=KrwOpf3sH2PsRFCWNGjTdEkdgLfSK8VsXN7vVA9FFAM=;
 h=From:To:Subject:Date:From;
 b=O1Drsh3sDMBO6tyyFjVXDdA4oUIHw03Cxc4TDEGB9XoEaVEP1/YSxNFbdBx6wvG3Y
 GhRg/jUwLeGG7sijqR1Kgej3PW0//PN8BDIdFqk+j+Ea5f+KikFstg2+jzMZ3W3BFP
 Gi9CbO3cISpIF51eeBHN+C8qfZBjxsrp4dJSSsBqua73K+OazcoBQ8TNN7wKb6tfhk
 5mRkH2UeeR626Uir3i53Iz8VJOvTtIDGiF/lNT0Ejjoakwiry3j5+bWUSXTQXpSaz3
 11FkLc782dJy8CikMkOLb+0NEdkhO9jdZQPP154sFqZZ6kPNNJeOHc/EdZcwTSh8G2
 F6R4eqVewoKFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=O1Drsh3s
Subject: [Buildroot] [PATCH 1/1] package/libva: bump version to 2.24.0
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

https://github.com/intel/libva/blob/2.24.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5a5c43412bec68409af03749c2cd60cc45ce81d1

 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2d7e8b7ee8..5e26dd8b99 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b10aceb30e93ddf13b2030eb70079574ba437be9b3b76065caf28a72c07e23e7  libva-2.23.0.tar.gz
+sha256  6d4aff97decc0401875a25f8e1319e41e73f0d137f19fc330ba4506b18c65541  libva-2.24.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f41a0c00ff..0735b19f85 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.23.0
+LIBVA_VERSION = 2.24.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
