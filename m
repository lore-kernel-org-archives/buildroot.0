Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA27C54E93
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 10:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCA8608C8;
	Wed, 28 Aug 2024 10:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEMxeItsSm7Y; Wed, 28 Aug 2024 10:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA3060A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA3060A52;
	Wed, 28 Aug 2024 10:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57C241BF3FC
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 10:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 453D380EDE
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 10:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYK5pLU0jQNS for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 10:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30D6480EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D6480EC1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30D6480EC1
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 10:21:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2C412200402;
 Wed, 28 Aug 2024 12:21:07 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 12:21:05 +0200
Message-ID: <20240828102106.55640-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827003813.30083-2-vjardin@free.fr>
References: <20240827003813.30083-2-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724840471;
 bh=NvxfNXqLGmLkeZSoF7JTzzFOpkh089vqfasAJcmvXlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SvsP/gFbfnns8wYWLsGlOl5oEO6I5zSiq3PAThowg50l44ZAmALwclDmrr3ZzgFqG
 6QQFEnTP1ZbhU4dklQDhva0Gb3zAQjdyiGAS50JoDxVuZygu/2Y4ikpscpfjd8oct8
 s5UeQ1pI7SGeeNrmHNoyWo9TxzuEoxIap8LoMYowPkt84vZW4GE6LEGLlf8o/7xY6k
 EALbuZ2VaIPnbPBR4fPdEXSv27SqAj380SvHI/TPfJKv8tSmHIocCdl9va6Szjizdl
 Pf38EWj8qH4tuPDM8TwAuqtNGdUVb8mv4nYnmBz71Kt/xXnkOBL+ArQH9ug4YSNxNN
 MXSjjTaMpuJGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SvsP/gFb
Subject: [Buildroot] [PATCH v4 0/1] add DPDK libraries
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
 package/dpdk/Config.in                        | 34 ++++++++
 package/dpdk/dpdk.hash                        | 10 +++
 package/dpdk/dpdk.mk                          | 87 +++++++++++++++++++
 6 files changed, 168 insertions(+)
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
