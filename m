Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6954C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69E481B7B;
	Sun, 24 Mar 2024 13:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4wCpTVGYvVO; Sun, 24 Mar 2024 13:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AA881DA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AA881DA3;
	Sun, 24 Mar 2024 13:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC651BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9718060780
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOcqaamvEzkG for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC01D605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC01D605F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC01D605F8
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:06:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBA74A4C239B;
 Sun, 24 Mar 2024 14:06:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51496)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNYc-000000005bi-15nh;
 Sun, 24 Mar 2024 13:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:06:38 +0100
Message-Id: <20240324130638.29838-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285598;
 bh=Q1yclKgLcr56LyAX5GlbF+RTvyp7sGWCGxymywLPZcc=;
 h=From:To:Cc:Subject:Date:From;
 b=jZRiaBzg6skpke8c5+wM4EWH65e+hwFq955nf1lEqp1RTBOl20f4ltywBbRcrg8la
 IyOApO1eFLI/gRce+dm1rgXx48C4/ioltlD9aW9ayHh0NFZDbAvyqcTHyFIMYA9w5U
 jltv620aW6UlEN3KJnEMmokyMv1KFLe5dem4vU9iE8olk4Z3uxYahkqnPBKhYx4qeq
 KsfdL6u38bfB2KZmcBRrXrlD5CxVmscq83RG+0FzTYbDKwzxzdaa3olVo9BaFu1fLZ
 ygdHXX2nMtc13BHYkvGzYIkY3I/lzBrMk42STDO8cxwKehqulrXrtR4SbEBEuds9sE
 4U0nA8LZZ5pNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=jZRiaBzg
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 62c954234d..972db9300e 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  99a2fd954d8e620029759f5a65dc09271c168cd047a6a152a0fe643de64823cf  tvheadend-b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f.tar.gz
+sha256  e3f05da73596097757fb4c0f9306e415b1772f26a52b5b86c50d63811e7e65af  tvheadend-c63115464d8f6556fb4cac93ce8740afea1b00d5.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 816ec6e161..8f2e37b122 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f
+TVHEADEND_VERSION = c63115464d8f6556fb4cac93ce8740afea1b00d5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
