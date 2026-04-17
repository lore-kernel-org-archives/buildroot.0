Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EBEF8DFE9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACF460D5F;
	Fri, 17 Apr 2026 08:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M1O4XLGr9e3; Fri, 17 Apr 2026 08:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00F860656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776415219;
	bh=t7MewoMBt64c1c2Ri1omHoMM0d9M+Ytf2O1GZ9zABSM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQoozdPdRMIP7V8KYUaznKrFuzdOYHNbufko37AgKFw0pcEGKiTw98d71ZPPlMxeD
	 EeUMOwDco7QhHJL3LV7GE2uO/g6OT933valOh4+fuxJsGsjgJOCZYZjQLmg3UxiUFC
	 XDlFm+j00g+c1zKEh9rUx7AvWeHF4/lHFTu5rjpTgjuEV0TlS6S1rdxBaev3hwyeLT
	 RCyn9vWNH6Y2YdmeybCn3ss2VgRrWiesY/ADjn4FFRswx6udX1xWHYJklfRXYm4sXt
	 aPlB7wmHylinpk5cUfsQXBAngiDqdo0gJgBAS318NjcJY6zP6dRHHC1OtB3Bl+nN8c
	 xbgPTppbFV+EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00F860656;
	Fri, 17 Apr 2026 08:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B488396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416ED80E2E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nGdZaA9wzCe for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7739806BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7739806BF
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7739806BF
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:40:13 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wDekF-00HMP4-C3; Fri, 17 Apr 2026 10:40:11 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 095c83ae;
 Fri, 17 Apr 2026 08:40:10 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 Apr 2026 11:40:08 +0300
Message-ID: <20260417084010.1414193-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDguWSfvEseL4jiuM29LOwepMMAwAR53LkK6FV7N4HE=; b=GWADsj2N1UIk6co0wIQS0IbH4E
 tQkK75WQ/CPCjfa+bZShYhWnfeuTXUhRGzh0eBKNZI7KhHoYHx4leANaAd6iW+aFx8WNcG5iIfeoi
 xMqIe6CMr1ZZ9Z+NzK332k2C/RUIyq4lFCSo+M+6GTdpwrHLgrw4nSOnSwRDdDELVqwgmayrw6fIj
 2RC8W9fTFIEN6PUn4aXtbWcKpp98dbMDGrHzIPAtNEQsrsjJs18CS6VK/uuJgw2aeStiuGQiZCLtl
 HaBU4bE5dwHDRH06QW0a0jo+YKCbKIOIYh6E4vprdVMSQ9LuPYyLVNAHZyK9ZZzKgiFTb24VqvzE4
 PrpzBrZA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=GWADsj2N
Subject: [Buildroot] [PATCH] package/bubblewrap: bump version to 0.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index b2b88ffe92..696c20ee07 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,6 @@
 # Also checked GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
-sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
+# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
+sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index ea46d7a127..afbb29eab9 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.0
+BUBBLEWRAP_VERSION = 0.11.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
