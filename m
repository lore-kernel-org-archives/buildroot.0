Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FC9C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:53:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B32660F56
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B32660F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3E740410;
	Sat, 31 Jul 2021 21:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMzYHmlDNXy2; Sat, 31 Jul 2021 21:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C294403FE;
	Sat, 31 Jul 2021 21:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F03301BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDF24837C9
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjMy15Oj2LH7 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 21:53:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94398837A1
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:53:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so8674216wmd.3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d7CfpN0P+HTBbzvHzVR2UNyvUZcW/MTmZs7VxSX20Jw=;
 b=mFaDN3xhdzPZ07Jg7J1+P7hb6+i94qmg4Pgce014vkJ7XECy3LigvArjN8oasKIOqr
 t8nRqRBikTP5o68wD47sLSZ23tCEza7/VrsR/pxA2uWroH7DfQ9Lf6ZmgqoDxw2j4mzQ
 gOtHtqJ6B4PmYuBbNtooMcI+iUAhMYuArZ8dadrAeDBAB2W606YSrMple16awCiSOQ5Z
 VfyIl4Xt8RPt8TX06hyCy9BSzxjLjUP7VV4PpuUIp7kF4zr80TRjnsaomNEUTHcsB3QH
 Q31xG5ywclvas/5GQNKdYLYsvH+lXv84wxYJFIaApOQRkMRdUUhzLXL2OB0s3ALuzC20
 OhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d7CfpN0P+HTBbzvHzVR2UNyvUZcW/MTmZs7VxSX20Jw=;
 b=ojstm78waja+7STTsbE6ymXkJ2f7G5lbRmhgwrbl9WsOx9h0oFG29njVk+/22+tTsP
 mtWfEjGG2xQK1xXeMOo3Bww2AhEfFpdaiA9UGywGi09x289cbEWndTuSS0EWYyH/WTwT
 mxLFLCzasmh/fXohGvUtPBQv2evxkot4Iu2haGyl7IyZrZDD/ptg7yYZhJAgXOmyhv+D
 whAQh6rYbrfU7VMxOQHovB+BNhiBYrHxWNEXY4gF1rzjp0VIG5PQh0602C8SB/lZNXVX
 Nrg7CsUdD8vKWOoPD4SFobPOQ64HBL0bNX/9jBI04Hs96XNVQ5msYlUI4YAhU5uZ74JB
 aasQ==
X-Gm-Message-State: AOAM533s24/j2OEId9g01RDXKWjgTYXeQj3k8/O+RtO3WgWLAE5ATmq8
 NSEMtcOtkyfw12H/Qfy3i5SWvocJvnHLmQ==
X-Google-Smtp-Source: ABdhPJyF3UU/+ZQLb0ptgOsgoAJYNcMyI5e5gyjZmq25xlnjia1aVCpkxT4NJfW3Mi6qoK3r2NFLrQ==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr9850014wme.61.1627768418613; 
 Sat, 31 Jul 2021 14:53:38 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id d14sm6019355wrs.49.2021.07.31.14.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:53:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 23:53:30 +0200
Message-Id: <20210731215330.1921591-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmbim: fix static build
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
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix static build failure raised since switch to meson in commit
be76508af2b2253f95137a28198139732be2dcb3

Fixes:
 - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...im-glib-meson.build-fix-static-build.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch

diff --git a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..6ccad9abf8
--- /dev/null
+++ b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
@@ -0,0 +1,34 @@
+From ff1f9d7c9bc163de3117383b7cea9cd99585462a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 23:42:35 +0200
+Subject: [PATCH] src/libmbim-glib/meson.build: fix static build
+
+Replace shared_library by library to fix static build failure with
+toolchains that don't support dynamic library
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/merge_requests/83]
+---
+ src/libmbim-glib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libmbim-glib/meson.build b/src/libmbim-glib/meson.build
+index e3337db..5de3564 100644
+--- a/src/libmbim-glib/meson.build
++++ b/src/libmbim-glib/meson.build
+@@ -76,7 +76,7 @@ version_header = configure_file(
+ 
+ symbol_map = join_paths(meson.current_source_dir(), 'symbol.map')
+ 
+-libmbim_glib = shared_library(
++libmbim_glib = library(
+   libname,
+   version: mbim_glib_version,
+   sources: version_header,
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
