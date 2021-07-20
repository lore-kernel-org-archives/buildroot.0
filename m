Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C05C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B6B61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6B6B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7513F40539;
	Tue,  3 Aug 2021 23:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5QbKcUvh_-s; Tue,  3 Aug 2021 23:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5370F4060B;
	Tue,  3 Aug 2021 23:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8871BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCDE140EE8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwQ0k5_yYqtU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D5474022E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 847FE87059; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 20:26:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 804d3ef55e157e3e3e7de69295fb9ea1446b44da
X-Git-Newrev: 6e4b8fe00f1b516630f109207c62ee0818db3000
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.847FE87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/systemd: disable
 urlify unless supported
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6e4b8fe00f1b516630f109207c62ee0818db3000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The urlify feature in the systemd pager is only supported by the full
less package and not busybox less, enable only for builds with full
less support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Add-meson-option-to-disable-urlify.patch  | 67 ++++++++++++++++++++++
 package/systemd/systemd.mk                         |  6 ++
 2 files changed, 73 insertions(+)

diff --git a/package/systemd/0001-Add-meson-option-to-disable-urlify.patch b/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
new file mode 100644
index 0000000000..b0a59a9f0f
--- /dev/null
+++ b/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
@@ -0,0 +1,67 @@
+From e5d86ebed5624ef62342c820a5868b1075deb300 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 11 Jul 2021 04:39:33 -0600
+Subject: [PATCH] Add meson option to disable urlify.
+
+Useful for systems that don't use a version of less with hyperlink
+support.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+e5d86ebed5624ef62342c820a5868b1075deb300]
+---
+ meson.build               | 1 +
+ meson_options.txt         | 2 ++
+ src/shared/pretty-print.c | 4 ++++
+ 3 files changed, 7 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 5735cfc7ad..a2ee15bf32 100644
+--- a/meson.build
++++ b/meson.build
+@@ -278,6 +278,7 @@ conf.set_quoted('USER_PRESET_DIR',                            userpresetdir)
+ conf.set_quoted('VENDOR_KEYRING_PATH',                        join_paths(rootlibexecdir, 'import-pubring.gpg'))
+ 
+ conf.set('ANSI_OK_COLOR',                                     'ANSI_' + get_option('ok-color').underscorify().to_upper())
++conf.set10('ENABLE_URLIFY',                                   get_option('urlify'))
+ conf.set10('ENABLE_FEXECVE',                                  get_option('fexecve'))
+ conf.set10('MEMORY_ACCOUNTING_DEFAULT',                       memory_accounting_default)
+ conf.set('STATUS_UNIT_FORMAT_DEFAULT',                        'STATUS_UNIT_FORMAT_' + status_unit_format_default.to_upper())
+diff --git a/meson_options.txt b/meson_options.txt
+index 163c8df87d..b60261ac24 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -444,6 +444,8 @@ option('ok-color', type : 'combo',
+                   'highlight-cyan', 'highlight-white'],
+        value : 'green',
+        description: 'color of the "OK" status message')
++option('urlify', type : 'boolean', value : 'true',
++       description : 'enable pager Hyperlink ANSI sequence support')
+ option('fexecve', type : 'boolean', value : 'false',
+        description : 'use fexecve() to spawn children')
+ 
+diff --git a/src/shared/pretty-print.c b/src/shared/pretty-print.c
+index 137ba77b3a..7983c0a33a 100644
+--- a/src/shared/pretty-print.c
++++ b/src/shared/pretty-print.c
+@@ -19,6 +19,7 @@
+ #include "util.h"
+ 
+ bool urlify_enabled(void) {
++#if ENABLE_URLIFY
+         static int cached_urlify_enabled = -1;
+ 
+         if (cached_urlify_enabled < 0) {
+@@ -32,6 +33,9 @@ bool urlify_enabled(void) {
+         }
+ 
+         return cached_urlify_enabled;
++#else
++        return 0;
++#endif
+ }
+ 
+ int terminal_urlify(const char *url, const char *text, char **ret) {
+-- 
+2.25.1
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5562703a89..03a5a5e4c8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -59,6 +59,12 @@ else
 SYSTEMD_CONF_OPTS += -Dacl=false
 endif
 
+ifeq ($(BR2_PACKAGE_LESS),y)
+SYSTEMD_CONF_OPTS += -Durlify=true
+else
+SYSTEMD_CONF_OPTS += -Durlify=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 SYSTEMD_DEPENDENCIES += libapparmor
 SYSTEMD_CONF_OPTS += -Dapparmor=true
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
