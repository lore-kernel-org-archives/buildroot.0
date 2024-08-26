Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A583C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 13:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2E0605F8;
	Mon, 26 Aug 2024 13:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSyXprBctc0k; Mon, 26 Aug 2024 13:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B907D6070F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B907D6070F;
	Mon, 26 Aug 2024 13:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F055A1BF2F4
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCBDE40376
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UH802csPXmwf for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 13:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A875940347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A875940347
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A875940347
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 13:19:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B443C2003DA;
 Mon, 26 Aug 2024 15:19:26 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 15:19:23 +0200
Message-ID: <20240826131924.7702-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
References: <7kble6ezjwutfk3f6niiignnxgmq5rxhsvplayvlkj5ahczg7i@dyco5ij36lrp>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724678370;
 bh=Wv54pi4txhRjteJxLjzh7r0PwClfw16qyxcmhhCzCUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h32nWbFCWAzK/bpOM04/RbNL2NfrusHT7IvE2CI6RA42p4uQqGAEm9zOlYwojgYf4
 jqEylwODHUUuWWct8KSFdHzTX8zxEaKIjVzd6aBvry3fiXemtMeTsPSTif9zDrCGLL
 m78mjARL9dH+7xO91cF7xTzz0VNb4YeHv/IckCCLYjCDBgPH9WsKZFeqsk8Z5i2Ib5
 9ELbJd6knHRJmMUaA7YnoxtJDQPGrENKi3x8qAWsywciK+xxmibG69y4NGGToDqF9U
 VXMjLCOHBdT2zmqzZ+6l+8rP2KOs54qLSy3TKVSHLiBQTi7ohcl9nqmIqf0Vy3hlGZ
 RKot43ibYTiLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h32nWbFC
Subject: [Buildroot] [PATCH v4 0/1] package/frr: update to 9.1.1
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
Cc: Vincent Jardin <vjardin@free.fr>, Vadim Kochan <vadim4j@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v3 -> v4 changes:
  - proof readings
  - CXX toolchain and libstd are mandatory

v2 -> v3 changes:
  - apply Thomas' comments regarding Config.in/BR2_PACKAGE_PROTOBUF_C
  - update hash with all licences
  - explain the non GPLv3 case

v1 -> v2 changes:
  - hash for COPYING file was missing


Vincent Jardin (1):
  package/frr: update to 9.1.1

 package/frr/Config.in | 12 +++++++++---
 package/frr/frr.hash  | 12 ++++++++++--
 package/frr/frr.mk    | 21 ++++++++++++++++++---
 3 files changed, 37 insertions(+), 8 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
