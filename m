Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95418C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 10:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17F361063;
	Mon, 31 Jul 2023 10:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F17F361063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9pHNZlYi7hH; Mon, 31 Jul 2023 10:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC146104B;
	Mon, 31 Jul 2023 10:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC146104B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8B751BF384
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 10:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F90840207
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F90840207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Zt-PBAVvK_h for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 10:40:15 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 245754012D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 10:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245754012D
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe383c1a26so1040275e87.1
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 03:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690800012; x=1691404812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOf9wFqf5CLcn4p9SxvKiRRs1taYhJTzcXHbleRCHA8=;
 b=i+WJNdmE5C0bAJs27rfJNLk7ZrBGLeQLfDrkU5vpwKnU30HlfCepHosgPqm+ciWUTA
 O8NVnoGrKvulENYb5UKTW6QUAtUrE/INv5ed9MTQgk+5N1fJg+ieNt8wdCugEvCYDCot
 0084TkXDyypPUXg/2FRp3hC8Uk4nok684Pa0tu16KjbBMc30kx33UTNTG6napME9lJ5w
 1kEeUMoyPwTKeBcN5ghzKzAxPjccthaBUJad6M7fnQxVWqgtCBkvYyE/W3Bs3NLJgsDO
 4mj4VijUVJEHgllJ/dB/YluJ7J1cljEP/zdh2FUusgrYDNJSu9lynGJv02cXIdCnra1/
 TdEw==
X-Gm-Message-State: ABy/qLYpUXCw9Q/e++5BGR1llvZtpA2NvyVymj8CgzhjClepVJulWUF1
 Clb9ZPEE49J+imWLYY0E/KNWwAkp8EE=
X-Google-Smtp-Source: APBJJlFYySlHw+rhdJwDHqmpijXFc5f14RreGMQyl9JjneSXNqOmhnjLwL7KTPpQSoYzCuHuFAbBMw==
X-Received: by 2002:ac2:464b:0:b0:4fd:c8dc:2f55 with SMTP id
 s11-20020ac2464b000000b004fdc8dc2f55mr5209541lfo.66.1690800012229; 
 Mon, 31 Jul 2023 03:40:12 -0700 (PDT)
Received: from fedora.. ([213.149.38.169])
 by smtp.googlemail.com with ESMTPSA id
 mf25-20020a170906cb9900b0099251a40184sm5957365ejb.99.2023.07.31.03.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 03:40:11 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 12:40:09 +0200
Message-ID: <20230731104009.1071930-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690800012; x=1691404812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LOf9wFqf5CLcn4p9SxvKiRRs1taYhJTzcXHbleRCHA8=;
 b=MRUyi0HAUmCuEL82VtFXAdvtMcoh3VJ2OlTfLMA+yb0Sxte3inPcHlw8tRFsr4NTSt
 FU2Mlyqnv2wbT5JwF7DNDET953qKemlay/ZlBs0C/OmDSBUYJ3FmwwJeVUgn7ozVfRkU
 DuLCSmqCoXXnLUpKD2BXS9iDPgngwySYVwqTMuRe/A6m/6MIOHq3wqN3bPa0il96J1V1
 eMwasT24TxqbwcRRCkE5BEogEc86/LPwudydZRe3ghJEnbm7nvDAiLrVCUpwiFYbh+h9
 EJujke3C1ucfgjYxfsTXO6ckcVZFtHZzFQ1BN+HD3KkAUANsuDc5t2zPhLGe8ax0PViW
 l8iQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MRUyi0HA
Subject: [Buildroot] [PATCH] package/mhz: add new package
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
index 0000000000..c2485995cc
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
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/mhz $(@D)/mhz.c
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
