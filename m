Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF18C43217
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 00:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A99760E78;
	Sun, 27 Nov 2022 00:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A99760E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRZYj2jWOqzT; Sun, 27 Nov 2022 00:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CDE60E73;
	Sun, 27 Nov 2022 00:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38CDE60E73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF3111BF4D6
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 00:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2AAB41696
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 00:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AAB41696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqesA5g-4x6m for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 00:21:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D6B41690
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76D6B41690
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 00:21:48 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id p12so7049407plq.4
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 16:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbjVGfQikPd2WJxR0X6Jy7uSn3wig1OMEmdRwLw1oFI=;
 b=Q77rMYVSIFfvo5Ol6vTkyIzMQ242s52stAz6ZsKdJBNuL2KVSuViDxn2V59LCFva8F
 46w5GrciqGtdGsposwwl25gloZYres5dCzv3940np02T+KvTTxYOJCkvutDNN7mNRNIj
 K+jG8gKGPrmEmw3OiCjHJ09qVYBKE5PhDl4pnTLvoYeaQL1UXo8wskheDxBawQwTdHVZ
 5IjUOzNhBCWE74CnDoKRQdp+tdWiWSM2XD4dMntrBlm/ej5GOKr+Cy1h1tHsonUetVz6
 jECNSSHbg2B7oy59kU/Q08/5FImvBZXoY2esnimeYXB79ip4DKe+cJzVbjTtTuzrfa09
 5Y4A==
X-Gm-Message-State: ANoB5plN5Ajrap6vvkuIP+iMhLlyQPFfwAyqFBFNJpUGnNxcMynl8NdW
 2pF0YdAUifIDmeeRuVnQ4N8Lt+NsOpg=
X-Google-Smtp-Source: AA0mqf6TodKmwgBuTgyz7TrqYgafOEnMT8drY+Ka27pT3JZoaoDtUdWNkQNAkB6UqLAqR4OBOVsjRw==
X-Received: by 2002:a17:902:b78b:b0:186:e2c3:91c6 with SMTP id
 e11-20020a170902b78b00b00186e2c391c6mr25044464pls.27.1669508507467; 
 Sat, 26 Nov 2022 16:21:47 -0800 (PST)
Received: from solsona.cg.shawcable.net (S01061033bff6aa32.cg.shawcable.net.
 [174.0.63.53]) by smtp.gmail.com with ESMTPSA id
 x8-20020a17090a2b0800b00212d9a06edcsm4082580pjc.42.2022.11.26.16.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 16:21:46 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 17:21:35 -0700
Message-Id: <20221127002135.12134-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xbjVGfQikPd2WJxR0X6Jy7uSn3wig1OMEmdRwLw1oFI=;
 b=gofLk+UlDMm699w/oBRD3Pw7V6/TcqC/eWwp/+SjZfhPrD88WSNi1luDD9HBZwdnX4
 ior2HpafKsV3nyhn6yKnK50X8NPvwXOKN7LzV6S03rKe+5eNfQA+lk/OoskA4kYhMwco
 pYsePOxRyK2HC6YKVinIQTf0thwq4N72gLp66t61slJBMgZMyFnsOEo+yeQ36UyDQHBa
 MyLSLh2b6fEXB3lR+fiij5ZI5BLHo+epceCnWcR3ysDvjocN2OQgRi+VI43o2gzh/UjE
 JEa8gna5IvoGwWtQWdUFjsVVbNi0hogKv42Gq0pYdiAWasbth3HwhQdiLYM6pI36nedp
 rUKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gofLk+Ul
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.1
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE_FILES changed to LICENSE.txt for version 2.20.1.
Previous versions used COPYING.txt.

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index a490b002b6..937dba13e7 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
-sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
+sha256 78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
+sha256 28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 054e327fac..f859d097ff 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.18
+SDL2_TTF_VERSION = 2.20.1
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-SDL2_TTF_LICENSE_FILES = COPYING.txt
+SDL2_TTF_LICENSE_FILES = LICENSE.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_OPTS = --disable-freetype-builtin --disable-harfbuzz-builtin
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
