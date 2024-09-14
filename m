Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD1C021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7741605FE;
	Sat, 14 Sep 2024 18:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFEmEz1aW_0I; Sat, 14 Sep 2024 18:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF6136076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF6136076D;
	Sat, 14 Sep 2024 18:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E87D1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C45E40600
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKMci6VOV-g2 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.101;
 helo=smtpcmd10101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5D39405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D39405FD
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5D39405FD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:51:13 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pXrSs8Aox0w3UpXrTsCgL9; Sat, 14 Sep 2024 20:51:11 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:51:10 +0200
Message-Id: <20240914185110.2757653-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLduks0nx2TvAMoQqQvaTN0sHDRTHd0f7Q9vSyBDUjRKAN3f4L+TAex33m+ud75pPd0lELb+6sL+Vto1prixDoYKcxxmZ08RMCezfLMJfzQSVlo9b4NY
 fr66xlyZj2wUmglBlGSvSQE5WHYhLoSI0IwbvH88wegYwtGUnjstQpul72DDm26NC1zQe5yxbpFeT2mIPIx8O9W2/Idt3B9MzRIB4a2Y3GeMTQ/rqedfaMBJ
 Fw7NeV01cIBEIdr2+fbdgM53Mlx3+B2VK59agtJjO35i32EmT00OwXxFVjULXwxzDEVfdz03KO1/6zPtywQ8WA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1726339871; bh=7hjEkuBWWM8lw8yhLU7VUGHYTQME+rcOqpotS1cpPPA=;
 h=From:To:Subject:Date:MIME-Version;
 b=cV6HldHafvPFxwgICspbqg0dDjzctMvJQ8OKqPkQreuuE515fUm6GHBbsiUdUm01c
 ImM3FtPVcER1vXbVedtSzrrlTOZQtr6iH62egPI6+w+GjKrgSmIpOiIMAUvD7xQ0ea
 j3zsxSLXrA690r/F1gbRfBdgYx5Ahx1opEwPwThL1b3Cx4SgD1TRgtOE6hnMuzhgdS
 HtvrRR3zPvZtvQjVCtHlak1xAAYMiqeRKHCLWWqOVJqPqy8QL1V5WwuYTJLXS0Fmgr
 hXiByuH3RxzXUq+V5+gNd92d+kAjc2vSNiYgDAlXH7jDSma9pmUdch3eEGGl+Dgl16
 qnaQNjHhgdEhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cV6HldHa
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2024-08-21
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.11.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index fba2f7a109..41c39f5cff 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c04741129e815c30c51e509012d1a21e4f6d568c211921e6bc46e1adc3d4d4e1  rtl8821cu-0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0.tar.gz
+sha256  9ccac108553e0ddc35e030539e23c2151fc038f21c12a241b4df13e0c171ba5f  rtl8821cu-1597dfeda6cefd2e603fc7020ceca226d05fb108.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 39aea1d7a4..faad054b3b 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 0b505f382ea67bd8bdc9288ba5dbe7f4c9de33c0
+RTL8821CU_VERSION = 1597dfeda6cefd2e603fc7020ceca226d05fb108
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
