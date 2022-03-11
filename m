Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AF2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 06:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9B04098D;
	Fri, 11 Mar 2022 06:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcUxQPZpw2gy; Fri, 11 Mar 2022 06:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C2D40961;
	Fri, 11 Mar 2022 06:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9863E1BF279
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93EBB400E9
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4ig5JxxPoZr for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 06:59:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1533C400E2
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646981969;
 bh=gcwGlyb3uANpscgddz88HdV05HiQcID4s0137z3d0s8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GqZ+LSkTmT1Bz9p2RYwNdJqZow8Az2G4YdL13juLY+1j5N78y0/tmo0QuEEx0o4ci
 poNGIH1YO8r4lNbgQMao5S1940uYSuPV3ulydX5tjLRR9i17n5xagG+/Un/QN54qDu
 co1JP+g9gbDEayY/hXSC6d0MBzc6gyxaCUjtuWNU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.204]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N1fmq-1o88K108qm-0123ZZ; Fri, 11 Mar 2022 07:59:29 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 07:59:28 +0100
Message-Id: <20220311065928.14849-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ddpPjnUHS15utGPAPUMYwvRGzYyGjxAydGqHr8u5Z2EbEKbe5EU
 sJeWKqVauRt7ecBTieeWW0FKD6bCGt+DoFgVDuM3wjEgTQxpOJDjbojJ8XK3EqNinOA4YEO
 qwd0kDfZMtTbD2iKqGYWZADInOG2o9/jA67XWVoLCnxJlu4m9V4lMFemmVC70xHu9CXwwmt
 i3O2gQgTcQeNBRwBP5fjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lFOWnkgSuH8=:SKAOgAIXeKElmGHSOTWLff
 sTQTw1jRBf+HpPvtOJFpw9IqKa8SWFF8p+AQSQW4/gYPcJ0DiVe9P/cWbffbGu0sqG/w3UaYR
 2fRoTSNeQYkL2Q10o9p6C02qumAvvXiOf+BRKzppYPmAuJnGOPL1UF0JLBcxxtm1CK/w7q+3l
 5dl1d26E5fcnoNUEkReqc91Hl71mx9HLYHLW0/R6kthoGbC2EsIn9XuyDWORZCJmd9W8uOTJF
 HZ3TJpVNaIWxvCGAj0qCaOm96NJR2y7NPn3N9u3btqkM+VeZCcoFl0Pj2pEEXvwZc5AeNIbaf
 PRc9Ro6Uzz/9hZ5hpi6cYm6GnBSnsGxOcCtQ0YZBvjjBEIRbt5DZshmXxmUEob4FGwfb9mg+p
 f7gJN0HijQprauSpFS6tBoc6x1BUhlaPO3MJd2UUKFBGJ9X6C217B9aYbwYMvfJi6Y2of+8IX
 sBGrrRTSNN4pSIfiULvhhExI6JKEDD2xZcNKVG7bDias3QBSmE+IKSpGUMwEvn95BawPgEFpQ
 h7RRSWbrbCExASKUWOeIYVTfxa7Ma6g/rqgm6OcwUYNY7h6ZXi/+uxIFXYPfnP05q5g5Le0A5
 uPeQ30Zj2//37SO6x4CfD4TiW6oEWpQ462WCOhw6feADF5EWORUFjSQt6tgEUFEX2CFhdhOUX
 9Ft79z0ErWUfbHiKRxHgemBgKrCKr1gqYxwBLYj6tt9Hsif2r/dqvHv+9pLEAbXiDkZEEPPK7
 9VmCpNVS4xWesRpb4sLXVA1sI5Bmtb5KSAhPBYAcl2FxxFEJ82roPjYTaWPXVvavD4IrQaLuL
 Qb0Yf8gMdT/1Kx1+cSi+L7YFDAf/XBUBhasLIGRHB3roUeElDJzPShM324BvuEUCCsGf6dA1G
 LyW9XTTK942s6fXAUQupDhVxvP71ZuqyoSXEK8wdB5K1p6Vn3fZ3/3P9G4GjtS8Uue9F/Z2cG
 TA5m0z/9mk7e3AZQT/Z4Y9li2Z0siN0haBXGdCs6bRWWTBikLh6ANlGnD59PG6fhUfYF/+tZb
 8xnmE5OKfIo6/2OJuAFiIolfgS6Jx/a1MVSAgWCQZf7PBkiTXJ4P79hb+El2vibVamBb9NxpY
 D6BRgKBm4aJEAE=
Subject: [Buildroot] [PATCH v1] package/mtools: bump version to 4.0.38
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2022-03/msg00000.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 5d1bca486f..a162bfdc95 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  f4dd1fb4b4d72f344f7efcfb05219de3882c6c6fce678d75e7cfb29ca162c7ca  mtools-4.0.37.tar.lz
+sha256  7086821b399a39b8a3c5a372d064de4860f3c195b4911dd4e8b76219fcabe75c  mtools-4.0.38.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index f73fd5d231..c875814bc7 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.37
+MTOOLS_VERSION = 4.0.38
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
