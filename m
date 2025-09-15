Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28ECAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 14:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F04C40A1D;
	Mon, 15 Sep 2025 14:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9GAodGQwhkH; Mon, 15 Sep 2025 14:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE7840A1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE7840A1A;
	Mon, 15 Sep 2025 14:35:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F351F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B1AA61071
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5nasfXAhkWk for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 14:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BEC460C2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BEC460C2B
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BEC460C2B
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:35:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62105d21297so8460837a12.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 07:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757946946; x=1758551746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wr1vimT/PLPe8CZJAACqnQsGECxqvGUsVJ474QRmlNw=;
 b=CeupAC163gwMqQjNAnxDuufssEjn7TQxinOyAud+87MaY6WoArZszCFYhVxWGaGgwf
 6aDd7Gw4TwzB0nVpb6GclI+qzatpNtsnL/XqASzUHW6E+N+A5zj1sjEo6powFSTlsPnK
 9WrNLUQ2V/OiXlnKK+q7ZTgVW7sD7xbyIZYEpUjfycWENDbTuS37hfJfBadO4m86g872
 OHSmhd2uIdCFcv9qgcCeY5x5HkotW1ejg1yBoVS6NHhsmla3jTgeZRWC3XJVlMQvWGWC
 ZztRrQUxsDb3i5rpkO6NAnSUIKZOfSr+5Vou3VTLYS2hNXUM/ILE6h9nGk/r57OQiP1n
 0qew==
X-Gm-Message-State: AOJu0Yz2d92r3hExg7ghnex9y8qDQtYUEoujiVF+o91+kxHi4g/GjBn9
 uMrJdRtNJ6H2YQ1yym9TPR8Yd1GhiMiA/PqFJcSyisbq4F8RScH0hoDsMlEbbVgR
X-Gm-Gg: ASbGncs4NUKn3wsufZzhYjm/7gwXl+xDnH8NiYlM0uyTrWSoP5EphdTiScFFvPCf/u7
 ySDqtaZBR11AgedCRjet+KKICwRVdOKW1Kuo/OG4f+Dwk9Ab2SbBWtzTwbl5Etj1m+SoUStBTYN
 Mu5p5S5oX2/DsmSYOq+gF5YbGG4ZWvw9LJ8rLc2DuTS78m9yPoZVSYk/xAui9+v/F3aPmRQL1al
 cZRIbW8y+LjWi+Djs5N7hmvdlN1vnlVop7Jpl73g0ity77SatZCHpHs1wvmh6aRdd9cbZNnwUlC
 uHVeGviLjZ2o91mAZbYtGGV8/t0jgY6P9kTfIWIujwC1oJsCtlhIi1Mtxc2ZZvEmWfCkf5KieJQ
 Kdbz6Gzz0H070qQxxkx6ddH0szwg8ygt/EKee3jZGG7sVYdMjAS2qX/xqtesXNGXEMPh3KMff4s
 +ra9YOOnc5jdtTKy3Ll4oNu6wMJVvKghEcr7IO6JRL0PSSeTn8LLN8U1d9yiXduB9SfXbaiyLb6
 va5cXbYSjkQZBqPJa8wcra8
X-Google-Smtp-Source: AGHT+IF7nP7h9S7ZobjGSIUCraq6OA9qIhFp2RjgS7PIEV8Oi5mPYEwTgdN8hBQ4s9Zwuj3iE/2OaA==
X-Received: by 2002:a05:6402:4302:b0:627:a2dc:811 with SMTP id
 4fb4d7f45d1cf-62ed863f05fmr12553819a12.34.1757946945682; 
 Mon, 15 Sep 2025 07:35:45 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.home
 (2a02-a450-7a0e-0-d307-416a-de81-9106.fixed6.kpn.net.
 [2a02:a450:7a0e:0:d307:416a:de81:9106])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62efe17e03esm5966103a12.47.2025.09.15.07.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:35:45 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Mon, 15 Sep 2025 16:35:42 +0200
Message-ID: <20250915143543.3523471-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757946946; x=1758551746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wr1vimT/PLPe8CZJAACqnQsGECxqvGUsVJ474QRmlNw=;
 b=eYS13QeGKuoPduJuYH5b8MQA33llstIYljc025gKu+Eq8YrHkkif/LPshf4eIGjcA6
 O8xHMjV7nEsQZfDYhP/4R7p9dy3lXK2MNxlq6xeLZbPYt2ltBXHaHba5Ff/PQyeyFc2r
 fO85bA6+kyVrSMSmrbw3vsyRdiQaaU3Ymahb7wFB+hWw8OOUsCPWHKNU0CTDjIZXE41B
 su3HH991jRu8+FQ2Bz2+OjKM7I1TIA6OyIrb4RDJq9c0Fh0raTqjDLGpS4Q3nwTtBY+p
 pvWpqRTSMDGnVEmDjwgLg70uYB8x4+Uu0Yh2C1bmskGIt+DC/syjpzg4f8owEb9adoTs
 pyYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eYS13QeG
Subject: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.10
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
https://github.com/dalance/procs/releases/tag/v0.14.10

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index d79e205231..35f1f6d2f4 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bcb75fd23307581e23c20697edd876a5a231dac25191b9e8166f62e0f82af997  procs-0.14.9-cargo4.tar.gz
+sha256  09f2faee76bad885af50bf2977ea34b64810645a0b781699f8c822311211575e  procs-0.14.10-cargo4.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index b6ada48115..c85c521341 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.9
+PROCS_VERSION = 0.14.10
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
