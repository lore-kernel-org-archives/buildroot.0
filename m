Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B06C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC569401C8;
	Tue, 25 Jan 2022 17:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXGFnkotvPpE; Tue, 25 Jan 2022 17:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7627401D2;
	Tue, 25 Jan 2022 17:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB4F1BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 008A9813A8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UggWTX2tMfU1 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:35:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3734813A7
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:35:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so2387489wms.3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xia/vAXV4wRbeuMgqy6PmmO5AlM1ttDyTakfeGY5Uzc=;
 b=fuNaX3V+yIdwZiC1SUDlpCXZpaHhn6B3js3lHoAAv52SriUVb39HHad8IMkfbhInpx
 VULUR1uwTXUSLLX0nQot9lHuJb9nwYD1fwGjtCwcg9LniNi30RC4bLiATaES9ac8bQWt
 YZTMwISf7/C9H9Y5RTFwBx17O2sqQxcZg1Qopo1A8tl+6/zJ8hzazAEzNYx9J68ZuRKv
 CdDvc5zpzllcZCVF9jeaWIIoM5GqjqIxQNN7egBXDmNYrDAuih9LKp0yUBmB76+xIZbB
 oz4zvD5ndzZZNYK9nx2LSauzbfTzZDqPCarJubZR3/uC9zUFnRA3vj3AgsrTgxTGMNJw
 bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xia/vAXV4wRbeuMgqy6PmmO5AlM1ttDyTakfeGY5Uzc=;
 b=DW92YfE69C76orwtF6bO6LSqAItI5F7CKvqfS4SZ95hsd/SbvzT/ZRWtBXRnsXj3of
 wappMtKSBjRog3mxNDIqw+yXFvRw1f0DqEN3FCPfzV/cRkoyfdUDDejzFXIhCtBlqhDn
 yGRGBFnaMjC0wgjpGI4ajV9ORwvz0iJcKWtYTU2Z8cipC1U8Wo5gQWMeEUOCtHHrMY9l
 8wmjyBO5u9oFFcTC8J+ZcZddMwoed+EssktEPUGtdb17vVO7xamZZpekYuZzSW5xAebE
 pUOBGIpl42MSWRDQYaZBfPhflyuNj1Fs59tU81HQqM8aRQeMv0/FcXIAmYw+zhRFED4w
 XfpQ==
X-Gm-Message-State: AOAM533CLoweR8Oq6T+nXET4/Zl5scBSSeJpgO07ckRjAK0ll3W68w7A
 sORoXadA4weg3KBeZ3AdTq/hR/J2oIo=
X-Google-Smtp-Source: ABdhPJyWdNP+2ed4iYZrA/Hr4uqj+dpM2x5l1lg/NA2+t+WrMngV+o/x7QBodJJ4goIG4zfqvM1Mhw==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr3909380wmq.81.1643132118020; 
 Tue, 25 Jan 2022 09:35:18 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z3sm1260159wmp.42.2022.01.25.09.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:35:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:33:28 +0100
Message-Id: <20220125173328.3475928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer/gst1-plugins-bad: fix
 build with neon
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

Fix the following build failure raised since bump of neon to version
0.32.2 in commit 029a6dc3e3320984c6369747e0b79060f13b2afc:

../output-1/build/gst1-plugins-bad-1.18.5/ext/neon/meson.build:1:0: ERROR: Invalid version of dependency, need 'neon' ['<= 0.31.99'] found '0.32.2'.

Fixes:
 - http://autobuild.buildroot.org/results/eaf1890176431000ea8b371956f0d2d7e9907aea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-Allow-building-against-neon-0-32-x.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch b/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
new file mode 100644
index 0000000000..e995a8cb91
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
@@ -0,0 +1,29 @@
+From b83e85ab677c79b46f520abebd1ee031e3a139c0 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Sun, 26 Sep 2021 21:34:30 +0200
+Subject: [PATCH] neon: Allow building against neon 0.32.x
+
+No API/ABI changes: https://github.com/notroj/neon/blob/0.32.0/NEWS#L3
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1267>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-plugins-bad/ext/neon/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/neon/meson.build b/ext/neon/meson.build
+index bf49be9111..abd9763649 100644
+--- a/ext/neon/meson.build
++++ b/ext/neon/meson.build
+@@ -1,4 +1,4 @@
+-neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.31.99'],
++neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.32.99'],
+                       required : get_option('neon'))
+ 
+ if neon_dep.found()
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
