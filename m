Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFEFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB5B61A6C
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AB5B61A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3CA83FFE;
	Thu, 30 Sep 2021 23:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyR5c1LNJcC7; Thu, 30 Sep 2021 23:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C919D84214;
	Thu, 30 Sep 2021 23:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8791BF9C1
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484D840464
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEg4Pu-_Ay2G for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 23:12:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3944A40463
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:12:22 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W5Dvm4urBrIRlW5DvmKqqA; Fri, 01 Oct 2021 01:12:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633043539; bh=umPmhFgochGLytzizj0MG72Sjg3xUoaGxDM39PLWvEY=;
 h=From:To:Subject:Date:MIME-Version;
 b=EiFSFFAeyZoAav7lsuGVlusXxdmltgtGHWDgvZ71fRPpSiOYujqhXEnLeHxGuCykJ
 6jL33tVzujiIyd3YEa5sc4wjjJRPxo7GS1d4u1Jezc6F9A2gZXLoV6RjIWdkwQ8aNP
 Vaz55kTSZ0C6Hnu4lbn1OVoDTq0dFypBBubgoQEb/RH/XiOv/tTI1eV0ZM2pD585TM
 0+kFW5xNWo6Q53w+ZxNbOh8h2Uijyr6gi9cnmgVAoKTFaXKAl0sXXRE/hHpFw0OCBN
 SGiD9XeAD2U9zVSdILCmyicaiMiQCunvRUTgZecejwEygLkbYYd15zegZ4UdOy/j4y
 yhNh/iQQTe+ew==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 01:12:17 +0200
Message-Id: <20210930231218.237991-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA34ogiJ3PBh4pTBPWAkHKeMBMa5zof1JcUI6JbnKc+1/10tsPyWOV/s0Vxm6RBZ571MYRvUBbVLLuPgx8o6llIn4ssopnB+xi6yibRZsFt8P11g0guP
 kTBuDgvcMacjhVIcnFa3rliZncF3nKRf+GCDlJhLkaYp2AEtyE/1WBSTEXLHHEfKJb8I8Hh5ODKLgjLOdG7ahxGvHod6NI5P3yHWMDx2IyUrWqUhcnnO1AZH
 gZFrtPzK2mq+QAlqGLQGDaOTJ4Je4yR649gHqaeo4w4tJnpRoKAZqf0pO3qbEL24FZnJfZCuLJWUOveGwR5AmGGVpwtCklPeIRFOSwhHwfA=
Subject: [Buildroot] [PATCH 1/2] package/libnss: bump to version 3.71
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 3.71.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index afb6d5602e..f35e8f2e4a 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_70_RTM/src/SHA256SUMS
-sha256  2b89abb8601ee405be8ac5b5703d71f1fb38a51c3a64a3d834387f78b325511b  nss-3.70.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_71_RTM/src/SHA256SUMS
+sha256  99acd315d9af35419cda4a6960f00a7d446bd231bd407174a7b07cb3dba0c253  nss-3.71.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3f8f0e1789..83daf18e76 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.70
+LIBNSS_VERSION = 3.71
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
