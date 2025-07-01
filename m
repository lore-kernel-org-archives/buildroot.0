Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2ECC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 16:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D29740708;
	Tue,  1 Jul 2025 16:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ch35OYW0oco8; Tue,  1 Jul 2025 16:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FC24077B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3FC24077B;
	Tue,  1 Jul 2025 16:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47311128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E6160DB6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmCETP3nPCZr for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 16:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27EBA6081C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EBA6081C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27EBA6081C
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 16:15:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -841939334; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Jul 2025 16:15:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uWddV-006o5d-0a;
 Tue, 01 Jul 2025 18:15:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 18:15:07 +0200
Message-Id: <20250701161508.1622502-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Vwgmj0Ky4nDkp0/xfEpU5ucFljAp8Gsy/3JtqoHCDJ+T8pXKdqTS/6CIyCS6opd1AwIBOJIDm3cYZUmVk636LYxWTYHxJ79zM50QxuSuWDIZwJlywznn/6qqWArEjnopKRP3j2OEU2+PpwfG4t5osmIuuuJ8xIZlq5Tz0AEnIWDag6Fjx2zQ/+muySfXzeswe2DKeXiN1Z7b6sd8KxG6ZCH2+FvkS3VLVTnvSu0q2RFwEhPGmin2Ukhi0lIsmNBm072iGGOwVYl4Ni0sAOd0eu9WjGoWwIIcK7FFicLVV1v1Sn0rjiEfO2Q1ZiPjWaTvCU/PrtBo9OujuSfW5h04oQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=VpmwpaWIbS+u+/DOD4DHxISOS+PV2pm7ZzpWNfVDu/4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Vwgmj0Ky
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/jose: security bump to version 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jose-13 fixed the following security issue:

- CVE-2023-50967: latchset jose through version 11 allows attackers to cause
  a denial of service (CPU consumption) via a large p2c (aka PBES2 Count)
  value.
  https://github.com/latchset/jose/issues/151

In addition, jose-14 worked around another DoS issue related to
decompression:
https://github.com/latchset/jose/pull/157

Drop now upstreamed patches:

- 0001-lib-hsh.c-rename-hsh-local-variable.patch: Upstream as of
  https://github.com/latchset/jose/commit/3d5b287243f87ce0243b23abd690d86c41fc499c

- 0002-man-add-option-to-skip-building-man-pages.patch: Upstream after
  getting reworked to use -Ddocs=disabled as of
  https://github.com/latchset/jose/commit/786b426df018edf30a53e2d82155df20d13047c1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-lib-hsh.c-rename-hsh-local-variable.patch | 71 -------------------
 ...dd-option-to-skip-building-man-pages.patch | 64 -----------------
 package/jose/jose.hash                        |  2 +-
 package/jose/jose.mk                          |  4 +-
 4 files changed, 3 insertions(+), 138 deletions(-)
 delete mode 100644 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
 delete mode 100644 package/jose/0002-man-add-option-to-skip-building-man-pages.patch

