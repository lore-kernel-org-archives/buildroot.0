Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889E9C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1463416B5;
	Sat, 13 Aug 2022 19:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1463416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT_boqAT_8Gs; Sat, 13 Aug 2022 19:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD25F41696;
	Sat, 13 Aug 2022 19:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD25F41696
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7D381BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D2E140122
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2E140122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR34uD5CYGDv for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 19:32:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF14400AF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF14400AF
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 19:32:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bv3so4569987wrb.5
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 12:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pGQJO086hkl90kDP/AcVI6eYx2PXeTrVDdEmRqqnkwQ=;
 b=n+g7eff6K1a8qzRKvshVBO5qFp+kEf/qF1iAey0j5mLoKjT0L9r+WeP17Mmf9FRLzY
 mo0jw52MnLcJVEXEy4UG6dKwWcaQxeLAKtAoLfj4GEg37PBC77gD4NUqSsYlsNiL3NFP
 fwTyZ9WSM/HhcN11yGGfcYN4rvnEtmdhRZEBuS/fmjCTTuksV+uhyn9PAXz21dA4MNKx
 bkYrJL7qCvtqsPQfjqh22T+rN9G1j/cuFygY5KMXrxB8jW3x3UhfcG1y27qXyWcYFqUO
 qnJ0YeQ58dKYxkCxw0wZU12vfG6l28HqcO5q+gWRsL/ovB20MjAQ97WX1tkHmNRvQXIP
 knbQ==
X-Gm-Message-State: ACgBeo3YUJb+2T3z3eQ5lATozyWA6peUHXSWrDiOZtbTZod9kjzc7VCI
 pAzLWMPZZvV77D9XA4d3y1BX0rj31t4=
X-Google-Smtp-Source: AA6agR6YbV9KSScDe+IODwHHfXQtJVxDRHm7B9TnwN71YS5d0Ka3tD6KDBOWbEz1z+iCgozf+nLY0Q==
X-Received: by 2002:a05:6000:1d8d:b0:220:606b:2516 with SMTP id
 bk13-20020a0560001d8d00b00220606b2516mr5037644wrb.370.1660419149989; 
 Sat, 13 Aug 2022 12:32:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00f2efd4a33b7d07e8.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:f2ef:d4a3:3b7d:7e8])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b003a4eea0aa48sm4203056wms.0.2022.08.13.12.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 12:32:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 21:32:27 +0200
Message-Id: <20220813193227.2386185-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pGQJO086hkl90kDP/AcVI6eYx2PXeTrVDdEmRqqnkwQ=;
 b=pw3ujshPfIm0NZNIGKBbUahH/4A9hEYBHuTvygnE6fakwCg5kpAHQQIWhsEJGC9qVN
 kMT5u+p69rUd5ydii6vpQV2ZzW4L08YtJN/Usp9G0gsjL3kE8BcJbATvdah1hnEd86Wg
 aHdPwBfU9EsKP/+LIPOCO57NboI2uceZ7p28Ycw4yu3ragtIPcco/mQn1yY6PKtuHtnn
 uIAQnVzn0LdfScXkw0/1u602TQ3jYdNdD472iDi6nDWelncf/f4zx7UrMH5SZLfsfyhT
 9D/0FX0U86W320E8fgNKoXOeipMYwbBxJIf0sgWkGl+AspEhKn4D94EHh5fIv1QkB6gs
 O3aA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pw3ujshP
Subject: [Buildroot] [PATCH 1/1] package/jose: disable man pages
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
index 8a60e20cc6..11c0783799 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -11,5 +11,6 @@ JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
+JOSE_CONF_OPTS = -Dskip_manpages=false
 
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
