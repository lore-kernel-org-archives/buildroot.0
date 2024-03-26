Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03294C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD9A0403FC;
	Tue, 26 Mar 2024 16:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9IQx1KNLkqm; Tue, 26 Mar 2024 16:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4EA040430
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4EA040430;
	Tue, 26 Mar 2024 16:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 147A71BF364
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0133A40430
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3kVctkoaoLq for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A59FB403FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A59FB403FC
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A59FB403FC
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 67FA716531;
 Tue, 26 Mar 2024 17:38:02 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id bVQ7mSYNvDmi; Tue, 26 Mar 2024 17:38:02 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id BA24116520;
 Tue, 26 Mar 2024 17:38:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 17:37:50 +0100
Message-ID: <20240326163750.2211753-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228145642.436509-2-christian@klarinett.li>
References: <20240228145642.436509-2-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1711471082; bh=oTQLJrNCn1c5av4dfeC7zrh/Lvzp4mE6Rh6Zp
 9ABf3Q=; b=P5EdJX+57FCtracTyy0UIQZayyLgegmYImqNDWL18SZjtUMQcEPXi
 DyeTbiB1RtGPd80T8PBRGC2hAoZSBohmImBTOfkwypFOm0CZAArIzKDqMcB1gUnf
 5i4KvQIijPJpi1J/d9yZIaXyULsOXbWDFVpkOfjolFFenjUYD63mRc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=P5EdJX+5
Subject: [Buildroot] [PATCH v2] package/zic: enable installation on target
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

When we configure a time zone on our device's GUI we use the standard
time zones. This gives us the usual benefits e.g. automatic daylight
saving time switching.
We also need to support an API that wants to set the "time zone" by
specifying the offset in minutes from GMT. The given information
is not enough to reliably selecting one of the existing time zones.
Instead, when the time zone is set over this API we dynamically create
and configure a "Custom" time zone with the given offset. For this
we use the `zic` tool on target.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

---
Changes v1 -> v2:
  - dropped adding hash for patch
  - dropped installing header file to staging
  - added rationale to commit message
---
 package/Config.in     | 1 +
 package/zic/Config.in | 6 ++++++
 package/zic/zic.mk    | 9 +++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 package/zic/Config.in

diff --git a/package/Config.in b/package/Config.in
index 410fe0f493..3963282aab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2239,6 +2239,7 @@ endif
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
index 95fa1eaa96..d116c5b773 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -11,6 +11,14 @@ ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 ZIC_LICENSE_FILES = LICENSE
 
+define ZIC_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) zic
+endef
+
+define ZIC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/zic $(TARGET_DIR)/usr/sbin/zic
+endef
+
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
 endef
@@ -20,6 +28,7 @@ define HOST_ZIC_INSTALL_CMDS
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
