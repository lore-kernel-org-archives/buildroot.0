Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E6ED25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335C684655;
	Mon, 12 Jan 2026 08:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu2PRUfQ3AFn; Mon, 12 Jan 2026 08:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DBA84619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207475;
	bh=+0xkiDEAyWAqaZO+pOcH7lGZWJX9M1fKXUJieesThnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tn0QLk6cmr1XN6EceDoPzrjvpmf/cUlKWbuHSnZbdu2Vk0Km5/KQhvKWr3kqmkQKI
	 sgQyMm8CdrQkN+rlKv3n6YtzvabOQ956nJVAk1PVXg+hEAS00T3c65LUsJaU0YnWCO
	 g9jg+zTOq/IhmhMeejOLuetchIgx47hPNjoPuaiBRxv6k2CcVHdaeNzdtZjp7eYMQ+
	 4Zbh0O/njfIb2Ko4onVxvuwrxegXhB5o1Gq3AYZN6kIQZMVslA34yiYsvuqwl8cC9/
	 ZirjBDLb3KjMq3+SKSHBUu07QoZnAr70c5fPMOdO9aL/Gb2+HI/RvG6WUJL0nxFhYF
	 3oNJCVaNPcIcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DBA84619;
	Mon, 12 Jan 2026 08:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D08018D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 745014168E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZiQycDudlnJ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D5AC4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5AC4004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D5AC4004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:44:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C839A4C4177
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-1FXs
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:31 +0100
Message-ID: <20260112082950.2528445-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206661;
 bh=JHue+q1ndpv3v4ambYARvp5b3AjiW97oIyfbmnaOZpY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=F32koDBUISswn143Jip6366P4xbSoIvV6wS4RteAo44RLtAPx9R96sd/t2fEO+Nw6
 i56PGSTY3WpSamYdb13Fy7no/BkJdfziejVFU3B9TooiaGoGup8TAixgkazqSWow4T
 FbjNdNqq3oWw1tKT+fvbUtGqmfxVx2KZZ3wSqIlYQIIthAVMpNNiqueM9YPbW81cT0
 h14o7Uw6UL6OQd0O3J+cthaLILOPjvMBFpSpoR1OatVg46y/XCWetMve4G2aQQLJRk
 u4z9KDHkWtGmSEmxYCHzzRzorJ3wkVqjAKlo81Srp4V4ao6lAebtB0WuAok/iAW8Zb
 M6AhWRdmGl3wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=F32koDBU
Subject: [Buildroot] [PATCH 023/102] package/x11r7/xapp_viewres: bump
 version to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2025-May/003604.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 6 +++---
 package/x11r7/xapp_viewres/xapp_viewres.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index a662f4ef2e..a5ff6a7a4b 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003219.html
-sha256  b15a62085b1a10f55ae1cf17b7ded75b72b21be240c68071685db377c4afc628  viewres-1.0.7.tar.xz
-sha512  75878faee001163891adf8472c79b31273f794e23dd775c80b33acdd1ce76df708eb27a49c20f79b7101ad676e1d50d9c857c2e2e0930c6209eeb7af8a11397c  viewres-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003604.html
+sha256  4b221c2b103390b166633612b9abf8036cbbe90605dbd8a37cf2a377fa2b6cd2  viewres-1.0.8.tar.xz
+sha512  3cd5dc23ab1b3289eb1433cf7373cc4edab84ef39166013056d4ffad90bb4f926e7471f7691a4c6bcb81cf6bfd203478a0ae2fb53300e838b1c5d1cc82ff8da0  viewres-1.0.8.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 49933d7af6..98198ec325 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.7
+XAPP_VIEWRES_VERSION = 1.0.8
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.xz
 XAPP_VIEWRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_VIEWRES_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
