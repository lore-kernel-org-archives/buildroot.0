Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F809E9D409
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA0860E20;
	Wed,  4 Feb 2026 16:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CENXBLl4yDEh; Wed,  4 Feb 2026 16:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A5560F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222267;
	bh=D0AUhqdub3Ge4duoQG4JYGjzw9iWSuUludz3mM93Cx0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=fnH2HzwnF8Djw0h5AA9eYbRWTRToIjXPQKRYcd5HeglJOsz+sineSO7T6VE0mKWdw
	 NTseuaSWV+nK5bYTj3/ogdisTLLL/e7jLJcPPfeRRRh0jYN5U1Nv77yCVvUjpUgDXm
	 2Ab9I5dcdcvz5ZvyHOBMVEw1fzoNEoubmLKOhj6zQZneKp/tVQwC/A4V5LbiaNmaGy
	 lVumo6vJAg9nJnHNnaJ0OCdYyN5Lmpkcc8oha3akjmrD7yXPzldymttRieMqWh6KDM
	 +IevYRyEFEpcljC3c1YvDq0ivYmsQOivDkIldHrbxxDtDcZrcHx8ziyAJOxS4vULon
	 8ky+FCNWwa6aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A5560F0A;
	Wed,  4 Feb 2026 16:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F197F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C4BE405B2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAgsFUa9OqeA for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4D66402DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D66402DB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4D66402DB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 55083C24381
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 82F9160705;
 Wed,  4 Feb 2026 16:24:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFC99119A8891; Wed,  4 Feb 2026 17:24:20 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 17:24:10 +0100
Message-ID: <20260204162412.159086-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770222261; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=XnybFu9al8laQ2jN1hfetqsrb3lBLtM59PjI9dGYrTI=;
 b=d8i002rUDBmpojbeX5XBmTQPyrPj8aiHDz8TCarXjbz7GIRxHwI8ofXKF05PpI8tutHdxB
 Lw/aFvpu1nFdx5xQpkRwJcRjnvu7FXT4A1kkiCIBQqjfyEdWsEFh1rVYdh2Y5hGAUksCaa
 CYqsNgQYV87nzs+ZaVxMa9yn+BzLLP2jqtma7N1AA6lpKs8o/cllqlm+sR/3vtmBVJFrcA
 o7YLqAMq+6bWHE5DZC8T6ghFhMtjpNwSUpjmlG+JdhPuqzk/sPSvYY+hk499w0BR1Rjooi
 RY5LgFxeYYK3ymB1OEhn3FDh1hmmTUlNT9M7RWFiXQIDYV3GUUcEjBqoTlc0TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d8i002rU
Subject: [Buildroot] [PATCH 1/2] package/uclibc: rename
 UCLIBC_INSTALL_UTILS_STAGING to UCLIBC_INSTALL_HOST_UTILS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The UCLIBC_INSTALL_UTILS_STAGING is really badly named, as it doesn't
install anything to STAGING_DIR. Instead, it installs the host variant
of ldd and ldconfig into $(HOST_DIR)/bin. Therefore, rename it to
UCLIBC_INSTALL_HOST_UTILS.

This is important as a follow-up commit will re-introduce a
UCLIBC_INSTALL_UTILS_STAGING variable which really installs things
into STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e1cf12fa68..dea5445b16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -463,7 +463,7 @@ endef
 
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
-define UCLIBC_INSTALL_UTILS_STAGING
+define UCLIBC_INSTALL_HOST_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
 	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
@@ -478,7 +478,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
-	$(UCLIBC_INSTALL_UTILS_STAGING)
+	$(UCLIBC_INSTALL_HOST_UTILS)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
