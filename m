Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0A5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E536103C
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E536103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BF6400B5;
	Thu, 23 Sep 2021 16:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtf3XXaegYri; Thu, 23 Sep 2021 16:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B3240169;
	Thu, 23 Sep 2021 16:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8DD71BF5DD
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C50BF4071F
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpbvH9r8GFCD for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 16:45:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2603D40718
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 16:45:55 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TRr7mmlAZa4UMTRr8mfLWP; Thu, 23 Sep 2021 18:45:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632415554; bh=YH0UlZR0b6mYc5X8VuZWiEQK4coaeVenPnMGOMa3+tc=;
 h=From:To:Subject:Date:MIME-Version;
 b=ffOpAw8B9EkATQrQeCXKDu0MzMEc54ahxVQElO/76XjCHvxAPpXhH8Qo/P2CiKtc+
 HfWsP1YnQ61mM+JyeRSW11OrFH/DaIBsa0+AQcajDlcVb05ZLD88gilgX/LNg8uzD+
 uHuiaxxl8xgky5fgnJVTDlDv/uwRdf24joLjZWa2IiAlcH9Rfedqgnk9I7P5+I2mbr
 7FCHk65VC+WzGc4k7Jxojc1JDjQCLMqTL3n2ZIt8AlmoZw9noFYo76KTWxc4vTv9qH
 SJOdAYjE1XpxdltF48QGKQJQFO4Ds1nIa+c6RY9GNt8hxDoS3P0wOJWaZ2FK/ORydM
 ti5Qb0B09U/WQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 18:45:52 +0200
Message-Id: <20210923164553.1218801-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFZzPXTsagF743z6Ub7y7SZfH1PL8d8bGi2/f5dMQvDP5rZFLAODDpqQ2+YhM6GvI2ZTvrKfnzK8LmeugkiKoZ3ZoL94eTqioYEgPl3CZ0P1k/o4a8HW
 9geGbLIVMr6QBA0GxT9kg9hY5ODJF6RcKDRCR5OsVkvYnqYHycIkBo34bxa4kq2S74c/HFC3H//RMuyWy8PMU23qXABmvNbdr+suRO0tAb9N4huQy/LsSiGN
 HN8LfNMSE6Eht+rIEwLyjamuY0WcrIqqLqhz5jJLDmWSgOZ3+4dQVzkJqe6MEfC8pFFo7pBaiL/4oBWqwLdDbv2r0SoI7YTx2B7Dezy34HLt5MK+X0ZNl98E
 79dqKncl4JFoWOoVN/eHyvyXxqGpuvdHNKmoLLXBlHm0dTtfwUZD6o4G69N/0vaSMXyJ+YAYst8OlDIigkXdl3UwC5Tajt9ughSc0RNppWZT8ExDcsM=
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_102472
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

python-uvloop package hang while building for the m68k architecture with
optimization enabled with gcc = 11.2.0:
http://autobuild.buildroot.net/results/17d/17d6e6422abadcd6313c430c40f2a5d7162dbbd3/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102472

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8b01067105..adb4d63759 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -210,6 +210,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102472
+# ICE: on m68k it enters an infinite loop
+# This bug still exists in gcc = 11.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_102472
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
