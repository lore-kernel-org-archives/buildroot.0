Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E36E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB0461242;
	Mon,  9 Oct 2023 14:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB0461242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vc6RAlDtnijX; Mon,  9 Oct 2023 14:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D71D611A2;
	Mon,  9 Oct 2023 14:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D71D611A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4FAE1BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF326104D
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF326104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnDx7lTzGd11 for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:29:29 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB60960B1A
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB60960B1A
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40537481094so42392745e9.0
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861766; x=1697466566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IRPpMqsiiwT00NTBx8So2P3n/2TKEBK8P09/QLi4jU=;
 b=KDRwJ1u6jOpnNnslNcdOkKGV4V2iho/mvtbl9ilWdYcH6Ha4eC5ahYdhBmnddtkSQ9
 CRJjYZkLwt4eAuZmk2+0bpfhZBnL+b7FmLoa+Ra9Vw73I2fBi3sFs6gSio8IC4bj69BY
 t31DuNuVThWZjAXs+RiIPnZagjSDRkFgNs8fyc1+Su/ofrDic9fpPt0gf0kWOa0nGtqx
 w6okTCuiK9kv5WJZv420SiKuXtF+FWDkp4snEZvzFFd+5oANd1BuGqM8z/V2A1TEFYH4
 xT/nwc+SwG1g7VQowaqMk5JmTC/dPyom1WSWZtlPysbHHl6Ta23oceJStLqoJNKO+jvD
 nHtw==
X-Gm-Message-State: AOJu0YxSxFI0kVr78ynxgDSDPUYB68h2qTomKZ7Ow+ABZDBcGNcbwCSm
 8gHXYPHQfWfkowyMw3lgBiDrssAundrLvq5e66pOnw==
X-Google-Smtp-Source: AGHT+IHSs8X2+MeP4QPU1VTxB3JHpuTjM+SeY6avkCrAEkpzUAvwg622BR2QPKuW02I/akKDlRjhag==
X-Received: by 2002:adf:e88f:0:b0:319:71be:9248 with SMTP id
 d15-20020adfe88f000000b0031971be9248mr13676640wrm.19.1696861766448; 
 Mon, 09 Oct 2023 07:29:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 kt13-20020a170906aacd00b009a5f1d15644sm6701412ejb.119.2023.10.09.07.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:29:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:29:13 +0200
Message-ID: <20231009142915.1775087-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
References: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861766; x=1697466566;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IRPpMqsiiwT00NTBx8So2P3n/2TKEBK8P09/QLi4jU=;
 b=p0LtQvBpaHCMWi9GOvHFTPQrhSBDFpo9kN3fQXFp8EYwF53tCQon8T3X54j5HR3qn0
 bsQkZF06YHUxmjhjuN7TKkej0122HjYeMRhapTEmwHkNiKjSPd+W+IFFxZJPg7+YWjNt
 CiE421e02MWsDO1bJhFG3A0W8XQcwj2XX9d30=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p0LtQvBp
Subject: [Buildroot] [PATCH 2/4] package/openrc: add linux-pam support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 01c23a2a79..5e667de7f8 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -24,6 +24,13 @@ else
 OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENRC_CONF_OPTS += -Dpam=true
+OPENRC_DEPENDENCIES += linux-pam
+else
+OPENRC_CONF_OPTS += -Dpam=false
+endif
+
 ifeq ($(BR2_PACKAGE_KBD),)
 # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
 # remove them if the kbd package is not selected (e.g. devices with serial
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
