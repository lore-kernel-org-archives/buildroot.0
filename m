Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DDCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Mar 2022 18:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E817A81471;
	Tue,  1 Mar 2022 18:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tlKl3yIXgEK; Tue,  1 Mar 2022 18:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F136C81453;
	Tue,  1 Mar 2022 18:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E16371BF852
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 18:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCF7A605E9
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 18:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wa40DT2JQifS for <buildroot@lists.busybox.net>;
 Tue,  1 Mar 2022 18:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993D86059F
 for <buildroot@buildroot.org>; Tue,  1 Mar 2022 18:31:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1936818wmp.5
 for <buildroot@buildroot.org>; Tue, 01 Mar 2022 10:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ve7hihSFK968TYlotEEBRL4x4hJ09h4qK36D4dRAsys=;
 b=PrHIWn15ynp6wct7JfOHo+5CxVFSl+R3NS0kM/y/tZm8oMYG6AP/qYl0qnwi6TxpS1
 GgVVYWKHnINYKkTBkOWuVpNs71x8f5/sadk37tz0Tw99Ec30a6KCV7Odd8d65PsW+q1h
 RU1X6FvJicEm5s6ILfYmKtAkWKNy9Zd/KibVUtX5oayjGtDRC9bevj5roKf+3oAVj20f
 ftHgjovpZ7oNOKOs7aEcXYrNjR4mWbPbgHvubEDDsCTLD9FBbfp6/RqpcjbsOGOs1DaV
 RSrFtEDiQ5Rf5IYap64JfPZpDFZR8A+V/0cCWmUJZIudDcxwQUKmt0gna/6tcDNIFvgx
 Xz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ve7hihSFK968TYlotEEBRL4x4hJ09h4qK36D4dRAsys=;
 b=Pv2PBxAMHqBXwevUFAATC8uktZKVhlOgYMedkcdQwfEgv6ID0weB4p7VUDilAvEyrt
 OlHe9T49RD+hbSv3SCJxqH5tUjaFZGiTLjBDfDj74CwlYLHu6Gz1v4iVlGohyCS8Loef
 8PoaNuu+1SUOvxhj4Z6YF7VSxYQuZhxm8gBukNl5oVZl3urwnNXfOQ5KlWrSbb41POj5
 DaueN/HAzcoEZxKqnUMzKQ7ra7KIbRjitaZTQCENGP28VLxJiCuGlmrwu8LwbojFOg9L
 h8rYrqkkhWr0E3t91uBIoqvd/rmWU2ztR/F7M/rf7GbwcRP1iMYIDLTVHce85+nbqZrV
 8QAQ==
X-Gm-Message-State: AOAM530sDX4Qu21G/1BKHmamtqTJoSizlMm5ZkhVGRAcWrlJEnayhV4I
 8mz6p9QdltT3vjzGTvvxTZSLVQWGqqI=
X-Google-Smtp-Source: ABdhPJxQeNY0n1P83r5EulCb9Ul/440/XeRQYJO35jx8aa1//TfYZ7y4cLeC86r+ZtbulY4I1qAn5g==
X-Received: by 2002:a05:600c:378b:b0:381:67e7:e20c with SMTP id
 o11-20020a05600c378b00b0038167e7e20cmr8772779wmr.32.1646159506393; 
 Tue, 01 Mar 2022 10:31:46 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm5033084wmq.35.2022.03.01.10.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:31:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Mar 2022 19:31:10 +0100
Message-Id: <20220301183110.925959-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rygel: disable man pages
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

Fix the following build failure raised since bump to version 0.40.2 in
commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

FAILED: doc/man/rygel.1
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.authors.section.enabled 1 --stringparam man.copyright.section.enabled 1 -o doc/man/rygel.1 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl ../doc/man/rygel.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

Fixes:
 - http://autobuild.buildroot.org/results/297859cdb544e980826df28b446a75d32c06d839

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-build-Add-man_pages-build-options.patch | 150 ++++++++++++++++++
 package/rygel/rygel.mk                        |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 package/rygel/0001-build-Add-man_pages-build-options.patch

