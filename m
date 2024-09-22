Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA139CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A4D40124;
	Sun, 22 Sep 2024 03:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwPuUP6TsAWl; Sun, 22 Sep 2024 03:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3224052C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3224052C;
	Sun, 22 Sep 2024 03:33:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3FF51BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9253781521
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTUxAaU3yeEl for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8869A814B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8869A814B5
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8869A814B5
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:33:05 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso169615839f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726975984; x=1727580784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BRI4/gVzh6SfgFqmK3FPoLS5Ib4W3yXBi7epdLfEys=;
 b=KTYV4EUqrxJHPzfhTy38O5iHeHOOk4375UiXkSTOhCK/iIWBpIpgc0qwK6tpGPDh7D
 dFX1XzKlPWRYP59MeA2gtIal3K0RI2leBjYh3/viL8L7EJsGdQwjFTwGMfHTRYtbYisd
 VCEoej8PQR/jx+89U6pZwmbznwtyq/yZ1LTmGIhnpWl1FPlxoAWTVCR6b7Br7tjaDzGF
 0ma2sUQZyPg2dTZaQ/ao2+qY4SU6STyVZzn7X02pUHv7LPUnCvIkYCov7Nz8keh6EN5L
 7lnyOEAWPMF+5DYDK37yvCnE5NztdgSfRd6+H5GmNOUwsz+pRPiW7wHHJax3RAHpjcFZ
 5sYQ==
X-Gm-Message-State: AOJu0YxQk2cSYJdybXRxCtg7l+zc6myze4/A35sEaeT5YpiTsobYCq3c
 WV8CoGCqXsJPbvowHCAPxR7G0HUJcUw2+U9zAB6TufPFfKPObumIG1d8ug==
X-Google-Smtp-Source: AGHT+IHYCnIr9kZEBgdh+fDhi+x5+eAxfaAPXLqm+VzuyMoYv57JPC8YxkwW0Is6LN9BTuVUyuKnug==
X-Received: by 2002:a05:6602:60c2:b0:82a:4490:692a with SMTP id
 ca18e2360f4ac-83209d17920mr625376539f.7.1726975984073; 
 Sat, 21 Sep 2024 20:33:04 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49356352sm469155039f.51.2024.09.21.20.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:33:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:33:01 -0600
Message-Id: <20240922033301.845631-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726975984; x=1727580784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6BRI4/gVzh6SfgFqmK3FPoLS5Ib4W3yXBi7epdLfEys=;
 b=PUoNvxo/Ca8jAnL3TecNy2xEve27jhtACkLYrcih2L/kTJrxXK7n2fYbxWYBBArmp9
 tVqT+WdWsSOUmNLCvRGbxFXgrfLxwFtfNEhUyd3gF7+F7GGlDUwceNpCzFp7Gceo1Pwt
 LNh/XRgCy1R3g0Sag02ukrL4mi3yscH48Rh9693lgLX9Ni1f/ivfxZ2QBeUJFzGqDz66
 i9GyuRx94dE7OSjj5u7Jm0rqmV/yDinSurnk5TIQlDz5tr2XjkyM6Maf4/eb00useuU0
 y4IsC6QzJxH8F0JSu3E/pp+jOKhz5A56xtmrnbSjB9BMwup6Vkp6lCgemzh2LfeoXQNv
 4/rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PUoNvxo/
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tempora/python-tempora.hash | 4 ++--
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index ff7093394f..9d3487d67b 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  39314c5843bc3f40f8ce4f5cc340c479  tempora-5.5.0.tar.gz
-sha256  13e4fcc997d0509c3306d6841f03e9381b7e5e46b2bebfae9151af90085f0c26  tempora-5.5.0.tar.gz
+md5  e4ca48a06f4c8b9aa21b8081937353f2  tempora-5.7.0.tar.gz
+sha256  888190a2dbe3255ff26dfa9fcecb25f4d38434c0f1943cd61de98bb41c410c50  tempora-5.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index d1b333ec0a..aeb2e4687c 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.5.0
+PYTHON_TEMPORA_VERSION = 5.7.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c9/dc/97d90b9f64dbe4f599023e19602b33a2cced68462db67a3d4805a77cf784
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/5d/52/b4ff0ca21695a4f8ac0f158d884587b5eba08b0e95356b0ea210e00446ac
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
