Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86A2ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 12:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F88740241;
	Mon,  9 Sep 2024 12:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Qn6-gakvYpR; Mon,  9 Sep 2024 12:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DE94024A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DE94024A;
	Mon,  9 Sep 2024 12:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E75B21BF2FC
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D503F80C22
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EapfxzgWRLZI for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 12:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77A7680C28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A7680C28
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77A7680C28
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 12:58:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6A9782003D6;
 Mon,  9 Sep 2024 14:58:06 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 14:58:03 +0200
Message-ID: <20240909125804.64690-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828102106.55640-2-vjardin@free.fr>
References: <20240828102106.55640-2-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725886689;
 bh=/dIwkd6pMpLIizvZMvyXLzWiseGiC1cNdZQWx/LveXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lbcb9k631oArAcXY5CYq3FXGPV26qFnj57ItdXgvb1l55agW/wdB+0+wC/bf/AafL
 XZg3E8fS+LYWCDfLsquMIT3wF7gRVc48YAcnREzk/B8JpsH00E+P+EkZpKYkfJNdFc
 UoIhNws8BVOUIwqL9Bgpm2e053UyT6atlqHrOiTpWnjWAUW9N1GvVeJ/I9f7+hT66X
 jSkcQYgJr94Y8NRgj0la394uQQzrw3bWNhIbqGws8tABh/OcfwHH6MEp1OyYcqpLwY
 iJTHro6RDy6zu8lURjaoMIQE/3offGpy6hAuCT9xYt9N5vj9gKh5AtHOwp2ELkm6Nr
 IVW0vMM/Q0EQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Lbcb9k63
Subject: [Buildroot] [PATCH v5 0/1] add DPDK libraries
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
 package/dpdk/0010-Fix-aarch64-build.patch     | 37 +++++++
 package/dpdk/Config.in                        | 45 +++++++++
 package/dpdk/dpdk.hash                        | 10 ++
 package/dpdk/dpdk.mk                          | 99 +++++++++++++++++++
 7 files changed, 228 insertions(+)
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
