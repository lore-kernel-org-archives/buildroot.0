Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF29C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280BE8187F;
	Mon, 31 Jul 2023 12:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280BE8187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOpw4LkWgjBt; Mon, 31 Jul 2023 12:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3DF817FD;
	Mon, 31 Jul 2023 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3DF817FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78CB01BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50DA14097A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50DA14097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5hQWdkNaVF0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:20:28 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C97FB40975
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C97FB40975
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so805242e87.2
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 05:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690806025; x=1691410825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIhNDMUE8ynrtADCVdrt09Gr85AgkhrPSCqFcAiaI7g=;
 b=GF/kVYwLfNMlNz+luUKU6qol4ml0FXFl2ghLUZph8sRSWCHeFNzMgMonHWbGnrsXeQ
 wJDSR4vc5Oeubqk1v+WCobNByLy9nseQj5Zp2Q7gWHK90xoKTeKPc/qn8Joxhmqqx4n5
 VQ3My/MqqthfHnIdrlwDPRyxDvkSTYMwDhG7jNwA6sXcAP7HyhchR1l8dT1doX4nAdLI
 VBMTdrQcUHIN1PEFJetJV6RvDtDm9kT8T0y0jC12QuF2U/IqPCMDDH1ZPK8Y2KhAhghQ
 cdKSyYEcDKJ9zaaU4pjshTwVY+MlfyeC+veTriMF7xFLCtnepRR89TdYeRMOK05pCNIp
 udkA==
X-Gm-Message-State: ABy/qLZynajvmzm/4qBM74cvPnbJkOu9gak2QlWAd8FgWciX0AV30AXK
 BEn4kxiMyfjExMpTyisfqQd6sKsLV+4=
X-Google-Smtp-Source: APBJJlEisRaEYOgZK+qM35jmGhyF9qlfw4w6eetz+Y534RbolR6CiChPoeJRCPTVO3SWP5I6yolBzQ==
X-Received: by 2002:a19:8c0f:0:b0:4f8:714e:27a8 with SMTP id
 o15-20020a198c0f000000b004f8714e27a8mr4922889lfd.0.1690806024852; 
 Mon, 31 Jul 2023 05:20:24 -0700 (PDT)
Received: from fedora.. ([213.149.38.169])
 by smtp.googlemail.com with ESMTPSA id
 x5-20020aa7dac5000000b005223c34259fsm5309902eds.57.2023.07.31.05.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:20:24 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 14:20:22 +0200
Message-ID: <20230731122022.1686951-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690806025; x=1691410825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IIhNDMUE8ynrtADCVdrt09Gr85AgkhrPSCqFcAiaI7g=;
 b=AHTaGcv28QvG+Dqe+K85g17BMXUpcjbNXLsxuCJ7H4p6UkmBpn+hWdn/7k8+WxOySe
 RuilNVSGKmSq/xoZxNgwsXLl35ZpUGS094OMYiCa37Ekb0NlP1KPpSW3Gf+lzlWXa5ub
 FbMrjNdNHaw/AUFAa4wvXB0niZNFe6XxYsYeuG8VOMy0mSL9LZ0WuIAOF2BxNTEbArrb
 7TYVPIF4uSp5klqgzL5BnliaJZYXjvce8HCKDs4XxVB2uVHTIL9oYU3qV60wNpyW2VbY
 2raLfVjaRjBhcHthOrNWRgpFbuxEtl749V6LgpPKaXHhXJ5YXpkJIKjJUP2bG1XufczN
 PUFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AHTaGcv2
Subject: [Buildroot] [PATCH v2] package/mhz: add new package
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
Cc: Robert Marko <robimarko@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mhz is a tool to mathematically calculate the real running CPU frequency
and as such has proved as invaluable tool for developing CPUFreq and
similar features in the kernel.

Its source finally got a license recently so it can be packaged.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
* Use the Makefile from source and override CC and CFLAGS
---
 package/Config.in     |  1 +
 package/mhz/Config.in |  6 ++++++
 package/mhz/mhz.hash  |  2 ++
 package/mhz/mhz.mk    | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/mhz/Config.in
 create mode 100644 package/mhz/mhz.hash
 create mode 100644 package/mhz/mhz.mk

diff --git a/package/Config.in b/package/Config.in
index a60a1a8858..b9b6dd2580 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ endmenu
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
+	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/mhz/Config.in b/package/mhz/Config.in
new file mode 100644
index 0000000000..2f4af5026e
--- /dev/null
+++ b/package/mhz/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MHZ
+	bool "mhz"
+	help
+	  CPU frequency measurement utility.
+
+	  https://github.com/wtarreau/mhz.git
diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
new file mode 100644
index 0000000000..6b39eb4bb7
--- /dev/null
+++ b/package/mhz/mhz.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  1e07bb0d455d63fd33fb87a24f65a803c7c2d920fde4e5b5378b8c1b07de3b47  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1-br1.tar.gz
diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
new file mode 100644
index 0000000000..924bf0793e
--- /dev/null
+++ b/package/mhz/mhz.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mhz
+#
+################################################################################
+
+MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
+MHZ_SITE = https://github.com/wtarreau/mhz.git
+MHZ_SITE_METHOD = git
+MHZ_LICENSE = MIT/X11
+MHZ_LICENSE_FILES = LICENSE
+
+define MHZ_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
+endef
+
+define MHZ_INSTALL_TARGET_CMDS
+	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
