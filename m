Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB49FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75ACE40A03;
	Tue,  5 Apr 2022 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fi5PQJ1E5NV; Tue,  5 Apr 2022 20:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DCF140496;
	Tue,  5 Apr 2022 20:43:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03A6F1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E580840947
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtymApo3BufA for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:42:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FC0540918
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649191375;
 bh=RXCCH/9PRSOo/+Xz1cmxMyKlbLzCuRDEltv5IeI/hwg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Bnhh1tAi/o2qE1NzSEMgOtnoiEDWsJ/nsTMx5k6SbN03gSPRo7oeC9ldIVPMTcj9n
 x3TcFlJHDJn7kW3ag8Eh7giZzivFUroa5FttXRGjxOYld0xgMYAj+sxf7SYeJ1IFDj
 OwchLAAFQkTMraMuRkIMVGweY50rcHBcIki4XqOs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.249]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9FjR-1nfz9E1DnD-006M4m for <buildroot@buildroot.org>; Tue, 05 Apr 2022
 22:42:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 22:42:54 +0200
Message-Id: <20220405204254.11147-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:4SvTnch9vW0XExYEAee+Y8VoA7d8pNooi+JYZq/fxc9/nSNSpRW
 B4KTHFfmne6vcVXDqvx37NpVroVPJuG0Abt2j7xVxP6BeeD0bRLUrfLgDsb0yn/igd6vwtc
 Yh+KRBSzbae8Mzmq9FjXIrQVkK4ikHjTgL127kRTgBZViG/5akiqo77gVlmiv2wn/59tHpK
 8rKUPkC1MD0O6T6Ucy6iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WYqVApw4C48=:TB1fHc1lBOSC0jbF8njXmz
 EKZAgRM0OhH8SXgTrjSuOPeD1V43aLt/NLWjZKsBOhWmM9x8g5PmG9FuEozWGDxGZQdGW1ps8
 3e0Tb161+QRuX1PWEHkJuwtG9i+/VPc+k7KqZrbnx9fDILnTTOkCJ9cpD2lQk6S0j9Ay/iEDb
 TiQQ9zIovqQ8yBI0s55Ac1qwtwO7LHl8E3i/k0ViQcBiv5a6tB90EzwHK+Io7di+FPRqLETb+
 lzD7rffKwb3yOumHrh1CbUFmAVi5RjnD0hrecNVr1Ju1uTLK7xElxVq1jbK60KE2qGIgFlk7O
 3uUbPJ150LnuI+8l+l9qaqAh1w41geelxmy+19+yAc/R2jsCi34duTQ8q9YYpVsO7JgsHgtys
 TvU+RU0nsIVtxMao7fUlACUulz2i0OqTJfJEyxSqTqlAGh89xjo3m+pcBYfYUQarww4pq/C7x
 wgURzUK/pTLqbuBCKAffRf7hBCvoE1n9eJIjdgaeeWzdi2oDn8HDSHnYUIT0d7cbuweRvPzwH
 vIJ42Eq1w570t43rq7OoY7g1T14D3b6uKx6DvYn2vRPd8adqZc8Si1ALaRLJWEwSWTXQWcZ02
 MFSwbufxOWgkSkOv4l5M9+ksfa9X7JnpaeKJmUQ8mUa3jFhNnoXR6rWIDtz5/snSKcF34C5le
 XLXieEDsTQvo2xGFd361Zhq7GbNUnq2JoDNrPXbL6L46/f0sTQhNdp6OzDHTZ0nN8ZPQM0IaY
 YPTe8OrB/FI+TpvMIJLSxZgryZoFJS2ykCMGg//RcOwEKJqhkPxN5l9PWKPAqFChb6oPIwqZO
 n43oj5X9uJt1scYG87B533YU38L2sri4KZxhwkAm78a2z8C9vO7CFjJHRRpLkmdx3cXcuTkrw
 gsCnvi0MtqReuDCzU9Ew6mTx/eZ/rvqjkiB7+q4wVsje/hqR0DFWin1D5P5SHHsX9t3yF626P
 ItatW1Zx6fe14G+0qJshlfC5dhNSmiPUafscmZTxGt++qkuHaM/sDYrDazqDVBJpe+IcUewPK
 JWJr3tYl7R+CNBSLJer4ONx6jcewQrBCK5MNcKu0TivZ5U2hOGU5pD/qEnMuPNVPqPQZ+lNGy
 2suGABei5dv9Hk=
Subject: [Buildroot] [PATCH v1] package/spidev_test: fix version
 determination (SPI_TX_OCTAL support needs linux headers >= 5.8)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  - http://autobuild.buildroot.net/results/a5c008aaff40f4851ffa36439c7340b6243a4842

  .../build/spidev_test-5.8/spidev_test.c:132:13: error: 'SPI_TX_OCTAL' undeclared (first use in this function); did you mean 'SPI_TX_DUAL'?
    132 |  if (mode & SPI_TX_OCTAL)
        |             ^~~~~~~~~~~~
        |             SPI_TX_DUAL

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/spidev_test/Config.in      | 2 +-
 package/spidev_test/spidev_test.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 81386adf7a..abfa885b73 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, up to headers 4.20
+	  if it's older than 3.15 then 3.0 is used, up to headers 5.7
 	  version 4.10 is used and otherwise version 5.8.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 6c5a9495a4..bd138b0142 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -10,7 +10,7 @@
 # If you need quad-pumped spi support you need to upgrade your toolchain.
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8),y)
 SPIDEV_TEST_VERSION = 5.8
 SPIDEV_TEST_PATH = tools/spi
 else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
