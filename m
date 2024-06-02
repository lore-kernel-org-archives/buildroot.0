Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FAC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 16:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F6B82222;
	Sun,  2 Jun 2024 16:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3DdIE41OJv5; Sun,  2 Jun 2024 16:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7AC8088A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7AC8088A;
	Sun,  2 Jun 2024 16:21:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0724C1BF3A4
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 16:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E54A140199
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 16:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P17hAVDODzLW for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 16:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7519A400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7519A400BB
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7519A400BB
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 16:21:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so2851375f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717345284; x=1717950084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyLwbIXqzMhN4u721Ut2zpeOQz6NUiC4yU/qXLxgAUg=;
 b=X8g9Dyq96dadetMaz+9VAbO2tJmPRyr+9PKlc2GaRJSX6mdjNG1CpI90jLms08RLuS
 Hg8oq3kZFpewJj738950CTnYpEDVvVxGIc7TCuVi4ZpgLH2ZRgcQBsao8DmEHc7/tH+D
 +I7dvUGy57ejaNG6yAJDMFgKkTnaWUKmec6jlgV0Oon61HK7yOtFtagp6KaGQ6m6Ahty
 sZeRAkJe5m0J0IqCj9D5qRrZwljNMsesPTg+Ny7NFlIKw/GlFT3A6xHOC9+v2L+X2KTk
 TJHihlu40bqNOd2YOJjbEQ/LL/6aMxmVYuLwUikX8U4EmaqZR9RdAnpRLwI341HQt0aR
 sLQA==
X-Gm-Message-State: AOJu0YyHjxIqVDzJv73NH5xhW9mXAA8bwApQ6HNUqw2vzwCrlZ473KXI
 YVq9fkmRFX1dAZYR81dfM/ExfzgQFwoZ+SMLu1xsQc10ZrvwXoH7f5gCGQ==
X-Google-Smtp-Source: AGHT+IHbzaM23WYMBQpoVeNjradNj67ezQ5gy0QldO30kgooxISwAdwG076W87Up3GNEVzNouq/GiQ==
X-Received: by 2002:a5d:5086:0:b0:355:1ae:cec8 with SMTP id
 ffacd0b85a97d-35e0f30f0d9mr5164552f8f.55.1717345284044; 
 Sun, 02 Jun 2024 09:21:24 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bba6sm6481293f8f.104.2024.06.02.09.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 09:21:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 18:21:23 +0200
Message-ID: <20240602162123.2513233-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717345284; x=1717950084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=UyLwbIXqzMhN4u721Ut2zpeOQz6NUiC4yU/qXLxgAUg=;
 b=W7BXNVTU5FFKkxIqsjzn0MaFufs7JNmx4q4vP/VYUy35AGEehvZz+9Tt7OA8oJSzHn
 yPGZlvhNX2Na7qksVbkfCRyTzUNthAxy2IHNFQNZ6gn/aONApcADy81D7oRoXMaXvZ5Y
 go9fPkT8M4GUTbOoObGmY8IUkedfYgLLaUGRiCQWE4soo67k2BFkb4owDfRnRqrSQdhQ
 jQnb9ZyaHYAo7aYl2SsYYhDq1lwCviDAqQvj6P9VytSVnAf4eq2Vw6ff5ZJafcj0S4Mm
 zxV89PyDpSIgEnruOUaPqlWUF95TPd3M86o9TWbvog3HlIjYppgZF3dqOmZC06I3OGSz
 khdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W7BXNVTU
Subject: [Buildroot] [PATCH] package/qt5base: fix download
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since qt5base was last bumped in 8ab4a0a348b2 (package/qt5: bump packages
to latest kde submodule versions), the hash for the downloaded tarball
has changed:

    $ make qt5base-source
    [...]
    ERROR: expected: 935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d
    ERROR: got     : 3067c4d84ba9927bfe65bf606c17af082199e0a3b22781fbf9bc6c6bc3de26dd

We know the hash was good back when 8ab4a0a348b2 was applied, because
the tarball has been cached on sources.buildroot.org with the expected
hash:

    $ curl 'https://sources.buildroot.net/qt5base/qtbase-da6e958319e95fe564d3b30c931492dd666bfaff.tar.bz2' 2>/dev/null |sha256sum -
    935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d  -

But now, the archive generated by the KDE gorge (Gitlab underneath) has
another hash (as seen above). This means that the KDE forge (Gitlab) has
changed the way it generates archives. So, what's the delta? It turns
out that the only changes are about CRLF that were present in the
original archive, and are no longer in the new one. It is to be noted
that the affected files do not have CRLFS in the repository. It further
turns out that the archive was previously generated with .gitattibutes
of the main branch ('dev' in Qt repositories), while now they are
generated with the .gitattibutes of the commit for which they are
generated.

Switch to using the git download method for really reproducible
archives...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.hash | 2 +-
 package/qt5/qt5base/qt5base.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index ffc474f49e..77b88fa909 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d  qtbase-da6e958319e95fe564d3b30c931492dd666bfaff.tar.bz2
+sha256  9219c8e5d82b32b351743fb548f248400f3b3eca9db37a43b2b8c929d2625c01  qt5base-da6e958319e95fe564d3b30c931492dd666bfaff-git4.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e173639cca..bbab9b3de1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 QT5BASE_VERSION = da6e958319e95fe564d3b30c931492dd666bfaff
-QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
-QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
+QT5BASE_SITE = $(QT5_SITE)/qtbase
+QT5BASE_SITE_METHOD = git
 QT5BASE_CPE_ID_VENDOR = qt
 QT5BASE_CPE_ID_PRODUCT = qt
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
