Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DD7D339AE
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F4E6EE12;
	Fri,  5 Dec 2025 18:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDeepewOSMaJ; Fri,  5 Dec 2025 18:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A6161C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764960314;
	bh=WBXBPxAe4wAh43nFtsWKJ/VFv4R895qr1RdS2Nowxvs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WBAZVEX3hcEUCrQFudm/BcRcJRWPczgDgrAOFnAGZsNnMHzQkNxRcMqbAJbwLNkjU
	 fopua+tncblHYybdtbnBHKlQ1Y2VpVHKGnZLJiKE5mGrzIsOQBpykM1HJGM/ry0q9A
	 O6zv4FDSqgnC/3N5d5xi1eW9MuTlA5yi/uGJEnnmnEKcwuJgne45L5OsTOJ3GE/pcg
	 9Nr+XY2OCdpG3HELEUtcBRJjMU2mOgU7mmbTfuwcRHYPs5wSs0uB3LQntELQKRNz0F
	 K705BGUsSwWEKhJXKaDu7lfG0LAIpkBDuuuo6EDLz7FX3+TxM6Yt+YzW8a6iv2GrMA
	 u4Grx+m8VKylA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A6161C9F;
	Fri,  5 Dec 2025 18:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3AFF199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA0108420A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nljFKxABonQ1 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 18:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4888383E2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4888383E2A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4888383E2A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:45:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8D87A4C21AD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:45:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40902)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRanj-000000007Ih-037k
 for buildroot@buildroot.org; Fri, 05 Dec 2025 18:45:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 19:45:07 +0100
Message-ID: <20251205184507.1792309-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764960307;
 bh=2X7J/eCmGvx8Wa5tl5g5e9d1pP/oHrhtwoGkytPfU2w=;
 h=From:To:Subject:Date:From;
 b=hKR4hTI3Lw3fdP7R7CwAUivU+XF0XoSKkHzbXVacdmcOIoxRxkC3oxNZYZtYOCFTS
 Up56rXMhLYqRQqvSFjGOjIYZG4bxcPGd/ApkWDDjnY3PUNNSFIWwNX769Td6HjdXUe
 BFESpKRUM6kn48lBCW2g4xQO3z9y2dqXQOi2YiAuC1hapqPpq/l4pWj+MW4o9M6wci
 zUErOD/7/pG0Nd9FZ2bAwF2EcR2JXUyr7EMEp9cb10ClX/8bGfB9IMwmDAMVnnRrLD
 SxuB0z9oF5FOT0+Qxw/ByopjYCHFuczz7mvxN79cp2AC4WT21lMbh3H7QG9zDJhZQ1
 1pDv9F123Lg7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hKR4hTI3
Subject: [Buildroot] [PATCH/next 1/1] package/matchbox-lib: bump version to
 1.14
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

Changelog: https://git.yoctoproject.org/libmatchbox/log/?h=1.14

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

Updated license hash due to upstream commit:
https://git.yoctoproject.org/libmatchbox/commit/COPYING?h=1.14&id=bd46fea025212dac5e2a218a41f971d4cba92b76

Fixes:
https://autobuild.buildroot.net/results/66a/66ac5ae4b1cd053122ccebad9f61af02fa5fe7f6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/matchbox-lib/matchbox-lib.hash | 4 ++--
 package/matchbox-lib/matchbox-lib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index 8144c10258..7c2d972440 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  2d0c3e827acb8f95e801168d6f7fa03497e06ff60cbfe0b8ae7c5e740295c6ac  libmatchbox-1.14.tar.gz
+sha256  8e470c16b6bc23f275c22fec5ed56ca8dceca9d34c87d76d5a0c1295553f15d1  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 00ca4a0d15..097678c028 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MATCHBOX_LIB_VERSION = 1.12
-MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
+MATCHBOX_LIB_VERSION = 1.14
+MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.gz
 MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
