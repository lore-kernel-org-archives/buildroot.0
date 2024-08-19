Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32167C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F476083A;
	Mon, 19 Aug 2024 22:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TFuTG7vPyo2; Mon, 19 Aug 2024 22:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E346083E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E346083E;
	Mon, 19 Aug 2024 22:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6BC1BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57B99402F7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L53exoDKTn02 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59D5A40282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D5A40282
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59D5A40282
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:13:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2d45:dc9e:cf4d:7a6e])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B41A85FE03;
 Tue, 20 Aug 2024 00:13:48 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 00:11:47 +0200
Message-ID: <20240819221146.9678-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817102923.18f56e24@windsurf>
References: <20240817102923.18f56e24@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724105630;
 bh=i3We7/cKWc7CBFk36CEJfJHb5eO7tMZqVb4Eu0OLu5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnxFXUFfxyTHQNbIL8g5zmU9E2kaVN860LcFLeVq4iiElf0hFTd4KrVfT8fLIav+0
 m2XHxhA6fHFfxB4IPA9GaUnXsWYwBKnudnqs1SX5JFtnQrH/oMN/SpRhFXj2fE4gWx
 uW/GKxSGceSyG6bkCv8BGA+qNILpAffXDQAUxYAx5y802PwgXmr75kKN/QyF44tCss
 FSjPjE3edvjq3tnXC2+/VFKmOFPWdKE4C3ATiCoCvawQlykEGOJob1BCE42wMbSY8l
 4dS371m9XEGMB8Ps69kjh6qcE+edLPhWWRUfxR0DbxA3q1rGTxmJI/CZgMXL9i0ij6
 4fPNB/FgM6qnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fnxFXUFf
Subject: [Buildroot] [PATCH v2 0/1] add DPDK libraries
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
Cc: Vincent Jardin <vjardin@free.fr>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes from the v1:
  - include the comments from Thomas Petazzoni
  - add a meson patch for the DPDK that I forgot to include
    This patch has been aligned with Yocto so we can share the same
    feedbacks. I'll upstream it on DPDK too.

Vincent Jardin (1):
  package/dpdk: add 24.03

 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ...-cpu_instruction_set-from-meson-opti.patch | 32 ++++++++++++++
 package/dpdk/Config.in                        | 20 +++++++++
 package/dpdk/dpdk.hash                        | 10 +++++
 package/dpdk/dpdk.mk                          | 43 +++++++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
