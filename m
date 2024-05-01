Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D63C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E931840712;
	Wed,  1 May 2024 12:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsW6x9WzJak5; Wed,  1 May 2024 12:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B75040737
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B75040737;
	Wed,  1 May 2024 12:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0061BF844
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B1240223
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VigW70tk27op for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C60340125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C60340125
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C60340125
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:00:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a58e787130fso119719666b.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 05:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714564854; x=1715169654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dld5unzAnrICLjw0rhb2ZmS+jeAX0qBbHLVbDywQJY=;
 b=UehCDK021GOgnX3pBmIYGoW6j4qtFUOvQDuxg93sm6TSFcrYY9vkW/hpAAP4Jx1S88
 AvN0QfjC1iUYGQFv1yk9gzvLMrJB5LjERY6/HSHUB0GznVgh/em9jgFcSdZLh0TnVRH5
 /hMZjits9+8BueaTfusWBC0fjjhC0fboOmme9CiPsMEtR06ccARIJEyyRC56G2NY8USf
 e4+r1DZIeQYmD89DFj9+oR3Kh3K4WvqcPv9HstV3zLkDGvzDmKApR1bn67CmFX7xLZW1
 QpKov9OTJlEE2OWfxJJg/b25dVwlAPIGEQX6W6LVGwkQOtlobR3JKL2OP0KpnegjIPqH
 eDBg==
X-Gm-Message-State: AOJu0YxUUJThms0I+518AazxWhDCIRBXoMiYyM+uapzX37p9MKQ2gCub
 Bm6UQgfGhBcqIV0ObPvz7+rK0+lOWiMjsDzTlkT+lxFQC4G3zkbyjJV8Es8HXkmMFFYW944JaxF
 Wvk4=
X-Google-Smtp-Source: AGHT+IFZFv47b6co9weCF20pzUNZOnPK/xCFuZXRt+JilsTXD6pBF4esMCveuD1yB5xMDnFC1KApkw==
X-Received: by 2002:a17:906:3111:b0:a58:c4f9:a2f7 with SMTP id
 17-20020a170906311100b00a58c4f9a2f7mr5123174ejx.2.1714564854073; 
 Wed, 01 May 2024 05:00:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a50eb09000000b005727bdb1eafsm3973689edp.40.2024.05.01.05.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 05:00:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 14:00:49 +0200
Message-ID: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1714564854; x=1715169654;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dld5unzAnrICLjw0rhb2ZmS+jeAX0qBbHLVbDywQJY=;
 b=jamucwd1QubY0+rtgFkwi8im9h0ddCjCwOZNQNgcURMoosxLPYiA/sK4Gk2hytQMd9
 BB/FOKqCfm0rHludy78vxjxlJLFGnHYFQOGpVJycexIsRWrItNevl5ElqofJZ/mw0jjU
 W4sHIPVyPZYNmodVi0ZMsDs+4TXw1iXGjQS/k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jamucwd1
Subject: [Buildroot] [PATCH 1/2] package/qemu: fix disabling fp-bench test
 compilation
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the bump to version 8.1.1, the patch that disabled the compilation
of the fp-bench test is no longer applicable, even though the package
compilation process does not report any errors in applying the patch
itself. The new patch does not disable the test by default but only if
the file fenv.h is not missing, with the hope that this approach will be
considered acceptable by the maintainer and merged upstream.

The patch is an adaptation of the one sent upstream.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |  2 +-
 ...fp-disable-fp-bench-build-by-default.patch | 28 -----------
 ...on-t-build-fp-bench-test-if-fenv.h-i.patch | 49 +++++++++++++++++++
 3 files changed, 50 insertions(+), 29 deletions(-)
 delete mode 100644 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
 create mode 100644 package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3ee..c16e17cc35e4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1073,7 +1073,7 @@ package/python3/0028-fix-building-on-older-distributions.patch lib_patch.Upstrea
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
-package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch lib_patch.Upstream
+package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch lib_patch.Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
deleted file mode 100644
index fb7a9a69897b..000000000000
--- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 83d976d6d7f0357659d5daa0f01c52048a609e88 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 Aug 2021 21:55:53 +0200
-Subject: [PATCH] tests/fp: disable fp-bench build by default
-
-Fixes:
-https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00947.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- tests/fp/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index 8bd0979f67..2fe019d2c6 100644
---- a/tests/fp/meson.build
-+++ b/tests/fp/meson.build
-@@ -640,6 +640,7 @@ fpbench = executable(
-   dependencies: [qemuutil],
-   include_directories: [sfinc, include_directories(tfdir)],
-   c_args: fpcflags,
-+  build_by_default: false,
- )
- 
- fptestlog2 = executable(
--- 
-2.35.1
-
diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
new file mode 100644
index 000000000000..836754ba231a
--- /dev/null
+++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
@@ -0,0 +1,49 @@
+From b4a692f46135af1011bf0adbfeb19abf354ca191 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 30 Apr 2024 09:40:55 +0200
+Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
+ missing
+
+The fp-bench test (i. e. tests/fp/fp-bench.c) use fenv.h that is not
+always provided by the libc (uClibc). The patch disables its compilation
+in case the header is not available.
+
+The patch is based on a suggestion from Paolo Bonzini, which you can
+find at the following link.
+
+Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Upstream status: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/]
+---
+ tests/fp/meson.build | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/tests/fp/meson.build b/tests/fp/meson.build
+index cbc17392d678..cd052667e940 100644
+--- a/tests/fp/meson.build
++++ b/tests/fp/meson.build
+@@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
+            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
+      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
+ 
+-executable(
+-  'fp-bench',
+-  ['fp-bench.c', '../../fpu/softfloat.c'],
+-  dependencies: [qemuutil, libtestfloat, libsoftfloat],
+-  c_args: fpcflags,
+-)
++if cc.has_header('fenv.h')
++  executable(
++    'fp-bench',
++    ['fp-bench.c', '../../fpu/softfloat.c'],
++    dependencies: [qemuutil, libtestfloat, libsoftfloat],
++    c_args: fpcflags,
++  )
++endif
+ 
+ fptestlog2 = executable(
+   'fp-test-log2',
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
