Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F252FC9EFE
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 14:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB26A841CA;
	Sat,  7 Mar 2026 14:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFxUtkFu5uJO; Sat,  7 Mar 2026 14:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57AE841C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772894783;
	bh=MeLv7cLJquTqSjxvIPXRITPwJzaClQ7nF9GfvFdse0M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gVLQ2Wp8DJLPCq6VbdA23VU/AL1zHNFYFeveJTzNNF70JEixS+qxc1gLBFNxnJWpb
	 wAxY0SnciVq6ElBa3yIn7CBUuT/eDqHIE19ZjR2NVgK+4CePfsBAcu9Oysul9uIEXi
	 KYETBNPLXC+vmPNNTTSBeFtoziUOiFJg60lRV0+AEwyqfez2JC4EENMU3qnEjWPf1S
	 4GpGC6186KO5TZ/F5GKbKqSciz0z/ASTt0EzoIrfmTB/opj919Sx7E9QtWc1U9mW0H
	 hBfCClsYqEoQVGx4vY/aTfVTC/MuKEG6ZChxV+0JyRWYkdSZCMIGYzcs6Ep0KITfwC
	 A9VSNAJW4fMPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57AE841C1;
	Sat,  7 Mar 2026 14:46:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 413A4223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2372A41DAE
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_U2nhRYGmnF for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 14:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A73D541DAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73D541DAC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A73D541DAC
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:46:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2750CA4C37E4;
 Sat,  7 Mar 2026 15:46:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50530)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vysv2-000000006hG-08QQ;
 Sat, 07 Mar 2026 14:46:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sat,  7 Mar 2026 15:46:15 +0100
Message-ID: <20260307144615.711975-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772894777;
 bh=DxZ4KJgofGgGdY6j2WfK+F9icSch048g0TdBMvX+plk=;
 h=From:To:Cc:Subject:Date:From;
 b=JZQDI1fMzRxh9s6PHr2JSiAp9AqPe+GDoRM/rl+70EFD4rqyr5Hd4dcQzJEYLPBd7
 XyzfYv/OpycganCVPxfnwk/DUz2rwFSTygsPaMTOC/x82eoIb3OmZ08wbeI98skekT
 /yH5stXNZ/pQ7kCH76ieOsIhSq0EtI6xuCwR4AWc28EqVUo3/3EHj71tKAMRT0Exzg
 RQ52jhGk15WaEzjFWs/qQw9Ja/F0bRWc7sveHBZC2gdgurHKkJBo4k5RDlW8IORSg2
 eeXqVcABT2h83neckhG8UH1eOzw0n1CkmRCRLuPGs2LmEEHZYHfKFzd0Rg5kHpEts6
 PVHEEaPFBwQzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JZQDI1fM
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: bump version to 6.14
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

Replaced install_prefix with DESTDIR in _INSTALL_TARGET_OPTS following
changes in upstream Makefiles, for example:
https://github.com/xscreensaver/xscreensaver/commit/acb9dd88dc469a02fd0451c58b4f588a5efab6e9#diff-d56275146b88014f5017f78d3eb4ccdb545c8b82d94877b09ef33bac8f228414L13

Build-tested using this defconfig

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSCREENSAVER=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED

32 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xscreensaver/xscreensaver.hash | 2 +-
 package/xscreensaver/xscreensaver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index b8a27a0515..441b7fbe6b 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4ff6798217e3bbbc3c7336beeda7e83eafbf03301ac29b2236da66a0f1317643  xscreensaver-6.12.tar.gz
+sha256  07f310eb60ece3a6c57abaa722d7209a2c4f54309a5a7b09b6eed20152d073f2  xscreensaver-6.14.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index f9e28e4551..480f065dfd 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 6.12
+XSCREENSAVER_VERSION = 6.14
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
@@ -78,6 +78,6 @@ else
 XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=no
 endif
 
-XSCREENSAVER_INSTALL_TARGET_OPTS = install_prefix="$(TARGET_DIR)" install
+XSCREENSAVER_INSTALL_TARGET_OPTS = DESTDIR="$(TARGET_DIR)" install
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
