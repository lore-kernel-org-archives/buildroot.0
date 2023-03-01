Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB9C678D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 22:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C49419D9;
	Wed,  1 Mar 2023 22:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C49419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2h2ZsZM2kYvk; Wed,  1 Mar 2023 22:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF0F419D0;
	Wed,  1 Mar 2023 22:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF0F419D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 072831BF304
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 22:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5BBF40602
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5BBF40602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icCNVeTGbZnf for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 22:02:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E95D6405F4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E95D6405F4
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 22:02:21 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.224.61])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B909619F59E;
 Wed,  1 Mar 2023 23:02:16 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 23:01:59 +0100
Message-Id: <20230301220159.161476-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301220159.161476-1-ju.o@free.fr>
References: <20230301220159.161476-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677708140;
 bh=bIRKQAhjRmdSExzNZHZ/LdZkxuN0yHHVlWVRRWi+JzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAYjWYftCSyIegTvjdaEEy9oeeD74C5Uex37Disoqg2IccqBkm4SY6PL4Zk/1S1Xv
 5qAvBDSU/iIEbBA6wRoTJbW55isX7FG7ohjM0PbaGtmakswtSL4BVOebfsTWdOPpK1
 tuSt5CdgP41Kqf6pbtmDf8CJ1a9ff8HdzrsAohLiD0vErR1ehQ0YjHmNaEIDNoYWVQ
 eox26HJ8F36UaZ47jlRt+pbgQY+0qz4ttOTx0Fu3SygWdc6lCUF5RKMs5xMCykjAyl
 S7m6AycjPlyJ6XJgbKS7V+5HSylAv/SCWfI91vRWR90hk6FM1KvqeZ3ba6+mkGS38s
 hY9xXm4ngFV9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oAYjWYft
Subject: [Buildroot] [PATCH next 2/2] package/kexec: add KEXEC_CPE_ID_VENDOR
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier
for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akexec-tools_project%3Akexec-tools

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kexec/kexec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index c1411f6ab7..a725a1bfba 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -9,6 +9,7 @@ KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
+KEXEC_CPE_ID_VENDOR = kexec-tools_project
 KEXEC_SELINUX_MODULES = kdump
 
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
