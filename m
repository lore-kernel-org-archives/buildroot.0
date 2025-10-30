Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB65CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5AF361568;
	Thu, 30 Oct 2025 21:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnV4Te__xU_E; Thu, 30 Oct 2025 21:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E24966155F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24966155F;
	Thu, 30 Oct 2025 21:42:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FB62A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BB8484405
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19ZW37wGzooB for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 067C984404
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067C984404
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 067C984404
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D367EA4C5B41
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 22:41:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41906)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEaP6-000000004EC-3EHy
 for buildroot@buildroot.org; Thu, 30 Oct 2025 21:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 22:41:54 +0100
Message-ID: <20251030214156.1307743-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030214156.1307743-1-bernd@kuhls.net>
References: <20251030214156.1307743-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761860516;
 bh=qGuT/O89zRlL4dI0QQpiday/WpXQ+A3aoshXAo3pMrY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=kBAH8rI0J7XXwsnKufGkraE/iKA+QeujPGHxI0lXFQjm7ta5mFBzb4EfRrffUZLre
 zNAuzxOgq/Qetq9UDYqoQfFfdKdD8Lt/YriwkF460qf+Kx75UJf6knuonr6xs+YdKV
 +p46UcpmVtmLBtKLt/kkJw5S8WuXMzyDnAvuiD4YqVsQcHBbimc7mhq/sT+AaoodlH
 edZgGnX1J1B5qDm9xacxb/87tDIqquZqPL7HXy9xfOJbGPrNZdKAwXizq08hshDHfS
 AXjcVBI11p1GfK0hquBhulzkYj9/C3eLSG+kP9iJvATVdVSlciUjad9LzfvK/d+cAO
 q2DmgZHPRQ1XA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kBAH8rI0
Subject: [Buildroot] [PATCH 3/5] package/bind: enable parallel builds
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

Buildroot commit e4749b826c04cda213768332f67ffb82f06105b2 disabled
parallel builds back in 2016. Nearly 10 years and a "Complete rewrite
[of] the BIND 9 build system" later

https://gitlab.isc.org/isc-projects/bind9/-/commit/978c7b2e89aa37a7ddfe2f6b6ba12ce73dd04528

we enable parallel builds again, make -j1000 finished without problems.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d137245ef9..64cf2fa9fb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,8 +7,6 @@
 BIND_VERSION = 9.18.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
-# bind does not support parallel builds.
-BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
