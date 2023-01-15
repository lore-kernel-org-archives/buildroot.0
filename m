Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C35C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7575860B3A;
	Sun, 15 Jan 2023 12:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7575860B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EytGuHkirULv; Sun, 15 Jan 2023 12:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E53D60FA6;
	Sun, 15 Jan 2023 12:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E53D60FA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 171011BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E521341680
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E521341680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y57xZmwpBhgh for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAB1415DF
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEAB1415DF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id l22so32555954eja.12
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WPQzlDSfYWMhjHCHNxDY+x/a3b1tcxWeg+Mbjs+1TmM=;
 b=VGKFDqBYFc1mht6V3W7CHqGMSkvEjEZlEqf8EoiO4nDItWeznN1RjpG49VATZ+ieBF
 Md38kKrPcfbMJU1jkQbBQokfmHHEQwiCI5bSOHPkK0k2b5+hBhZIG7LejeK8m6fTz+oc
 Um7LHWBlfY5LBo7SAc37x7NBRb2SCj9tHvpvMBOgsSLSjzd1soMJ4BsJ652PwPEql3V1
 ruO+vmWWGiowFc7QJRCMRpNCeKhAVvg9uqE+YWsmwQoOv2XgEunfOBR/Eqc3am+Wab9G
 CCj4dd7Wgohlp2gQ/uC/CbUt6uWENvhMdez3kdw/tcnv8VsKXoetRsH60W7ncp6x57Fe
 kptQ==
X-Gm-Message-State: AFqh2kpMSTIzZfJnFdgixmLvBatpXniYDDCHDcsEESgpUwtBzVL/JCU6
 TqfNhHloV7dIfiOwY6xzxiTKJkZiTFE=
X-Google-Smtp-Source: AMrXdXvi2vapM1Zne0FJrXCbzTe4nQMKozqIvmCGkjzGuX4jkRwRGTgE7PO9Vi3PHvjsIgk593+kqw==
X-Received: by 2002:a17:906:1d41:b0:86e:b750:d0fe with SMTP id
 o1-20020a1709061d4100b0086eb750d0femr3842631ejh.32.1673787188177; 
 Sun, 15 Jan 2023 04:53:08 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:07 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:48 +0100
Message-Id: <20230115125253.280257-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPQzlDSfYWMhjHCHNxDY+x/a3b1tcxWeg+Mbjs+1TmM=;
 b=NKnwrPVpCTNIMVZGVkImlhZO5qYh+wBSzh07kgyZ3tTqMGVU64xvy6YaoslHkQ5m2l
 9tax0RfFfT/UdbbzE5qxdwqkTYFV7KoB6BgDOsF/Hvk6eC/c1SJ8zMeheGBrV9f3vmjj
 vpqmN5U/As4OYATU7DjFwdrFGJTaFR5kFr/bp7Ph3rgadow8eaiPYgVBj66UAxiMolOY
 CNQPjaIS41bmDSZd6Fnp76pH66QsYO7HYqyvc24J7aqznVeyh0mYGEQ9EeuQaDbYiKUL
 OUxxV97xtBgxWolLHI7qUu1jszaGkakOuGg2YD0c5leES94fnovPGRl3IpBWeq+M2kH8
 fQWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NKnwrPVp
Subject: [Buildroot] [PATCH 3/7] package/skeleton-init-systemd: force
 permissions for buildroot runtime dirs
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A previous commit introduced /run/.br and /tmp/.br and a few
subdirectories.
Add a tmpfile to ensure the existance, ownership and permissions.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/skeleton-init-systemd/00-buildroot.conf        | 7 +++++++
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 package/skeleton-init-systemd/00-buildroot.conf

diff --git a/package/skeleton-init-systemd/00-buildroot.conf b/package/skeleton-init-systemd/00-buildroot.conf
new file mode 100644
index 0000000000..a4c7bf0576
--- /dev/null
+++ b/package/skeleton-init-systemd/00-buildroot.conf
@@ -0,0 +1,7 @@
+# Create buildroot API directories and fix permissions
+
+d /run/.br 0755 root root -
+d /tmp/.br 0755 root root -
+
+z /run/.br/bnd 0700 root root -
+z /run/.br/ovl 0700 root root -
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index ad529cddf6..f431ec4612 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -91,6 +91,7 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	ln -s ../run $(TARGET_DIR)/var/run
 	# prevent install scripts to create var/lock as directory
 	ln -s ../run/lock $(TARGET_DIR)/var/lock
+	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/00-buildroot.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/00-buildroot.conf
 	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
