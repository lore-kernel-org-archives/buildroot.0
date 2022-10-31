Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47DECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB76415CB;
	Mon, 31 Oct 2022 17:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB76415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aX4QLD-ZCxcG; Mon, 31 Oct 2022 17:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B291D40919;
	Mon, 31 Oct 2022 17:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B291D40919
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71DD51BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D95860AD8
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D95860AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Fga7lsTiTVy for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:50:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA3A60C1E
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA3A60C1E
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:50:06 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id 7so6556961ilg.11
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=618MTCOtu/bkrj3vtYQ1wyN7+mghLwJptHBVVAzwmFg=;
 b=PT/vWzDS1BUaEGlQwLAb9m0u4deVcquoZ1Z7fbjuU/JY5wZd0G+sC2tS9TZtIZTnZT
 tRH6ZUdOoM2sScryiPEXXO9d8I2FYHqtZjBa9oNHcxHoNpua7s46WNkMTDoStfOcNf/L
 +Rgaih5nJvpxCSnxI4kb9rHk2fsNCUMxCkvHDaGAVnluCA25qq9g9yEMVT4lF8+wNYpG
 +8+jPyMciObQ99sQr6TxXMzOOMsoDzCIUlZm+brzTcCUwbyCnRzehD33p3wsOM+YlL3J
 9rPbhjsPTywiGzYIi5ARxzpi+PxYg+qGdgB8TU4DXUpVrdfV1spZ/qpy9BWbiRQsmjNW
 6mkw==
X-Gm-Message-State: ACrzQf2eWiVifyFIZCpTvoLicKGm82Iq4Dip6oRnFuPTvvldxyLlJZ5c
 KM0KQjaHuB4ddP+sQ6zb5bpXIvR0fPgorQ==
X-Google-Smtp-Source: AMsMyM6Ky4zCJqVr4nwHvBJgP//HrfcHi9oYJN/gssotJAPBP6Wi4VkqISWwsYmtlaSyHeGviIPahg==
X-Received: by 2002:a05:6e02:1aab:b0:2fa:80c2:8375 with SMTP id
 l11-20020a056e021aab00b002fa80c28375mr7543555ilv.72.1667238605522; 
 Mon, 31 Oct 2022 10:50:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y98-20020a02956b000000b003639ef62d08sm2992559jah.84.2022.10.31.10.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:50:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:49:59 -0600
Message-Id: <20221031174959.604094-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=618MTCOtu/bkrj3vtYQ1wyN7+mghLwJptHBVVAzwmFg=;
 b=pZjvbW9lxAqezT4AhaHLCWXpjCb9gzdHvpx3cbS+1SJ5/7Jglr5hA6weL5W6bPOVav
 WKQt6lQO6qiw6ZV7sFoHfX6lXTbgvsHjIqrJ/mBPSe1eFUejHBYHX4ZFw7qXvrj1HvCD
 H41yqGFzqkM8wEGPEZmXHBsXAxla08lTcV1JBxS6ZjJ0w/RO6a/YzEOJLbmHETcrK6Sd
 E6SiKZ1Ulx4IqYM80uOG1J5Jr+etRGgkwFSTW0WHMqo0l1CLdF0tjUhvMZTqGgBFVyqv
 2Z9yvFh7KY/Xzf32XoEsZuYhoR6qMkyV0VwBo8dQiNfBawB1v0jqvgO6dzxDI7WV+SxG
 osgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pZjvbW9l
Subject: [Buildroot] [PATCH v3 1/1] package/iwd: add dbus compile time
 dependency
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
dependency, however we still need it when building with systemd so
that the service directory is available via pkg-config.

In addition we can drop --with-dbus-datadir by unconditionally
requiring dbus as the datadir will then be fetched from pkg-config.

Fixes:
checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - always depend on dbus
Changes v1 -> v2:
  - depend on dbus when depending on systemd
---
 package/iwd/iwd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 002988cf33..5ffbde334e 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -16,9 +16,8 @@ IWD_SELINUX_MODULES = networkmanager
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
 	--enable-external-ell \
-	--enable-dbus-policy \
-	--with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES = ell
+	--enable-dbus-policy
+IWD_DEPENDENCIES = dbus ell
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
