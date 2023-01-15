Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB1CC46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79EBB410A8;
	Sun, 15 Jan 2023 11:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79EBB410A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7BMES6V3Ws8; Sun, 15 Jan 2023 11:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D508410B7;
	Sun, 15 Jan 2023 11:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D508410B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F19121BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD30840640
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD30840640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLkpI7kTvt4U for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E5B400A4
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4E5B400A4
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:49:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id 18so37207484edw.7
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 03:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBOXZrdBwPxCKpciOlrQypAASLz9BopI/HG10WCMKTI=;
 b=R6yHp6ifSNCCXD7sXaF63Y3Sn/kWf41oPM5fIUIK4yHOawZwrjnlpLzPm6y56lSomE
 9gRIT2SZ4LAGLX1y7okY3+9RLBH6J57wmF3wyBi9sEbBOyLcjeMAKKXaop4pWMz0pv9A
 PHhrdOfmPTwTmiNHWbXQBTp8C3wvzqmGVGyRQDN44Ps3SsHZ0r4VJPlskkBwlT6X3Ogd
 5QXphjqhb0Y3GlUyG12ClQLQ2RJDpNOICKunH4Aplg7Nssmnq2/nwJv921ao3awStwLq
 4JwKuz0WU/7Skh1SopCynbZR6KzjWpOrj3uG7NAR0QEmufMW46jNfmowYbBC6x/rHcX5
 m36g==
X-Gm-Message-State: AFqh2kp0jp8Ey+pfUgi7sNXS5n7zO6FfLePBUxcWIcClDdeTESmjL8W3
 QA+UM97MKLULMr3PowssFACQvIb91PQ=
X-Google-Smtp-Source: AMrXdXsZi+0phRW2hWvR+R0Lp4yMlefNLb840zI0VJcMuy+bdb4BM2ohSWlGWzmItaoGEHS/o8mxlw==
X-Received: by 2002:a05:6402:3784:b0:46d:cead:4eab with SMTP id
 et4-20020a056402378400b0046dcead4eabmr77751002edb.6.1673783366061; 
 Sun, 15 Jan 2023 03:49:26 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402150600b0049622a61f8fsm10351880edw.30.2023.01.15.03.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:49:25 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:48:37 +0100
Message-Id: <20230115114840.9027-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115114840.9027-1-nolange79@gmail.com>
References: <20230115114840.9027-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBOXZrdBwPxCKpciOlrQypAASLz9BopI/HG10WCMKTI=;
 b=mVJ+cbHUqOm7boko8M9xRg6tzkwzzdr2rSH9f2Cb0u6E8WTwp3ZLz4t2W/bIFpKima
 9t/fqF7F1YpCKiegMj6QZmRuL/R0E8pzZzGroPsvc2fCQIqDisfb2LAxuKoQlawbhZl+
 nkaLcW8rDFvHJ9/D6/RXR6BVWwJX8wDx6hrxF5Exbv5Qvpb7OqfcKbWqPw94p2Ohv6rX
 T+smH2IHPpXeQuNfYAEfGYJXy4D8pR20ToTFh5M9bfzJi22fAamiXpJE5UQiac5whg6U
 2MSrfDgg+kBKU43Egs9AfD8MlrT4NnYqryNM3wKDIqBVw3Fdr8BdTOnq7UAUySSjJC05
 mQnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mVJ+cbHU
Subject: [Buildroot] [PATCH v8 2/4] package/systemd: Add config option for
 sysupdate feature
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support the new feature added with v251,
requires openssl.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 12 ++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f35305c0be..9278772951 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -481,6 +481,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b0597f9bb4..f49d34d32f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -91,7 +91,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
-	-Dsysupdate=false \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
@@ -489,6 +488,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
