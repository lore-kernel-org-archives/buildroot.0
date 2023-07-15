Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD44C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B712360D77;
	Sat, 15 Jul 2023 15:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B712360D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZSct4WGfY0K; Sat, 15 Jul 2023 15:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E631C60E5B;
	Sat, 15 Jul 2023 15:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E631C60E5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 282E01BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F25960D77
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F25960D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QG2vireDzUmq for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1682260D4D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1682260D4D
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:07:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B75ABA4C0FDC;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-26;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:28 +0200
Message-Id: <20230715150536.2959313-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=xHgZ4kzqVDaDP7B6SVjzTR2q/EV5lkiw7BtAt0nfSnc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y+RoTU68x2yGcwIxxDENSIHBnsbi2Yor1HHq+jASpX9POdPjzn08zhX+PVneghJsl
 MaQ/YSjtsPnazKJMXsq2gyM/pwDZkZdMHt8MKqXSuN19mjxz14C5p0ISXJ/bCTFDst
 KZImfUrrGz2oQbrEBmj0Ep+MotBhShD8BpNxZz7nx2KvL04i1OyzdKhtib3fDmSn+O
 Q471FCwEuQzpPVVZHxdWzca5eeYoDQ0SyQ7rWiSPDq3EtEFFzJvsNzuL099nUnSJy/
 pJeL5v2ru3Qk7k2fougOx+rURzWqh+OrWUAn7keMPDt4jtlnNkKmNfKkdX1UBeKdbI
 6Uf9kN8rH0m3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Y+RoTU68
Subject: [Buildroot] [PATCH 12/20] package/erlang-p1-stun: bump version to
 1.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/processone/stun/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index aef122b4a6..49e1963ff0 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f9b82949b54778a4b766dca5509eef4475e1dbc165a449974dbd0cc54c6f84a2  erlang-p1-stun-1.0.47.tar.gz
+sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-p1-stun-1.2.7.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index ce117e20b5..7438bd2186 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.47
+ERLANG_P1_STUN_VERSION = 1.2.7
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
