Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 19:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34F241E3F;
	Thu,  9 Nov 2023 19:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A34F241E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeUnBRPBJln4; Thu,  9 Nov 2023 19:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA05341E32;
	Thu,  9 Nov 2023 19:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA05341E32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2FE1BF385
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 19:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55BE081F42
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 19:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55BE081F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KKkUZkkjyur for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 19:06:30 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 244C381337
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 19:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244C381337
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc9784dbc1so10538455ad.2
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 11:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699556789; x=1700161589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iG5osfqUw+QVLpKw4R9Xw+KCURPEVs8wrHXqfCixvrs=;
 b=S+lUz7uyMW+eKqrBTiBB8jA2EhFEbAuzzXurq1AWHVmpB5f8+P7bawXAiVdzMh3bzb
 q+KKf/X6HlRyevYMVfqjzg2sYEUBH+FlQ8dw1s9P2bC2JtUi2mTEsElyAAtSmK9NG0TN
 ThB4uz0NSVPir6M96HH4gtc2cCqwzGVZt3+GZHLqdjnv8G8KcQxnMWK5f+bj6aQqAIOZ
 iKz8kTxyoUvUcutvS0y2IqiYurRPfYMfbNB18spJogYCifyRIdW9Psf5gvKfFwfQZmrX
 tTvc3xwDcBTU0kGTB7JpdPq2hNs/nlqaUWEP6cNhbowhua6y+ERTCRcoCvgMk6FpreQC
 KtIQ==
X-Gm-Message-State: AOJu0Yz+QQzq3gmOuihqDn+fsqX0OMFGVkirJtXqcwq/FPDewsURm4wL
 6anfjTEj9w5mwoSrNmNGH3IWVVhlmYYRmJq3cKZj2Mg9Eng=
X-Google-Smtp-Source: AGHT+IGYiAmGPQPNOR9FWlMFSJRcQ1VoYjMDDANYt81DR48ZW3OT46riIDAd/ftWpsmY7p9ZuwXO8Q==
X-Received: by 2002:a17:90b:4f88:b0:27d:75f2:a3ee with SMTP id
 qe8-20020a17090b4f8800b0027d75f2a3eemr2453318pjb.10.1699556788787; 
 Thu, 09 Nov 2023 11:06:28 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a17090ad78200b002794fe14cabsm147671pju.12.2023.11.09.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 11:06:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 12:06:23 -0700
Message-ID: <20231109190623.589747-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699556789; x=1700161589;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iG5osfqUw+QVLpKw4R9Xw+KCURPEVs8wrHXqfCixvrs=;
 b=p6MdTyqkWWsqfq5nOEvuftO4beP/2hcWwbXSCSD0qqArl9R2a0scbGzUVrKgKV/T6p
 lOyQLn7wg+rpjeTDTmE2tx55QBE6gdM4ayy3IWRGdPGq2tXb96kHj+c3ena6gaIBiMOo
 L5a3/fLXTrM97SDXxKC/iSt8kQiH8xyszZdho=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p6MdTyqk
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: do not use
 host-prelink-cross
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Internally, gobject-introspection processes the output of ldd with regexes,
and works properly with what objdump -p is printing. Gobject-introspection only
resolves the library name as passed to the linker to the library file name and
does not need the recursive resolution that ldd is doing and objdump is not.

This change also allows us to remove patches 0002 and 0003 as they are
prelink-rtld specific.

Tested on Fedora 39 and Debian 11, with AArch64, X86_64, and S390x.
Also tested with:
./support/testing/run-tests tests.package.test_python_gobject

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0002-Add-rpath-links-to-ccompiler.patch   | 29 -----------------
 ...-error-return-codes-from-ldd-wrapper.patch | 31 -------------------
 .../g-ir-scanner-lddwrapper.in                |  2 +-
 .../gobject-introspection.mk                  |  4 +--
 4 files changed, 3 insertions(+), 63 deletions(-)
 delete mode 100644 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
 delete mode 100644 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch

diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
deleted file mode 100644
index a8cf332f21..0000000000
--- a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 952e2e2bb6a22ec8824223b03b65cb28361c6e34 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Wed, 14 Mar 2018 12:07:10 -0400
-Subject: [PATCH] Add rpath links to ccompiler
-
-This patch allows gobject-introspection to process extra paths passed to the
-compiler via the GIR_EXTRA_LIBS_PATH variable.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/ccompiler.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index cb97e76f..d29b28c8 100644
---- a/giscanner/ccompiler.py
-+++ b/giscanner/ccompiler.py
-@@ -266,6 +266,8 @@ class CCompiler(object):
- 
-         for envvar in runtime_path_envvar:
-             if envvar in os.environ:
-+                for envvar_path in os.environ[envvar].split(':'):
-+                    args.append("-Wl,-rpath-link," + envvar_path)
-                 os.environ[envvar] = \
-                     os.pathsep.join(runtime_paths + [os.environ[envvar]])
-             else:
--- 
-2.25.1
-
diff --git a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
deleted file mode 100644
index f1ea518954..0000000000
--- a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e0fc4a2a5161a36483ddc518be9bb14390f11b19 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 5 Sep 2018 16:46:52 +0200
-Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
-
-prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
-It is not an error per se, but it breaks subprocess.check_output().
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/shlibs.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 9f8ab5df..7a1a72fe 100644
---- a/giscanner/shlibs.py
-+++ b/giscanner/shlibs.py
-@@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
-             args.extend(['otool', '-L', binary.args[0]])
-         else:
-             args.extend(['ldd', binary.args[0]])
--        output = subprocess.check_output(args)
-+        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
-         if isinstance(output, bytes):
-             output = output.decode("utf-8", "replace")
- 
--- 
-2.25.1
-
diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
index 2f09bca77a..10393feae2 100644
--- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -1,3 +1,3 @@
 #!/usr/bin/env sh
 
-"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
+@OBJDUMP@ -p "$@"
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f0c7fcd2ca..7786fa74fe 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -15,7 +15,6 @@ GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scanner
 GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-autoconf-archive \
 	host-gobject-introspection \
-	host-prelink-cross \
 	host-qemu \
 	libffi \
 	libglib2 \
@@ -78,7 +77,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
 
 	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
-
+	$(SED) "s%@OBJDUMP@%$(TARGET_OBJDUMP)%g" \
+		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
 	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
