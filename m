Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05414C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 18:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EBD824E3;
	Sun, 14 Aug 2022 18:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EBD824E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfiIvU_pKISE; Sun, 14 Aug 2022 18:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6327983EBD;
	Sun, 14 Aug 2022 18:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6327983EBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B05391BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84EBD60E27
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84EBD60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcW0CacEMkzP for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 18:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B1560C00
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7B1560C00
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 18:12:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs25so6776998wrb.2
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=HmhK42u35rjIRYBABZzF+1Lz3EoOFyfH32CiQ39kMTQ=;
 b=YC9B/2r1wL5FQk40RV6CeNxny4UjERDdVuH2Eght6xgE6wG43nS0NKmvO7md2UmZtw
 rp9N6xH36CzpZMmtUwXITP8W/MlB3A+PBUAE7Nq/nyjPfQE9KrTwKsbumHa+2yXTiXDf
 oyF3Q8tLJ7s0CAtBK2uGqS3vZDE8lacpA3AoJjMw0TjRiLLYa3zGyaWXEYMQeEzl6se5
 c3b6Ujw1QRI4QOR2tGWY2SxjS/GjtofIhKlAqH5QXOH+cJ8210vuPRspxbN4cpyNuq7m
 M3o/aIqLmw9kSm+UpOtINeHQl1SzVWs8OGxjY8ipzWVrFW8C5oMF8/U8iQrL6QXAeJEc
 +Bww==
X-Gm-Message-State: ACgBeo3H//ZvvDYJAbBmmBU2waY/mL791R0WajeGrYuiIKttPS992i2K
 xzqL4d4q28GFSnlZdxfvlwwD6nhP1LU=
X-Google-Smtp-Source: AA6agR7Rf1rC4XmrZfM4s6RoJIzswU1z7AQ+PXs9s9JHLueiwPn7dSYwxL7wPN0gwfujkRZ8zyOBLQ==
X-Received: by 2002:adf:e5ca:0:b0:21f:15f2:9894 with SMTP id
 a10-20020adfe5ca000000b0021f15f29894mr7061443wrn.115.1660500758672; 
 Sun, 14 Aug 2022 11:12:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0007ba281157de2184.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7ba:2811:57de:2184])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d52cf000000b0021f73c66198sm5149808wrv.1.2022.08.14.11.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 11:12:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:12:34 +0200
Message-Id: <20220814181234.2873747-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=HmhK42u35rjIRYBABZzF+1Lz3EoOFyfH32CiQ39kMTQ=;
 b=OW9lp0YNlSSzDQga1gvuWZ0Bc2Ud0TNJCqiYJCgH7vsUSvCamIYNx10TuY1rdTa5Bi
 IfqG3Ebvef3aPcHSPVy9v4zuE1hBb3Uz1RMI6FzAz2B2HXd0StlFfh8MpXPZT8jf+Qgm
 P2E/X9czfcKto2NszDeb6KHVXf5ZqxzeuNt+IV7aCRDed3NhPVlNsDPWj/h4Jru/141d
 IgSjLpu8oF2D4laZj8v/qUrkqSaY/cfjd0RPCGhk6Qi2HBHTR7XnTFklCca4eZKhz3tU
 vwMciNPYg6a4PhWb1fh33SSnCD7Fgp0a8h3RmhNTTSIumpF8i2n2JlGgCjqpOiog5Qug
 Icyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OW9lp0YN
Subject: [Buildroot] [PATCH v2,1/1] package/jose: disable man pages
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

Disable man pages to avoid the following build failure if a non-working
a2x is found on the system raised since bump to version 11 in commit
b72b849ad597810823ecf9efe471a40e2427c8e8:

/usr/bin/a2x -f manpage -D /nvmedata/autobuild/instance-23/output-1/build/jose-11/build /nvmedata/autobuild/instance-23/output-1/build/jose-11/doc/man/jose.1.adoc
/nvmedata/autobuild/instance-23/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')

Fixes:
 - http://autobuild.buildroot.org/results/ae69f7fd1258d99a5b08eeb8c67904be53eabf15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix typo: false -> true

 ...dd-option-to-skip-building-man-pages.patch | 65 +++++++++++++++++++
 package/jose/jose.mk                          |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/jose/0002-man-add-option-to-skip-building-man-pages.patch

diff --git a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
new file mode 100644
index 0000000000..d9963d2504
--- /dev/null
+++ b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
@@ -0,0 +1,65 @@
+From 506132d3edc8d062f65fdacf007a15613d27e5c5 Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cotequeiroz@gmail.com>
+Date: Wed, 6 Apr 2022 09:49:48 -0300
+Subject: [PATCH] man: add option to skip building man pages
+
+Add a 'skip_manpages' option to meson, so that man pages do not get
+built.
+
+Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
+[Retrieved from:
+https://github.com/latchset/jose/pull/115/commits/506132d3edc8d062f65fdacf007a15613d27e5c5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 24 +++++++++++++-----------
+ meson_options.txt |  1 +
+ 2 files changed, 14 insertions(+), 11 deletions(-)
+ create mode 100644 meson_options.txt
+
+diff --git a/meson.build b/meson.build
+index 1edfbe7..9b40efb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -37,7 +37,6 @@ zlib = dependency('zlib')
+ threads = dependency('threads')
+ jansson = dependency('jansson', version: '>=2.10')
+ libcrypto = dependency('libcrypto', version: '>=1.0.2')
+-a2x = find_program('a2x', required: false)
+ 
+ mans = []
+ 
+@@ -63,14 +62,17 @@ pkg.generate(
+   requires: 'jansson',
+ )
+ 
+-if a2x.found()
+-  foreach m : mans
+-    custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
+-      command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
+-      install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
+-      install: true
+-    )
+-  endforeach
+-else
+-  warning('Will not build man pages due to missing dependencies!')
++if not get_option('skip_manpages')
++  a2x = find_program('a2x', required: false)
++  if a2x.found()
++    foreach m : mans
++      custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
++        command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
++        install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
++        install: true
++      )
++    endforeach
++  else
++    warning('Will not build man pages due to missing dependencies!')
++  endif
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+new file mode 100644
+index 0000000..0885515
+--- /dev/null
++++ b/meson_options.txt
+@@ -0,0 +1 @@
++option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 8a60e20cc6..723ebe8bb9 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -11,5 +11,6 @@ JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
+JOSE_CONF_OPTS = -Dskip_manpages=true
 
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
