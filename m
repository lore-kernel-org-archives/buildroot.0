Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2AEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1835240AC5;
	Mon,  2 May 2022 20:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGexiiH5nwMi; Mon,  2 May 2022 20:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30A6140AC1;
	Mon,  2 May 2022 20:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB2C1BF2BD
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB5F81CE1
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3uC5NcbmBYg for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 20:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 014CC81CBA
 for <buildroot@busybox.net>; Mon,  2 May 2022 20:12:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id bg25so8822201wmb.4
 for <buildroot@busybox.net>; Mon, 02 May 2022 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UwKLsinUo1+D9OHquyMKc4Hy1rX7XwES21iiECRmleA=;
 b=Ak5ApU43ORJtC/TlW4Ti+uWDAfM804YWetCE/Gm4auyIQjNxU9/Aqt1mj8qJi7c/R/
 ZpDisbxtHQTZy0TWVXZ1RuXrBeO31E7NoF3VrMnC+7xYvX24WprtmFdBOWde1ZvTHSpa
 p9DrW4W4bFpU9GyrbSKhko/yVekVDAKN4z17B1hdUk9oYvMygJ1zeMpdR/XTQ85iT4fW
 kwKPNLijIq03NV3vAn5+ce71/bqHhsqQFk29/l36OxkIaFCh8/nTvsdaxIyxrrG7Kjs1
 RyyAZCMAN+5xG/vZq3t++FihJLxwCVZlLn3q3rrg+VRfKuY5957aHCZi8P+iqhJCa9v6
 pZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UwKLsinUo1+D9OHquyMKc4Hy1rX7XwES21iiECRmleA=;
 b=5dzSt4vT3bbs3asMr8OxF/0csRb00XZ6oyqhBK0IsL/kd1ixPaF6cOi+gi0kRCCU0R
 C5VnUIIKf9A1gsmdS6cEKCgfi266qPnMhby+h/nmHCYdx1yebnUVPsuvTjKh6Mwq5o8A
 b9+HuC0hw1Uhb2MOVyBY+YTrViCi+Aag9Kg0wbfssBGL+lyepNu6q0ZmTY28I6qQkL4N
 andcZ7+4WfiPhBA5BdH8rj4Pz3AKanYKIzYPjqcbpW0tV5yN93zM1vTAchftyxG0xvet
 EHSFC/jEnEcT/wmrVuTcqXBEzDEw0s3aFq5vnUDW2Rz80/xyPEbpV9yNygga9KuWm+dW
 Z81A==
X-Gm-Message-State: AOAM531HmdKyBr5oUmO3RMUMwwhvgSPkzzf1irrNNfOzC0LwOE3DdGpv
 PqwVFVoH4KykcKxQW8eTGRUrvKIQu4Y=
X-Google-Smtp-Source: ABdhPJxWtZ8NVr5eJuROLXijmxgz3qK10aI+CjRbkBNJLQIqjsk5QbHe0TY4nYQ29vu8zx2zE4kE4A==
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id
 y6-20020a7bc186000000b003940bede0cfmr559284wmi.162.1651522345258; 
 Mon, 02 May 2022 13:12:25 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b0038eba413181sm226072wmj.1.2022.05.02.13.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 13:12:24 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 May 2022 22:12:09 +0200
Message-Id: <20220502201209.92316-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.38.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 882cf8564..12a543f00 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4  sqlite-autoconf-3380200.tar.gz
+sha256  61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e  sqlite-autoconf-3380300.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9f88af7ae..3ba120df8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.38.2
-SQLITE_TAR_VERSION = 3380200
+SQLITE_VERSION = 3.38.3
+SQLITE_TAR_VERSION = 3380300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
