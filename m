Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A78EC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE4081332;
	Sun, 18 Sep 2022 10:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE4081332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpXwaV7crbFi; Sun, 18 Sep 2022 10:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2F58086A;
	Sun, 18 Sep 2022 10:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2F58086A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45BA11BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E635405A9
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E635405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93WMa_kxXmG7 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127CD4012E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 127CD4012E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:13:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n12so2401174wrx.9
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=43InxnzZwYbzAkvIrpoWpDGZXAZb83nCCs+ANZRSTnU=;
 b=5rJ9NirfuPvp4JiO9+jLAIqkXnWGep4aAbG+cwewJNIfru/lQ6EK+4mtFwewey0nXa
 OlMDoQT0bPgJa4lUpj4GCazQmE1XmF4DxTvyi4UntkpdUuyf1cEGhYwo4qhvjPzVEh2f
 6hZoE57hwtqS8465W4vb0TT8074RzUj4M0biKzgbMYdCZ/enj16QNzSxkeHGku+oN0al
 NCmQjFgTrDZCFMkmWJVs3p4358BjNhCSfkykXlm+TLvx7QEUOzf99HpDCbpUmcIN3muI
 gWcW7gu32MAD2eukY9HSklLvFbQPnnK4ucxlNlKBQlBrhK6zX8dWk4uafHPi5UfA3sql
 +r0Q==
X-Gm-Message-State: ACrzQf1SMd2E5mITczdnw23DJvk1FLQPFcojggn0cf2O1GBzoZ1JLx2P
 4w4EIaSlJxj4qT6udw9z1ulCFVO11SQ=
X-Google-Smtp-Source: AMsMyM48mcwQ36W+bXb1+8Zfd+QVtmZbsnXl2uOeWqhlbyrU3IzyMWgMzzAOhX++P5BAmEYMaAXChw==
X-Received: by 2002:adf:d1e4:0:b0:22a:34a4:79ab with SMTP id
 g4-20020adfd1e4000000b0022a34a479abmr7401915wrd.188.1663496000666; 
 Sun, 18 Sep 2022 03:13:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 y10-20020adff6ca000000b00228cd9f6349sm10020010wrp.106.2022.09.18.03.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 03:13:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:13:17 +0200
Message-Id: <20220918101317.171735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=43InxnzZwYbzAkvIrpoWpDGZXAZb83nCCs+ANZRSTnU=;
 b=gWeFPV2baqtNNUzQrvmNuY89Qxh9MFCHAfSXMnyZL0xPPhHINSUkfjjSojzJHuZnkH
 UsFrgTSA8zAPVTVeebuo2Jau3U0WPrYIzraEy0icPllEAe0SB6WhRUM8HZZ0S75IVFsi
 EH2EtW3ksyYhU8xWXFhaHcHHY1wNGOI/kXz5z+rPwSAATakzp7nx/tUfIdpOV3/Vnl92
 F5uJnl54gPUVGD6OVU49N+2hb6n76XwTzQWz40egiyVr+jLab1wFbifbcjrElW53IgD7
 M3iEDX9F0Id1wBR+Ed4LTAWurnX5+GpxCNwlGrq0KU2eU5mcw6yCReC01XAfFM9PgyON
 c00Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gWeFPV2b
Subject: [Buildroot] [PATCH 1/1] package/libconfuse: fix CVE-2022-40320
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cfg_tilde_expand in confuse.c in libConfuse 3.3 has a heap-based buffer
over-read.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rminated-username-used-with-getpwnam.patch | 43 +++++++++++++++++++
 package/libconfuse/libconfuse.mk              |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch

diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
new file mode 100644
index 0000000000..9ff3f5ec1c
--- /dev/null
+++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
@@ -0,0 +1,43 @@
+From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Fri, 2 Sep 2022 16:12:46 +0200
+Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+[Retrieved (and backported) from:
+https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/confuse.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/confuse.c b/src/confuse.c
+index 6d1fdbd..05566b5 100644
+--- a/src/confuse.c
++++ b/src/confuse.c
+@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
+ 			passwd = getpwuid(geteuid());
+ 			file = filename + 1;
+ 		} else {
+-			/* ~user or ~user/path */
+-			char *user;
++			char *user; /* ~user or ~user/path */
++			size_t len;
+ 
+ 			file = strchr(filename, '/');
+ 			if (file == 0)
+ 				file = filename + strlen(filename);
+ 
+-			user = malloc(file - filename);
++			len = file - filename - 1;
++			user = malloc(len + 1);
+ 			if (!user)
+ 				return NULL;
+ 
+-			strncpy(user, filename + 1, file - filename - 1);
++			strncpy(user, &filename[1], len);
++			user[len] = 0;
+ 			passwd = getpwnam(user);
+ 			free(user);
+ 		}
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 2beb0e4fbf..e7c2ef0a84 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -14,5 +14,8 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
 LIBCONFUSE_CPE_ID_VENDOR = libconfuse_project
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
