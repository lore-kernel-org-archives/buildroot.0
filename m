Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46844C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF50404D4;
	Mon, 16 Sep 2024 09:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9gQ9rOyuX4L; Mon, 16 Sep 2024 09:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC42640469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC42640469;
	Mon, 16 Sep 2024 09:32:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0231BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D746061F
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRyDkaoz8bAL for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE4D5605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE4D5605CB
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE4D5605CB
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:32:32 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id CC26A1FD0F;
 Mon, 16 Sep 2024 11:32:26 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id A9B9F5F497;
 Mon, 16 Sep 2024 11:27:56 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:31:46 +0200
Message-Id: <20240916093146.2957308-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240916093146.2957308-1-guillaume.chaye@zeetim.com>
References: <20240916093146.2957308-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1726479146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZSOsYAG2SaG4pyjwzBQE5cfCQWP1yQ8Y81k1q3oWm0=;
 b=ClaIDcGKfBbekrFCF9w/J5N8V5s3ECOVXyDmqfl3BHQdVPxVcM5XFt/iPn0WE8zTFCoM2V
 MfUEJcLGY4kdq4zpnjEl4tON3+RyI6k6pF4+LptZOUdABajZfvUsF4yttoeaI3N9Dv0dnr
 dsywi4Xb/QOULi0a87dljkaBQvQpDOAZTdZfjwHldKo4LyC+paEW2YerqJatdy1cH/p+fJ
 QtKUIsL8f6hS9xNYuMSnan/cYiIJlg7tXDyrPvNRpvu5juVgx1lq3w/KodaIUHb1HuZhw1
 8k54HghJMWY0ntKKvaC46ZISfXH1ccfle+ipWtt9FG1GyopJPZqmCdLucXcAUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=ClaIDcGK
Subject: [Buildroot] [PATCHv3 2/2] package/librsvg: Enable gdk-pixbuf,
 so gdk-pixbuf is able to open SVG
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/librsvg/librsvg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 81a6667817..6b9200084b 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -12,7 +12,7 @@ LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = \
 	LIBS=$(TARGET_NLS_LIBS) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
+LIBRSVG_CONF_OPTS = --enable-pixbuf-loader --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
 	$(TARGET_NLS_DEPENDENCIES)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
