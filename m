Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F94C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A5A60EBC
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3A5A60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6637940111;
	Wed, 11 Aug 2021 11:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqjLgbK_0wEK; Wed, 11 Aug 2021 11:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF30E402E8;
	Wed, 11 Aug 2021 11:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 076781BF30A
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA8704048C
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px-V9xy12Mmf for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 11:12:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 247F74022B
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=ojAuTV6gMKBAU2NpowZAjTqOdfvYLS9c7/qmNQh0tas=; 
 b=qC4HV7qyTzVdlLbIawbhhjOAd1c+x+UAd/LRASN3i+Am/41mzNup2XLtwIM5IfA1IysFdo1GQXeM9reaxluVuSCRiZSftRwVFyUYQnUt5/t1qzzO4taOxpJjLCMhbY3CyK3in8YhCh6RueYGjyRn+KmbAcnkutpX/HuvjJ6VshlOpAAnoudNYWQZPBo1ca755ERTufpo3kRGy71+Hi6COQ1S0ws/iCsIeGBpFrTeEgSsnipCBgGUjQ4tic3iDL/DeQZ4BWzAm1hwD+5Kl5MokrYR5uidtCUrP6Jxlu4cxmWDc9ZxkAMioo/gQ5GsSuqlXF4T18G3P3CZGXoC5XHnHQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mDm9e-0007YR-47; Wed, 11 Aug 2021 13:12:14 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7fe7a21b;
 Wed, 11 Aug 2021 11:11:58 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 14:11:56 +0300
Message-Id: <20210811111158.2577789-2-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811111158.2577789-1-aperez@igalia.com>
References: <20210811111158.2577789-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/wayland-protocols: bump to version
 1.21
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to version 1.21, which is required by newer wlroots releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 321fc62de5..fd6b9925eb 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041269.html
-md5  b0836533a3f2dc6585b1dae00341157f  wayland-protocols-1.20.tar.xz
-sha1  e78c739a3a85477ed524b81e8bb75efe7f8bf4df  wayland-protocols-1.20.tar.xz
-sha256  9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7  wayland-protocols-1.20.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041815.html
+md5  8196416baac07cd833bcb86b69da41a7  wayland-protocols-1.21.tar.xz
+sha1  6e0e2a05edb43d32e3b2e3f681ef266a287a186e  wayland-protocols-1.21.tar.xz
+sha256  b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5  wayland-protocols-1.21.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 84028b97d5..3d7a0e472d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.20
+WAYLAND_PROTOCOLS_VERSION = 1.21
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
