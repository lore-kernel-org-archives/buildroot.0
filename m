Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34392CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94BB80E67;
	Sun, 15 Oct 2023 21:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C94BB80E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpXb2AgkURQr; Sun, 15 Oct 2023 21:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF72A80E3A;
	Sun, 15 Oct 2023 21:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF72A80E3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D92C1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26139408EB
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26139408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7D8IyN1h33U6 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 21:00:33 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A3DC408E9
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 21:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3DC408E9
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-405417465aaso37897055e9.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 14:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697403631; x=1698008431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1259FVoM1PkB7dgxfVcV/9yWr+cv20djrdJRG1TEW4=;
 b=I5xtHSdM4hQQrAsixQOI9qZMMh+jKWFC8CEVdzTFndnnDhXTqMHIA9RGU/MPeMYVIK
 iYh4pfj+51TDoRnxf6t/Ctno4MLgShrwM8s0aYnGynkbbGOe4xpDboYDc6FeoLMwIzvV
 IGaUQthlp3bh8gJ7S5T+gP8v5WftkXS69QdEFpbeoqXfuVtRx1nLNgBF30lYaiRdkKyE
 NkBuCv0CmayR9iqbTeFMscvJgcQn9S2uxJe+jIvFaRQXg7kbTrmZabQYitljMok+08L/
 cbavNQOuS2zEam7slzDB9jSK3/K9c5wCYT1zu0jdwIOEct0KuFNxWtsDuN5vX6N1aG5Z
 86vw==
X-Gm-Message-State: AOJu0YwI1KhhQgA1hoIIhzHImHOuGHkFvg+51VkNS5yXwW7Mxnd0TtJS
 X7eRTf8uHNKBdOyQzImDCew5qktccT0=
X-Google-Smtp-Source: AGHT+IFfHKLke2AV6g8jZPlQIHySRfro4AY9q2ATiFzydhiiZo82a13KeQJXgDcLRdAzcD7QuKoJEw==
X-Received: by 2002:a05:600c:220b:b0:406:4242:e7df with SMTP id
 z11-20020a05600c220b00b004064242e7dfmr29265910wml.35.1697403631155; 
 Sun, 15 Oct 2023 14:00:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c4e8c00b0040772934b12sm5478314wmq.7.2023.10.15.14.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 14:00:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 23:00:27 +0200
Message-ID: <20231015210027.1587075-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697403631; x=1698008431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n1259FVoM1PkB7dgxfVcV/9yWr+cv20djrdJRG1TEW4=;
 b=mk3d2E4TNkv0YlOa5HgItgLJ1fZuHezbB+urfXpARtSnktQsaLcb1blMhY6kkLBKSd
 JRq0qfoPYqeNVu70JHzdZQ03Lkest7dUIo8/dj4eq8AY+JHSDpA7MIsPtfHzGnqBGJDZ
 QJsy7ITEUQ3ijy/GYUUFaRj60fX8uQR284GEN86kLDsDVn534t32INxzlBNO5mqnFMZ2
 /Xg+hETSLqCHEwwNhFa81mAeZ1LzkuaeK+GBdlG3uj5J8aQlne2kviAxw5p8xTu623k/
 +z6qz/WzL7V4AwZVc0gJ0yz8ELWuEu5atkKswYHIS6QEfpkzy5Px3MpN6wBM656ebel3
 9KzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mk3d2E4T
Subject: [Buildroot] [PATCH 1/1] package/monit: fix build without SSP
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix build without SSP raised since bump to version 5.33.0 in commit
8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

configure:10524: checking for pthread_create in -lpthread
configure:10547: /home/thomas/autobuild/instance-1/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -static -Wextra -fstack-protector-all -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpthread   >&5
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared

[...]

checking for pthread_create in -lpthread... no
configure: error: POSIX thread library is required

Fixes:
 - http://autobuild.buildroot.org/results/ce0f9f62d60f801b03a079135941424ad147cf45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index f9d6617a54..4766ce3d9e 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -18,6 +18,7 @@ MONIT_AUTORECONF = YES
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
 	libmonit_cv_vsnprintf_c99_conformant=yes \
+	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	ac_cv_ipv6=yes
 
 MONIT_CONF_OPTS += \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
