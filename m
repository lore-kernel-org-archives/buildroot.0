Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D299C5B543
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 06:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F8F60A60;
	Sun,  1 Jun 2025 06:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdNTXL5tJRCJ; Sun,  1 Jun 2025 06:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25CBE60A62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CBE60A62;
	Sun,  1 Jun 2025 06:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D00222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 06:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B9C60A62
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 06:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1K2kLxAZk9UP for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 06:58:44 +0000 (UTC)
X-Greylist: delayed 314 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 01 Jun 2025 06:58:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F54C60A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F54C60A60
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.230.68.37;
 helo=mail-out-01.as48500.net; envelope-from=ciro04@incmail.it;
 receiver=<UNKNOWN> 
Received: from mail-out-01.as48500.net (smtp-out1.as48500.net [94.230.68.37])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F54C60A60
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 06:58:44 +0000 (UTC)
Received: from webmailng.irpinianetcom.it (inc-pub.as48500.net [94.230.68.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: ciro04@incmail.it)
 by mail-out-01.as48500.net (Postfix) with ESMTPSA id 0AA8F3E06DF
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:53:26 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 08:53:26 +0200
From: ciro04@incmail.it
To: buildroot@buildroot.org
Message-ID: <d9229956b9df19ee2f0e987386da78e0@incmail.it>
X-Sender: ciro04@incmail.it
User-Agent: Roundcube Webmail/1.3.8
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=incmail.it
Subject: [Buildroot] Buldroot 2025.02.1 Broken GBM  on xorg modesetting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

im currently try to use Xorg on imx8mp (nxp evk) with D2/3D Accel. using 
modesetting + glamor.

when i try to set up Xorg with modesetting driver i've got this error:

[   198.155] (EE) Failed to load 
/usr/lib/xorg/modules/drivers/modesetting_drv.so: 
/usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: 
gbm_bo_get_plane_count

libgbm is prensent on the system:
# ls -l /usr/lib/libgbm.so*
lrwxrwxrwx    1 root     root            11 May 31  2025 
/usr/lib/libgbm.so -> libgbm.so.1
lrwxrwxrwx    1 root     root            15 May 31  2025 
/usr/lib/libgbm.so.1 -> libgbm.so.1.0.0
-rwxr-xr-x    1 root     root         63600 May 31  2025 
/usr/lib/libgbm.so.1.0.0

on my .config ive got all GBM option enabled:

BR2_PACKAGE_MESA3D_GBM=y
BR2_PACKAGE_PROVIDES_LIBGBM="mesa3d"
BR2_PACKAGE_HAS_LIBGBM=y
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT=y
BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF=y
BR2_PACKAGE_WAFFLE_SUPPORTS_GBM=y


is packages broken?

May Thanks For help
Ciro
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
