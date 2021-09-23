Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71902C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB4E60F43
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECB4E60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBAD60AFE;
	Thu, 23 Sep 2021 16:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCOd6nMmGyRo; Thu, 23 Sep 2021 16:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F152860AC5;
	Thu, 23 Sep 2021 16:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7F1A1BF5DD
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D280840169
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCCPsx6_GhhX for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 16:48:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD4E4400B5
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 16:48:36 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TRthmTkA1iqGsTRthmgerB; Thu, 23 Sep 2021 18:48:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632415713; bh=t1+RgmypGxsQKYfEe0mBHafb9PMjDZm92XvdZybNkfo=;
 h=From:To:Subject:Date:MIME-Version;
 b=KSwK8HN4cFZP5rqP4cUmsJBni7PTrjQo5EUR3KJp4PfUiYIBs5Hmj1KrDMV2XSj3a
 3j4gOOg+pZixqy34A/hzvIwI/7gNZJM/4LRokzg8LYcHRNnUHw8M4FDlJaXYR8FZxj
 uuJO2IRhwwEl5Cr+fyC49Ozni+RZ8YUuHG/5bjCc4Zw2GLQGh+WnL9dFuqKDW2XY3j
 L685YTpACuKzA8P8W2a9kfcNs8jx5BHpM9O+HRC8AmgsFyUakZ8IJfG3Dg/AvN0hpg
 24yy9t4EMfpipup8AqS9EU9pXFjxWBqpObCfAub0shNEEKGuoj9M2qc4RRW+zbjF6D
 gl9AvpK1F0y1w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 18:48:32 +0200
Message-Id: <20210923164832.1250360-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFFpHczokTMx5fDLr6cqy5XFrNzy4p29vxDr/Ma/enFDlrfPCAIjO/J8IxvUGvZQVbm0YBbpNnVyGN5fDutTBmNc8a+zu8iWkgNcX+3x2P1+V6pfrhKF
 d9mPrT+HTeFPyD3LqqWR6McYd20A+aB/tP4v571xL2JXap6MG0nJDaBTWDCOA8ltixqt3+ZTptzvzP8s6X+P9vQ/CHskpZHEaNA1SPZavr06KYa26FKykyab
 ik9tQCBruWkWnE29rpwCJ5j1sBVDOc7X9Ftf5BX2nDQ=
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to python-uvloop package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add myself to python-uvloop package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 926c6a27d7..581b5cd7d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1063,6 +1063,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
+F:	package/python-uvloop/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/trace-cmd/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
