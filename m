Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F2BC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 06:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 615A0419B2;
	Sat,  1 Oct 2022 06:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 615A0419B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urLY9rsk9PLT; Sat,  1 Oct 2022 06:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EDC419AE;
	Sat,  1 Oct 2022 06:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19EDC419AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2F01BF5E9
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 06:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7153983FFA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 06:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7153983FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J27_bGtlE4KM for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 06:56:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780D983FF5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 780D983FF5
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 06:56:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m15so8485234edb.13
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 23:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SnW0lOfexqlbpjzEkj+3uoNJd4cN+5fKHOwOqqZgHE8=;
 b=Xg+PbplAywOi4e6D4nGvoTp97vH86TPG3HJp12Z30xnxNlw3GqiYPUuK1QGQEqm3SU
 UekQem20aJxXjvFQWnBFsqcifNH2qb1PqIAU77JtO4kCunNiHiVuYjWILHh7hyO2p2hJ
 30z60vwG9DY/91I2I5rS8tBKi/6DteyRzmoyQmNYzvJ6MsDyi0TyIQTy2otWyyBXLWzE
 Cr4OxKfszhROhPz6+VUgovscP4FcKsve0qrDmEgNUG2lYEE50aBkuwjxek4eotC13YXY
 Fua4iSe5BNCUmv7U/8efAfpV1ej3U1BSiE8XG3C0Y3HOi3qSjSdgkh6TWV5LYpwOanyh
 0drg==
X-Gm-Message-State: ACrzQf2ioPfFNWNvQzP8chriT785e5fqigR9vrtla91XvxF47t/+NwL7
 g3Mry0gZfF+9NrFf3fyFon/P0GiP76M=
X-Google-Smtp-Source: AMsMyM7Jk7Snmk6DH0aSdOUBoVsy5nsdpqisSg1bdhBkEma4p+lAUTsDwRyHBcKxdkDKZzff564+KQ==
X-Received: by 2002:a05:6402:ea0:b0:454:38bf:aa3d with SMTP id
 h32-20020a0564020ea000b0045438bfaa3dmr10667178eda.291.1664607373789; 
 Fri, 30 Sep 2022 23:56:13 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056402090700b0045769dee1fdsm3022599edz.29.2022.09.30.23.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 23:56:12 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Oct 2022 08:56:09 +0200
Message-Id: <20221001065609.28815-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SnW0lOfexqlbpjzEkj+3uoNJd4cN+5fKHOwOqqZgHE8=;
 b=IWTFzg6MBWWeEHVFMGfPOY627IfwjB2+QrxCGcLcS0IoByKLlyaX74q1PgePjTVy2X
 XgNS1buS0nMnWc/ZauYkusMfcI5hbCPWHdk1TgT37JbGvNEHlgl4QUJXCNM2lLNhUp3w
 gEwcV//n3fHIRu/O7tMDPi0MvknAroC38DtwCd6U0nQtVkr4wpN2OMo9Raylj8bo5e8g
 rXCTzYYHqrsPXEddpCZpVBEBXdLBYLYkdp3l1zEY+01V0Wxm1qoMecSzdOLiOS+kMoUD
 EjluRShBGjFH6jjBuUy7wl7/QG3XFPbmfgKx7Uu4BF2W2OCbI+c9vA16pu+5twokzftt
 9gJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IWTFzg6M
Subject: [Buildroot] [PATCH] package/rauc: bump to version 1.8
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes[1] on GitHub for changes.

[1] https://github.com/rauc/rauc/releases/tag/v1.8

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.hash | 5 ++---
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 677d358158..8351d0266e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,3 @@
-# Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
-sha256  8b7d37cc1eb57df4f03de3c943dd7be290b78d47be28881e8b1f070e1d5e55df  rauc-1.7.tar.xz
+# Locally calculated
+sha256  d233247c1763b1c56c851d0adef2094b7aa2fcd72decf524a8ac0419188e0978  rauc-1.8.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 8bfb0b79ba..0c81a6cc35 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.7
+RAUC_VERSION = 1.8
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
