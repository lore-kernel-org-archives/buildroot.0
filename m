Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C7C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 14:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AFC60F13;
	Sun,  3 Dec 2023 14:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AFC60F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrj_pGNMFVqp; Sun,  3 Dec 2023 14:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 377F760B98;
	Sun,  3 Dec 2023 14:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 377F760B98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F17E1BF47D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4449F40298
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4449F40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2AjXuSI00eD for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 14:15:25 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1056440192
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 14:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1056440192
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3333074512bso1215190f8f.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 06:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701612922; x=1702217722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SKnB9du88erlfjcD4aCU35b6hvFakeueQKsOuj4LnM=;
 b=gXZy3zOBblPfZT8zn+EpqZgtcnRS0DWWX1XzdPObZAeTsBapV68G5Atxyv5Fpm0uQy
 6IGqUqG1gzqYiK1QgXR0lqSpOyqy+5Bcuea3JyFYWlp/RhmEcBfyvyVvQaUZZgb/x1ph
 2zfV/0cXTrVIzeGcCPPvy9/BjOQLH+5lWWTu/jaLyIxxBOf8lteKbZMNVTOfniYU+pUv
 tG9hkd605xX6Wytd9Zxei4TQIqqdcX7WrkYk/ZhuxT9fpyekOFYw8ddZSH6OkZTFGrZn
 oW6zYO60F8UnwL6bLeaHZUByNgYkivRLO1xuV4nXRSCeiXb3v6BA1gdVljETjgr5YUFh
 MAcQ==
X-Gm-Message-State: AOJu0Yzdo8aGTsZVSGrkoaKD7UHxOGXKqN22Ykj40vtwaMB/wiI737LV
 5c17RfENPs55/3JJ9GS8qHjdKzH5xeg=
X-Google-Smtp-Source: AGHT+IF3hmrUizE7vIw6OZMyNpdT7bBCa1KXnpv/x2e5YWVvie9pO9L1cUuNllo4waoDfBA55Sb+cw==
X-Received: by 2002:a05:600c:4711:b0:40b:5e26:237a with SMTP id
 v17-20020a05600c471100b0040b5e26237amr2191259wmo.43.1701612921957; 
 Sun, 03 Dec 2023 06:15:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 13-20020a056000156d00b00333483b468dsm970883wrz.88.2023.12.03.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 06:15:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 15:15:18 +0100
Message-ID: <20231203141518.1402915-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701612922; x=1702217722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3SKnB9du88erlfjcD4aCU35b6hvFakeueQKsOuj4LnM=;
 b=C12x50MYD0XQs2Eyl48QO3wJyFZHu6SfnW0nJO3vaVZX4EuKQamX4xGrn8m1JHmMj6
 0+X3HbJ3QqOOa3cY7wGBuXbT5cmWIFqw7QluPduKkPioPhMW8ZXWyOa5aKlc30jfh4KD
 PymlIi0N6dzs0x1N6p+3SMVLBU+P7bzx8XYrdQb3HuV9SCRSaTTzVZUuvUr1I2xhsn/4
 NM371EkImVnorZ2W50oXiS3zSaxMwNBkflYApCmbqOiMbKmpX0vnS7yxxo2r6GgH2IjA
 xFEOvmrG6lTJCmfDz5aBvaUhUGpOQ80ABf5XrHrTkCkteFdwjCruQzlIrfgNZvwSjGIZ
 6JFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C12x50MY
Subject: [Buildroot] [PATCH 1/1] package/speechd: fix NLS build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following NLS build failure raised since the addition of the
package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../src/common/.libs/libcommon.a(libcommon_la-i18n.o): undefined reference to symbol 'libintl_bindtextdomain'

Fixes:
 - http://autobuild.buildroot.org/results/8ab13cf474d732c95a1da65592d950b24b3d474b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speechd/speechd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index c68d466116..7d50f88c1d 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,8 +12,11 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_AUTOPOINT = YES
-SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
-SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
+SPEECHD_DEPENDENCIES = \
+	host-pkgconf dotconf libglib2 libsndfile $(TARGET_NLS_DEPENDENCIES)
+SPEECHD_CONF_ENV = \
+	ac_cv_prog_HELP2MAN="" \
+	LIBS=$(TARGET_NLS_LIBS)
 SPEECHD_CONF_OPTS = \
 	--disable-python \
 	--without-espeak \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
