Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F621C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC1B41773;
	Thu,  2 May 2024 07:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_Dw83AiOqqk; Thu,  2 May 2024 07:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0257041833
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0257041833;
	Thu,  2 May 2024 07:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03D9E1BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A0340241
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1SWMLcy1URk for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A1354013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1354013D
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A1354013D
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:23:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51f174e316eso471026e87.0
 for <buildroot@buildroot.org>; Thu, 02 May 2024 00:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634612; x=1715239412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AUPYoUIRecYVx6nQuzw2ODvW1Nb5HHmFKZxBdct2m4=;
 b=UW4HRU4/yaSp63/bVSEK8CJGtv5kyKDiN2cWb01FrXMCkJQPN+8qk6vX06lZICBa2I
 Jw1kSW3StQ8eDvFQOm2+UbIawbIwWagCw6qCZgCRJGr0UfyetLCm46bPTxWNfoCCfKQ6
 99xK5cUkYl4UNH82bZx2jE7uDjHKnUAgFHqb/bXzhq3+10fOG9tuQfepguMBTWAbf72F
 IWr0Gz7roTetJ3HZ4voUjmY02J1w+usqVcEZxnTY1JAOxCb02fcd+SbLqirnY21c1GNI
 CYS/Nfy+ejE3XJF+LadbtTPmo0g1Nh4+re58czat+/ep3cYFQslcE+Xl3PE0qL2+RiI3
 AXBA==
X-Gm-Message-State: AOJu0Yy/6o4Z1yhe5dhponvzMOZLIJsu9yPLSybj/YdSf2tN8Bu+NSgE
 DGmHLlqkW8sIAoX7OmD8hJoqZeFrWiQXq2H+ndOyFc3MsY10Mik1LeFal2qZMXPBF3VoINQi7TO
 k+v0=
X-Google-Smtp-Source: AGHT+IGqN5IGSR32NH29qyEB7a+oHgm43Rt4GGWgvsQ35bxvoYTTj/1Catc27UhFDXHpDiw3hsAPKg==
X-Received: by 2002:ac2:4c0c:0:b0:513:edf4:6f20 with SMTP id
 t12-20020ac24c0c000000b00513edf46f20mr2539313lfq.54.1714634612218; 
 Thu, 02 May 2024 00:23:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.201.29.159]) by smtp.gmail.com with ESMTPSA id
 l11-20020a056402028b00b00572bba6745esm194758edv.81.2024.05.02.00.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:23:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 09:23:26 +0200
Message-ID: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1714634612; x=1715239412;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2AUPYoUIRecYVx6nQuzw2ODvW1Nb5HHmFKZxBdct2m4=;
 b=lSClh+JjtKLTkZdJVluT7shDjM/lUkgJWWpPEdjS2Yz1fgrstEIrKWVEPRhnoQB1ar
 oGO5fCS7wkD1oLSwILBZFGSgLuKiUO6i2czrwLMg/VsmyRp58vdbVLLVl1jgjByrOcM5
 WaszW1E0yc1+0YKpFSqph4rMl4sy34g/0TGZg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lSClh+Jj
Subject: [Buildroot] [PATCH v2 1/2] package/qemu: fix disabling fp-bench
 test compilation
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

Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2
 - Replace [Upstream status: <url>] with Upstream: <url>
 - Drop the added line to .checkpackageignore

 .checkpackageignore                           |  1 -
 ...fp-disable-fp-bench-build-by-default.patch | 28 -----------
 ...on-t-build-fp-bench-test-if-fenv.h-i.patch | 49 +++++++++++++++++++
 3 files changed, 49 insertions(+), 29 deletions(-)
 delete mode 100644 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
 create mode 100644 package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index db23450f0381..3693b770cf4d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1360,7 +1360,6 @@ package/python3/0028-fix-building-on-older-distributions.patch lib_patch.Upstrea
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
-package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch lib_patch.Upstream
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
index 000000000000..b7e41d6f232c
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
+Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
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
