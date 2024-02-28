Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD3FC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 14:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D3B8233A;
	Wed, 28 Feb 2024 14:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWztDX_lShvl; Wed, 28 Feb 2024 14:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD1B8258A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD1B8258A;
	Wed, 28 Feb 2024 14:56:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 609481BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E8BE60E67
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O68rDYB5mQO4 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 14:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F202060E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F202060E62
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F202060E62
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 6E830164F3;
 Wed, 28 Feb 2024 15:56:55 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id MSZzFW0Bfdct; Wed, 28 Feb 2024 15:56:55 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 19A2516255;
 Wed, 28 Feb 2024 15:56:52 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 15:56:41 +0100
Message-ID: <20240228145642.436509-2-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228145642.436509-1-christian@klarinett.li>
References: <20240228145642.436509-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1709132215; bh=a02hJUWYYWXB0tlEaSs5QBYGtKWuV5EpkHi4b
 buPB+I=; b=e+U2utXIAyT2dtpXS9JLbBAbBQSq++vRAWm9bS+IeqZ/UmSfIQmHh
 /u4crAo4pf/j2PNe/X81zNVnDgf3ruqiedE5ngx1FRLsyJZWTP/CecGow8I4eF19
 OXpS0K0cZMuvQgeAUeOQrWSc67Res39i4CENXckuLOlrDJw7TcMCBM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=e+U2utXI
Subject: [Buildroot] [PATCH 2/2] package/zic: enable installation on target
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/Config.in     |  1 +
 package/zic/Config.in |  6 ++++++
 package/zic/zic.mk    | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/zic/Config.in

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..909b716f16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2237,6 +2237,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/zic/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/zic/Config.in b/package/zic/Config.in
new file mode 100644
index 0000000000..11a8c99a66
--- /dev/null
+++ b/package/zic/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ZIC
+	bool "zic"
+	help
+	  timezone information compiler (zic)
+
+	  https://www.iana.org/time-zones
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a915f6d256..12bb9e9943 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -10,6 +10,19 @@ ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 ZIC_LICENSE_FILES = LICENSE
+ZIC_INSTALL_STAGING = YES
+
+define ZIC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) zic
+endef
+
+define ZIC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(TARGET_DIR)/usr/include/tzfile.h
+endef
+
+define ZIC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/zic $(TARGET_DIR)/usr/sbin/zic
+endef
 
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
@@ -20,6 +33,7 @@ define HOST_ZIC_INSTALL_CMDS
 	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/include/tzfile.h
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 
 ZIC = $(HOST_DIR)/sbin/zic
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
