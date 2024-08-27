Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6DCC5321D
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 00:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F2D4035E;
	Tue, 27 Aug 2024 00:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCvjB-YVqBtF; Tue, 27 Aug 2024 00:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5B3402A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5B3402A1;
	Tue, 27 Aug 2024 00:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E35191BF2F5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 00:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA0840167
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 00:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io201GdoiYjA for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 00:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE6EF40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE6EF40153
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE6EF40153
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 00:39:38 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:f4e4:88b0:5ddb:7195])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0E28A5FFAF;
 Tue, 27 Aug 2024 02:39:31 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 02:38:12 +0200
Message-ID: <20240827003813.30083-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819221146.9678-4-vjardin@free.fr>
References: <20240819221146.9678-4-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724719175;
 bh=sZ1fCeuVEpwZO318zczgf7O+I8Dr5SWX2N5BN1d/E04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BKAFrrzqD6BEIih8ib82xuqfRpEJFdWI5TIycuO3L7RRrSnKY05D/b0HaNBifMqgp
 tagmd2WdfEzpievDHtXoDFzOuXHRb40l+d1GqfAfif2xrcN+B22hzSwpTbTwGofGK4
 YW3b7xmw0yxspPeQW5fXyT8jpwtnSPxMQMUJvjs5HhNYjztApiicdadVxaP0lR4Niy
 mZmQXzQfxyPDdu3AzvXvhT2ykof5uWscqgotiAPFCVde9+WHMM6uEvmnUGShrDBZAp
 fIu5O1hnPn3crn054HyrBKQrnGkSoMFYz8wiBpCSPpi4rS4Y5kRRHXIHv0C5TNeGVn
 Gwgv/eTyTcRKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BKAFrrzq
Subject: [Buildroot] [PATCH v3 0/1] add DPDK libraries
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
  package/dpdk: add 24.03

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...-cpu_instruction_set-from-meson-opti.patch | 33 +++++++
 package/dpdk/Config.in                        | 29 +++++++
 package/dpdk/dpdk.hash                        | 10 +++
 package/dpdk/dpdk.mk                          | 87 +++++++++++++++++++
 6 files changed, 163 insertions(+)
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
