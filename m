Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C2CCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 08:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EA040804;
	Sat,  8 Nov 2025 08:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnKjp-UIFrem; Sat,  8 Nov 2025 08:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4229407E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4229407E7;
	Sat,  8 Nov 2025 08:21:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C632B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1B0D80A85
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CiEFnEhimOA for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 08:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34E1B80A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E1B80A48
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34E1B80A48
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 08:20:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20AA8A4C4399;
 Sat,  8 Nov 2025 09:20:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45612)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vHeBp-000000000jd-14MB;
 Sat, 08 Nov 2025 08:20:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  8 Nov 2025 09:20:53 +0100
Message-ID: <20251108082053.12487-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762590054;
 bh=jrTK2P4pf1a4Tgz/5mHAsLWIkQ/2kLP2GacXzWEEKMs=;
 h=From:To:Cc:Subject:Date:From;
 b=OcAWjTAGzgU+0xFq2uUGa1G0Suplwqj+2HwDtzvOmQxGGgTtIjpSsTHhKEhDTO3sx
 X0nMYvn2pn46a8PQ7ztM2vqe0H+QmzRMTmaGMJV3iHhEavFNnIBFZBzBVipFK2AXKt
 zMOXh9KpzoNqRefCvKonbwt9sd3avT9KpNyMzV0F+TVuEZ5VqnATzXWmxm7YnKWk3y
 S3kGZ7GalnNfE7/mOM7KK7kgw1slrxi3c+ahYoJ8mz9gfhBmTLzifsGWjiS0AB/N5C
 sb6CVmYm/pCtdjQf5VhawiI1dppgBTuTqWqBSP9+PeA8NzcBb4x/KpCj2OyxyGAO/z
 X6WHMkCKERQnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=OcAWjTAG
Subject: [Buildroot] [PATCH 1/1] package/libnvme: bump version to 1.16.1
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

Release notes:
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ng-cross-builds-with-OpenSSL-enabled.patch | 31 -------------------
 package/libnvme/libnvme.hash                  |  2 +-
 package/libnvme/libnvme.mk                    |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch

diff --git a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
deleted file mode 100644
index 7cf91fd98e..0000000000
--- a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 82066e5f46d743e7a7cf396be7f95e577084b93e Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <wagi@kernel.org>
-Date: Thu, 6 Nov 2025 08:10:27 +0100
-Subject: [PATCH] build: avoid breaking cross builds with OpenSSL enabled
-
-The OpenSSL sanity check wants to be executed, thus we should only try
-this if it's possible. Since this is just a warning, we can just skip it
-if it is not possible.
-
-Signed-off-by: Daniel Wagner <wagi@kernel.org>
-
-Upstream: https://github.com/linux-nvme/libnvme/pull/1090
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index dce5c68e..6d1f5204 100644
---- a/meson.build
-+++ b/meson.build
-@@ -252,7 +252,7 @@ else
-   conf.set('fallthrough', 'do {} while (0) /* fallthrough */')
- endif
- 
--if openssl_dep.found()
-+if openssl_dep.found() and meson.can_run_host_binaries()
-   if openssl_dep.type_name() != 'internal'
-     # Check for a bug in the EVP_PKEY_CTX_add1_hkdf_info implementation
-     res = cc.run(
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 66dedbbe8f..29071da1bf 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  5bb24139a113f350708fe54073e799f454d509218758060c398144b91811d176  libnvme-1.16.tar.gz
+sha256  ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579  libnvme-1.16.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 238b7041da..f9bc0be371 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.16
+LIBNVME_VERSION = 1.16.1
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
