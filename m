Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3628ACD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB1B60EDE;
	Wed,  6 May 2026 18:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEU_bq9v3MAc; Wed,  6 May 2026 18:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591DC60ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092901;
	bh=FJddR2aZ6T0x1DEi8+NdSq/N3uGlcZuJ+DJaTA+RfSc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lO4y5d7xnl3Kv68Q/1YO/TDhLm6a6T61qoNEPu8cJbFwFhQBp38nh5B4FrUNNCbLT
	 4w9udDWKrBYSsco7VTGMeebslKbQZ9ZMAgA4Q6CUA4F4dsFeUtwC8Jh7cuH+sVksnw
	 hiyMFsnxCQJ8mLCxr9QVcCo0wr7V+GifdUlqYjSiBbaCafzMl7T1U+ccIoSOX5t47L
	 GDY0ENcoIw7HDqqDGf0gcyYTmFURseHsCstS8BL2ysp5NqqE//nEyPajUd2Srt6X9V
	 7jSQGyq/KTlqXJQJnIki8c0e/XISvHED8OHOHr8SAQ0MbEXK/jPkCf40E6QpFbzedj
	 UzFO9U9EjuB9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591DC60ECF;
	Wed,  6 May 2026 18:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70CA1317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6065F82C3B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWv0iUtzGe70 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A4C582BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A4C582BED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A4C582BED
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2EE7A4C20BA;
 Wed,  6 May 2026 20:40:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-05Rp;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 20:40:47 +0200
Message-ID: <20260506184057.665854-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092858;
 bh=+BsvQ9WMGRvX8q/QGtpv4NEIqGYZV7RfE2kTeTHDIOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ruT2xV00acCDioVQf5np5D2EmlaWdmAG9tOv+bqeXehNJa4/TNRkrgKJRsfXC3l7y
 O1mFVJbI+0S2zFDMs99Z8c68JkP0rrGR2kyjm5u3SHHScLIn14d3NW1BFQsZKl5T56
 vZ3VvjF6m9gCYGfzXZBxHgSygj1KY+FaWH3KRk9lb7U3oC11fz+HfFehs6ZBu+5F3F
 Aqb33jsVFea8aY1EhysTReuA24OH53gPMO6D9XO5Ac2SCDRqBipglwS+XzD4OsERXP
 XBFKbqmXpwzj4rx6vp+aCj8sGiRX+e29LEtp6B5Crm+z42AiMdDQ9jbEeaghCMxw8p
 +rrBDKKyFrohg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ruT2xV00
Subject: [Buildroot] [PATCH 03/12] package/libudev-zero: provides libudev
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libudev-zero/Config.in       | 8 ++++++++
 package/libudev-zero/libudev-zero.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/libudev-zero/Config.in b/package/libudev-zero/Config.in
index 78263406a4..41f1d762f1 100644
--- a/package/libudev-zero/Config.in
+++ b/package/libudev-zero/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUDEV_ZERO
 	bool "libudev-zero"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  Daemonless replacement for libudev
 
@@ -8,3 +9,10 @@ config BR2_PACKAGE_LIBUDEV_ZERO
 
 comment "libudev-zero needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LIBUDEV_ZERO
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "libudev-zero"
+
+endif # BR2_PACKAGE_LIBUDEV_ZERO
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
index 122ed2b7bf..b987b63cc9 100644
--- a/package/libudev-zero/libudev-zero.mk
+++ b/package/libudev-zero/libudev-zero.mk
@@ -9,6 +9,7 @@ LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
 LIBUDEV_ZERO_LICENSE = ISC
 LIBUDEV_ZERO_LICENSE_FILES = LICENSE
 LIBUDEV_ZERO_INSTALL_STAGING = YES
+LIBUDEV_ZERO_PROVIDES = libudev
 
 define LIBUDEV_ZERO_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
