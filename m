Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21792C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 19:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF5560BA6;
	Wed, 10 Aug 2022 19:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BF5560BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCp2D_98uwWF; Wed, 10 Aug 2022 19:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA1760B18;
	Wed, 10 Aug 2022 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA1760B18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBCB31BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C717D60B18
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C717D60B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6-NLUQa4e5H for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 19:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E759260B12
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E759260B12
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 19:07:10 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id v2so11673598qvs.12
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hqSrwk1yQTzNDy/LIttAOepPFPdYivIi4HVCh6XU+tc=;
 b=BMJQcCAuuXfOGN5TLdc7YfB7768WNBP59MfAzSnQujZW2bDaiuVAZ+KoBRDf2Uwx4B
 jHf5VK6t7TXUfRo0zH49Om8p0EQ1sX0Q+HxpbC+TukKOY1vXyXdBFAZ3malAQFewFRJ9
 dbKlGurKFnufUm2/qgCLlgS/JPPtuGgyLJ0m4cutVtAqCQEZ1mLZZ0F20VytBKr3cr70
 /iW6UaqFaQspU3tp3XUU1z2QcBja8gmK6urHxOQsVizQxWtwA3hqI6EdXcSI3nnt0Q1U
 HVenD73eRwAct93vNRp9wCq7r4cEzeib8abwgKSSR/2UzGNplb95eDbxNcl7ZlROTFkB
 zxUQ==
X-Gm-Message-State: ACgBeo3wCH21cYJU1SdKFktZc+1kGQhZGdczMkkuWYrmkgz3j2EjuyAB
 sE64Es5n4aBuxL2IsCXzZXwcJDrxhl4=
X-Google-Smtp-Source: AA6agR4NjJZFBefFwbWnDTszqfVVTvxjSfnh+au2/OKlo+sfhKGTGXb7hRWLo6eBcyHH6hbpMXerZQ==
X-Received: by 2002:a05:6214:acf:b0:474:7fd6:299 with SMTP id
 g15-20020a0562140acf00b004747fd60299mr24775737qvi.51.1660158418969; 
 Wed, 10 Aug 2022 12:06:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05622a01cb00b0033c36ef019esm394921qtw.63.2022.08.10.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:06:57 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 12:06:52 -0700
Message-Id: <20220810190652.2185416-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hqSrwk1yQTzNDy/LIttAOepPFPdYivIi4HVCh6XU+tc=;
 b=bPgo0PxIcGnFMmAL/QCn4FtIJuFY1p7fCJs/O5lMcdsrci203s1EkkPBAd/ryinwGe
 3nrfe1lNHcMz8ZiomVMjKTIgWtQdWimqcCjwHtT8hoqKjoPSS53Jjsxec6JZ4+4Ak+/v
 HaP+64OZDLt/ONfb5kSD16E429onUSUCcHhzgfiNu/KbT/HiwV+wwyM/RE4WSOudzEDW
 PjqU217zqy1tuv/n8a0jRFEubiGaT4tRXb3njU+OXX5nCwVtZrBwQHaZ5zP7LYtndy5Z
 YeiVhDgjeaHaj8tbk7QK3JsjOKgXGY7AatFH3iAa5ugbSLiR2u0qJgDBKZfjGDj+Ra43
 vFfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bPgo0PxI
Subject: [Buildroot] [PATCH] package/linux-tools: Allow installation of perf
 scripts
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to run the full gamut of "perf tests" installing the perf
scripts is required, otherwise we run into errors similar to those:

	failed to open shell test directory: /usr/libexec/perf-core/tests/shell

Make this possible by introducing a new option allowing us to install
perf scripts.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/linux-tools/Config.in             | 6 ++++++
 package/linux-tools/linux-tool-perf.mk.in | 6 ++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 732ac65a2565..c0c097d888a9 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -76,6 +76,12 @@ comment "perf needs a toolchain w/ dynamic library"
 
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS
+	bool "Enable installation of perf scripts"
+	help
+	  Enable the installation of the perf scripts under
+	  /usr/libexec/perf-core/ which is necessary for running "perf tests"
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	bool "enable perf TUI"
 	depends on BR2_USE_MMU # slang
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 8ac4ebbc42f5..171aa06fed6b 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -163,8 +163,10 @@ endef
 define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS)" = ""; then \
+		$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/ ; \
+		$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/ ; \
+	fi
 endef
 
 define PERF_LINUX_CONFIG_FIXUPS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
