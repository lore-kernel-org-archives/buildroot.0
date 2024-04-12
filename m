Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83E6C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 08:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A14F6136A;
	Fri, 12 Apr 2024 08:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB6GtiZXPS-R; Fri, 12 Apr 2024 08:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0CB606E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0CB606E5;
	Fri, 12 Apr 2024 08:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2448A1BF316
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 08:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A80A4027D
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 08:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGJOs3hoqYHm for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 08:04:18 +0000 (UTC)
X-Greylist: delayed 1135 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 12 Apr 2024 08:04:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DE7F40278
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE7F40278
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE7F40278
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 08:04:16 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rvBtO-003pCp-JW; Fri, 12 Apr 2024 10:04:14 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3f3c7fc9;
 Fri, 12 Apr 2024 08:04:14 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 11:04:12 +0300
Message-ID: <20240412080413.1407759-1-aperez@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c60Q2ZnIUrqsaIkwEMCu+T8jLKeHXNxYzJm4mm5yv5g=; b=KpF82+MONqvIkFBtHBjAJj2g+U
 kxfT1c81O+Ta6/yCRoKR8ofdrHIqhBh5FHp+0VthZKE/GHRsvy56AIHGT6w4vfHdTG1G3jg+Vq3qt
 X0UzJCsPwsDJq02COehWiIzMwINEUuuvKx9i8PdtwHQNgVbxgdhnmBQGoDxlNuIDQsaNWIIqQD5Eu
 6gUSL5FCXCzy8lGPR8sMj6lIWpGpOImhS7U4EwKXr/L9Kmpplk6Hjo4qDUnXJ2rqIUC5iwZebfxSo
 eKG+sd4rQ+ZHZa22I00O1tqGxp5DOImy5rZCQDwFzNQy/6OFCIVBiGQG/6Kh3qcquZbSYGc7+fdiE
 abnbJDaA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=KpF82+MO
Subject: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.9.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds a new --argv0 flag, has better error reporting, and
fixes and important file descriptor double-close when using --args,
--seccomp, and --seccomp-fd. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.9.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index abc69d96be..f61aca34f9 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.8.0
-sha256  957ad1149db9033db88e988b12bcebe349a445e1efc8a9b59ad2939a113d333a  bubblewrap-0.8.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.9.0
+sha256  c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43bab9f2d05dd094e1  bubblewrap-0.9.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 1081db697d..9dd711ce47 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.8.0
+BUBBLEWRAP_VERSION = 0.9.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
