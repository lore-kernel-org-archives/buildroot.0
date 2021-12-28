Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF39C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 10:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D228360AD9;
	Tue, 28 Dec 2021 10:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFNReyv3D4gB; Tue, 28 Dec 2021 10:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA2460AD5;
	Tue, 28 Dec 2021 10:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98441BF362
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A54F740350
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_PbX-hbOMvO for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 10:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73C88403C8
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 10:22:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q16so37439684wrg.7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBC5szb9zrWvtfiS8z8ap6u2cfPZGyg0wx2Mvl8fCYI=;
 b=TQQgsz0IraPOzc3zT2ePPPebQZImA03oQTTqLIufhC98dtujco9LpIZ5fDPr7tPFp8
 gY5loDA7FPNYsMQOqH1GF9iOYh+PiqqFWIp0Near06CkGv3409YoGJS/QGK3VQx6liVD
 vsZxXquOTfYiQK038OEQ0+CAfMGoI8bNjc7pXvEZGeUxAYrui2XxwDI3pjM9uZ11zX7z
 mK9AOJLnC8kYQIw2WZu7ZzS3kQPZtz6QQSRtoTuG10AxWPZKyC7ZEdK3Sl/OK8OR5MvI
 7WcchihsapMCaKdRFPd/3cjdsEux4eEQKbwqJOA4M4fdlqO2Uk4vGi1VWngwKbdp5qE7
 RWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBC5szb9zrWvtfiS8z8ap6u2cfPZGyg0wx2Mvl8fCYI=;
 b=SUMrmlqWrJu9MqR2nzpIJJwStILX46qZPOg9i48yHINUFAdMjSQK7olCxvWfPmez6b
 1bf5jJZp5QbiGEUcn/MwoRLa0NVay2qrCkUA3d0Z50TISBw8r3YSGGgVJ1wS66ouYusC
 8pG5kbPuY+9K83X9/J3xRZbnoUxJhygwnyNhd7FqeY1JkS+2Dl8F9+7YzCwmPfZ0Kz7l
 tFsku4P7sQ3J+fOExI28UOhiJrDn+yZERbcqxdcbnFvrupoA00eJhH7W4QyGWhSusTR7
 4rk5vUvpAeeSS0TBktvZ3ulJQhrIyCsI0YTj1STx54D2+lPBsdGAug5oJXgenmcld8lh
 KwQA==
X-Gm-Message-State: AOAM532XAL9jhjlvGfBW5HvNixR/3lbOGvGn2LnVQm/A/gBD+B/5zHEe
 jVM8m0m7OYp9wuHrzNNrQ5ESRphqywkCTg==
X-Google-Smtp-Source: ABdhPJxwqirlGEsrDMLu4/dZrIINy4Yi55O+9iz2CLe6JJ4+WqQsMC5g1DvZkcSuBBFVSih9GtXmqg==
X-Received: by 2002:adf:bb11:: with SMTP id r17mr16040830wrg.463.1640686946630; 
 Tue, 28 Dec 2021 02:22:26 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i8sm18635786wmq.4.2021.12.28.02.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 02:22:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 11:21:29 +0100
Message-Id: <20211228102130.3575690-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
References: <20211228102130.3575690-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/glibmm: bump to version 2.68.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 389ee5c369..f0bc7f4e71 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.66/glibmm-2.66.0.sha256sum
-sha256  9e1db7d43d2e2d4dfa2771354e21a69a6beec7c446b711619cf8c779e13a581e  glibmm-2.66.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
+sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 30fbe65f6e..578267c75e 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.66
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
+GLIBMM_VERSION_MAJOR = 2.68
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
