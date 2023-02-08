Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E4C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CED2340C87;
	Wed,  8 Feb 2023 18:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED2340C87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDkdgW640B2y; Wed,  8 Feb 2023 18:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02B3D40C7B;
	Wed,  8 Feb 2023 18:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02B3D40C7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04DE41BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA5F402C3
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA5F402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpKZT4j8lCGt for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:28:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBD940250
Received: from neutron.kverse.co.uk (neutron.kverse.co.uk [88.97.48.192])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CBD940250
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:28:14 +0000 (UTC)
Received: from dvorak.ensemble.orchestrated-technology.com ([172.16.1.69])
 by tallis.ensemble.orchestrated-technology.com with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <james.kent@orchestrated-technology.com>)
 id 1pPpAy-0000kR-Ft; Wed, 08 Feb 2023 18:28:12 +0000
From: James Kent <james.kent@orchestrated-technology.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 18:27:31 +0000
Message-Id: <20230208182731.15752-1-james.kent@orchestrated-technology.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=orchestrated-technology.com; s=dkim20210630; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPdtHGLFERClj9ZtIrqP9Mj9wfrqVFzzgHp36jN8hvM=; t=1675880895; x=1676744895; 
 b=dOa9ljcR+n4fVle6LzRe+cbEgaekvuiv5K6nYLGMWBPeFBZ/mooYHx07sdC5sRSi9536ZEnyLY4
 CZcRBjeQuKFlp3PDtdREqP40fMiIEY9lO2Nq6xlnW1gIDjlwPFLLHQmmFV5gdKNInp0E1Ythk92E1
 RLYtdLapbULBst/B0Lu+QPY+1nrOpJaYvKfv2RRwEMfQCmdO9x8eAXOEE9k8emP10e5gGPAUVjaf6
 uwtN7F4BsQjT2nvt16XeRq4GMhUhNnNVPKWEmVkAOZ/alA6FeRBYOxBRA166duKzoUZSWxch68dP5
 +WBDnimdZkmPK4Mo8Py51tvcR5fdsKtnStig==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orchestrated-technology.com
 header.i=@orchestrated-technology.com header.a=rsa-sha256
 header.s=dkim20210630 header.b=dOa9ljcR
Subject: [Buildroot] [PATCH v2] package/chrony: add default unprivileged
 user option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Kent <james.kent@orchestrated-technology.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Configurable option to define and enable by default an unprivileged
user which the Chrony daemon will assume once initialised. The
functionality requires libcap which is selected as necessary.

This option supports the good security practice of dropping elevated
privileges for daemon runtime.

The package configuration layout has been updated to current working
practice.

Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
---
 package/chrony/Config.in | 12 +++++++++++-
 package/chrony/chrony.mk |  8 ++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 158dc20530..0ba14c6aef 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -7,10 +7,20 @@ config BR2_PACKAGE_CHRONY
 
 	  http://chrony.tuxfamily.org/
 
+if BR2_PACKAGE_CHRONY
+
 config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	bool "enable debug logging support"
-	depends on BR2_PACKAGE_CHRONY
 	help
 	  Enable support for debug logging output from Chrony when
 	  enabled at runtime. If disabled, code for debug logging will
 	  not be compiled in.
+
+config BR2_PACKAGE_CHRONY_USER
+	bool "chrony default unprivileged user"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Define and enable default unprivileged user for the Chrony
+	  daemon to run as.
+
+endif
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 379e95a778..16f8f082a3 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -21,6 +21,14 @@ CHRONY_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 CHRONY_DEPENDENCIES += libcap
+
+ifeq ($(BR2_PACKAGE_CHRONY_USER),y)
+CHRONY_CONF_OPTS += --with-user=chrony
+define CHRONY_USERS
+	chrony -1 chrony -1 * /run/chrony - - Time daemon
+endef
+endif
+
 else
 CHRONY_CONF_OPTS += --without-libcap
 endif
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
