Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A680CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 15:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98DE8812D8;
	Sun,  9 Nov 2025 15:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrCEgb9sViVZ; Sun,  9 Nov 2025 15:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AD781297
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AD781297;
	Sun,  9 Nov 2025 15:32:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC5EFA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6984403B6
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTWuh1VTAXwy for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 15:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E515D4031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E515D4031E
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E515D4031E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:31:59 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b70bee93dc4so298258766b.3
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 07:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762702317; x=1763307117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2mV3aWaNiH9o84tN7tCMYODBBUc4heRPvRQbbLUEx0=;
 b=YTW0W2NK5STq9GFjecaAnI4jO4yJWfiRIyhp6mELKaNVbRiSAn7uHOZ+klEl/f5pTl
 Q5LXwYh8JW7LaxFwpye2DhzjjvIMJJGIxMmqpi/UrqrVGbleXERjkxdZEll9Ty93lBRS
 azzIToeYIxWxupknUypGw7EXtMQu/XN3NugQFwkJdIWce20c6S4edR+4Ti0TgYsSmBPA
 BgtvOueyFzarXcja0JxaFVpF/o7ysh0vE3sdPvLB9a7BYtoMxSK8+xgHJkAlGGKkGg0/
 3QavkRzV/yiJstlTsIGgYjYi8540mxhByrAi7vU9pGcKYpwZE+PbVwSy9FTCWDTgRmOl
 ay9A==
X-Gm-Message-State: AOJu0Yzmg5aEDx+AYSEvKfH1HGxZc9J5ix0G59jYOvk/Rj6jh0rRztpS
 h70RmbqiKDMAZq+WRsAn8FUP1uyDwR6btYfir2YuI0vBReWFlg/AB/93EuqN16SnrxXDBiOGVUg
 W2THx
X-Gm-Gg: ASbGncvQ1WUJyA50TkLnEDgZFSOwtCr4bVkoBTafsUkHXguAy10sn385VOO1llyWqPx
 NBCos1M+E76gGFN/a1LBJdqmPn85I8QXltsoSfKLIC642sml/KwiZ+593C3dS1FSWeLW/Oxm736
 rkRcQlf6M5yFDFOXVfYJzixWE/5cKJQt1ldPPgcb7e0ciI314D1Z+WyXgc2aaNhq8V1Y0iNMoAQ
 qsT0HjsRbXrEcYYwhkXE8wfD1rs9YYnCgvk20UUKEw+JSsM2y6tguokMrkPX29HWWE0rxTVzhbI
 OBxDWIZRRKKWOPl09k9Ajus/yzIDiwIENgdIkWtGu4UNpUeqzw6gx/FKXAOhPJN2OaflZlmJ6J8
 BxkQRUKrfFom0YOjTX9xBsZH4V1SVyTCkQV8lxbFrPAylxPH2jla9zuA+stpCEEweiocD9HTsKm
 EhW9THKddJwmZ7M0/TXynsD2IQ1lf9jPsBG3M9wAeUhbeu0uV2qRjkqnqZZg20fON+y6NfFmUHx
 T367XFt6rS9yUUE1QuxGoGJC8tl9o8+WafQf8HstpdHWkUJKIBu2Jx420BJ
X-Google-Smtp-Source: AGHT+IEqzLwyrwo4bEiTKyTGtE5pZem69h/z5Uc4KtS4xZXo2c2dSs/DH8//nTTyLwW88PrjV71PWA==
X-Received: by 2002:a17:906:6a13:b0:b72:52c2:b8e2 with SMTP id
 a640c23a62f3a-b72e031574amr465851966b.26.1762702317408; 
 Sun, 09 Nov 2025 07:31:57 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-62-211-171-160.retail.telecomitalia.it. [62.211.171.160])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbc95e4sm846123866b.12.2025.11.09.07.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 07:31:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 16:31:54 +0100
Message-ID: <20251109153154.596687-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762702317; x=1763307117;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R2mV3aWaNiH9o84tN7tCMYODBBUc4heRPvRQbbLUEx0=;
 b=Frb/qrA8M38nWcDn/0FScGn7FPkXfGuib8m9GQsL/ASkkqv6njPo1pxbW/IuZnbGBl
 dMaECt1c1wtD8zKJLh2L5ywsoGubL57kQ7KKYpYKPVhqf2O61arC+phQDHPywCplMm+l
 ywKYasHZZbkKduSOQpqA8ku5z2mosQoeHYnkQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Frb/qrA8
Subject: [Buildroot] [PATCH 1/1] package/crudini: bump to version 0.9.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/pixelb/crudini/releases/tag/0.9.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/crudini/crudini.hash | 2 +-
 package/crudini/crudini.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 5b92c0e4da5c..0df91ab1e104 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,4 +1,4 @@
 # from https://pypi.org/project/crudini/#files
-sha256  59ae650f45af82a64afc33eb876909ee0c4888dc4e8711ef59731c1edfda5e24  crudini-0.9.5.tar.gz
+sha256  c2af311a0833857a1449d821a312edc6109f0c2d6d81d76c2d954a76b05e6b14  crudini-0.9.6.tar.gz
 # locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 0f5cfcedd9bc..2f59b025fb89 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.9.5
-CRUDINI_SITE = https://files.pythonhosted.org/packages/32/67/c4e838930e2f434db08d6a6aadffca3d14e7455d1c2c2332e22003ad453d
+CRUDINI_VERSION = 0.9.6
+CRUDINI_SITE = https://files.pythonhosted.org/packages/54/d1/0a363fbbab0aea9e27dd981a602efaf514c45f4fffceac3906274e0425c7
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_DEPENDENCIES = host-python-setuptools-scm
 CRUDINI_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
