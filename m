Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20637C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B617B61090
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B617B61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8531060B25;
	Thu, 23 Sep 2021 21:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67qYVg03hJyj; Thu, 23 Sep 2021 21:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC656606B8;
	Thu, 23 Sep 2021 21:28:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09B291BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD0584178
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bw-F3ORPJ73 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0815F84142
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:28:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t28so7732741wra.7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICiQPpfSGfI6BIAHTwQt/JLc8q5Io69JlaUofsO2vjk=;
 b=DBnHXBdgItnm8b7aP+A+ChOmVVPIQFweP7bYG6yLYNRy3xfj9BN9vhaTXvSw/UDlzt
 LnJgv/PpEZpUC9NWwpKZXPvmFqjBsYJXCllXe5ENbTttX5iXL+0r973KEglSwCl5jhOZ
 znuVq6BYvMoXgdlZvPEesznHwSpyGGkgFmU5oVJ4M9T/j4fBLZgh+2iYuWTdfFMjPDbq
 UxZkE/reVysqdRS5fKDdnXuyRQOwDM4DqQlvPz7tdzVvLg4MF/IqX8+Rq46G9sF3neH0
 bTqtBKHT5fAt/UitsRa/UhjEs0zGyHZ61O+obzrWRsUAYKHZIba9pZA28wMPyc4wnfis
 eexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICiQPpfSGfI6BIAHTwQt/JLc8q5Io69JlaUofsO2vjk=;
 b=h35J/YXEg6KsHr3/CosDFZ+5nR4joIU2A1eAWGco+sQrdpwyQtCzAozvBWedpB/E5I
 divfHeuOc8u6vrT163fPyMJflz5DfKIHNaJBUHLSfINOsQy7Sx2TbTE+YPF8Zj7T5mpI
 5YhRQJRQLNtyq+yo8j1N04z5vp0l6xm2Q/FYxowUmWIvozhpVSDiSZhriw2gexIut1th
 /791LAANylwerwb81jOLv9LtOzKPGRAivLfdkaDiSjr9zpRjI50R9stEZrdSlrJ1O8+K
 Zw5iAP+H7EiiNUvyWR+IKfypwYvbV5SaYkFQtkA3HWB/qE5j3T0SJhEfjJ+fbnh1i9UI
 vn4g==
X-Gm-Message-State: AOAM532Vn05/Th+wtegvqyAMRqb6xZwZPzAvO1PK/BwqIQrK+pvEmRyb
 WAP352LyfUXTc29lGOCHlmTtYOb7yMQ=
X-Google-Smtp-Source: ABdhPJwXKiVBkNDDPQ8kjNO26bZnukBBebMyxdu/pxmneSFDNNKZTLe8owV7/96MedABm2Qm6BwzWw==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr6816430wma.105.1632432517269; 
 Thu, 23 Sep 2021 14:28:37 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id j14sm6239783wrp.21.2021.09.23.14.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 14:28:36 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 23:28:31 +0200
Message-Id: <20210923212831.391084-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/syslinux: add missing python dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Syslinux use some python scripts during the build and they
are using python interpreter by default. It fail to build
when there is no python interpreter on the host.

[...]/syslinux-6.03/com32/cmenu/menugen.py
make[6]: python: No such file or directory

Since Syslinux 5.00, we can override the python interpreter
used during the build:

https://repo.or.cz/syslinux.git/commitdiff/4dec62ce9c2c0d170f21b3ae2d7c618eb7a30c05

Add the	missing	host-python3 dependency and override
it in SYSLINUX_BUILD_CMDS.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1614446766

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/syslinux/syslinux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 67bc69254e..77bacca9a3 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -14,7 +14,12 @@ SYSLINUX_LICENSE_FILES = COPYING
 SYSLINUX_INSTALL_IMAGES = YES
 
 # host-util-linux needed to provide libuuid when building host tools
-SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux host-util-linux
+SYSLINUX_DEPENDENCIES = \
+	host-nasm \
+	host-python3 \
+	host-upx \
+	host-util-linux \
+	util-linux \
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET += bios
@@ -59,6 +64,7 @@ define SYSLINUX_BUILD_CMDS
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
