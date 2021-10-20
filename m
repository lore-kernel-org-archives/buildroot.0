Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AD3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF4D60FE8
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF4D60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0754076F;
	Wed, 20 Oct 2021 17:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5too3UkJjtSn; Wed, 20 Oct 2021 17:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C13440757;
	Wed, 20 Oct 2021 17:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA701BF94D
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 17:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA9E40757
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 17:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IX7EZI46EBK for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 17:30:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E904740628
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 17:30:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u18so8126wrg.5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ErPYAuPevsCd1c/pz1P831W/ChU/Q10Fd1DtLcU5Nk=;
 b=aOBaTFy6Kh15KLt3X8KDIv8G31tfnOEbxQZq2QzTWU6DykX7X+iDXhPQ9sTjDsLxzZ
 Rg4CEHEAFFbeMZ57wJNmSEPEbqWmjwXoYhJ13mZj0B+4S656JPTdBQPuhj/VqRPi7Ci1
 Tdf1A5EAyZ0RiW/QVy0XrbD4BL13KFCviYMKDOA38zxUD6BqjM/1NAHKl5+jPsaxo0Ul
 SLpu24Rue0dMchpc4A5YP+CP6ysfGmDmO4zJASU96xnWeXfk1nzOwF8ZKQykiLTY/x5c
 0JUVq2lbXk497GVveUIZmN2CwXTMdTTYffGJf/wjk0meiZ8S4rUbakcnpGIZSeq36ZXD
 blJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ErPYAuPevsCd1c/pz1P831W/ChU/Q10Fd1DtLcU5Nk=;
 b=KoOXmSq43aVNHs8FWZtcLnc6k0VFdv9O2IntY0WsHzCMYE0ouMxeVkSq2nZNDIUSuv
 z37FOI7BR5KblqDywG/9b7f9tIrPZb/qK6siFimqu5jMWTfLgNUVs0Kgr3Rv9llYqkOq
 EVaJcy3OlQ8R/zvmvgPs6ByGeajVUPdfy0P0d7culaM/XD9eV+ySH7860QIQGjU8rg1J
 B3ufyEYbJnxW97u1/7vHmMNwtO1VE6meNu/mGm3f94PkxILDnf2OeRAy4V9itrpIA1R0
 kFn1HLtx9zuCGfOduTm98Sbqys3zWE7Z6GiXa9u6nnYG2pilBFHmzKFdKaruNknocQGY
 2/uw==
X-Gm-Message-State: AOAM5313Sv1UY+cpa7d5mNoiE6NGv9+60rWD6vsUiUIeA9n7ZFTbBPv5
 YbloDyzuV2lnvBCWqtE3ciCbBKwx1Y8=
X-Google-Smtp-Source: ABdhPJyqTwi4z5WsD2SL3p/euY5QCbWDxh1OFk/Kmd9GhWOpSg2gJuTaVKg2KgB9IZCXd/io+EuNkA==
X-Received: by 2002:adf:9147:: with SMTP id j65mr678484wrj.163.1634751049878; 
 Wed, 20 Oct 2021 10:30:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i8sm2510084wrv.47.2021.10.20.10.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:30:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 19:29:17 +0200
Message-Id: <20211020172917.3136578-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix media-session without
 alsa
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure of media-session without alsa raised
since bump to version 0.3.38 in commit
22cccbd771b859f4a127e28575b360daf36cb4f7 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e46a30562ff21d70215d0efc77496a9d7f587542:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/media-session/pipewire-media-session.p/alsa-endpoint.c.o: in function `spa_pod_builder_add':
alsa-endpoint.c:(.text+0x11e4): undefined reference to `snd_card_get_name'

Fixes:
 - http://autobuild.buildroot.org/results/dbc2971f5bb89fc10334d14d6f349cfae2d069d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dia-session-meson.build-add-alsa_dep.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/pipewire/0002-src-media-session-meson.build-add-alsa_dep.patch

diff --git a/package/pipewire/0002-src-media-session-meson.build-add-alsa_dep.patch b/package/pipewire/0002-src-media-session-meson.build-add-alsa_dep.patch
new file mode 100644
index 0000000000..d911bb2940
--- /dev/null
+++ b/package/pipewire/0002-src-media-session-meson.build-add-alsa_dep.patch
@@ -0,0 +1,42 @@
+From c643b6abbbebe8a0b8992b4403aab854e476673d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 20 Oct 2021 19:24:50 +0200
+Subject: [PATCH] src/media-session/meson.build: add alsa_dep
+
+Fix the following build failure of media-session raised since version
+0.3.38 and
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e46a30562ff21d70215d0efc77496a9d7f587542
+with -Dalsa=disabled because alsa_dep is overrwritten to false by
+spa/meson.build:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/media-session/pipewire-media-session.p/alsa-endpoint.c.o: in function `spa_pod_builder_add':
+alsa-endpoint.c:(.text+0x11e4): undefined reference to `snd_card_get_name'
+
+This patch is not upstreamable as media-session moved to its own
+project:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/1bced6b2ef300acce23c0daaeb8f4fc14095f330
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dbc2971f5bb89fc10334d14d6f349cfae2d069d3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable (media-session moved to its own
+project)]
+---
+ src/media-session/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/media-session/meson.build b/src/media-session/meson.build
+index ff83f34fc..549b58288 100644
+--- a/src/media-session/meson.build
++++ b/src/media-session/meson.build
+@@ -1,5 +1,6 @@
+ media_session_sources = []
+ if get_option('session-managers').contains('media-session')
++  alsa_dep = dependency('alsa', version : '>=1.1.7', required: get_option('pipewire-alsa'))
+   sm_logind_src = []
+   sm_logind_dep = []
+   if systemd.found() and systemd_dep.found()
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
