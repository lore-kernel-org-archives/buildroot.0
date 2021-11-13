Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20EDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F22261106
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F22261106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ED5640281;
	Sat, 13 Nov 2021 17:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b--uOP8I-n8b; Sat, 13 Nov 2021 17:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7989C40299;
	Sat, 13 Nov 2021 17:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5951BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C5C440355
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnZyM6Ecb4CE for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53977402FE
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EFE8B8CA1A; Sat, 13 Nov 2021 17:00:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:04:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea9a411a3f7a379fcdef2519a254138fffd937d6
X-Git-Newrev: eeb5cc0eebd96f4cac48181efd25e29189e74508
X-Patchwork-Hint: ignore
Message-Id: <20211113170013.EFE8B8CA1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firmware-utils: needs dynamic
 library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eeb5cc0eebd96f4cac48181efd25e29189e74508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As usual with cmake packages, static builds are not supported and result
in the following build failure:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): in function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x54): undefined reference to `inflate'

Instead of patching CMakeLists.txt to add a call to pkg-config, add a
dependency on dynamic library

Fixes:
 - http://autobuild.buildroot.org/results/16a89075e6a809a551e7155a64a4e6b6701428e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/firmware-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
index 501b89b453..7753360702 100644
--- a/package/firmware-utils/Config.in
+++ b/package/firmware-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FIRMWARE_UTILS
 	bool "firmware-utils"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -14,3 +15,6 @@ config BR2_PACKAGE_FIRMWARE_UTILS
 	  extract a part of firmware image and flash it.
 
 	  https://git.openwrt.org/?p=project/firmware-utils.git;a=summary
+
+comment "firmware-utils needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
