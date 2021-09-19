Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA77FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:09:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7266461019
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7266461019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F85860684;
	Sun, 19 Sep 2021 08:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-OBsaTAdZlz; Sun, 19 Sep 2021 08:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8F360626;
	Sun, 19 Sep 2021 08:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B05591BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928BA60626
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mwtbJkfQOin for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3FDB60586
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:09:09 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id r75so283756iod.7
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1BrWKJgJdykXp3PQW3n7MGsbbTstrG2IVGyFX3rpY0=;
 b=kvl/JJ0mBHZiC95EZkz6LmM8OkxZniNjw89tSjfGRVkXjjwNMqI7fO38cibov+yAw2
 LQGwAmK1S/riHM4D9K4Xn/KU8+dwE6hnMXAtX7KxhPkFszId7tlxIl6zXVLQT1WFr2is
 aste81EBv7GqLAaGOJCB5u0hWDKCTG+QG7UIDGGVQ+/O1LctENrQQ2g4IZ7Yso4bTWVk
 qEvEeP92DDbe0dg8BwugVNv3SFpfBNi4WRfG7w1yicR/PCVysdVxfzFrb3st+VdrEz7z
 kdTQ+UmUKDrc5auR/OHMSrvomw2eoSKkgYP8FdwxXsSTUCe6bM66X/Z3IkBAlF7vGAj4
 H4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1BrWKJgJdykXp3PQW3n7MGsbbTstrG2IVGyFX3rpY0=;
 b=FwwOexbDaL3mUUZ3jMjK9hByXzeFR7Oobtlw1DpS2n956B6OpKSRJWmRMwnhGbgCIh
 iLc8FwA07kJOi4485nk2jLlPCTOjtIiRTUlpBWYM6wCknayaoUHPKgzPicV+dec3YDCL
 tsY8NoFJ21K/NjugXI/Tc193Tx2syplzeU1UnSne74+bL1KKOEONlOBU5F4uV+CC0sUf
 WAcvBRmFWNfgJ3O2YxbsmhLLitSJ3rG7VB5OhYQkBM6TcIzMdN3ny/3QnmvLbqsaWyPc
 X4E2xoUJ4HSNCq4RR+kAsz/DqooJEcqYMBGE7Ji888i5DURKsDhhOaoW5MK6fqvwQ9RN
 KMdw==
X-Gm-Message-State: AOAM5334uLScy/KbFbpdJtXHldZvE4t35E/Bnuh1DtgoSkUadA80C3Mh
 vPoNWZtem+ht94FL+6ybuZQw6/AWnt0=
X-Google-Smtp-Source: ABdhPJzG6uEvJuyhHUVHCp4qbJOZ71DR0n9cusn2WG7fCJBfdQ5UsxwXEoPxjWr4p4xvKY+rZbvWOw==
X-Received: by 2002:a5e:8d16:: with SMTP id m22mr258470ioj.62.1632038948757;
 Sun, 19 Sep 2021 01:09:08 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id k5sm5263837ioc.7.2021.09.19.01.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 01:09:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 02:09:02 -0600
Message-Id: <20210919080902.2475463-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: add option to enable
 USB install
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is enabled by default for consistency with meta-swupdate
behavior.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add note in commit on why this is enabled by default
  - fix whitespace in udev rule
---
 package/swupdate/Config.in          | 7 +++++++
 package/swupdate/swupdate-usb.rules | 1 +
 package/swupdate/swupdate.mk        | 3 +++
 3 files changed, 11 insertions(+)
 create mode 100644 package/swupdate/swupdate-usb.rules

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 6b832cfcbf..54a99b73d5 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_USB
+	bool "swupdate usb"
+	default y
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  Enable update from USB disk.
+
 config BR2_PACKAGE_SWUPDATE_WEBSERVER
 	bool "swupdate webserver"
 	default y
diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
new file mode 100644
index 0000000000..72e003d74d
--- /dev/null
+++ b/package/swupdate/swupdate-usb.rules
@@ -0,0 +1 @@
+ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e191ab384a..5ed2ca55d2 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(if $(BR2_PACKAGE_SWUPDATE_USB), \
+		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb.rules \
+			$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
