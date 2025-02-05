Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9860FC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E6460678;
	Wed,  5 Feb 2025 15:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sZEl3rdWmZL; Wed,  5 Feb 2025 15:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785C560ADB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 785C560ADB;
	Wed,  5 Feb 2025 15:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 082DC12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E474383EE5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eU5eLra1wiao for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3234D83EEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3234D83EEC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:19:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D3C3870B6; Wed,  5 Feb 2025 15:19:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:19:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebb65fcf2c96bddc17e82fa5128b73c18909ef13
X-Git-Newrev: 315672feec151cf3a19eaf7f9932daa2c5d838ec
X-Patchwork-Hint: ignore
Message-Id: <20250205151953.2D3C3870B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: enable zstd support for
 host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=315672feec151cf3a19eaf7f9932daa2c5d838ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot fails to build Linux kernel configurations where BTF support
is enabled together with zstd compression of debugging information.
The reason is in host-elfutils zstd support being explicitly disabled.
So enable zstd support in host-elfutils by default to fix such builds.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index e7c2efe867..39d6607cdf 100644
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
