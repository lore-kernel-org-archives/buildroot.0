Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5CDC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 09:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7839E407AA;
	Sat, 20 Jul 2024 09:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QqqfI3_Xf2B; Sat, 20 Jul 2024 09:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA544088C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA544088C;
	Sat, 20 Jul 2024 09:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 138271BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 014C66072D
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1dsEYRsGks3 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 09:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFE6B6071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE6B6071A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFE6B6071A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 09:52:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-368526b1333so897436f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 02:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721469138; x=1722073938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9pt/49kP2O+PzIBZ5ukmPzTM6zFBI2UW+vaWZmzPus=;
 b=u2SZcOlIUGxdhRKQZTJzAR3pZy8DNT0b3x7HVIs3EHKNC++9Ex7kprjqwJU15jETA/
 QLrjDvce55hsRJGAeTGGzfoo3Zo5xNHkYQVI9XZqrvZNJsRgfJhrT6MNObMgoLO3JhDA
 W6CHyWKP1jmQvVJG3OyH3ysdaqhgqScSfYkB5L21P0Q8T8fOIP6uJzgj/fyZBA0dCSQQ
 lxD7PmUW1WanNqI2nd0KfwfmR9K7KudoRHXDx8SwRQSu0XblzOYmBUTTc2AcVqekOA+1
 dciClZhpDpydN7NiULtv9LSVnWyX5KGd5voBfH7Ftg47DkyPJRjD0gkxdwYwtNYPYzKa
 xkcw==
X-Gm-Message-State: AOJu0YzXitmUhUhy1vK/KUtr6eVBd3Bau73KF+LkzLbma6lCPyVxoiPd
 vRyZQyPbK//pJ3UpWk+yh82XPGdzTOQcGFjNirU3vz3u7AVrOv2gqgwNnQ==
X-Google-Smtp-Source: AGHT+IELIEiVO19eQodOzzamYgp+2aJUVHiNVs5HaEa/c/JGjZJKJoUZ/RwnnNZCqtZP17AZhxsPeg==
X-Received: by 2002:a5d:468b:0:b0:367:8e57:8 with SMTP id
 ffacd0b85a97d-36873f198bdmr3107698f8f.19.1721469137843; 
 Sat, 20 Jul 2024 02:52:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d69013fasm51669325e9.12.2024.07.20.02.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 02:52:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 11:52:13 +0200
Message-ID: <20240720095213.335126-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721469138; x=1722073938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b9pt/49kP2O+PzIBZ5ukmPzTM6zFBI2UW+vaWZmzPus=;
 b=N3byMCrkV3AKt+0LrcCVt63GrbhQLhZLJ0JwIukSTpaFR8Y1237z2zZ9S4CL2Cx5eY
 /oRkVFsuR3ScJKxevml2ghgfYXI8nHhlrMtwCaXar1ut8e5IjFtgm32p2Wzhugvo4YDD
 q1cZiVMqnQZWJ2lpkqAaNhEiXbnLvNzMgj8QrlNoCnVcRhgYCdAudt+5ONU+DMqvjxwZ
 8zuWG/JZ0vI5S4kgGgqAlWW4Dfh/lEd68d9Rl4rMbn5ZbuOaN/pK7aUZUKUwIevnPLYN
 cxGDFXj0mie5xpVz/4tgOp+OhfvBFjdhI6qxSuiHuVWYLiNXnMqF1ppqtZO+l72ioDAy
 KcGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N3byMCrk
Subject: [Buildroot] [PATCH 1/1] package/edid-decode: switch to meson-package
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to meson-package to fix the following build failure raised since
bump to 6f117a8 in commit 4f5790116b42768bd1bd982245e00483440a6311 and
https://git.linuxtv.org/edid-decode.git/commit/?id=cdf81907def8658a66041a76ef2542e9a888cbed:

make[1]: *** No targets specified and no makefile found.  Stop.

Fixes: 4f5790116b42768bd1bd982245e00483440a6311
 - http://autobuild.buildroot.org/results/c569b0484dcd33f6ea88a9b6f11df5b54401db96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/edid-decode/edid-decode.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index be0c4f1a0e..3e1d861f22 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -10,14 +10,4 @@ EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
 
-define EDID_DECODE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11" WARN_FLAGS=
-endef
-
-define EDID_DECODE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
