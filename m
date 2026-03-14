Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F6D107BCF9
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 06:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 798AF60E88;
	Sat, 14 Mar 2026 06:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mynJ_ah3128Q; Sat, 14 Mar 2026 06:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA0B60EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773469147;
	bh=q2A2UdIkE5UiCa+cneMZfne5AWOCiN+rrR+5FWx+p0c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D94WNdL69Xe8xKhMJgR2l5mTGGP51gortPzmbOhDDwCflSQUJsShZ2a9POcfWKIoJ
	 O7PTgCrpxuCo/tYIIsWTqLimlqxPrLqfEhJcBawwDIYCsFwbWrrLJQiZky6vU/ybCo
	 IPYs3/hgoQnswAFRz6UsQfbs/OBKN60J7Ga0TvdU60Oct/wMLTmcaaq+6luIrq87KE
	 ARnkEDLlBWAB2ul/VQavboCYUKxI3CwSRJPH7iCUfzfeRDlNZht0ReSDvkhLJO3/7I
	 NdF13QnUBti4hY/CpYb1i4CCkpWeicp/v4Pug1BZqW44Q6WcXMwKpNOfvhrFwPMfN7
	 IzKpMVSsT05Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA0B60EDE;
	Sat, 14 Mar 2026 06:19:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C4B786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED05660DEB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qC9MMweYMUPG for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C7A260DF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7A260DF0
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C7A260DF0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6FFF2BDE228B;
 Sat, 14 Mar 2026 07:19:00 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sat, 14 Mar 2026 07:18:35 +0100
Message-ID: <20260314061837.9425-4-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-1-br025@umbiko.net>
References: <20260314061837.9425-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773469140; bh=jJufZMVeTZ+dWFS2RRm1Zpcav9LywGfC82ADxGhqsTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nun7VuTYfvVD0o0v4UjlGMJ8zz1ucUM6H40IupdmQ2bYsSQaEaoM/A9DrSWo+bk3u
 ndbMIsSOMS951eerGfy7QWJXPNTI2/gX3bvzsxE1m1KzcmM4MbUDo2YYzQa9wS+Uto
 rhKCQlGvnRGeXW7Dotsnx4I54vRTPxk7FhBFdlL0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=Nun7VuTY
Subject: [Buildroot] [PATCH 3/3] package/mpd: add missing optional dependency
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

Config.in selects libiconv in certain situations (uClibc with locales
not enabled). This may lead to a build error with utils/test-pkg -p mpd.

Add missing optional dependency and restore sorting order.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c8107be128..ce7c44a9a8 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -26,14 +26,6 @@ MPD_CONF_OPTS = \
 	-Dpipewire=disabled \
 	-Dsnapcast=false
 
-# Zeroconf support depends on libdns_sd from avahi.
-ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
-MPD_DEPENDENCIES += avahi
-MPD_CONF_OPTS += -Dzeroconf=avahi
-else
-MPD_CONF_OPTS += -Dzeroconf=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 MPD_DEPENDENCIES += expat
 MPD_CONF_OPTS += -Dexpat=enabled
@@ -49,6 +41,14 @@ else
 MPD_CONF_OPTS += -Dicu=disabled
 endif
 
+# uClibc w/o locales
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPD_DEPENDENCIES += libiconv
+MPD_CONF_OPTS += -Diconv=enabled
+else
+MPD_CONF_OPTS += -Diconv=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
 MPD_DEPENDENCIES += json-for-modern-cpp
 MPD_CONF_OPTS += -Dnlohmann_json=enabled
@@ -63,6 +63,14 @@ else
 MPD_CONF_OPTS += -Dalsa=disabled
 endif
 
+# Zeroconf support depends on libdns_sd from avahi.
+ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
+MPD_DEPENDENCIES += avahi
+MPD_CONF_OPTS += -Dzeroconf=avahi
+else
+MPD_CONF_OPTS += -Dzeroconf=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
 MPD_CONF_OPTS += -Dao=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
