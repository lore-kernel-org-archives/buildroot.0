Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE48C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 17:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25D1440C02;
	Wed, 23 Nov 2022 17:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D1440C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViHT8wEN5Ucq; Wed, 23 Nov 2022 17:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6208040585;
	Wed, 23 Nov 2022 17:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6208040585
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 484BB1BF5A5
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 232CC81BBD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 232CC81BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCQlRhJZoHFV for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 17:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3760F81B25
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3760F81B25
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 17:27:58 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id x16so8822660ilm.5
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Z9XSZFspaWwnY4eN0rM2LOUc6s3xM86Otm+vpT7vGQ=;
 b=bVhJcEKK5AdIErLA31Zp6yzd75yt7xSu4fv77sNl3bsQHdRvzEvtL4CNdeNCPlyVTu
 JUqkm7zO9F9DVRrWAM6+cniGzAp+vS9rNy71Y41aUK6J8l92zD7HYA7yDAUUwKEe98Zl
 f989X4jOwTWKAEZSxgXJJeKzIm6iYjbQXJk4tUNIb/ncPq0Po9B7X+9CUwOSlPym1YmZ
 mlbG1E6A5MLw7zkDvw51DB+tAaBFdMmwmuHfWvKqr2qht5oh7y7mDJgrtO4TyJN8qVdz
 wYs0M252tDdToL0UrCPkrfbnXWi9KYnSwOMIMYR4smGll5kcIR9VEXzwVlRo04Xun3y4
 XTTQ==
X-Gm-Message-State: ANoB5pmgE/MeSjeReunZ0nsvoW9x+CKCQgB6Igx+kaKbV9BBzB/LGCDA
 iqQMpHkd2z4jee3O7LP6wGrP0cBBk1NlyQ==
X-Google-Smtp-Source: AA0mqf61bcTnNslaqQjxeXlmbBxmTU5/S1Sg4dRxvpkCdyRAFYjp/ySwk/4JGBmUxt4V41zXGO4UHQ==
X-Received: by 2002:a05:6e02:de9:b0:300:c699:770e with SMTP id
 m9-20020a056e020de900b00300c699770emr4143249ilj.115.1669224476902; 
 Wed, 23 Nov 2022 09:27:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 j5-20020a026305000000b0037508cc0bc2sm6555126jac.12.2022.11.23.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:27:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:27:54 -0700
Message-Id: <20221123172754.2847756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Z9XSZFspaWwnY4eN0rM2LOUc6s3xM86Otm+vpT7vGQ=;
 b=I6n4BJrWrT3V3W3uytcl5HFus1MI6E+pE/E89bX/IvcZDKG6xnwIp/5B8xoWXsfcaL
 77MNsqyRD9DD+TYYP0qzHj1HuXZbBwgHUjnYYFsFW5t3QSp/eM2wy7gcIBsd1bLB1Zsz
 aIxzdEShY5IdkbbtPsM3aiReMjsQYPQPIOXMLs3uSCVRDzqqntfoGpvdGyCl7JkSxHSX
 KpRY7M4MqSQR4WjN4b+OY3T26NWZsrKPr73+Q3mhXLohp5V+8vrwLUH+cQN/MyvoBxXj
 +ph4ObqSFEBarZo9eP1wApAmICDieYDx/NpxRoMp8UpbA19GKEUYTjS2eI2mtwk2+TPg
 DDhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I6n4BJrW
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.64.1
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 2a76f32874..1544bb3897 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.64.0/meson-0.64.0.tar.gz.asc
-sha256  c5e27e091c2a35b9049e152a6535045ebbd057253aeb67856de6ecbb7b917bab  meson-0.64.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.64.1/meson-0.64.1.tar.gz.asc
+sha256  3a8e030c2334f782085f81627062cc6d4a6771edf31e055ffe374f9e6b089ab9  meson-0.64.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 06ca555d12..5aae95973a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.64.0
+MESON_VERSION = 0.64.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
