Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45E3C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 19:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8560042DBA;
	Fri, 25 Apr 2025 19:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8j1ZoKxzIO0f; Fri, 25 Apr 2025 19:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A356842DBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A356842DBD;
	Fri, 25 Apr 2025 19:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB938159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D4C42DBD
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRT4NSqDx0bO for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 19:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9F4642DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F4642DC1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9F4642DC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D1741B005B2;
 Fri, 25 Apr 2025 21:25:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 25 Apr 2025 21:24:58 +0200
Message-ID: <20250425192458.2276762-2-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425192458.2276762-1-ju.o@free.fr>
References: <20250425192458.2276762-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745609114;
 bh=FWV5HsUCVPXWf5SYuMEtLwMdRmfmLqGKVygZ9ccr4Tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FoUQL862bVLEgNNV2AE8aOW0SKF7kRmTT9jpQkiJS7a6Rp2agYXGExQ6dYhLIw6H8
 cwZ03CGxPdxWjt4nGWJqExzJOpLyKwwmoV1vEomNefSvO/ZuaRt5/ikWm/5xBD9FP2
 vu8upX9zwU9LxZ5GMHC5N0H/ssLSwQWcm9ELLQotouzh0IOuWZRsqxqM8gJoqwKZh0
 Kwc+DlSlkO9kVWot7+VsnB7r/ZUeoklkY7uXmEu0kEZoVqoYyj+XiHbJqdKBTgxA1N
 wLgm1CCX1uKvSg3zGaxXb0Yar+BR4I5bIaB3L/uMTwCvatR2XpUvqUnu2WZj+nwWhk
 u9v423y/wDFYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FoUQL862
Subject: [Buildroot] [PATCH 2/2] package/libqrencode: fix the _SITE package
 download url
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

The qrencode release archive is no longer distributed at [1].
This url now shows a HTTP/404 not found error.

The qrencode homepage [2] states:
"You can download the source packages at Releases[3] page at GitHub."

This commit updates the package download url to use github. The github
archive is not the same as the old release archive: it does not
contain the autotools configure script. For this reason, the hash
archive is updated and "_AUTORECONF = YES" is also added.

This commit also fixes the zbar runtime test [4] which is using
libqrencode to generate a qrcode to test zbar.

Fixes: [4]

[1] http://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz
[2] https://fukuchi.org/en/works/qrencode/
[3] https://github.com/fukuchi/libqrencode/releases
[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022888

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9834933196
---
 package/libqrencode/libqrencode.hash | 4 ++--
 package/libqrencode/libqrencode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
index ffcc537379..4586159420 100644
--- a/package/libqrencode/libqrencode.hash
+++ b/package/libqrencode/libqrencode.hash
@@ -1,5 +1,5 @@
-# From http://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz.sha
-sha512  209bb656ae3f391b03c7b3ceb03e34f7320b0105babf48b619e7a299528b8828449e0e7696f0b5db0d99170a81709d0518e34835229a748701e7df784e58a9ce  qrencode-4.1.1.tar.gz
+# Locally computed:
+sha256  5385bc1b8c2f20f3b91d258bf8ccc8cf62023935df2d2676b5b67049f31a049c  libqrencode-4.1.1.tar.gz
 
 # Hash for license file:
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 0062a96a39..8698d88611 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 LIBQRENCODE_VERSION = 4.1.1
-LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
-LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
+LIBQRENCODE_SITE = $(call github,fukuchi,libqrencode,v$(LIBQRENCODE_VERSION))
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
 LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPL-2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
+LIBQRENCODE_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBQRENCODE_CONF_ENV += LIBS='-pthread'
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
