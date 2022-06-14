Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA33410AD;
	Tue, 14 Jun 2022 17:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rA2-p35LeGfo; Tue, 14 Jun 2022 17:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E4A409A5;
	Tue, 14 Jun 2022 17:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 802061BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 782F3607F2
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djF_nVwyD80J for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AD486074C
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:38:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id z9so5057914wmf.3
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2sxOqkrRlUS9RpKdu5SNO01bq0nM6ZZnWOTYW8Ghww=;
 b=me/IG3zKL9DC2fx9WWaMz4BSSQhylLdOMUUA9eQciCKPq3l0HFUKVsdSOVxtiQ7mu8
 eo7kNKMtQCysralOFNj7+VS0o4ORUxQ+S9gcGP75QcGgC9R8+PRFAuCLBXmKFOXxO59n
 iHuYfCaun7TQXk9yEaxCFzbAHSKW7EkL+RaNFVYpT/0SWt9Q5je1qT3JWenHmR+/Ik6L
 fOfEhO5zs5yOjF+QFsQvJpIxqtSsKQEJfNIBvfpecHzF1/hY3DL90NtdglrUDSoi2cmP
 RXZvcchrfL9hbdE7nCuWt7kkF5W2oeaDrVED91HX+r7hm99L98XMWBH66SGIWJH9dPRX
 P6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2sxOqkrRlUS9RpKdu5SNO01bq0nM6ZZnWOTYW8Ghww=;
 b=savcWyB1lt6XDI/5Qyr5ik7+BbA9AKPdkQeibsPSSDbh7+7nJvwJXFrriqac8XpWPH
 2ULSUJkGIFiHylTZilZ5/rfQzog/rBcUJxnPpshcONUb7lgzIBiBluusEdonNTk19nBg
 OxrN9Y4IY43ei6cQfGWsay7gr9ZGVv++1un1RMslnASUc/0hb6U3g6jrq9ieaxr/3WwS
 7tdHKCZge0FFkfsuBV04leyKlEgePBjvgpx6nLs/YePSRseNIGQDVONd68L6I021bGMt
 jwPNqnYkpmGr+Y07wKayRlg24XRb6cI1IrC8xPWliuurp2oDWJgYVqVGscK9ICHbEhqu
 3npQ==
X-Gm-Message-State: AOAM5324mHFGvTqCFWn1KVliDMrmOECUVMFCI1mlRyiSF2lAFu2wFjRi
 6Tb33mUt/8vcagTCVob2laI/uzuCcSwRpw==
X-Google-Smtp-Source: ABdhPJwrpDAhpZYtUTlkKv9J0WzJIYqu95nCkQq+/thawHKoRK99/tfhHIwFu2dwOoJc+va0QL9few==
X-Received: by 2002:a7b:cd16:0:b0:39c:4fff:88cc with SMTP id
 f22-20020a7bcd16000000b0039c4fff88ccmr5260724wmj.122.1655228322932; 
 Tue, 14 Jun 2022 10:38:42 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 f187-20020a1c38c4000000b003973ea7e725sm21640889wma.0.2022.06.14.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 10:38:42 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 19:38:35 +0200
Message-Id: <20220614173835.3207-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/slirp: bump to version 4.7.0
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.7.0/CHANGELOG.md
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 326b2ad246..b391462d9b 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
+sha256  9398f0ec5a581d4e1cd6856b88ae83927e458d643788c3391a39e61b75db3d3b  libslirp-v4.7.0.tar.gz
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 43d2c520e9..8017b7a636 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.6.1
-SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
-SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
+SLIRP_VERSION = 4.7.0
+SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.gz
+SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_CPE_ID_VENDOR = libslirp_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
