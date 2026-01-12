Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5BD25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A21480843;
	Mon, 12 Jan 2026 08:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_zKHno1BCL4; Mon, 12 Jan 2026 08:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B620D808A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205938;
	bh=TVRD9Uc0BSAYzUskDuz/hM9jfaqKuEdgfE4/knm43wM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWLULey2XhbDQLy0omQtQ7EA3PJrtgngieVyJGs1y8yUcQgTVRHYtBdNOUQgOVidf
	 5ZZEfP8l+T4OTq/3xO9ZmvaxJii/ExLnmkTz13VzMl6WjASroIVTjpD8q+HN8gzaoC
	 6o7l3LqbrEZFyYysxXxCgcUJQVbNb7Valibh21bWwnwboX3hAHbZ1ar0Tjv/ZoD4Qr
	 u/I5HezoYjhJMdPfkrDfB8bf5QIUuIxaMWaU8wzs8gWAKH9w6UWbaJQZvADL9SpNKK
	 HRe3Rc2ERlPV6lh9SdX1SecoZuI79q7O33TDd6zBxUzWfZ/SftCMYOWyD8LomIgAbM
	 9PB/yLvNJ25wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B620D808A4;
	Mon, 12 Jan 2026 08:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2791D12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 199914031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvuM0KLgh1R7 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06AB54013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06AB54013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06AB54013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7BCAA4C3FBA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-01w1
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:57 +0100
Message-ID: <20260112080419.2516889-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205143;
 bh=xgtxAO2ofwPRh8Xk8H3pIIEHW/zplenBfOChecet1AQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=sxRRvN5XlcnKCuxE9T/Hwj9FVXDUVxjQCkiVpIRCI96/D+Cec8CEgKbR2PppI3IhL
 tPcMfbpb3cC8ptYVJlgYBbt2y3lD2WLBd/rnHg8bI74gdKYDF0lyhv7nxWBqFCr6/b
 LzlBfSMscFiT5XEbf5ggiA1xX7BdJgVFuOw3ERkXAa4wHYlrjuM6QPsOHr3QKePLQy
 EXydG6WJvPL+UtC68PecKF0zOheWazG5CqQKzcTyIUvitWg63sO6FZZbk8p7cG+P78
 easLAUoTVIWJrZx1Jqpx3RcJ/j+xbvgoKk/dizsS1JSoPhjCbKCb/6zSuwwyMEJTPt
 D3brzbHRfVjpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sxRRvN5X
Subject: [Buildroot] [PATCH 022/104] package/x11r7/xapp_xdpyinfo: bump
 version to 1.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2025-July/003616.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash | 6 +++---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index b0afdc15ac..70f78d612d 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003388.html
-sha256  a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b  xdpyinfo-1.3.4.tar.xz
-sha512  9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12  xdpyinfo-1.3.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003616.html
+sha256  dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638cab3e530ff081a48b6  xdpyinfo-1.4.0.tar.xz
+sha512  478dd3de58950eeca213a51820445e62a5a63b2fa9ff3505f22802a7980f855fc11f1465e57ff4c34cdf8df0a0ff3c576804ef44f11f3b52c1c9da4ecc5a62d3  xdpyinfo-1.4.0.tar.xz
 # Locally computed
 sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index a198fc44c3..7d6ce7a9c6 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.4
+XAPP_XDPYINFO_VERSION = 1.4.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.xz
 XAPP_XDPYINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
