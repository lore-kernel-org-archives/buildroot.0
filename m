Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7604CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 18:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8329C41DB5;
	Thu,  4 Apr 2024 18:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLdGzwNGJ5s5; Thu,  4 Apr 2024 18:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA30F41DA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA30F41DA7;
	Thu,  4 Apr 2024 18:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9CD1BF363
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 18:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18C27838C9
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 18:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogLfqAxBAruT for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 18:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5835C81FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5835C81FC2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5835C81FC2
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 18:37:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c646.dip0.t-ipconnect.de [79.214.198.70])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D739A4C212A
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46626)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rsRxT-000000006tS-2wUv
 for buildroot@buildroot.org; Thu, 04 Apr 2024 18:37:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 20:37:07 +0200
Message-Id: <20240404183707.83611-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712255828;
 bh=naEf4+FDGXPCRIA0SITlFpQsUz6/lw+dKjWhgZYeK8U=;
 h=From:To:Subject:Date:From;
 b=Tk6ltQXBbEiAbsELiICqt9hsb0yddCRIrMlEMaRGa3sWNv6OUaybZixJ6mTIwB8T0
 LMd7btW/h5DsIGh+w1ZzlXhDVE0gAgZc3xwWLFq5SEir8mB/wYPRd5WuuDV36b70ip
 eFBDxqhmGpZO5FI+SQ0xOasZwVe6fecmT1EX7Ss07Pv0zOCTKjTpe6dBIoXitxBwSM
 rprlC4h+Vs4v2cZPgMnysVVUgJc+kF2AM729teuCQxGxn1rhm5pfOrZflp2uc4hQpz
 rmEViQR4x/spOYA/Zkn8apRR/ejDkcgPqVD3yXFWZ0d7LSJGKtQpERVtvwxwqnj3VI
 b2rL6N9cuWJwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=Tk6ltQXB
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.21.2
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 9d84ab7957..116855fdba 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c45baea5a210143b647349b5234a2192164d3473a39d2b1cab7fb35b1a2a8ba9  xmrig-6.21.1.tar.gz
+sha256  68b4be51e99687bad15d5bf4ac9eed79a080ba89141f7363457a957ce9304e4d  xmrig-6.21.2.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 37a613820d..45538fa77e 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.21.1
+XMRIG_VERSION = 6.21.2
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
