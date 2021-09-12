Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFB6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE64361108
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE64361108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63146401E9;
	Sun, 12 Sep 2021 12:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izRtYh1RHr4d; Sun, 12 Sep 2021 12:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F5040247;
	Sun, 12 Sep 2021 12:23:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D81EA1BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D4940247
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDkL9Yhcopy6 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:23:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7899C401E9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:23:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b6so10064378wrh.10
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gr17H+00o0JJ2SLQ4ufcM1MSsls8lpXnetPicp0r0co=;
 b=Q1WEfgWPnprRTt06GHxieo1QSET5P+o2Hs+7riE50S7IvC0OkIl9xRh30+IbSzCwRO
 +L92LhmueE3n1OiWueb5zWd/Cu3lti1O2Yuo/IlXbZzHNKxfjpaZHb2FDXHbfnalCjDP
 tqumrh8uNdSgr+O/x6HXS9pHYHgey88RJBzvoMvzsylVSXm3X4IQ9E3piOIKcSu72PAi
 W5XRzxTYM4SZakyMNWWm8OExKHtv6qGsdXGOcV4pD4BmAu7NydfXrBhBz9exXKiQ+uPF
 SvImTY4qLUOhqFNyaSlilENkeJWA76yT6No2HB9LobtY9m5F+qJgwQGYxj0g6HD9jBjf
 DvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gr17H+00o0JJ2SLQ4ufcM1MSsls8lpXnetPicp0r0co=;
 b=Srk0XGn9p2MtOlbXShX6iAu/OmmUYBjOIeGFVGl88+z4Pfxv05QAJ3Z2K7pdSeyRgY
 8LPki5jUBrlGlwnBV+Wg3rfWKtVK15j04Il7wylcjpTcP6NA3Wfw/4yHlUNY/ajJc37D
 TTmdXkynOIuBq8ukVvxobu8iiq0bcGWv0LvyK+Zul0/gZkb1L6yZ+FUzAIZ7/kGfV5mt
 ijbAAgSvEtMtIJ+7lz2ewMVgrOackumNxR0oyDn+7TQW8FEKRC9hq8nfNgE3wbJxDddZ
 7b/gY6ovfYMJ5uVu8NIr3frREVoOnya5xEU09OIznLZVfThyqx+Wg/Rjoc1mUyUawKUF
 VAaQ==
X-Gm-Message-State: AOAM532ZmeUkJp9dtWyumayetS+EskEA16QYZv/Zn+YNYhnyCG3148zO
 YQRMtsUT01gI5eYdej2J2TTxESnYhH8=
X-Google-Smtp-Source: ABdhPJxUw+QD6rGhwRfH5KHBNgTMACqVZ4dVcY4V9WOLyzLIbwUFt0/5XfLCDaOX/nnKoIjT+L5q2Q==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr4159698wrn.238.1631449380232; 
 Sun, 12 Sep 2021 05:23:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id q10sm3946681wmq.12.2021.09.12.05.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:22:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:22:52 +0200
Message-Id: <20210912122252.1811311-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure which is only raised once on
autobuilders even if pause is defined in glibc since at least 1995 and
https://sourceware.org/git/?p=glibc.git;a=commit;h=28f540f45bbacd939bfd07f213bcad2bf730b1bf
and in bluez5_utils since version 5.5 and
https://github.com/bluez/bluez/commit/caab74c97542a56b591f0b16b44ab6ba4b40f0f5:

profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
 1284 | static bool pause(void *user_data)
      |             ^~~~~
In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
                 from profiles/audio/media.c:21:
/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
  489 | extern int pause (void);
      |            ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c4f/c4fbface34be8815838fd7201621d7a8fddd32c5/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-profiles-audio-media.c-rename-pause.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch

diff --git a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
new file mode 100644
index 0000000000..a7fabc9edd
--- /dev/null
+++ b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
@@ -0,0 +1,52 @@
+From 0bb5785a68a2799db003364770be3764af9b9034 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Sep 2021 13:55:49 +0200
+Subject: [PATCH] profiles/audio/media.c: rename pause
+
+Rename pause to media_player_pause to avoid the following build failure:
+
+profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
+ 1284 | static bool pause(void *user_data)
+      |             ^~~~~
+In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
+                 from profiles/audio/media.c:21:
+/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
+  489 | extern int pause (void);
+      |            ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c4fbface34be8815838fd7201621d7a8fddd32c5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ profiles/audio/media.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/audio/media.c b/profiles/audio/media.c
+index 267722542..f93b74e67 100644
+--- a/profiles/audio/media.c
++++ b/profiles/audio/media.c
+@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
+ 	return media_player_send(mp, "Stop");
+ }
+ 
+-static bool pause(void *user_data)
++static bool media_player_pause(void *user_data)
+ {
+ 	struct media_player *mp = user_data;
+ 
+@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
+ 	.set_volume = set_volume,
+ 	.play = play,
+ 	.stop = stop,
+-	.pause = pause,
++	.pause = media_player_pause,
+ 	.next = next,
+ 	.previous = previous,
+ };
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
