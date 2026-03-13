Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D4107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5009D40F09;
	Fri, 13 Mar 2026 21:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7C34yfd6CfpH; Fri, 13 Mar 2026 21:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7C540EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438694;
	bh=TQDKPC8GZbBfnzmtbTrxWzXH9IVT0lMcfALSKMTlIvQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AjY+yEbsIwBlZ0sumNVsNQGXIxjyCox8k5zuImt83JoOgEjFEPVVXMrggM3alXpX5
	 CgYHY0nUI93CoyMasab4vED5JTjOT5xVEOXpUJEPGgO74CeBHP7CteX4k61D77Eq4Z
	 6qmiUra/VayEXLCa6nCmpEFMY9Nm7mBm56xa8xPV+f433RDvXL1eTQBtnid9Uq8YBT
	 QADE8W1hJ/koDLtYTaHmbkn8lHX4hdXk7DfOoxZz9snG7KzleJmaaCbZ3mnC3/qAa7
	 a08Q+PAY4hKJi0DGl5FqCe5xjSzLuUVR38xmK3xhAZNGD2qj5lYjDVEN09CW9bIsM5
	 bP8erqFi6dpxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7C540EE8;
	Fri, 13 Mar 2026 21:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2338E786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1196160E43
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1X7AgPNOsQk for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E41AE60E4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41AE60E4B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41AE60E4B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 735E219F593;
 Fri, 13 Mar 2026 22:51:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:41 +0100
Message-ID: <20260313215044.2406044-5-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438689;
 bh=L2ierKh/+5g1jVq/CU24wj0sL3E9liTF7OURrcz1Xbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YzP6Nr3wOu1AQ897f1mVx25d2edSuC9QZ3SsIV2m0IiNA9d2C0guBYuTcZyH1uUYB
 pWr1kR7XvV2+iW7lfo8Y13C81geVj8rjQ6m52gh0wPSNnHnx14p1I7xuokwgN8yXHt
 1+dL9/VVPVHF9rV1X88U5jD/vDFg5DrFb18lUJDII55YCGsMKEDKpU311tj7qQMDYi
 F4AYzW1Wc2TexstsFhHP8v3zyboHHGOtQTVkGX2MzVDibUG675qH0KWpQYo3m7Hw5Q
 lFsXVeu9wCfbKcqhmQFlz1zMggkJCGIdeThbv8CqH09RZex9M1jwjIvVbiERs6Wizr
 8OT7mst2o5WHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YzP6Nr3w
Subject: [Buildroot] [PATCH v2 5/7] package/xfsprogs: enable host package
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host mkfs.xfs is needed to create XFS root filesystems
in Buildroot.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in.host          | 1 +
 package/xfsprogs/Config.in.host | 6 ++++++
 package/xfsprogs/xfsprogs.mk    | 8 ++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/xfsprogs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 2160a0f558..b990ce8b14 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -128,6 +128,7 @@ menu "Host utilities"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/xfsprogs/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
diff --git a/package/xfsprogs/Config.in.host b/package/xfsprogs/Config.in.host
new file mode 100644
index 0000000000..f200b766fe
--- /dev/null
+++ b/package/xfsprogs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_XFSPROGS
+	bool "host xfsprogs"
+	help
+	  The XFS file system utilities and libraries
+
+	  https://xfs.wiki.kernel.org
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index ab78f8e2cc..729f4f753f 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -20,6 +20,13 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
+HOST_XFSPROGS_DEPENDENCIES = host-inih host-liburcu host-util-linux
+HOST_XFSPROGS_CONF_OPTS = \
+	--enable-gettext=no \
+	--enable-lib64=no \
+	--enable-libicu=no \
+	--enable-static
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 XFSPROGS_DEPENDENCIES += icu
 XFSPROGS_CONF_OPTS += --enable-libicu
@@ -34,3 +41,4 @@ endif
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
