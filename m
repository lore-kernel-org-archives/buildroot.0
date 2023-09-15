Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D947CD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2376140C;
	Fri, 15 Sep 2023 22:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2376140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiB39aZhwYMV; Fri, 15 Sep 2023 22:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B93613FA;
	Fri, 15 Sep 2023 22:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B93613FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD3E51BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5F53404C2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F53404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMuejv8lesUF for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D16D402A8
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D16D402A8
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-577f6b414a4so2099124a12.0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694816836; x=1695421636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UinhQQtuPYrmAsKl6Y0R9pYrBbvK5KOuTRzLbFdgr8=;
 b=EfM6tPGDNzz2adepbwL6k08jJJMqdJewkb1Qj7jYeDELztKmzohkCFh4qOnVH0RodF
 vAC+yJuJXuD+w9BD3Vet4XHN8H+49190UaCa7aVyv3+AiYUIoFbnHNw7sOKwzVuhTo3z
 HRanMZCSqquB1b38BOU6cOYeibXRPIrOdkj+6DQj+fcRxSZfh5dSF7OadeXKp0hZh/wG
 Cjwqp9D52hQMioDBk4SeNtfyQDHedXl8IsdCnEIAjXhJGURULhQxfnL+SemzyOxdQNbi
 MwjMwOR9ihn/z8PtT3HXL9UVhBfXnxDxjZkNzgf68TNkoEwrLZNkOet4pD7BmU0xp5oY
 lEnw==
X-Gm-Message-State: AOJu0Yzl6qoUiGqOcJr2SGnwmfg4PxzdZxKtCrxnroE8wPB5pJPimPWS
 W0vRjsa6DmvbKPIgLIY0K123x2O+OUc=
X-Google-Smtp-Source: AGHT+IGX++jpk2o4zord3BGC7zAHyNfbjxzsbsJCJ+eoyPqII2WyfIi5VRUNFlinP8Dwa+hJq2QKRA==
X-Received: by 2002:a17:90b:2248:b0:268:dad:2fdc with SMTP id
 hk8-20020a17090b224800b002680dad2fdcmr2901164pjb.21.1694816836131; 
 Fri, 15 Sep 2023 15:27:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 26-20020a17090a019a00b0026fb228fafasm5714413pjc.18.2023.09.15.15.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 15:27:15 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 15:27:11 -0700
Message-Id: <20230915222711.899079-2-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915222711.899079-1-yanghaobillcheng@gmail.com>
References: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
 <20230915222711.899079-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694816836; x=1695421636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UinhQQtuPYrmAsKl6Y0R9pYrBbvK5KOuTRzLbFdgr8=;
 b=bh/848DcMdZGkIxlJLHH9/LwawyF0AYxJu6Beur7cjUvcqHFYplbYQ3K1QnvPJq3+J
 xpyzRgDZuFlXFbv9128J33Ftcr2MnW1yDxfLk9c093/xICosorzvyEuFznp5Qhx3Vika
 Aq2afZmSJ5v/UfEI7nnYVvqJKsBP8t6Mue9Uoip/oHGmmK+ncaeRujOUYE1R5sRR+3Gn
 8VCxI9htSObUtZs9FYJVn5uwAkAqH7WM3nus10WPnHPCsIQQZhp06Q79/Nv39bPy8Cdi
 Qxv5PIShA2r2mFkOCzrCpGWAPoHKaEUnNmAsmAPz3XFnBpX7+h9zanjLYz0Fogg0pq0M
 +TmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bh/848Dc
Subject: [Buildroot] [PATCH v3 2/2] package/xserver_xorg-server: Add
 condition in xserver_xorg-server.mk
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

Does not install systemd unit if nodm or xdm is enabled.

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
Changes v1 -> v2:
    - Simplify the condition per Thomas's suggestion

Changes v2 -> v3: (Suggested by Yann)
	- Revert indent added in original patch
	- Keep the original number of patches

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0390519d6a..4019e1e280 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -176,10 +176,14 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+# Systemd unit conflicts with nodm and xdm
+ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
+# Install the systemd unit only when nodm nor xdm aren't enabled
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
+endif
 
 # init script conflicts with S90nodm and S99xdm
 ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
