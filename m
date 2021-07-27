Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2109C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9299761373
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9299761373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8774F4041A;
	Tue, 27 Jul 2021 12:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGgfmJpIAqG5; Tue, 27 Jul 2021 12:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9C640397;
	Tue, 27 Jul 2021 12:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAF7D1BF9C2
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB5C382C3B
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmBmkaWwEbdu for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 12:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7905382C21
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 12:05:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u15so4036829wmj.1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=obVrZ5PpBRQRLZ5DzmKWJ6fTtEvPTonXPN/0ttWwjnI=;
 b=CJqJ20iPP3p9CZrMzMy3a0V4T/M/pXEKiBlB+NRwIr0hd6zn4ObUgmyvmGQiI/WhRd
 kwUGRGe0n2+FnyN3iXARvFLsQCbM7/iD/fFo5c5e65jo5OKxjYOZ3ZyzGUVN2f7PJLxx
 k7bGGHqthfzBKRKqwbE4ObEumZiEIqqCzMuevEme5H5W3XqPLjwurTZvXYSvaKnlkESf
 +b0eVXhJlWLPMbpnFdF48I9gMwafpuEB4inpI0JGETcIYAMLS3KbqkWJQ2mfj1qAFc5I
 ADtYQf4i1NFjhCigxwaSh4f99ALbEfcwfFh21M9G9phpYuh1PTrE6VN2OLP5HaZ4VT3W
 iqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=obVrZ5PpBRQRLZ5DzmKWJ6fTtEvPTonXPN/0ttWwjnI=;
 b=qKDQxwIbmem6QAgl2/TyLjwv264ib4bWxodRYTdRvVaj5JQcsUaiD3kFL28iCRG+xg
 2MWmdCq1TTbt2wGSmQGIwaVqdFgmgOzbJfhCDdhQetBY1oZdOQ3ihhqIauq4kcZKfKF8
 2AK6FrlnYW9wgsk9wWSrZd3xP+Il5/hTPvymQUxcuqhX2eL6ZAxcvObNcdH5h40LkhOZ
 rQeVTbRO0eVOBR0PFodAs5E5M2P7ls1wdsVgUf7peC6w8GoY+7/XhMHuiBsoSzwzepQa
 MOxvNEjOVl1oxHtoYJixj3tbBjJPKnXQkNVXeoUpnO+8NSQGap9wvfUk+65+KCAqPQSz
 MLzg==
X-Gm-Message-State: AOAM531tfU6g02x28M9JcXkpQFzYT2uCQzNlf7hE5qo6lg/BDgoQChrE
 /CCvdJOYKhy/f/tp7mmVhQxeMw/f5U9bOg==
X-Google-Smtp-Source: ABdhPJzXEoPPR+/ZIVebPmmZKkWYV2fWUP6WuXzeWb5/W8x7mVIPKs3GdC1a8ji6k2O/VxpwEuK/Yw==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr22173580wmq.174.1627387551301; 
 Tue, 27 Jul 2021 05:05:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id b12sm3189141wro.1.2021.07.27.05.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:05:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 14:05:36 +0200
Message-Id: <20210727120536.2807777-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727120536.2807777-1-fontaine.fabrice@gmail.com>
References: <20210727120536.2807777-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/gupnp: bump to version 1.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Drop patch (already in version)
- Update license to LGPL-2.1+:
  https://gitlab.gnome.org/GNOME/gupnp/-/commit/37b22d0a050842d91dc64678518c425b1e2a3451

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.3.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...or-stylesheet-existence-on-doc-build.patch | 73 -------------------
 package/gupnp/gupnp.hash                      |  6 +-
 package/gupnp/gupnp.mk                        |  6 +-
 3 files changed, 6 insertions(+), 79 deletions(-)
 delete mode 100644 package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch

diff --git a/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch b/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
deleted file mode 100644
index 448996da04..0000000000
--- a/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 7ce37c94596029358a67d732a82e4313f7b89135 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sun, 30 May 2021 13:13:00 +0200
-Subject: [PATCH] doc: Check for stylesheet existence on doc build
-
-Checking for xsltproc is not enough
-
-Fixes #17
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gupnp/-/commit/7ce37c94596029358a67d732a82e4313f7b89135]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- doc/meson.build | 34 +++++++++++++++++++++++++---------
- 1 file changed, 25 insertions(+), 9 deletions(-)
-
-diff --git a/doc/meson.build b/doc/meson.build
-index 26c32c9..eb69d07 100644
---- a/doc/meson.build
-+++ b/doc/meson.build
-@@ -30,6 +30,8 @@ endif
- 
- xsltproc = find_program('xsltproc', required: false)
- if xsltproc.found()
-+    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
-+
-     xlstproc_flags = [
-         '--nonet',
-         '--xinclude',
-@@ -45,17 +47,31 @@ if xsltproc.found()
-         xsltproc,
-         xlstproc_flags,
-         '-o', '@OUTPUT@',
--        'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
-+        stylesheet,
-         '@INPUT@'
-     ]
- 
--    custom_target(
--        'man 1 pages',
--        input: 'gupnp-binding-tool.xml',
--        output: 'gupnp-binding-tool-1.2.1',
--        command: xsltproc_args,
--        depend_files : version_xml,
--        install: true,
--        install_dir: join_paths(get_option('mandir'), 'man1')
-+    stylesheet_check = run_command(
-+        [
-+            xsltproc,
-+            xlstproc_flags,
-+            '--noout',
-+            stylesheet,
-+            'gupnp-binding-tool.xml'
-+        ]
-     )
-+    if (stylesheet_check.returncode() == 0)
-+        message('Stylesheet ' + stylesheet + ' available')
-+        custom_target(
-+            'man 1 pages',
-+            input: 'gupnp-binding-tool.xml',
-+            output: 'gupnp-binding-tool-1.2.1',
-+            command: xsltproc_args,
-+            depend_files : version_xml,
-+            install: true,
-+            install_dir: join_paths(get_option('mandir'), 'man1')
-+        )
-+    else
-+        message('Stylesheet ' + stylesheet + ' not found, not building man page')
-+    endif
- endif
--- 
-GitLab
-
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 7064c9f6b8..d7868b99b9 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.6.sha256sum:
-sha256  00b20f1e478a72deac92c34723693a2ac55789ed1e4bb4eed99eb4d62092aafd  gupnp-1.2.6.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.0.sha256sum:
+sha256  df8279293aae45ea6bb6de1b13bf1988285c8f2f4f25569fb0d79325a8471666  gupnp-1.3.0.tar.xz
 
 # Hash for license file:
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 7ec0e6388c..421d12d3d2 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.2
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
+GUPNP_VERSION_MAJOR = 1.3
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
-GUPNP_LICENSE = LGPL-2.0+
+GUPNP_LICENSE = LGPL-2.1+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
