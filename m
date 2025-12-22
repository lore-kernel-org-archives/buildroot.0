Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58866E67803
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 18:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293C28086D;
	Mon, 22 Dec 2025 18:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mH_9oPgf5sP; Mon, 22 Dec 2025 18:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56142808B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766427055;
	bh=/iIjf6KDSDCh2hEpRHRvvGsLZw6vDvdbybdHt5tmRGo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MWngZZqHUph/P89FDX1/PzLBANef9XpT5jo7Pb4IwhsWO9FszCU5OXo/Cox2bM2Fo
	 L6T14Fo6VtgezsKO3r78//TW2Zu8pv/0IvyfZkiTL0e5O6IENTZvRjOb5tfO2yqtz/
	 /U7/oTmuHbEAeZC2b2I8UgsJ5RuZl7ramjPz41qKDknHzSCcX9yVuscrKZEJHPBsNz
	 lf8CDiuOrbmt01c5UK6KsjqsmeIlfK4zy3chKJb2ZpiZf2N1Oo/9mSMv87Q8c9C7gm
	 nsa88MNO0ydrAe/ROng+F+iTRZsQ5O0xj6UA8h9Zvynkb3H47UymVJXLmGNZrq9qBs
	 gYU311A8GiEEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56142808B8;
	Mon, 22 Dec 2025 18:10:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6FE119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52779606C4
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxVHfIVwGCMu for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 18:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2B9360716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B9360716
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2B9360716
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:10:49 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id XkMpvbgqjgRm2XkMpvqf9r; Mon, 22 Dec 2025 19:10:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Dec 2025 19:05:45 +0100
Message-ID: <20251222180545.2126505-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDm0C74wRqLrWjXN0Kgj4fNn9KrUWByP6PSk3P+m3w1m2zmRCwmucyIUBe27u2bUiKE+ZsFm86FKkurwAs3jKp4WV2ESV/KsUe+fzZ/bkftqln25s5Kd
 v7oY4EGb1N7OBJqnLin346abcDGmQRK7+3En76uu0MzmIeEkDfB57TqBboeyxvz7VFnqXd4JJASyyUGZZnUE1QDbHBDdOPLSd1ow90gsN+oeXA6uKWuwiXzv
 zL0Xy2txglI2w0MKOfx2MEnlcmpZKqT92a76nVrQoqY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766427047; bh=55whcFIFLOVXEgeRqcmc+xIWNgA3jZYNlpqffSAUMsw=;
 h=From:To:Subject:Date:MIME-Version;
 b=AJIWaQQOe6Y/GdnLkFkmwMsFW1Z3eRhbu5wX7TMXdLM+PH/AKgPu1wAUQv5jOiINZ
 9Y9C9lHD0M40xahWapg5TcWv4He1Wn2/aXV+dFjWxyeemtK5va8TR+8mSZCyVzI8tk
 5Krbz9X5bDbUq66HHssy7gh8F/azDsIqUeY3r2JePQuB1efUb4PV3PQJBGbeyygR/E
 HI5o4h5B7xl7Z77LKrCh4CQAE1VuBc39ZULxclpfqFRiFDlxbq8GvlCfYGlKb6jtHj
 6nhz+WkBhxFfPARAwL/xLi1834wY4fk2YrzKcHRaJ386fRAwGHbcf7INDGc/zKio5n
 Z/yC/lZ6QuBfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AJIWaQQO
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.18.1
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index b4d252ce40..e80d39ac56 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  354b001b112bafa956005d242f6fca9c3a2a03433eeea874e8a44fe2a4a36e7c  libfuse3-3.18.0.tar.gz
+sha256  adb6b7eed09331d72cbbe6d5ef3597024ab46a1d61c6ca7cdd495e51600f8957  libfuse3-3.18.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6a9d0097bf..6418c5798b 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.0
+LIBFUSE3_VERSION = 3.18.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
