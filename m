Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F317CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 15:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F4130606CB;
	Tue, 24 Sep 2024 15:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDUEuNGY-ud5; Tue, 24 Sep 2024 15:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D31060AD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D31060AD9;
	Tue, 24 Sep 2024 15:24:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C92931BF401
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B72DA40523
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICRVbXCy78EV for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 15:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 523CB40194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 523CB40194
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 523CB40194
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.242.185.50])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2F57919F73B;
 Tue, 24 Sep 2024 17:24:33 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 17:24:29 +0200
Message-ID: <20240924152430.61363-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <o24zxu3iac7zacfdlxdzhpnjuixozkrf35tznhuodxxkbtv737@hxe2jgbd7d37>
References: <o24zxu3iac7zacfdlxdzhpnjuixozkrf35tznhuodxxkbtv737@hxe2jgbd7d37>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727191479;
 bh=rXmYDwg0Uf1qTjVHAQE4Yv6UAU08BxgeZA2C4usdW14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZE2+nnf4BiCWGQk4ckDjRbDA3KWFQ2oCIeoRixe6mBaQcmZrERx//6FIK2dhwWGG8
 MC6F3WiX+/ehqiXiiyv6uKSK+T3o8T6S3f0eL+vycR/G9997E8tAAg749J0Rd2Q/Mh
 vIIR1E1W9UsOpw4s+tqU5UuogZy8YF7pjGdMqgsG8WXA6mGtFE6daQIkPwzEEQ2zK3
 ec094VsIXiYUhQWWS2+QxpUI24xGPQwe2YPgRQtjH9xYUCrPdLaCvWblF8oyuCoMMF
 YqMntFKHGRhpbpVdu/cPSaR1cDmC7l1adb6aYTH39GCxIAv1egKQjDVlggHLIMhlO1
 2XGKZnk7wjcsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZE2+nnf4
Subject: [Buildroot] [PATCH v8 0/1] add DPDK libraries
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
 Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v7 -> v8 changes:
  - focus glibc
  - drop any licenses which do not apply to the Buildroot's builds

v6 -> v7 changes:
  - shorter commit log, include comments from Yann Morin
  - update mk's LICENSE

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
 ...-cpu_instruction_set-from-meson-opti.patch | 35 +++++++
 package/dpdk/0010-Fix-aarch64-build.patch     | 43 +++++++++
 package/dpdk/Config.in                        | 54 +++++++++++
 package/dpdk/dpdk.hash                        |  6 ++
 package/dpdk/dpdk.mk                          | 95 +++++++++++++++++++
 7 files changed, 237 insertions(+)
 create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
 create mode 100644 package/dpdk/0010-Fix-aarch64-build.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
