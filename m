Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6442C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08C7415F0;
	Sun, 15 Jan 2023 11:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08C7415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q38BvL6SIiKe; Sun, 15 Jan 2023 11:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2D041525;
	Sun, 15 Jan 2023 11:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2D041525
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75A9B1BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5189A60FBE
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5189A60FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m89aFhuG1Iju for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6C060F98
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6C060F98
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:49:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z11so37252691ede.1
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 03:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVvP5tC8kL/yqNOS982PmtRouwl+flmdb5Yc1RB/Qlw=;
 b=wUoxqtB7lwXzuxlUogL95PSHiz77qCHxdpYM7Qw1JdXwRIrkU2b7YyWtejUIWUnOrW
 OZod23eIRdO/PrHvttJKMSOUJUpURgLFXwk0aHGUT4xrxp85JwzeAltQ3eeo9PqBD4TO
 rQpxmz6Diilz/CCqTUVlqtjkkkgI3KXo6w1iDZLZOHPLXsbWtlEbLcO0vem1dJkiIAP5
 jGJFZVjxQsaANCicb/+txD+VU5zoySVrJPlXQ9LFpUNMis6j9kD5LSm6JcWaTOOgPa6G
 5hUJ2BUtg1yuzC/0HGETwbzVFcqcXkLZDRDZs1HN6IjQPgvyfDK6KK+sFRXzZw/LgbF4
 2K5g==
X-Gm-Message-State: AFqh2kpjNZ+NJQ0K4yyFpvVuGG13Z+/AFdr3U+l6GhIsk5pyv6KfpbmD
 gcv/XLCgCWxvq7J+zHKirUYY6TSZZFU=
X-Google-Smtp-Source: AMrXdXsBSkkJdvgXlJnIeZp2CVdr5nT0uLH7NsSsISQrDUa9OzoErolah516TgTCqME3K79PhwpGpg==
X-Received: by 2002:a05:6402:2883:b0:499:d1ca:6d83 with SMTP id
 eg3-20020a056402288300b00499d1ca6d83mr15539400edb.2.1673783367607; 
 Sun, 15 Jan 2023 03:49:27 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402150600b0049622a61f8fsm10351880edw.30.2023.01.15.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:49:27 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:48:38 +0100
Message-Id: <20230115114840.9027-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115114840.9027-1-nolange79@gmail.com>
References: <20230115114840.9027-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVvP5tC8kL/yqNOS982PmtRouwl+flmdb5Yc1RB/Qlw=;
 b=Dp3YbBDQa9dGgWJq6yZyrf3vztsLwngV6M0gS2rfkmO27GX//Ct9i8QoH2ShBgQLJQ
 3HwxcykhZcByPrncERWgIaUKiqej+esUS2KqqOO8u3VKlSsDbMKXzwW5rBRanRR9KqP8
 Gd6D/VIDJtQa5tBafqelvWPVWiwaLYjyBBrH+pV+Xg7fgoaw23MH2E20MFO6lCKvHaZs
 t355vbTQJqvYQXI48ThHAGsg6ekxGOQ1Ju1dfrhu3SmM/djjuRzm2/llM1Pe56gnXEr1
 1Qx6A8BWuq2ikiaaRaRw+Vd4Cxbm0LngL0MWi8ftIKEeFRBoztPU9r51SXCR1Kh8dw0G
 yrZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Dp3YbBDQ
Subject: [Buildroot] [PATCH v8 3/4] package/systemd: support dnssec if
 openssl is available
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set -Ddefault-dnssec=allow-downgrade if openssl is available as both
openssl and gcrypt are now supported for dnssec.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

---
v6->v7:

*   split off as its own patch
*   seems that the change was done at v250 or earlier
---
 package/systemd/systemd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f49d34d32f..297cc400ee 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -246,9 +246,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
@@ -318,6 +318,12 @@ else
 SYSTEMD_CONF_OPTS += -Dselinux=false
 endif
 
+ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
+else
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
