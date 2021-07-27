Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14477C432BE
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:25:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C230561179
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C230561179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E7740295;
	Tue, 27 Jul 2021 07:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1etHm4Nk3nN; Tue, 27 Jul 2021 07:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704BD40268;
	Tue, 27 Jul 2021 07:25:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 171A81BF2A1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03F0B400CA
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZHZRN0sG5LC for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 07:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD304400A8
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 07:25:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n11so6883824wmd.2
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrX0XXFJJXE7sxrbO+OO+W12KscvIfLxXEei5iEcQMQ=;
 b=aU4NeGZ/B5eGI1HY3mkujVeF5LB/2dnCJ4d9d1NTSdLA0S2FPSEi371ZPmYoKKXDiN
 Iy5H+28PyCwcL97N8TVVYbhsvRzSg4enpSIyC6dOOU79eiKMlRalM5z7+IU0MKq4L/Dy
 Iv+S4mAseMnCYraGhwlBNKeZ8LXGtrZ1ULXUvwFPMyUF2NBZokiwP3Sy6wRlYG9acYRH
 ThGxWOTG/aFdyqv25cTs9pbbaYbLdJnkwB+MISJoEfR/OsXPmWF8Op21PhgOq2zY39Pg
 QsYN82D6O/s6Cqj759fRmIIrRaAsPTBabtCIknAm3+PNfIcfiaFIZmFg8t9kmu9oGWZp
 doaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrX0XXFJJXE7sxrbO+OO+W12KscvIfLxXEei5iEcQMQ=;
 b=E18brXh+dsc+WVXGtdAKCIGriHBQ4OrLPKDBjc4kF+gfn8yi9q3CQwVpnt0AU3Y7KJ
 /2SLqK+DPH3FkZhvIW/oUKq0Sx4O3CI2+HcDkOijLjhBBBAh9q7DsYx6/yVyPqzznSCV
 bv+QY8+9STy2PnbnzNJJqLzfWHFamdVWj9f4UlD1ZYlOJjFAwwwelmOiKWWdhyes1D/k
 J4czIbKacRvX4wlGE6RiKFUgfMe8SU1T5cAeidNrpIVLCXuNhwmoWHvBr0lIGC469UvG
 FigMJzdbK6t9bZtzZTtNXSyYFBcajDP1tDcpSxOJozZGnhqDXWn9o1fIyLpEP1TVT/rE
 4syA==
X-Gm-Message-State: AOAM5338jiEv2nzj17PXsOl6mi6/tpRXeIHXzd+lbEgFQBWAgYKULriq
 UPPvd0kEB1KfACev2Hqwf6gIjFzzTaWlRA==
X-Google-Smtp-Source: ABdhPJzeP+lhegVh8qmmQ7m/BMAe4WqDROI3t1qeTN19Wf1w0qd2kjY10uG0/jRubMeUW6nmmfKwHg==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr20706230wml.46.1627370731274; 
 Tue, 27 Jul 2021 00:25:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j13sm220515wms.24.2021.07.27.00.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 00:25:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 09:25:23 +0200
Message-Id: <20210727072523.2273052-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: make a single option
 for avrcp and a2dp
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of avrcp without a2dp is broken since commit
fb9fc969d91f69851b4c70dba512b607e52bda7b:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: profiles/audio/bluetoothd-avrcp.o: in function `avrcp_handle_set_volume':
avrcp.c:(.text+0x9c4): undefined reference to `media_transport_update_device_volume'

However, build of a2dp without avrcp is also broken:

/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `.L50':
media.c:(.text+0x508): undefined reference to `avrcp_unregister_player'
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `match_endpoint_by_path':
media.c:(.text+0x824): undefined reference to `avrcp_register_player'

Fixes:
 - http://autobuild.buildroot.org/results/d54cdfc03212fff772a863d1bc8afd3cfb605831
 - http://autobuild.buildroot.org/results/64d75af986a4d6e9c5a176efb6e22046f4d82350

So make a single audio option for a2dp and avrcp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/Config.in       | 12 +++---------
 package/bluez5_utils/bluez5_utils.mk | 15 ++++-----------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index f2b63b0a1c..de480d0453 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -58,17 +58,11 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	  "Nokia OBEX PC Suite tool". So, only if OBEX support is
 	  enabled this option has an effect.
 
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP
-	bool "build a2dp plugin"
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
+	bool "build audio plugins (a2dp and avrcp)"
 	default y
 	help
-	  Build plugin for A2DP (audio) profiles.
-
-config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP
-	bool "build avrcp plugin"
-	default y
-	help
-	  Build plugin for AVRCP (audio) profiles.
+	  Build audio plugin profiles (for A2DP and AVRCP).
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7b7e31500f..3551b14a69 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -53,18 +53,11 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
-# enable a2dp plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_A2DP),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp
+# enable audio plugins (a2dp and avrcp)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-a2dp --enable-avrcp
 else
-BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp
-endif
-
-#enable avrcp plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AVRCP),y)
-BLUEZ5_UTILS_CONF_OPTS += --enable-avrcp
-else
-BLUEZ5_UTILS_CONF_OPTS += --disable-avrcp
+BLUEZ5_UTILS_CONF_OPTS += --disable-a2dp --disable-avrcp
 endif
 
 # enable health plugin
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
