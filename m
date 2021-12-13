Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D1BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3631140447;
	Mon, 13 Dec 2021 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axlsa8GQfcma; Mon, 13 Dec 2021 20:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54FA2403C4;
	Mon, 13 Dec 2021 20:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4325B1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F0F60B26
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H93VuQWk61gy for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 20:32:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBC7F606F5
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639427529;
 bh=fmNbQ8dOShE9B3lAATrToGbY/Lj3TFMS9d02OKWZOCg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jxSkoREBLmtfNvbrQgODZE1qggWflKfyfKyFz3PVprtJYjV/a3ERjOnhnirkYejQS
 wY2Chyhwcuiey/xM+qcxJCgzPBN0v9M555nDyAM/JUVzd7LnEps9J8iRWUMp1N+2TG
 DAGVuGo7P+XDpVGZds5fizzmB5qSqYOelG2zXW+A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1maGs645r8-00vue9; Mon, 13
 Dec 2021 21:32:09 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 21:32:08 +0100
Message-Id: <20211213203208.10983-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:TivROcLrpMGD57gtKhVH6cTygHm3SYTYvDqaonk5kP7flbi3sGH
 qtHi3JKza4vitU80xjw0DbYwSbkLSL0146o3oaNMulwGwxcyvEjissNku3IR7svfY0rOhqu
 G63k22of9T02sSv2TzT3Z4c0UR5QWPONIH4TSzIgzY9J1nKXBmceVHLhWTUusQ/y5tzfMAW
 1BvRKz1umqpwmXSwBFMxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:StDtstQDTAI=:KXW8WD22imB1S/fI9kpEKQ
 9VCh6eXhHami2ffqBWr6Evlw6zXK2RkCp1DpZwh2HJsSJLS8OMnV/rsXZK2mEkeAtaLVmFYi7
 xMUMzt4vMCE6m/RsHjWOxxROsSt5LMslT6qD/4Goag0i/OwYXkEHyx0bdDxH5f+S9CmQC4Rqu
 rBCDRDUdoCsqVjCPbLmYJrBbCGjasMHgNveo9PpoX4VH9O29+TsXH9KvZDtPKH/SErdSY5RHv
 XssJpUCLSfKXBGyY7KtXidUGmvah/hGHaLBfk1vV/V8uo+p8MrLPlgtrFDxj2rc5Thjynkqxw
 QiYrEF+NvHnaukitUaZUbETUUndH2UT2mK/v/Qg7PreaFEs6cbU+iSxR/rXJw/aWi/xu7QQYp
 EHCn7LtaJQnMy7IotW6Xe3Cm+9LNeonAa1sD/YvY+yszDd6uevR8H1x4NbmZUqOhCmwqtAiw+
 xN3B5vJGPu9PuPp2DSEnUPugDk4F/S3fD5HD3lDws666Kc1YQ6niUB6u4KO9JZW1X1LfcpkIq
 1UeK5Mr+ASCPD4dn5NAyjZc/hArKS/HA9JEFa/fmB+C6yccgs7rl1NSklqo3QBz90fR1ejWIg
 J6js3a6bMAIuwcRR6eVGhlBXY30Pc5agxIUjmPUv9M4cjncDHIcIEsvDWKgUUjUb6/EPpiIDh
 fdRlEw/G1l71ZI81FHnsbSeuUZx1lyNEkwIVhtAMpO+c6IU+2dKfdeHrMQMfUrfSS0y1X8haQ
 ze/Yg0qIKwaq3URYsKlhnyykslmgIuPeNprsvmBSLLlzZ0z8tZkSSLMlpPAa+PGTJVGhVAKuB
 cwUptYR5rRWQvQdc6bsgXt8U/AHSYq+tWWzDbNDIgwTnp2jLaq1NUbY5HkcdxLnSZYxHdVmhk
 1iOLGL3ghRq5IcvEs9rBPLrj1QYk3HAgt8r1qjwpKl1kMIgCLgrM2YqeMKpOUaslpDP1hdVRS
 HsBzPbwd+88DKRfnjqE3g8HocgHs0f8uDPcLt7b35AntkPlcRRXji8X2ayJgWSCZELlCtm04q
 iRLqlSib0sL/JyRAyZC7cwZ+eRAwUmAaCl9H9Ozr/s2WNdss4lYldN52k+nk3zas1fTDCnce1
 rdUiA19IydijGg=
Subject: [Buildroot] [PATCH v1] package/iw: bump version to 5.16
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 126b1cb673..33dd117368 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  293a07109aeb7e36267cf59e3ce52857e9ffae3a6666eb8ac77894b1839fe1f2  iw-5.9.tar.xz
+sha256  4c44e42762f903f9094ba5a598998c800a97a62afd6fd31ec1e0a799e308659c  iw-5.16.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 32ecf93c19..9bf6ddbfc6 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.9
+IW_VERSION = 5.16
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
