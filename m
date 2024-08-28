Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE9C636E0
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92645812D0;
	Wed, 28 Aug 2024 16:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5YU1IOWZVcH; Wed, 28 Aug 2024 16:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98BBA80E68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BBA80E68;
	Wed, 28 Aug 2024 16:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF7221BF3A4
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 16:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA1D980E68
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 16:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbqg60HkIoTm for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 16:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0C0180CBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C0180CBC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0C0180CBC
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 16:33:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 37362200408;
 Wed, 28 Aug 2024 18:33:43 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 18:33:42 +0200
Message-ID: <20240828163342.62819-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724862826;
 bh=DCFX3yQg6Hm8WMpvyo9OZmGTAtc3aOqTYzNq92nhS5Q=;
 h=From:To:Cc:Subject:Date:From;
 b=N/kcwH0JMN+wYj3b+Cezvc3/cl5+Ju/9XEW+u10ySftpisAp6xmD0Eh7WfWGr4+py
 IZa0jsRoJrwFGGJ8cBFNHFoVzz8WyC9GP+HH6ks/CvGl8HO+L4PCisTE6404hxq9Dp
 nibHvnBUyu+1R+wAIfz5lY9GOS3tz385LckshoUrl52DOxWYoulGnPtp8ukuxIBVGa
 TKlUnAL3h0wakvfdUpvw9p5+o1HHfotUOO0rMU28s6dxvRZNhJDEnn7RZtkk7rdCbc
 WshQr5w798tIpVtyTySG7PTzl6KKkw4Jk9Ik80VHBnxtQiagljH3ZmhzBYmmjUOfU0
 eE8DCvF1wvPGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N/kcwH0J
Subject: [Buildroot] [PATCH v1 1/1] package/lldpd: update to 1.0.18
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
Cc: Vincent Jardin <vjardin@free.fr>, Vincent Bernat <vincent@bernat.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GPG, hash key checked

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/lldpd/lldpd.hash | 5 +++--
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index e798e2beb2..127480095e 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.17.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.18.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce  lldpd-1.0.17.tar.gz
+# gpg --verify lldpd-1.0.18.tar.gz.gpg lldpd-1.0.18.tar.gz
+sha256  4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7  lldpd-1.0.18.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 34e1c8c249..1b2cef9865 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.17
+LLDPD_VERSION = 1.0.18
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