diff --git a/package/rygel/0001-build-Add-man_pages-build-options.patch b/package/rygel/0001-build-Add-man_pages-build-options.patch
new file mode 100644
index 0000000000..cdd7cc7721
--- /dev/null
+++ b/package/rygel/0001-build-Add-man_pages-build-options.patch
@@ -0,0 +1,150 @@
+From 5a54c5bb1c9609b7bffe6b3e05f934030e4e990e Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sat, 26 Dec 2020 18:40:51 +0100
+Subject: [PATCH] build: Add man_pages build options
+
+Check if xsltproc runs succesfully and fail otherwise
+
+Fixes #192
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/rygel/-/commit/5a54c5bb1c9609b7bffe6b3e05f934030e4e990e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ doc/man/meson.build | 98 +++++++++++++++++++++++++++------------------
+ doc/meson.build     |  5 ++-
+ meson_options.txt   |  1 +
+ 3 files changed, 64 insertions(+), 40 deletions(-)
+
+diff --git a/doc/man/meson.build b/doc/man/meson.build
+index ef3fcfbf5..4c92eab2b 100644
+--- a/doc/man/meson.build
++++ b/doc/man/meson.build
+@@ -1,43 +1,63 @@
+ xsltproc = find_program('xsltproc', required: false)
+ 
+ if xsltproc.found()
+-  xlstproc_flags = [
+-    '--nonet',
+-    '--stringparam', 'man.output.quietly', '1',
+-    '--stringparam', 'funcsynopsis.style', 'ansi',
+-    '--stringparam', 'man.authors.section.enabled', '1',
+-    '--stringparam', 'man.copyright.section.enabled', '1',
+-  ]
+-
+-  xsltproc_args = [
+-    xsltproc,
+-    xlstproc_flags,
+-    '-o', '@OUTPUT@',
+-    'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
+-    '@INPUT@',
+-  ]
+-
+-  man_input_files = [
+-    'rygel.xml',
+-    'rygel.conf.xml'
+-  ]
+-
+-  man_output_files = [
+-    'rygel.1',
+-    'rygel.conf.5'
+-  ]
+-
+-  custom_target('man 1 pages',
+-                input: 'rygel.xml',
+-                output: 'rygel.1',
+-                command: xsltproc_args,
+-                install: true,
+-                install_dir: join_paths(get_option('mandir'), 'man1'))
+-
+-  custom_target('man 5 pages',
+-                input: 'rygel.conf.xml',
+-                output: 'rygel.conf.5',
+-                command: xsltproc_args,
+-                install: true,
+-                install_dir: join_paths(get_option('mandir'), 'man5'))
++    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
++
++    xlstproc_flags = [
++        '--nonet',
++        '--stringparam', 'man.output.quietly', '1',
++        '--stringparam', 'funcsynopsis.style', 'ansi',
++        '--stringparam', 'man.authors.section.enabled', '1',
++        '--stringparam', 'man.copyright.section.enabled', '1',
++    ]
++
++    xsltproc_args = [
++        xsltproc,
++        xlstproc_flags,
++        '-o', '@OUTPUT@',
++        stylesheet,
++        '@INPUT@',
++    ]
++
++    man_input_files = [
++        'rygel.xml',
++        'rygel.conf.xml'
++    ]
++
++    man_output_files = [
++        'rygel.1',
++        'rygel.conf.5'
++    ]
++
++    r = run_command(
++        [
++            xsltproc,
++            xlstproc_flags,
++            '-o', '/dev/null',
++            stylesheet,
++            'rygel.xml'
++        ]
++    )
++
++    if (r.returncode() == 0)
++        custom_target(
++            'man 1 pages',
++            input: 'rygel.xml',
++            output: 'rygel.1',
++            command: xsltproc_args,
++            install: true,
++            install_dir: join_paths(get_option('mandir'), 'man1')
++        )
++
++        custom_target(
++            'man 5 pages',
++            input: 'rygel.conf.xml',
++            output: 'rygel.conf.5',
++            command: xsltproc_args,
++            install: true,
++            install_dir: join_paths(get_option('mandir'), 'man5')
++        )
++    else
++        error('Cannot bulid man pages, failed to run xsltproc')
++    endif
+ endif
+diff --git a/doc/meson.build b/doc/meson.build
+index 41c733e50..91c08fae5 100644
+--- a/doc/meson.build
++++ b/doc/meson.build
+@@ -1,2 +1,5 @@
+-subdir('man')
++if get_option('man_pages')
++    subdir('man')
++endif
++
+ subdir('reference')
+diff --git a/meson_options.txt b/meson_options.txt
+index cb604c4e9..c60ff1a9a 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,6 @@
+ option('uninstalled', type: 'boolean', value: 'false', description: 'Run Rygel from build directory only')
+ option('api-docs', type: 'boolean', value: 'false', description: 'Build the API documentation')
++option('man_pages', type: 'boolean', value: 'true', description: 'Build the man pages')
+ option('systemd-user-units-dir', type : 'string', value : 'auto', description : 'Where to install the systemd user unit (use special values "auto" or "none", or pass a path')
+ option('plugins', type : 'array', choices : ['external', 'gst-launch', 'lms', 'media-export', 'mpris', 'playbin', 'ruih', 'tracker', 'tracker3'])
+ option('engines', type : 'array', choices : ['simple', 'gstreamer'])
+-- 
+GitLab
+
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index bfcd5df3c6..e05297456d 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -26,6 +26,7 @@ RYGEL_CONF_OPTS += \
 	-Dapi-docs=false \
 	-Dexamples=false \
 	-Dintrospection=enabled \
+	-Dman_pages=false \
 	-Dtests=false
 RYGEL_PLUGINS = external,lms,mpris,ruih
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
