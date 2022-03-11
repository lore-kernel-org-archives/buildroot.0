Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5136C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 07:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B6B9812FF;
	Fri, 11 Mar 2022 07:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2OpyfzufgiE; Fri, 11 Mar 2022 07:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AC281000;
	Fri, 11 Mar 2022 07:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDEC1BF297
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D98D40119
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xb4lPHMvxiX6 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 07:33:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE203400E9
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646984013;
 bh=HKuGKTHbtZU3EJ+Lbhe+wySI5JSCOqkH5Y6oCpePOPQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Qn7JUHN0P2gWg2mPeoCWXF+mqVos6B3jE9IwzXwo2coxq2hWtJNVO5TSeDIlAB7Ci
 VgstGWb1fOcCkT7thbOEKfgqW2Zk66kRJitWNnWeSP9GHzekeyQYxMJXw64vNRKt9P
 Gn3Z/Kn9U1vSyWoiGxF2W5vr1+er9uKphhsz8mhw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.204]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MCKBc-1nJBrL2NaU-009RHn; Fri, 11 Mar 2022 08:33:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 08:33:33 +0100
Message-Id: <20220311073333.29596-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:hg3+4axZ2AeDKzVeuZIOxH1ta0pZxZKZVghMV8UCtBJqZj430r4
 bwoilRROHfNHJ8hFjuaNFJkCb455qMSBGihwQzmAAv8pcGV+BFjfO1Epgb4gxu/ZPZjOHA3
 dBQ2XlZLQuZtOnjeaz4h4Ggh2HzdgynudoHp6V5p9ehDqA+dcr96Oyqd4JpkYAaNEf3uXqO
 T28SrioyfDN++x4FeP24Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zJ9MHbaZr4c=:k/UU/jdUYOK1w9Y7sj3J0K
 Ngc7Rw2FwVM0jQTKnOy8Ui3yqCpQcX4aMEk3vtkiM7J5mkAcJwzt1ovm1de2/Or1P92B2rsKw
 QRsRMT/qhF3rDkfizUiwucfS943YaWe8CIBIw7oBBFj6USAJuyOtcoSvUpiW/FVqWlQSN6KMy
 n253GGldgJRPO92oV3HtbVYN6Hjg9OrhJHui38KZt+XP0wC4HSRueQxaZiwfnHbO/FsWzWt8f
 dl1DqsPFYU0OHCyrJCXfrjT5TbBS/nc+pTNLbHoPeq9ebErrfIIPt6X/8RcPhw3gHqJwerQLo
 /FCSbO+TwjPOFzrboaK/9pM/jJtBxVZQUG8XkeIh1YSbp9E1bq+j0gBq+xUDrNlv6qHX07htN
 0p21ef6aUmW36hAGPe7k7j8BSBeqlWSsjdqdiBEmIapX8ooclC25GBIj3Wf33mMWGNOlG4jvU
 OIXZu2YRXQp1GNyJO6KRxZ8Gx6GDkGx5YJ5JRV0lu6ViZuG/L2AvfilIRwgpWnmt7ki9uMPNk
 mZJW+1NU3qbqtW6ffTEJYmiZuBb46mzuon9qUnpR/wwLr8xgGNivPRuIQfbDP733Kj5BSjn1b
 llDe7pFJby4KYuGyMyrWAX9OKA/T+mRXv13N2PiVFf0UOVfZPs7HGkD6l0F1KC+h+VtwumHO0
 gy5rv3ITpj+M2CGFejoqv0dp/SJuRQUseVbxvaTCeiHPoMollaqW/PKfMN//UtcF2U+pqFtIC
 v0m0TejocloXjuoXFAtVtZ+siwd6lkuWOzDWEr0EAn205HsQ4tXCyLM1ZXjh8gaKexnztxfVM
 Ws7HzBxb9bKE8Ij1/Z0E0CzQsaEmPRH5RNL3jC5QHvpjcQxFix7AwC6jcb1VhUv56A5b0fyPO
 kRRRTogRJ8ULk6xMiDmqK4aSNgN9T+IXFH15mApIs1PcwQzXpSXKIe2IjC2ATzwbpXCUpXUVj
 IofsiNKtBCr00x4HpKozYnFFNs+pLQ0G3jIr1QEEOp2WQc4Kol7tENXAb/HeQxGkkz6ePQipj
 ZZ3o9mB3CjUjq5cOWBqg5kPsMWi3wAI0tSCvFj734kKVnihRTWJW5OBozK6DehMhQeCndC1Bk
 jF0VG5xuXQmOUI=
Subject: [Buildroot] [PATCH v1] package/linux-firmware: bump version to
 20220310
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update hash of WHENCE file

- update hash of LICENSE.amdgpu (copyright year update, see [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=34f9f8994a61192abfb597fc55810e3c27269ebf

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/linux-firmware.hash | 6 +++---
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 83275ec6d7..382e9cb2ba 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,9 +1,9 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d  linux-firmware-20211216.tar.xz
+sha256  5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182  linux-firmware-20220310.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
-sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
+sha256  a6c0ec4338bc89480da52812bea7f9e4b52bc7118e3e352141f99d779c397c53  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
@@ -33,6 +33,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  dfb98c5474d6264a6554322b3936e305e9d73cc7b683932e3f17550dc7d2d29b  WHENCE
+sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2d103df05c..5ccb7f10dd 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20211216
+LINUX_FIRMWARE_VERSION = 20220310
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
