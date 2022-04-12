Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A09C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 13:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B3AC40AC7;
	Tue, 12 Apr 2022 13:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJCpysAs2xLf; Tue, 12 Apr 2022 13:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A5740915;
	Tue, 12 Apr 2022 13:28:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8301BF9C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E51483E83
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 13:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FobxFYlCyY5P for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 13:27:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD5B83E75
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 13:27:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.82.161])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eGYlnD9hNzBRqeGYln2Wp6; Tue, 12 Apr 2022 15:27:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1649770076; bh=TdwIMyTIMS2zERpuzrTmVWWsMYcPCi0sMhyG+IWRTL8=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ax+VptI469fK1VHF4VQbi8SDrGW8NxtCRICv5WYq+C1nuO9tZpz6rJtfw6vLOk7uE
 m5hX3wYT18cBw6jNQKKVh2US29vGavkusMeYOqoBSAFblHlJyWIZgd4k+BQRrJL3Rt
 06hU/N7wYUtR7CNOO9hp0nznU/js64nYUy2T3YXLjpce7eNu02DRsn/W2xYbAH864I
 RWtk4RcJXh7uRvPNFiYJejDWbGWTIruBEVmVOlOnf9n+bvR6fhKpEJ0bzV7Zd6l/Mq
 dbA3t/6Xj9vfXqDKbt04nVxJdPSMx7O0xn/DsSsB74jGHWhYVEpU+sE+T9GvCUriJL
 /ik1j/OBu4Yhw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 15:27:53 +0200
Message-Id: <20220412132753.89827-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
References: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH0Cgw1v0YpsiDvg6/EJioQHcn6vk1MyOFEsjMgAz2Rhc8QI1vSxcgE/KkRDxCvV1CRytxLiA/0nZzszCCj26uR1piZP+pLiQ8xYKgnneHV2fVQcpkgd
 0ZI4zzfyHRQOF3wYdlDldS+30u4MzsnvRKfX9ucKQT3hlZZl0yGNNFV091snDlF48W/oDaCoFsPXGJbj3Wak62a/A/IuUIrKMCuHGI01GI92gRFUAdPD7NUr
 dpva3CCpTx8MxAS2IAf0I5yoPpjOP/dddtTLDZokognjv5/YKUgFBTCRHU26ksC77cE9CJgnSrAY/tvSHPcstzDlONVVWL63cWO+jYoCN24=
Subject: [Buildroot] [PATCH] package/mali-driver: fix build failure with
 archs different from aarch64 and arm
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
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Actually this kernel module can be built by any architecture and this
leads to many failures. Sintce it's very unlikely that Mali will be part
of architectures other than aarch64 and arm let's depend on BR2_aarch64
and BR2_arm only.

Fixes:
http://autobuild.buildroot.net/results/f94885ef76865c3888d6cc52b35c93a742f92f3a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mali-driver/Config.in b/package/mali-driver/Config.in
index fee67096c8..4c1a96d05c 100644
--- a/package/mali-driver/Config.in
+++ b/package/mali-driver/Config.in
@@ -3,6 +3,7 @@ comment "mali-driver needs a Linux kernel to be built"
 
 config BR2_PACKAGE_MALI_DRIVER
 	bool "mali-driver"
+	depends on BR2_aarch64 || BR2_arm
 	depends on BR2_LINUX_KERNEL
 	help
 	  This package builds and installs the Linux kernel driver for
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
