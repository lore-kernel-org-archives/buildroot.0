Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD9C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39D740706;
	Wed, 21 Aug 2024 09:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICge7F5sioWo; Wed, 21 Aug 2024 09:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EC34070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EC34070A;
	Wed, 21 Aug 2024 09:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2B11BF3CB
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4A560726
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfAUlQ6KDVgT for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 09:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A8E26072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A8E26072C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A8E26072C
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.113])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8584C19F574;
 Wed, 21 Aug 2024 11:51:08 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 11:50:44 +0200
Message-ID: <20240821095044.10038-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821095044.10038-1-vjardin@free.fr>
References: <20240820233830.5927db8d@windsurf>
 <20240821095044.10038-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724233873;
 bh=+ubpjo8dUcwGtTTYUQWetHJlOZgJUJAunE6/1/0iacY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hz3UKCb47SmsZFiCVNhkWeOH1vEYL//S58QqXTuzgBwUnM5BpD08XsI6rjk8ZJ17w
 TP16dAo5ge2N/uud25tTVcnselZ8rn/qgKrHSV9dB4SViH4w+QyiKpvzZdX7E0g+nV
 kABc/AsejWAm6aH0TJa8/n7G0ViSk8eMhqzXiNpaYhrmDSywJtuKH0ZJCLZdli+ffN
 zsw69O7xHMXEDXqqvxQ3zFzvgds+BJBuJQn6WiECvFSEfCl2bKoOfna5Qc0ybwdqlk
 BmsuZ9+ODvP+PS0J1lIsqBv26xzEwlZAjP+mzAeNaHn9eU8AGyGo0pMk+I+GTQEDks
 PpF+YgHS/OL+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hz3UKCb4
Subject: [Buildroot] [PATCH v2 1/1] package/lsuio: bump to 2020 version
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
Cc: Vincent Jardin <vjardin@free.fr>, peter@digitalbrains.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new version from peter@digitalbrains.com adds some few new features (name,
offset, etc.) and it includes some few improvements.

The former version was more than 14y old.

There is no tag, neither any archive, so currently I assume that git sha can be used.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/lsuio/lsuio.hash | 1 +
 package/lsuio/lsuio.mk   | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
index 2df6d074f4..472aee6e3e 100644
--- a/package/lsuio/lsuio.hash
+++ b/package/lsuio/lsuio.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5  lsuio-0.2.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  fe799ea2920f07b3d950ae9b6b3dec8c0838437f4571fc8091b94fd765b3d415  lsuio-ba46808da148552462e50ba66d8d15cc5b9a3a00.tar.gz
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 193de15aef..46647d17ee 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSUIO_VERSION = 0.2.0
-LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+# no tag yet
+LSUIO_VERSION = ba46808da148552462e50ba66d8d15cc5b9a3a00
+LSUIO_SITE = $(call github,DigitalBrains1,lsuio,$(LSUIO_VERSION))
 LSUIO_LICENSE = GPL-2.0
 LSUIO_LICENSE_FILES = COPYING
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
