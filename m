Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8C6C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 221D883E88;
	Sat,  6 Jan 2024 09:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221D883E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPuuQ7CoP_am; Sat,  6 Jan 2024 09:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F14483E2C;
	Sat,  6 Jan 2024 09:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F14483E2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510481BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 376ED83E2A
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376ED83E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY501VRiSf4c for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:49:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ACF883E24
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACF883E24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0773784559; Sat,  6 Jan 2024 09:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:47:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f259092d363867c0f99ad96edba4a11a9a4c71bb
X-Git-Newrev: aa10975643f6d779ad21ab6ac9595762a93a70f9
X-Patchwork-Hint: ignore
Message-Id: <20240106094937.0773784559@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: needs headers >= 5.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa10975643f6d779ad21ab6ac9595762a93a70f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libostree unconditionally uses loop_config since bump to version 2023.5
in commit c64a3e9767757f6bab0ecf2df35871508003f39e and
https://github.com/containers/composefs/commit/d7f24100c932cd0da9c315de7c7d44fe7a5005cd
which is only available with kernel >= 5.8 and
https://github.com/torvalds/linux/commit/3448914e8cc550ba792d4ccc74471d1ca4293aae
resulting in the following build failure:

composefs/libcomposefs/lcfs-mount.c: In function 'setup_loopback':
composefs/libcomposefs/lcfs-mount.c:273:16: error: variable 'loopconfig' has initializer but incomplete type
  273 |         struct loop_config loopconfig = { 0 };
      |                ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25d9d4f256861628ddd8e8ce659a39655d27b457
 - http://autobuild.buildroot.org/results/5c7e1e47c6eb43f7832ef7820ec2b5ac0f3c3696

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 9c59413eb1..49eed6517e 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBOSTREE
 	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # linux/fsverity.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8 # loop_config
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
@@ -19,9 +19,9 @@ config BR2_PACKAGE_LIBOSTREE
 
 	  https://ostree.readthedocs.io/en/latest/
 
-comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.4"
+comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
