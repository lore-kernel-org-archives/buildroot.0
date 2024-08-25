Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22BDC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 281026059E;
	Sun, 25 Aug 2024 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxDsorfhgPHB; Sun, 25 Aug 2024 16:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37223605A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37223605A3;
	Sun, 25 Aug 2024 16:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB6031BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6FEB40190
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 16:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qANtXgy74D_C for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 16:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DC4740169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DC4740169
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DC4740169
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 16:42:54 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2563:2cb1:d34e:50d7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0CA2B13F89A;
 Sun, 25 Aug 2024 18:42:45 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 18:40:37 +0200
Message-ID: <20240825164038.42818-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823185817.4658f57a () windsurf>
References: <20240823185817.4658f57a () windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724604172;
 bh=rBUWkreI+/3IwJHLb+xMQzsmfCr13JxOYXCZcwZPuwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AuavuU1f6IdGpfVnxpz7TKpv6fH4xn0C17W9BRsZxKx4GVCT/whvU6XNkufHKlbY3
 y34e62+dZ0iviHvPimbLEK9OeENGFztQDfArYVceG5eNydrsCuSRvZcbAaCsggT/M9
 1JbJnJflliwelHR1+JSLPrZupthmGLeUPy+541sCYkfHNfwhmVhO2CVHRvgyJMDiMz
 3+drHcqcmkCSqSFxrj6JLJLKS3A+8QTaQBgL51M+1fj2Ich+YPh0rCU9E5TdZkzkD/
 SMJ9m2w47AoZI/hN7lmf7MpLlo6jjl7wm0Tz9SlAxGVl7/a3RyFtBkQe32aIGhxNa0
 3N/n4s5tmdyQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AuavuU1f
Subject: [Buildroot] [PATCH v3 0/1] package/frr: update to 9.1.1
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

v2 -> v3 changes:
  - apply Thomas' comments regarding Config.in/BR2_PACKAGE_PROTOBUF_C
  - update hash with all licences
  - explain the non GPLv3 case

v1 -> v2 changes:
  - hash for COPYING file was missing

Vincent Jardin (1):
  package/frr: update to 9.1.1

 package/frr/Config.in | 11 +++++++++--
 package/frr/frr.hash  | 12 ++++++++++--
 package/frr/frr.mk    | 21 ++++++++++++++++++---
 3 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
