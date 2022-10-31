Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FD3FA373D
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 01:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4C860AC4;
	Mon, 31 Oct 2022 01:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A4C860AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhSSoFEcfmCd; Mon, 31 Oct 2022 01:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7011A60590;
	Mon, 31 Oct 2022 01:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7011A60590
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEE2A1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 01:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A757860590
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 01:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A757860590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYB1NDB3CXJn for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 01:09:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A622600C7
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A622600C7
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 01:09:08 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h18so5582878ilq.9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GeabeiTEHLb4saI5Y9hpYNWNqb0Lka7snjn0gV/wTWE=;
 b=TZktELmiTLrVA/43tgT1a7vhEeMUHdhxfoGVzGgUldye1/E+UAg5FGMavynmonvZ9y
 mjwWA83qNPWRXOPCDbZeTbEjUg9lR+huBnH/kuxY7OjSvOFz6CE0xoJ+s4LnrdUpxQ0q
 6raujIIL8ARP18IFrUu2OzJve0HqYOdwj1jqua/3zWfmdEXIhXgLCp1c0KiK7zP/UXzi
 Mr1cHe1SNY4ae8FMwJjRX+Y+2bvP9dbRUYRcONeahEjFhjaYVHtHrwhY3AcS7BurjOVP
 DdAa9C5+OWyGZ/7svipYe1pz9hutO7FjhtXoK+c13NjxfsSLN4W0wLnrCEA7yUaW2srf
 kO6g==
X-Gm-Message-State: ACrzQf3uRhxCXJXPrpcJq+LlSBYZKWK/S68jJlpEhHG27J01weuKqDJA
 jIAGxohp/XxKlueSt8lDYC2c28KsAmuqtw==
X-Google-Smtp-Source: AMsMyM5L4lrTuM+vCcu9OHGOLeAsQWn0B7wr1FQBLqq4cBG5xUKRXXpZEEGO8+rBBOx6cFTStxKWpQ==
X-Received: by 2002:a92:730c:0:b0:2f5:7dd7:45f7 with SMTP id
 o12-20020a92730c000000b002f57dd745f7mr5484867ilc.12.1667178546845; 
 Sun, 30 Oct 2022 18:09:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o131-20020a022289000000b0036332a07adcsm2175657jao.173.2022.10.30.18.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 18:09:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 19:09:04 -0600
Message-Id: <20221031010904.1109541-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GeabeiTEHLb4saI5Y9hpYNWNqb0Lka7snjn0gV/wTWE=;
 b=Xuph6n2FYcb3DwX+/d8pZ7cz5ngMoBcwCYKkacCQ9IXW0z2cmOKKI0Rh4oBl+VtYjO
 4Yzt46WZcoLKBq+iCpryRJaSr50JwtrsMp1Bad5uUKjytMl0MqQAHArwYJEdY//5Pued
 dM3gGUy9CJfkCcnnSg1YgiA8JzIOpIvqxCHACVsNZ1LkTElh+LcHRbNqg1tJJcdX18mt
 1F1nU+xk9lh8h1igfzCj9n25CMktwpsk0hS6DoaqneNwiPrsSVRKsUTJZZiq8IsAyHHj
 tu4VHyixlP9gREw+qOH/QjUdXksXEgu1dUp7i3aEzwl0YEx6/0WiqnXx9hDodCzjnotL
 q9YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xuph6n2F
Subject: [Buildroot] [PATCH 1/1] package/iwd: set dbus busdir
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
dependency, as such we also need to set --with-dbus-busdir which would
otherwise be pulled via pkg-config.

Fixes:
checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 002988cf33..e53ae595d7 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -17,7 +17,8 @@ IWD_CONF_OPTS = \
 	--disable-manual-pages \
 	--enable-external-ell \
 	--enable-dbus-policy \
-	--with-dbus-datadir=/usr/share
+	--with-dbus-datadir=/usr/share \
+	--with-dbus-busdir=/usr/share/dbus-1/system-services
 IWD_DEPENDENCIES = ell
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
