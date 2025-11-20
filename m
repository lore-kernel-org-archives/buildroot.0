Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3DCFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A398427BE;
	Thu, 20 Nov 2025 21:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvdpxhBrbn5Y; Thu, 20 Nov 2025 21:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F58041EE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F58041EE2;
	Thu, 20 Nov 2025 21:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EE24122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 859F3812BA
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1bKjECqoG-s for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 21:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 803D38120A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803D38120A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 803D38120A
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 21:17:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca64.dip0.t-ipconnect.de [79.214.202.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 920B6A4C72BA
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:17:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMC2F-000000004Vo-0Ir5
 for buildroot@buildroot.org; Thu, 20 Nov 2025 21:17:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:17:47 +0100
Message-ID: <20251120211747.1687323-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763673467;
 bh=zNzQ4pqPEhfNug+5xmUB5fjaZVYwRYu1Ci6tkSkFpR4=;
 h=From:To:Subject:Date:From;
 b=y0ij6qVkwOyRhIzkdUVtXTJm7cuLFUyWAiKIBPU+gbOMcQ1JtHoKZsrNPpGjgR7Zw
 g7A81NvBzcKOPPGs1riiu+BJci7Ek7mrfr8FNHbn4lxT3lh/LvQ9XZuznS36hDGJSs
 lN17qvPW+PvcfJcuy764srGgc9J/hBRun+yrY3vujSgVmzk7sWnVw30lALbKL4FYnv
 WguN3GPpu3MlV90POSWupFfVr8CU1yzC08zY+FS/h4F6fCUwBkRdiWulYjQcLvJZTi
 UKYbbvP60IkqzcyeT8bUHUR6fJzdIme69TScP/jXst3NV3DGMan/BV9FbHoRS6MmWY
 SUF1D0Vjr5yFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=y0ij6qVk
Subject: [Buildroot] [PATCH 1/1] package/php-memcached: bump version to 3.4.0
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

Changelog: https://pecl.php.net/package-changelog.php?package=memcached

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-memcached/php-memcached.hash | 2 +-
 package/php-memcached/php-memcached.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index 162d25f795..08a90f13b4 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2a41143a7b29f4a962a3805b77aa207a99e4566e2d314ce98a051cd24d6e9636  memcached-3.2.0.tgz
+sha256  c163434eb0da97c8f45c7ad41d979d381f8b81c49402b1b90b063987fb37972e  memcached-3.4.0.tgz
 sha256  24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
 sha256  a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
 sha256  bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index f92a8ddf4c..e45390e5a2 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 3.2.0
+PHP_MEMCACHED_VERSION = 3.4.0
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
