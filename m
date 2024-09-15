Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBFC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E479840428;
	Sun, 15 Sep 2024 14:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jh5z7yrnws4w; Sun, 15 Sep 2024 14:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79E3402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A79E3402BC;
	Sun, 15 Sep 2024 14:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1644A1BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04EA3402BC
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hb-och98J9AP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5035C40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5035C40012
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5035C40012
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:30:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:29b6:dcc2:71d9:ec47])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 13F92B00535;
 Sun, 15 Sep 2024 16:30:06 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:30:03 +0200
Message-ID: <20240915143004.24060-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <33f4749e4084bc4015a6c35d5edec68c@free.fr>
References: <33f4749e4084bc4015a6c35d5edec68c@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726410609;
 bh=JQKGxSQPzmNPEG8RC3hIHZ5Iz4nwJoyNyPCRg6R9DqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mIqecjrQaRHb7QLPBVJu6ql/suUopFObBb+4PH+gQIskMBiLlBIG12srLFsjY8JdJ
 0lBI+NzKiZUTD6Fp0Jsf+M4FSt2qaBwKEflxyDSywD6rWJo+is0FYarc8uRmvbrKe6
 pZguK4b/a4VgGZdhr7V+II7yff/48sPqGO5YRjXTJer2PJ6b4nw12kCDWArp/gSWcL
 sp0ixpowUJRUmJINunxhOLNxDCuN/xZSuWNoE3zfYB4xzt4uV9RimPHsbA3OrXETtC
 uGbK74MK+gA+QP2gIHy4Hbl/+tEtK6fJLdDgwJc1Q0t1ohmDBAPPeKfhO2V2kS95TX
 3wRMPvxU/2P9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mIqecjrQ
Subject: [Buildroot] [PATCH v6 0/1] add DPDK libraries
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
Cc: Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v5 -> v6 changes:
  - update comments on DPDK patch to compile aarch64 with Buildroot

v4 -> v5 changes:
  - fix test-pkg dpdk
  - fix make legal-info
  - add builds for DPDK tests and examples
  - support only aarch64/ARM64 and x86_64
  - notes: logs of checks at https://github.com/vjardin/br_dpdk/actions/runs/10767364662/job/29854551507
  - thans to Julien Olivain for many reviews and contributions

v3 -> v4 changes:
  - proof readings (dpdk/DPDK, git.dpdk.org instead of github)
  - gcc 4.9 needed

v2 -> v3 changes:
  - include the comments from Julien Olivain
  - refine the licenses
  - support little endian targets only
  - many build dependencies if the packages are selected

v1 -> v2 changes:
  - include the comments from Thomas
  - add a meson patch for the DPDK that I forgot to include
    This patch has been aligned with Yocto so we can share the same
    feedbacks. I'll upstream it on DPDK too.

Vincent Jardin (1):
  package/dpdk: add 24.07

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...-cpu_instruction_set-from-meson-opti.patch | 33 +++++++
 package/dpdk/0010-Fix-aarch64-build.patch     | 42 ++++++++
 package/dpdk/Config.in                        | 45 +++++++++
 package/dpdk/dpdk.hash                        | 10 ++
 package/dpdk/dpdk.mk                          | 99 +++++++++++++++++++
 7 files changed, 233 insertions(+)
 create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
 create mode 100644 package/dpdk/0010-Fix-aarch64-build.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
