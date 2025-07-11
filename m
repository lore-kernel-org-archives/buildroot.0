Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49EC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FBA61420;
	Fri, 11 Jul 2025 10:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-eErYhF5vFf; Fri, 11 Jul 2025 10:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD4960E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD4960E32;
	Fri, 11 Jul 2025 10:44:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA5341E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B4538217E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQBPZOKxE_aY for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C4CE82A28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4CE82A28
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C4CE82A28
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1317584f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230675; x=1752835475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1J/WEujfAIu5F3EEslB5jsuP1HgihLeUMQfP2zCpImk=;
 b=bhVw3WdrzpszgA/z939tOVz3p5OYhyxFjDTUer27P53IB2zn3TZv/PAjFElqe/BdUq
 NiAU3lILxheG7qvSOhFynH+ngoZFW7EFdwifM7I3SMvbVdUFBrZ729atQ3tk6zLHX7NX
 QrVlAqRaSv3Cgev5F4DE/5tONstC3ITjqKf+nWBzOyZsVMnfvf6l/81OKk+qX999u2SR
 3tFn9B6AtX2W2ogdxWqyvNIL/TZRPVI5UvHeuE2O1l1UwfJeN4xBcTGG9EqejRYbJRZr
 Oy2oMvsoFhCD441TGJvBXWr8YbPTGByB1IlMFs0UcNklDMr67U2KLnkJMTKmJnRlKOZI
 TT7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuHT1QgSpdeWWbpDNC8zED5YVAiXzs5zJU2G8T4z1TZHisZOwa5dn2IV8yGGA68eMZQFfVaqu9ZjY=@buildroot.org
X-Gm-Message-State: AOJu0YxaN9OMIfosKEKyQciI3D+Wy/yOZkzV6mPlhNH5s+PTO5/STsX9
 2GXDuL97StNXdXd5P1/DBKbtOJa7lRygGi9t2baVDKge7XOrrJdTSUFiNP7LpRMIKd9PXEOKA/4
 5QBio
X-Gm-Gg: ASbGncvIPt+PlL/Tdq8qV6mRBpLTZJqP90ZYBdHYOL2dBceGiVq3CFF2SCnyAncXny0
 /D5/elsZGk1g4v4XTbngWCTr5wdIww6Cx6o+nlUFMGfjjMfovJC+0ljuNVLJQERUKnKaF9IRKoB
 d+6ssFYONJ7ldWPRBQQ+dcnyrTpYS2cgI8yDCJRT9G0f5qqDIWFxegpvfBqcemIyz49FpbwMXj5
 OErP4UEDyENr+Wh3UELeK2MQI3u0zGbxiDT6uI3/88jaQl7S8ch6kxxv1IB0TIAh6QLPxtW1PFU
 sn6K+FG0nwRTVE6or1JYj6ngc2q87QAqMcf7yNiOloKPM4cXQING77N43LUkF/C6PJ2Yzx0tq8d
 HAFtP1hrC6qlTnw==
X-Google-Smtp-Source: AGHT+IEfwmUIC3n343DSB2h2Jx2T3HpNmvuhlqhXr7HW/TOE9kdqM8b2wn/D/T/l9QFkVeL82DMbKQ==
X-Received: by 2002:a05:6000:21c9:b0:3a5:2b1e:c49b with SMTP id
 ffacd0b85a97d-3b5e7f4356fmr4038008f8f.29.1752230675101; 
 Fri, 11 Jul 2025 03:44:35 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd4b32d8sm43337865e9.17.2025.07.11.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:34 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:34 +0200
