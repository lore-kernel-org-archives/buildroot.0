Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E403BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:51:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51209619E3
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51209619E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC26401D2;
	Mon,  8 Nov 2021 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaVNRWTCwwCx; Mon,  8 Nov 2021 19:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E41F40333;
	Mon,  8 Nov 2021 19:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD8B1BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1BC540003
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zo-e8ePkUnV for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 985B1400C4
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 19:51:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kAfzmJLboueW5kAg0mM3aN; Mon, 08 Nov 2021 20:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636401092; bh=Pyy5mBa/9AR2ru9IvDFEOdFibvRxjlskPHkMUeLN+q0=;
 h=From:To:Subject:Date:MIME-Version;
 b=IXh4jMgIuISGysyROcT9irA0zK55mFzO9O6i8PgbRuLwTt/iznHw6g3mOfWbut4nz
 08F4KRdYOu/DUlSOXquQ8bT260Bff3v1XSGPAEYuThh0v227QrZWatmyrVLISuRbIC
 vM3/cNti7nCKg2OVaZmm4gpz3VkF1Lv6hiUMC45kNDq4VNu998dDzdaV6+EHCrRBSI
 QKJsnZW68Uul6oTNciGPhLuMP+faK5yFx7J/C8W1Ne5PcKz5jKkteT17/tx2ksek0e
 ZLeElFWG1FUVs07rqXyw8EcsE0sS/jKg0mUoBTrsDsotuah3NrS4kN1EaIPTM3KlUa
 Io35eqnhg/bVw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 20:51:30 +0100
Message-Id: <20211108195130.2798450-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108195130.2798450-1-giulio.benetti@benettiengineering.com>
References: <20211108195130.2798450-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNg2hgAbbm9xn6R5SF5jjOhNNxeHkJe1ZZXooGSV4mLDnuLbjXSxENGHryJHDBY29KfpaCgBBiSAE29FbRKqHhiflV9OYM1VWD57KFksE/R30nsaLRVR
 8LS+5/Rs0bTNiXpaWZiOPmVU+353gapst3owCPuNhhPVp0KjEJRgb340VA3mPAHA9A0/sBD+K96USmxMLhWuaMoWerw+pLmwHPeCnt9RwLXfZpJ1RB7jDjv4
 z9T6RlMWQax8s++Uw4CkEBLm3jHq6iywxn5abIfCx7JQbQWE4B8Dtn3/5LJ6IbDjdMwwvSE1NrrwOVh1aT4Rojs+7v/zLgoNW9OLBb1/8hxTOFIQd+lGOj+j
 SOHOcCu0WGfXq0b1Ht4ysqayUHtuVeeLfnhhlMjExUbQ1TTWDpRlcOcLB5kAyL27C6EjiOUDob1Taf3IMSERhlaewJAhgjs7nvr7qmlyHKbeouXH//I=
Subject: [Buildroot] [PATCH 1/1] docs/manual: add genimage.cfg file coding
 style standard
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the explanation for the genimage.cfg files coding standard.
A real standard is not defined upstream by the genimage utility
developers[1], but I try to give one here in Buildroot for consistency.

[1]: https://github.com/pengutronix/genimage

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/writing-rules.txt | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3b809d5c48..28cb0fe4f1 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -136,6 +136,68 @@ LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
 ---------------------
 
+[[writing-genimage-cfg]]
+
+=== The +genimage.cfg+ file
+
++genimage.cfg+ files contain the output image layout that genimage utility
+uses to create final .img file.
+
+An example follows:
+
+---------------------
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 32M
+}
+
+image sdimage.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		image = "efi-part.vfat"
+		offset = 8K
+	}
+
+	partition root {
+		image = "rootfs.ext2"
+		size = 512M
+	}
+}
+---------------------
+
+* Every +section+(i.e. hdimage, vfat etc.), +partition+ must be indented
+  with one tab.
+
+* Every +file+ or other +subnode+ must be indented with two tabs.
+
+* Every node(+section+, +partition+, +file+, +subnode+) must have an open
+  curly bracket on the same line of the node's name, while the closing one
+  must be on a newline and after it a newline must be added except for the
+  last one node. Same goes for its option, for example option +size = +.
+
+* Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
+  assignment one space from it and one space from the value specified.
+
+* Filename must at least begin with genimage prefix and have the .cfg
+  extension to be easy to recognize.
+
+The +genimage.cfg+ files are the input for the genimage tool used in
+Buildroot to generate the final image file(i.e. sdcard.img). For further
+details about the _genimage_ language, refer to
+https://github.com/pengutronix/genimage/blob/master/README.rst[].
+
+
 === The documentation
 
 The documentation uses the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