diff --git a/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch b/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
deleted file mode 100644
index 0bd259ad8b..0000000000
--- a/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 591fc6da944ffc29936e0019b2bc225ddc81dbba Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Nov 2017 22:48:33 +0100
-Subject: [PATCH] lib/hsh.c: rename hsh local variable
-
-The hsh local variable name conflicts with the function prototype of
-hsh() in hsh.h, causing the following build issues with old compilers
-(gcc 4.7):
-
-hsh.c: In function 'hsh':
-hsh.c:28:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
-hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
-hsh.c: In function 'hsh_buf':
-hsh.c:60:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
-hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
-
-Therefore, we rename this local variable to _hsh.
-
-Submitted-upstream: https://github.com/latchset/jose/pull/51
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/hsh.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/hsh.c b/lib/hsh.c
-index c59a95f..a2a891b 100644
---- a/lib/hsh.c
-+++ b/lib/hsh.c
-@@ -25,7 +25,7 @@
- json_t *
- hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
- {
--    jose_io_auto_t *hsh = NULL;
-+    jose_io_auto_t *_hsh = NULL;
-     jose_io_auto_t *enc = NULL;
-     jose_io_auto_t *buf = NULL;
-     char b[1024] = {};
-@@ -33,8 +33,8 @@ hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
- 
-     buf = jose_io_buffer(cfg, b, &l);
-     enc = jose_b64_enc_io(buf);
--    hsh = hsh_io(cfg, alg, enc);
--    if (!buf || !enc || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
-+    _hsh = hsh_io(cfg, alg, enc);
-+    if (!buf || !enc || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
-         return NULL;
- 
-     return json_stringn(b, l);
-@@ -57,7 +57,7 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
-         const void *data, size_t dlen, void *hash, size_t hlen)
- {
-     const jose_hook_alg_t *a = NULL;
--    jose_io_auto_t *hsh = NULL;
-+    jose_io_auto_t *_hsh = NULL;
-     jose_io_auto_t *buf = NULL;
- 
-     a = jose_hook_alg_find(JOSE_HOOK_ALG_KIND_HASH, alg);
-@@ -71,8 +71,8 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
-         return SIZE_MAX;
- 
-     buf = jose_io_buffer(cfg, hash, &hlen);
--    hsh = a->hash.hsh(a, cfg, buf);
--    if (!buf || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
-+    _hsh = a->hash.hsh(a, cfg, buf);
-+    if (!buf || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
-         return SIZE_MAX;
- 
-     return hlen;
--- 
-2.13.6
-
diff --git a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
deleted file mode 100644
index 3a5ad1eadc..0000000000
--- a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 506132d3edc8d062f65fdacf007a15613d27e5c5 Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cotequeiroz@gmail.com>
-Date: Wed, 6 Apr 2022 09:49:48 -0300
-Subject: [PATCH] man: add option to skip building man pages
-
-Add a 'skip_manpages' option to meson, so that man pages do not get
-built.
-
-Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
-[Retrieved from: https://github.com/latchset/jose/pull/115]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build       | 24 +++++++++++++-----------
- meson_options.txt |  1 +
- 2 files changed, 14 insertions(+), 11 deletions(-)
- create mode 100644 meson_options.txt
-
-diff --git a/meson.build b/meson.build
-index 1edfbe7..9b40efb 100644
---- a/meson.build
-+++ b/meson.build
-@@ -37,7 +37,6 @@ zlib = dependency('zlib')
- threads = dependency('threads')
- jansson = dependency('jansson', version: '>=2.10')
- libcrypto = dependency('libcrypto', version: '>=1.0.2')
--a2x = find_program('a2x', required: false)
- 
- mans = []
- 
-@@ -63,14 +62,17 @@ pkg.generate(
-   requires: 'jansson',
- )
- 
--if a2x.found()
--  foreach m : mans
--    custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
--      command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
--      install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
--      install: true
--    )
--  endforeach
--else
--  warning('Will not build man pages due to missing dependencies!')
-+if not get_option('skip_manpages')
-+  a2x = find_program('a2x', required: false)
-+  if a2x.found()
-+    foreach m : mans
-+      custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
-+        command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
-+        install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
-+        install: true
-+      )
-+    endforeach
-+  else
-+    warning('Will not build man pages due to missing dependencies!')
-+  endif
- endif
-diff --git a/meson_options.txt b/meson_options.txt
-new file mode 100644
-index 0000000..0885515
---- /dev/null
-+++ b/meson_options.txt
-@@ -0,0 +1 @@
-+option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
diff --git a/package/jose/jose.hash b/package/jose/jose.hash
index 128d26d163..0bee7f46e8 100644
--- a/package/jose/jose.hash
+++ b/package/jose/jose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e272afe7717e22790c383f3164480627a567c714ccb80c1ee96f62c9929d8225  jose-11.tar.xz
+sha256  cee329ef9fce97c4c025604a8d237092f619aaa9f6d35fdf9d8c9052bc1ff95b  jose-14.tar.xz
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 723ebe8bb9..9fd9d1dcaa 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-JOSE_VERSION = 11
+JOSE_VERSION = 14
 JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
 JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
 JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
-JOSE_CONF_OPTS = -Dskip_manpages=true
+JOSE_CONF_OPTS = -Ddocs=disabled
 
 $(eval $(meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