Message-ID: <20250711104434.823288-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701161508.1622502-1-peter@korsgaard.com>
References: <20250701161508.1622502-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230675; x=1752835475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1J/WEujfAIu5F3EEslB5jsuP1HgihLeUMQfP2zCpImk=;
 b=ehk54UP2+BjA/rzrPFXjhA+MfGTxgeVElWJtJcQYJOGVxAYsxCneXC8NpaXPAhvrD9
 AvgpwBkS2MVonS6VfBlgEsLkeEXDlmd8nrh7RXnaimV8H9DBLn3xWNHU1ZAZivxGuYnw
 k/8FyLC2PerHCokMI9zM8Qia9L70IyzHqOzH22OV1n4cRFjAHz0nhwux2pG0R3U7OHag
 NtLA7kDoqyDlVxsmxkoRoC7LUopXtu2h5PADSmNn9hljRCLPxTrkL4PRhTcS63KmVnK7
 D/YXlBcy7hs+IAyauh5Z6Ips9GuZljn3FT0tZkXS93cDWgf5cj3VXJ+CriP/j3JVBRhV
 J2GQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ehk54UP2
Subject: Re: [Buildroot] [PATCH] package/jose: security bump to version 14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Jose-13 fixed the following security issue:
> 
> - CVE-2023-50967: latchset jose through version 11 allows attackers to cause
>   a denial of service (CPU consumption) via a large p2c (aka PBES2 Count)
>   value.
>   https://github.com/latchset/jose/issues/151
> 
> In addition, jose-14 worked around another DoS issue related to
> decompression:
> https://github.com/latchset/jose/pull/157
> 
> Drop now upstreamed patches:
> 
> - 0001-lib-hsh.c-rename-hsh-local-variable.patch: Upstream as of
>   https://github.com/latchset/jose/commit/3d5b287243f87ce0243b23abd690d86c41fc499c
> 
> - 0002-man-add-option-to-skip-building-man-pages.patch: Upstream after
>   getting reworked to use -Ddocs=disabled as of
>   https://github.com/latchset/jose/commit/786b426df018edf30a53e2d82155df20d13047c1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...-lib-hsh.c-rename-hsh-local-variable.patch | 71 -------------------
>  ...dd-option-to-skip-building-man-pages.patch | 64 -----------------
>  package/jose/jose.hash                        |  2 +-
>  package/jose/jose.mk                          |  4 +-
>  4 files changed, 3 insertions(+), 138 deletions(-)
>  delete mode 100644 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
>  delete mode 100644 package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> 
> diff --git a/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch b/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
> deleted file mode 100644
> index 0bd259ad8b..0000000000
> --- a/package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 591fc6da944ffc29936e0019b2bc225ddc81dbba Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Mon, 20 Nov 2017 22:48:33 +0100
> -Subject: [PATCH] lib/hsh.c: rename hsh local variable
> -
> -The hsh local variable name conflicts with the function prototype of
> -hsh() in hsh.h, causing the following build issues with old compilers
> -(gcc 4.7):
> -
> -hsh.c: In function 'hsh':
> -hsh.c:28:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
> -hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
> -hsh.c: In function 'hsh_buf':
> -hsh.c:60:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
> -hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
> -
> -Therefore, we rename this local variable to _hsh.
> -
> -Submitted-upstream: https://github.com/latchset/jose/pull/51
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - lib/hsh.c | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/lib/hsh.c b/lib/hsh.c
> -index c59a95f..a2a891b 100644
> ---- a/lib/hsh.c
> -+++ b/lib/hsh.c
> -@@ -25,7 +25,7 @@
> - json_t *
> - hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
> - {
> --    jose_io_auto_t *hsh = NULL;
> -+    jose_io_auto_t *_hsh = NULL;
> -     jose_io_auto_t *enc = NULL;
> -     jose_io_auto_t *buf = NULL;
> -     char b[1024] = {};
> -@@ -33,8 +33,8 @@ hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
> - 
> -     buf = jose_io_buffer(cfg, b, &l);
> -     enc = jose_b64_enc_io(buf);
> --    hsh = hsh_io(cfg, alg, enc);
> --    if (!buf || !enc || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
> -+    _hsh = hsh_io(cfg, alg, enc);
> -+    if (!buf || !enc || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
> -         return NULL;
> - 
> -     return json_stringn(b, l);
> -@@ -57,7 +57,7 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
> -         const void *data, size_t dlen, void *hash, size_t hlen)
> - {
> -     const jose_hook_alg_t *a = NULL;
> --    jose_io_auto_t *hsh = NULL;
> -+    jose_io_auto_t *_hsh = NULL;
> -     jose_io_auto_t *buf = NULL;
> - 
> -     a = jose_hook_alg_find(JOSE_HOOK_ALG_KIND_HASH, alg);
> -@@ -71,8 +71,8 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
> -         return SIZE_MAX;
> - 
> -     buf = jose_io_buffer(cfg, hash, &hlen);
> --    hsh = a->hash.hsh(a, cfg, buf);
> --    if (!buf || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
> -+    _hsh = a->hash.hsh(a, cfg, buf);
> -+    if (!buf || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
> -         return SIZE_MAX;
> - 
> -     return hlen;
> --- 
> -2.13.6
> -
> diff --git a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> deleted file mode 100644
> index 3a5ad1eadc..0000000000
> --- a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 506132d3edc8d062f65fdacf007a15613d27e5c5 Mon Sep 17 00:00:00 2001
> -From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> -Date: Wed, 6 Apr 2022 09:49:48 -0300
> -Subject: [PATCH] man: add option to skip building man pages
> -
> -Add a 'skip_manpages' option to meson, so that man pages do not get
> -built.
> -
> -Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> -[Retrieved from: https://github.com/latchset/jose/pull/115]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - meson.build       | 24 +++++++++++++-----------
> - meson_options.txt |  1 +
> - 2 files changed, 14 insertions(+), 11 deletions(-)
> - create mode 100644 meson_options.txt
> -
> -diff --git a/meson.build b/meson.build
> -index 1edfbe7..9b40efb 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -37,7 +37,6 @@ zlib = dependency('zlib')
> - threads = dependency('threads')
> - jansson = dependency('jansson', version: '>=2.10')
> - libcrypto = dependency('libcrypto', version: '>=1.0.2')
> --a2x = find_program('a2x', required: false)
> - 
> - mans = []
> - 
> -@@ -63,14 +62,17 @@ pkg.generate(
> -   requires: 'jansson',
> - )
> - 
> --if a2x.found()
> --  foreach m : mans
> --    custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
> --      command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
> --      install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
> --      install: true
> --    )
> --  endforeach
> --else
> --  warning('Will not build man pages due to missing dependencies!')
> -+if not get_option('skip_manpages')
> -+  a2x = find_program('a2x', required: false)
> -+  if a2x.found()
> -+    foreach m : mans
> -+      custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
> -+        command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
> -+        install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
> -+        install: true
> -+      )
> -+    endforeach
> -+  else
> -+    warning('Will not build man pages due to missing dependencies!')
> -+  endif
> - endif
> -diff --git a/meson_options.txt b/meson_options.txt
> -new file mode 100644
> -index 0000000..0885515
> ---- /dev/null
> -+++ b/meson_options.txt
> -@@ -0,0 +1 @@
> -+option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
> diff --git a/package/jose/jose.hash b/package/jose/jose.hash
> index 128d26d163..0bee7f46e8 100644
> --- a/package/jose/jose.hash
> +++ b/package/jose/jose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  e272afe7717e22790c383f3164480627a567c714ccb80c1ee96f62c9929d8225  jose-11.tar.xz
> +sha256  cee329ef9fce97c4c025604a8d237092f619aaa9f6d35fdf9d8c9052bc1ff95b  jose-14.tar.xz
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
> diff --git a/package/jose/jose.mk b/package/jose/jose.mk
> index 723ebe8bb9..9fd9d1dcaa 100644
> --- a/package/jose/jose.mk
> +++ b/package/jose/jose.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -JOSE_VERSION = 11
> +JOSE_VERSION = 14
>  JOSE_SOURCE = jose-$(JOSE_VERSION).tar.xz
>  JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
>  JOSE_LICENSE = Apache-2.0
>  JOSE_LICENSE_FILES = COPYING
>  JOSE_INSTALL_STAGING = YES
>  JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
> -JOSE_CONF_OPTS = -Dskip_manpages=true
> +JOSE_CONF_OPTS = -Ddocs=disabled
>  
>  $(eval $(meson-package))
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
