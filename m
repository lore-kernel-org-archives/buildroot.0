Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31DC54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67926085F;
	Wed, 21 Feb 2024 22:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQTV4W5bmb4f; Wed, 21 Feb 2024 22:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF9E60877
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF9E60877;
	Wed, 21 Feb 2024 22:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE7DA1BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 22:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C97417D3
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 22:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7YOQ9MFyW6k for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 22:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E64CB417D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64CB417D2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E64CB417D2
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 22:03:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d8739ddd4so342324f8f.2
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 14:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553029; x=1709157829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1P7qcnjrrFx+8msyXtBpv9QQVnEh9+2WfeCXjSGuCnY=;
 b=OfK1oF3iM1NUegdj8qkYlebO/NhLinRX4f4e5q4VTyZzjtSJWE4sHMWAtpNmJBSJMf
 lEzxiINTBh7pcpQO/lYV6UMbQQMIjIVikRkrr6mkBHXevhMWcfAlveAAr+YcWzRPvhvk
 XiXlcgCsmo/YRM4zrTlSnCYaABrw6mzV4OC6I/4gUvTSYTGWrJfpdBhIUQU4J43i7EjN
 to0rsLHBWyR/Ysrvbaw6GhMeMT/0PBAaG4mM2Mv6DVx8Ex5ZJ9IoWrtEn6Qw7DLuhsm2
 GmsgrYilk9D9GAkhgAtpYLlqEgVB1GLGlRQYWTxRig7INRFv16OXM3+v1U7CYyN6++pB
 8WUQ==
X-Gm-Message-State: AOJu0YxBQJotPQMfJ4mGXnd2maYChnw722qgH5CRcIwkJNBSo2uQYeAc
 pXtJ1jtMtUkZwMgQVrJTiEnA9ZGMjspPuzilL2saBGhcVCeBBXR3LR5tFTZl
X-Google-Smtp-Source: AGHT+IF9yP6iPnTJRpZcFaHFoi/Nu/QC4JOc9UYphvV+4plSBaJm4GMwG8ZreIedFw3G3G9o0agtLQ==
X-Received: by 2002:a5d:430d:0:b0:33b:302:c08 with SMTP id
 h13-20020a5d430d000000b0033b03020c08mr14654044wrq.43.1708553028440; 
 Wed, 21 Feb 2024 14:03:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bx9-20020a5d5b09000000b0033d202abf01sm3277753wrb.28.2024.02.21.14.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 14:03:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 23:03:43 +0100
Message-ID: <20240221220343.1228278-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708553029; x=1709157829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1P7qcnjrrFx+8msyXtBpv9QQVnEh9+2WfeCXjSGuCnY=;
 b=XpgtXIjSv6pZmLwW2tdOgLFrsyu0wUn+8jcYRipoGFgC0EFmpP5fPb/U8+6VwrQzkM
 sX+l/GX85R/0SgHLOhXdndyQONvlTuY0bcJnhFRh99EO+LGjqOx41QFDRU+wOLdGXBPn
 IfyLUyjUyoyCMYArKjFev8hXswuJSw53i4YdhxTSuxQCcMaMblAE/SALMGX+OT0XblvY
 +6ZebmgOlH7LwUQGt1MUlYhYblHa7VR4EWmJ3uZI5IniJItHFbB74wfvvBg5zbFJnsT7
 0lu6QTBNxMpbo0LouzsI8sVq8qA/qL13XqKokqOVXIfSc9f12Cyd4IGQgKp6SOQn9tGo
 PIsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XpgtXIjS
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to version
 20.11.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2024-21892, CVE-2024-22019, CVE-2024-21896, CVE-2024-22017,
  CVE-2023-46809, CVE-2024-21891, CVE-2024-21890 and CVE-2024-22025

- LICENSE hash changed due to two things:
  * c-ares vendored dependency license got updated [1]. This is unused
    by buildroot though anyway
  * base64 vendored library license updated copyright years and sorted
    contributor names [2], [3]

- This bump will fix the following build failure raised since bump of
  python to version 3.12.1 in commit 36e635d2d5c0166476858aa239ccbe78e8f2af14
  thanks to
  https://github.com/nodejs/node/commit/95534ad82f4e33f53fd50efe633d43f8da70cba6
  https://github.com/nodejs/node/commit/6557c1c9b1206a85bb7d8e7450e8c3a4cff7c84b:

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-2/output-1/build/host-nodejs-src-20.9.0/configure.py", line 17, in <module>
    from distutils.version import StrictVersion
ModuleNotFoundError: No module named 'distutils'

https://github.com/nodejs/node/blob/v20.11.1/CHANGELOG.md

[1] https://github.com/c-ares/c-ares/pull/556
[2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
[3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 - http://autobuild.buildroot.org/results/8b38bc4b7879a0349c1305e2fcb458a0cfd04a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2d60437a7c..ddab345e0a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.9.0/SHASUMS256.txt.asc
-sha256  ced3ecece4b7c3a664bca3d9e34a0e3b9a31078525283a6fdb7ea2de8ca5683b  node-v20.9.0-linux-arm64.tar.xz
-sha256  64099d7e62bdbb8efd52c216a6759b3cdd77c38aa993096fdee9f875d95b2d8e  node-v20.9.0-linux-armv7l.tar.xz
-sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v20.9.0-linux-ppc64le.tar.xz
-sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
-sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
+# From https://nodejs.org/dist/v20.11.1/SHASUMS256.txt.asc
+sha256  c957f29eb4e341903520caf362534f0acd1db7be79c502ae8e283994eed07fe1  node-v20.11.1-linux-arm64.tar.xz
+sha256  28e0120d2d150a8f41717899d33167b8b32053778665583d49ff971bfd188d1b  node-v20.11.1-linux-armv7l.tar.xz
+sha256  51343cacf5cdf5c4b5e93e919d19dd373d6ef43d5f2c666eae299f26e31d08b5  node-v20.11.1-linux-ppc64le.tar.xz
+sha256  d8dab549b09672b03356aa2257699f3de3b58c96e74eb26a8b495fbdc9cf6fbe  node-v20.11.1-linux-x64.tar.xz
+sha256  77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138c7538a3c0ca5209e  node-v20.11.1.tar.xz
 # Locally calculated
-sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
+sha256  7b0bbdca72f925bd78b764914651244a4432a753c7325d061a565cd7eac1193d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9806a64d38..858c6a86f5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.9.0
+NODEJS_COMMON_VERSION = 20.11.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
