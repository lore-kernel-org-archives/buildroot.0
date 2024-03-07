Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26625C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80DB401DD;
	Thu,  7 Mar 2024 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Xkk4k3Fymmj; Thu,  7 Mar 2024 17:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9B540205
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9B540205;
	Thu,  7 Mar 2024 17:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED311BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0835E40205
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8QzHId2uCwm for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10C7B401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C7B401DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10C7B401DD
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:49:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19016A4C1050
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 18:49:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45950)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHsJ-000000005Xz-3hE8
 for buildroot@buildroot.org; Thu, 07 Mar 2024 18:49:47 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:49:47 +0100
Message-Id: <20240307174947.37429-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833788;
 bh=KDfoKaEFpLNRVStfTz3C06jNx101baMCRgnnru6Wwmk=;
 h=From:To:Subject:Date:From;
 b=Ts2bQEjEdqkcQ0xTy0ZepWmEPyBPhMbi50Qh3P47LpO1exTJ9rV3we/KABr0KWfLE
 4GTCLA/pAnPeL1AHyotuRYKOJOmq/hEYZxVvqxYUuHG1ZyuIgXIGEpnZ0c/TxEcAE3
 uTlQ3CqlKphEZoxCKBOaJm9BQghyroQU+fCE6t+7jQfs/2n8jPi2BwESUrP/dImKH9
 DgUgpQLuFEPlEKayWdjUoLvpQ8kginxqz+U21I/ik/bp1q5qerMhIzM1GNF9XlN4Xw
 80yzQg8fnlSJZP0Qc3hhWPOg9qG/RQVJ2NTNEp9/qcYUYnitWsjxqN5w8hc/RV90mU
 EzeO9pbTKgO/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Ts2bQEjE
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.21.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 3a54d66ce4..9d84ab7957 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b197c71fa06030216b641b4ea57f7a3d977a17df1b55bd13759d4705dbf5941  xmrig-6.21.0.tar.gz
+sha256  c45baea5a210143b647349b5234a2192164d3473a39d2b1cab7fb35b1a2a8ba9  xmrig-6.21.1.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 35cd1d8d82..37a613820d 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.21.0
+XMRIG_VERSION = 6.21.1
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
