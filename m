Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4841C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D6C6137F
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54D6C6137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAF2608D6;
	Tue,  5 Oct 2021 06:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mI1D5_3nEMg6; Tue,  5 Oct 2021 06:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F06608C7;
	Tue,  5 Oct 2021 06:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8011BF3C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 973F0401B1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZhZjJvP74YJ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 06:44:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70A28400B9
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 06:44:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so2031408wmd.2
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 23:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Di4bMjU3Wtra4OOkJnfnScued2SIo7Cm9qT0tI2DANo=;
 b=kDfp5DIlI2870ndAcDbZI/vW0a+7C1oStC3SGRvoxGdX+IfQSjVcme+yHUq0k3W5jy
 EM15N7cJITha5C5A4bkNHaTFxochOJF+YcOc6c1w9lYt09qOOKBN2dR93Cwv6kgwitEA
 1UgkXUYOvse40N/GZWAkONuwzk4wgoQ9WBGhYXVyesb1Hz5Ba8aR9A67ZOGMPfWO/nB8
 jAAd3NuZMalGtYdvBQ5I3SJ/iUnO2JkkVghIfZUfZvBCSrrw/doycIk2KPEyB61JsREh
 4JaebkNcUPQJGa5cbXPx4zc2tdtcqnCaZJwDaY3PycLTc5KyZB/5VOGeiFnRwir5mwRF
 Fs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Di4bMjU3Wtra4OOkJnfnScued2SIo7Cm9qT0tI2DANo=;
 b=29RLQcs6ZhnhIhO3R1JpzVfR7wLFxurSVg/od1DDNrputV3itk7bT2VkS4YwFFLb9o
 Nz5Td2c1jxjm9jtr1mIoE3+wMSNsC4tjnLgRkU3AQEgyp233SRYLs9gsd4nVH47wAIiR
 E92vGjOq2+7OiQHYveHHdoTz43bgWhA/VWmVYCdbeTX6cBFKDFxA+jDhe7P5OiFpj6bm
 W7FCP+hk+7QjpXOpMjsvE3HswEPMGvJP93gysz7n+Hivb7mbnpNRKLcGmFoXlwHm8I8E
 0xYfcqVlI0RmuA8fx+gUGtKkFVPn8ePwnNsrFBrHFLeE6HJtQRpQ/6l36CmT7dLHFyaN
 dDqw==
X-Gm-Message-State: AOAM531TQo7pEjKBSIVJ17yPVs7Iv3eo67S96YCPhmZM48Z8t8cDvNWf
 iYLKifZEac1ok8XkDKgGWN1mllbsTds=
X-Google-Smtp-Source: ABdhPJwmnR8bEXXX++dtHbUHqhnaCySE+bgjdX8oYAPaQvSQG9bIqF1DskbURrIDCWRxTUJoSlnGgA==
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr1576497wme.68.1633416275312; 
 Mon, 04 Oct 2021 23:44:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id 143sm817384wma.37.2021.10.04.23.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 23:44:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 08:43:34 +0200
Message-Id: <20211005064334.737168-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005064334.737168-1-fontaine.fabrice@gmail.com>
References: <20211005064334.737168-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/net-tools: bump to version 2.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use standard install target as update target has been removed with
https://sourceforge.net/p/net-tools/code/ci/5484cf9a13a2b1d6f604aad2a4fa41c7f01e1a46/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/net-tools/net-tools.hash | 5 ++++-
 package/net-tools/net-tools.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index e29415b8ff..fdc30fa2b2 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,3 +1,6 @@
+# From http://sourceforge.net/projects/net-tools/files/
+sha1  4080baab0486dc882c3b293d5559c27251ae4268  net-tools-2.10.tar.xz
+md5  78aae762c95e2d731faf88d482e4cde5  net-tools-2.10.tar.xz
 # Locally computed
-sha256  4c68ef33d97cc807fe437fa64a801355c36d638774c0c8a4342742f6bdceea78  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b-br1.tar.gz
+sha256  b262435a5241e89bfa51c3cabd5133753952f7a7b7b93f32e08cb9d96f580d69  net-tools-2.10.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index eb268a6e14..4a03e3d846 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NET_TOOLS_VERSION = 479bb4a7e11a4084e2935c0a576388f92469225b
-NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
+NET_TOOLS_VERSION = 2.10
+NET_TOOLS_SOURCE = net-tools-$(NET_TOOLS_VERSION).tar.xz
+NET_TOOLS_SITE = http://downloads.sourceforge.net/project/net-tools
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
@@ -35,11 +36,10 @@ define NET_TOOLS_BUILD_CMDS
 		$(MAKE) -C $(@D)
 endef
 
-# install renames conflicting binaries, update does not
 # ifconfig & route reside in /sbin for busybox, so ensure we don't end
 # up with two versions of those.
 define NET_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) update
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
 	mv -f $(TARGET_DIR)/bin/route $(TARGET_DIR)/sbin/route
 endef
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
