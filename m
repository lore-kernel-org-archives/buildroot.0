Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0172C106ACCF
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E0B80314;
	Thu, 12 Mar 2026 16:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOt92JbZr7Lq; Thu, 12 Mar 2026 16:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E99238031A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773334566;
	bh=P8a+nnv8c5HfbOZK3dPNTOYnjnPN7YADvu5pJ2ysYgc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=erKfZ6o0v30KXRt+GKEWO6gLnrMDrBWqJxjxoI4DITleiWKOFup0u0i1aFmpNOLNc
	 wODlmhPAeBplkvf52U/KBETL8Toerqg6u2oMO8yRhKKOjxFFPlciHeICxb2qybsNi1
	 n9IQaYGRXlbsJH8jo5JWWzvR+IW4DV4HM/WAGMaQG4J7rlhDiVJPFPlrlGbqpTmubR
	 FeNwdzV6lSCy31nwgpTKkOiQYDsJZtAEamLgG4dwPUPy/e7Dv1ZS+j3vNDua53xIr5
	 UBmpCKFk8TiWbLFmmomBnZ9V6+5WxITCAwVUch02asENobmWzZOag+g5P0zN3yvW5w
	 uwPwRp2CATghg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E99238031A;
	Thu, 12 Mar 2026 16:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C6CC282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5D1C600C9
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQA1IDzYio-Y for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9D4A600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D4A600C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9D4A600C6
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:56:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A04C1A4C0D1B;
 Thu, 12 Mar 2026 17:56:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0jJf-0000000068u-1CWw;
 Thu, 12 Mar 2026 16:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Mar 2026 17:55:18 +0100
Message-ID: <20260312165518.3312453-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312165518.3312453-1-bernd@kuhls.net>
References: <20260312165518.3312453-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773334561;
 bh=uCdFg0oUQu9a8VyWTtyrz4o0Q3Vz76+IBqi7ByvCxK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ou049LowtLd2DUjjay5mAHrT5hv03XV/CjwL1zyyxB9p/KSJ0z4UpQcz36DmeBX3r
 QwH79/39QNyxCKxFFyN9CCvsuMs7+jn6AjL3QCZgFM8ltYm2Q4u/0hfi6gtqT+MBvW
 OqW9txQgq4OClE8eW3DXMDLW7lsSl/bF3pWTmvG/IdDAfxz89Oqw8x+asTkJHxmt8K
 /8pM5TCfHxRH0rxNpmRvJAN+JTZa0o3EPDZhVJZd2M0/y7ut5mAAqmopkmUCsVkNUP
 3X0hpL+j6II/fFVUa5kbeDBr0jBYzlUBJ0Lp6IZCE2v5RnR/BZB2DSs+adMHa4r/vk
 LF/755PUaBdrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ou049Low
Subject: [Buildroot] [PATCH v2 4/4] package/pipewire-media-session: bump
 version to 0.4.3
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

Release notes:
https://gitlab.freedesktop.org/pipewire/media-session/-/tags/0.4.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/pipewire-media-session/pipewire-media-session.hash | 2 +-
 package/pipewire-media-session/pipewire-media-session.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e6b176eea2..3559d3c222 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
+sha256  ea0e371b08f9fa158fb070283b04ce1c4c0a3180d6e89de46c206296918ee1e4  media-session-0.4.3.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index cc7317f925..16e12d9eb3 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.3
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
