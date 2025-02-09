Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097D1C021A0
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 08:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF3381F20;
	Sun,  9 Feb 2025 08:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUQh6T30BTHn; Sun,  9 Feb 2025 08:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD26C81F25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD26C81F25;
	Sun,  9 Feb 2025 08:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ECEF6C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D50E402E0
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2jvT_wJOMYD for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 08:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC7840242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC7840242
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:06:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02B2B872FB; Sun,  9 Feb 2025 08:06:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 08:47:28 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4e1f339a6b885dfff408fb1419822a9ae3f5f649
X-Git-Newrev: 5a63cd58fff48e754720582ce9ce3571d5f1cc13
X-Patchwork-Hint: ignore
Message-Id: <20250209080618.02B2B872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/elfutils: enable
 zstd support for host package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a63cd58fff48e754720582ce9ce3571d5f1cc13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Buildroot fails to build Linux kernel configurations where BTF support
is enabled together with zstd compression of debugging information.
The reason is in host-elfutils zstd support being explicitly disabled.
So enable zstd support in host-elfutils by default to fix such builds.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 315672feec151cf3a19eaf7f9932daa2c5d838ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8738af7751..1a1aca37b3 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -12,7 +12,7 @@ ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_CPE_ID_VALID = YES
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
-HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
+HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz host-zstd
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
@@ -26,7 +26,7 @@ ELFUTILS_CONF_OPTS += \
 HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
-	--without-zstd \
+	--with-zstd \
 	--disable-demangler \
 	--disable-progs
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
