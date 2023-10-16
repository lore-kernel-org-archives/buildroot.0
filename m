Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD6CCDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33D7402CE;
	Mon, 16 Oct 2023 20:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33D7402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9Ka_R-zRhsm; Mon, 16 Oct 2023 20:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1089D402D2;
	Mon, 16 Oct 2023 20:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1089D402D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6ED41BF34A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CEE180E90
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CEE180E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4NFyz_FUCgR for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 20:54:57 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 600C280E41
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 600C280E41
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32caaa1c493so4047381f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 13:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697489695; x=1698094495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGVgAynQUvPO9ofZh0Rdrnvfa0Y2+zJnqlxBIy+X96E=;
 b=YdD5WDSW8VJVI7pYl/VeedZzvJNdag+nBT7zXDVSgHn9KVwLQSlt1NxQz+rzRLNU75
 5yswiYeHBXSpNA3e1SyxKCjmheFY+G/vPCu96sTuVVvuA/ZpyIGdSQEwY4dhuCehDq0S
 U+hLwvG3IxTnm4LEAavbRevBVOylpLub6GHN9cdwWJl4UXvEMO6HOa2OPphmXAJUzMJd
 cxzZDrBNquVLEBHKsuNiwHczLOB8+hO5SOrR45ymLG9+X+mzb1+yCfEK32rHscAxqAW/
 YR0HUptnxxYd4feuhAV3rlRV+ChPaB4Ck3hFRu+FQ4iYJ25RocS0ZaC0T3XVS98nJpqq
 fjfg==
X-Gm-Message-State: AOJu0YwFk7QccbyMgs/55vbtTK6SPIyBB2NGwAuWqAWn8JPKeL/EMXyq
 VcjSZzK5u56q8xZ/eg+7moDCW8I2RQs=
X-Google-Smtp-Source: AGHT+IHX90uHKYZrHI4vEcmWRZ2aHwaexghU9wzLHJpqeHxsOYO0DmrDoMw4p/8+fdWgSDytHfcOqw==
X-Received: by 2002:a05:6000:922:b0:32d:b081:ff32 with SMTP id
 cx2-20020a056000092200b0032db081ff32mr381686wrb.38.1697489694685; 
 Mon, 16 Oct 2023 13:54:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d51c2000000b0032da4f70756sm137461wrv.5.2023.10.16.13.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 13:54:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 22:54:34 +0200
Message-ID: <20231016205434.17391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697489695; x=1698094495; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OGVgAynQUvPO9ofZh0Rdrnvfa0Y2+zJnqlxBIy+X96E=;
 b=DwTw24g5nYrJ3veN/oFjTc0E3Zg7Vxk4Nii950w1e9Lq8/UxBsubDRX89L9JlIsDQg
 gTpZ+SCd1ZuxD/QunvfpYAu5U6RQtBmo/GSiBM19qCzeLvV2Hebhud7vw4q780JS8bgi
 xlwH3F28TvHya8osaHpwXVwHFflVaLSvcGJd6VaD/X+pvQiiFAQ7Qbt69v+RJdRM2jPa
 a39quzKUebKgl8CsfmNe//7VbAMQzjsy5sT4AksVwHiI6icGU300O+w20pMQerL/0+I7
 UvRG1z2wQwx1QP/37CqplqZ+O6DnDExG/tqIOrBF8wk6FEMATG3PSF+JAEZm7bvm8eca
 MW1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DwTw24g5
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.3
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
Cc: John Stile <johns@msli.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.2
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...m.c-use-memset-instead-of-explicit_b.patch | 32 +++++++++++++++++++
 package/dhcpcd/dhcpcd.hash                    |  4 +--
 package/dhcpcd/dhcpcd.mk                      |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 package/dhcpcd/0001-compat-arc4random.c-use-memset-instead-of-explicit_b.patch

diff --git a/package/dhcpcd/0001-compat-arc4random.c-use-memset-instead-of-explicit_b.patch b/package/dhcpcd/0001-compat-arc4random.c-use-memset-instead-of-explicit_b.patch
new file mode 100644
index 0000000000..fba859d56d
--- /dev/null
+++ b/package/dhcpcd/0001-compat-arc4random.c-use-memset-instead-of-explicit_b.patch
@@ -0,0 +1,32 @@
+From 57070736a5d00c809e6a3777ab56745ef3e5bf0f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 16 Oct 2023 19:03:41 +0200
+Subject: [PATCH] compat/arc4random.c: use memset instead of explicit_bzero
+ (#252)
+
+Use memset instead of explicit_bzero to avoid the following build
+failure with uclibc-ng since version 10.0.3 and
+https://github.com/NetworkConfiguration/dhcpcd/commit/837d09e34c487edaa92aa2ae71a630d84c927f8e:
+
+/home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../compat/arc4random.o: in function `_rs_stir_if_needed':
+arc4random.c:(.text+0x8cc): undefined reference to `explicit_bzero'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/NetworkConfiguration/dhcpcd/commit/57070736a5d00c809e6a3777ab56745ef3e5bf0f
+---
+ compat/arc4random.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/arc4random.c b/compat/arc4random.c
+index 8f28f616..fdf60527 100644
+--- a/compat/arc4random.c
++++ b/compat/arc4random.c
+@@ -195,7 +195,7 @@ _rs_stir(void)
+ 		_rs_init(rnd, sizeof(rnd));
+ 	else
+ 		_rs_rekey(rnd, sizeof(rnd));
+-	explicit_bzero(rnd, sizeof(rnd));	/* discard source seed */
++	memset(rnd, 0, sizeof(rnd));	/* discard source seed */
+ 
+ 	/* invalidate rs_buf */
+ 	rs->rs_have = 0;
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 88032f05c1..a641208af8 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.1
-sha256  6e9f6a5c47fcd8a763cfa26f1ca6eedf1e534992224a01d6c1ab8abb154af972  dhcpcd-10.0.1.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.3
+sha256  232a3f7ee41f026e644ee8c8468d4baf2d5f37ca91ade442c5a7b4bc81b3cb0f  dhcpcd-10.0.3.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 82efe10ef9..f81c9de40b 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.1
+DHCPCD_VERSION = 10.0.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
