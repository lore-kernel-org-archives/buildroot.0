Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B1C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B91C608F5;
	Sat, 15 Jul 2023 15:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B91C608F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nX3TyZM3EoMu; Sat, 15 Jul 2023 15:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E72860B3D;
	Sat, 15 Jul 2023 15:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E72860B3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5221BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4092E60A63
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4092E60A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXIrajOPorD0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:05:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8676C60881
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8676C60881
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:05:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16A38A4C0EAD;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq0-0002tE-2R;
 Sat, 15 Jul 2023 17:05:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:18 +0200
Message-Id: <20230715150536.2959313-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=paijy3SUH2HjNhTdGUHjfszePhJZfUrksg4H47Mn1QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AnruHSuSWQSe/G6wPst3iV6MK6uIp1c3HqpZZ08etgIFnRBPA89cfN8Gpim92y+jx
 FwQFSdaMPqxo47Nh9GYjWPOas0+ITu3lQM9VxynKJi/whkFG8/njUgntT/XTIuX96I
 lnzItErcs2VanruagCRul0bn6KWpiG+RnSntGM806Fl0NRv8dens3HvQ7Y5bZk/GhF
 tGyYq6YqzwncebN4ViF6fttKN7nDTQJFRvRsNNZ9N9KOF7yMx99fnZMZBfsDMbxder
 AoVgrmS78d6GmWEDiisHsc8cyUKQ1bNf1HPeACqyJNrvx+P4WVcpFW8OIsLQCik6M2
 hsH7HEzppC1jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AnruHSuS
Subject: [Buildroot] [PATCH 02/20] package/erlang-goldrush: bump version to
 0.2.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-goldrush/erlang-goldrush.hash | 2 +-
 package/erlang-goldrush/erlang-goldrush.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
index 237bc8810c..ff4c8d64af 100644
--- a/package/erlang-goldrush/erlang-goldrush.hash
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612  erlang-goldrush-0.1.9.tar.gz
+sha256  45eb313413226933fcb8d723d087e82563dbd80897b236c45ac3a7016a7d192f  erlang-goldrush-0.2.0.tar.gz
 sha256  335dd315c1bf12bd9bde777666c45e92652c9fe633101b12fc6f927b88433b6f  LICENSE
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index e95b09cd86..562317b77a 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_GOLDRUSH_VERSION = 0.1.9
+ERLANG_GOLDRUSH_VERSION = 0.2.0
 ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
 ERLANG_GOLDRUSH_LICENSE = ISC
 ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
