Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1597EDE9AD
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B31040172;
	Tue, 10 Sep 2024 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYmFdOS9c_Te; Tue, 10 Sep 2024 19:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408EF40182
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 408EF40182;
	Tue, 10 Sep 2024 19:36:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527C61BF288
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DB89608AD
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuxLWv53ds3n for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 19:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D99360720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D99360720
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D99360720
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 19:36:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82a109bc459so5791239f.1
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 12:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725997016; x=1726601816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MdZQYfBbcvVtUfcZu55GFZxCJnr02Xva642viUJsvvU=;
 b=lR6spjH3/OzJNappl1x/rLoIETdM04qsERhY8rw1WbUVd51LV8P6vUw2laS927LAgY
 nmpu6Jls81KcC2IbOZLtpTHhsDWbglo0+x3Wt87SyG8V3BGRnXuXFxMbcO+2zN0ai29z
 jm5zzcVzbYxs0NemVdcbc4a/arQeYwg1rVJYYIaSvdtLnknyqAg2sLLFLZLrDn9lH4x6
 UDm8QgNXLJuLI54t8Ejj88jrcAmR8cLjO+B0uoDROmbXXcfEHoX1peSLb5c9JLVBmWLh
 /4Ov1o7a9D1mkPKg0KBnSvrn1euxPRFqBdeG1hdafCCfWszXvgUplJPRZx34vSUVRLNB
 YlBw==
X-Gm-Message-State: AOJu0Ywnt/lZcTsL7LDUynrHjtIyK+IcsFzFWcvtyDId4XaEJ6Zyb2m3
 0JvmmZQzMNmbN0KvuJOdsvOumxWSI0kn5DnesrVLMwLKFfM9rvd/p1ixog==
X-Google-Smtp-Source: AGHT+IGoI/gSMQQeXLQxXs4mqQvB26n6gxpPCHRZb1IBD3jgw5i2PK7F9fLFaPoP6GWcyCzq8jx1XQ==
X-Received: by 2002:a05:6e02:1d88:b0:39f:5def:a23d with SMTP id
 e9e14a558f8ab-3a074c1d7e5mr4612835ab.5.1725997015572; 
 Tue, 10 Sep 2024 12:36:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d1e96adc6asm1202388173.15.2024.09.10.12.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 12:36:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 13:36:41 -0600
Message-Id: <20240910193641.1711056-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725997016; x=1726601816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MdZQYfBbcvVtUfcZu55GFZxCJnr02Xva642viUJsvvU=;
 b=es2oUPL5TKuoXxx/j9xNYsoP0nU/u3rNkQNketLvfSLk95tUdCKnjv/iRRFKiyXzUN
 P/GeD5FjFHSgiq7KN/b5tSoU/c6uhT9uDotCOhgy1lSxBB/d/wCOwuIusa1FaNjauZL2
 a9TGp2j8mMpvUlNv2y5Nq/H3Fg2yCGtoTgR0EXqCnnd7cEW+I4ImpVvcNPjom7FRjNMg
 EPI1p9A1nGkSACV+mw11C5HUDNo0cpT9bzO2ZQvhdlCSgHXKt8tIWm27l1+nwKmEw33r
 5iLDKc1gf2mHPipf93A+6F7d96/ANmUpsY+rCNCkfoOu4tncBZwv2KPpPMJEzyiYdXwO
 2kSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=es2oUPL5
Subject: [Buildroot] [PATCH 1/1] package/systemd: link host systemd
 utilities statically
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
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes it less likely that we will run into missing library
errors when running host systemd utilities and lets us remove the
HOST_SYSTEMD_FIX_RPATH hack.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../fakeroot_tmpfiles.sh                      |  2 +-
 .../skeleton-init-systemd.mk                  |  2 +-
 package/systemd/systemd.mk                    | 30 +++++++------------
 3 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
index 9498638f0b..5381750500 100755
--- a/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
+++ b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
@@ -25,7 +25,7 @@
 # [1] - https://github.com/systemd/systemd/pull/16187
 
 [ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
-    HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
+    HOST_SYSTEMD_TMPFILES=systemd-tmpfiles.standalone
 
 [ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
     { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index b312fe33e4..cd51ce209a 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -80,7 +80,7 @@ endif  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 ifeq ($(BR2_INIT_SYSTEMD_POPULATE_TMPFILES),y)
 define SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
-	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles.standalone \
 		$(SKELETON_INIT_SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5dca8681bc..9a18d91533 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -899,6 +899,17 @@ endef
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
+	-Dlink-udev-shared=false \
+	-Dlink-executor-shared=false \
+	-Dlink-systemctl-shared=false \
+	-Dlink-networkd-shared=false \
+	-Dlink-timesyncd-shared=false \
+	-Dlink-journalctl-shared=false \
+	-Dlink-boot-shared=false \
+	-Dlink-portabled-shared=false \
+	-Dstatic-libsystemd=true \
+	-Dstatic-libudev=true \
+	-Dstandalone-binaries=true \
 	--prefix=/usr \
 	--libdir=lib \
 	--sysconfdir=/etc \
@@ -1022,24 +1033,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
-# Fix RPATH After installation
-# * systemd provides a install_rpath instruction to meson because the binaries
-#   need to link with libsystemd which is not in a standard path
-# * meson can only replace the RPATH, not append to it
-# * the original rpath is thus lost.
-# * the original path had been tweaked by buildroot via LDFLAGS to add
-#   $(HOST_DIR)/lib
-# * thus re-tweak rpath after the installation for all binaries that need it
-HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
-
-define HOST_SYSTEMD_FIX_RPATH
-	for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
-		[ -e $$f ] || continue; \
-		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
-		|| exit 1; \
-	done
-endef
-HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
-
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
