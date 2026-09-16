Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873C5C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384CF40714;
	Wed, 16 Sep 2026 18:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5kOXMzhh3Pp; Wed, 16 Sep 2026 18:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49DB540718
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584713;
	b=XSgR032EWBDmqZqJn9FGtzhlosq0d6FQwIQ2NmgBLnTLXsqdqs3NDDknQotSP5vTSCy0
	 dXFj3OPPwnsn5AoLd9ST0TI1W4hSLguvfAWSv8mm0ObJquXST0962eepcm1N2rNEsVEuX
	 USZCTru7i/nYJtNhYRucSfAsCacp4VjS+lYGQQZGOuvkIFTPTUFlORGJzGsHWUstxSJgg
	 Dk4oiz01Ewuawxuc8TpZ4v6E+93VYWYisNDcxP76mnJcuHTBLotFc9T+1zPY8MORbkREm
	 f9rSQFxj06AczcRE/KOdqI1ttIqLgynBhss4cHJf1U+G3uAYjWF6byzZal+pCFcs1yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qvR+5oINy1N8OPOrkJ6mNp6SSCWghCa5E5NOMB9FudI=;
	b=SBjcujrJFwxwTcVEcFY3FPoo3IkJOaVMKVhdxHhIM2LOCCRh0wET80AvNS1kJaW14CVV
	 4pviqXKlygmRqwwdoA7JxE/f+VPQ8PSsW1oSlNqCcSSM16DUcxbTebfCYClEQ+Am0tQV+
	 e4O4huxkbOLVnfWn1ws18olHGqs/Z7IKSEIQPo5ajPrfxA+lymu8DRkAWf4LCc7hsMkuG
	 W6BwobL99jFdiW1g7mfvYWnzbyld85CFVye0id07/mEjzEWOrMDrDYZ4BLWWUZgjIbuDx
	 gEsnxIhMCbxwtnazOng8mfesYM3oBgPmsSI9cKtMTW1PZEyCt5xIcTGETxhZSmiR5lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584713;
	bh=qvR+5oINy1N8OPOrkJ6mNp6SSCWghCa5E5NOMB9FudI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RhiU4pvFTTPgTqBMpEHka70OuD0wfwljRTjttijvQLul0vv2qnxMyQnwWb7ccbRdt
	 kYzhS17kJBBbO67aYmtyfqEA23FwbvaAcVMCSzKJQZy7RmCiwCGh5MM+zq0+jqbP/f
	 M+bzdH13OmMdNRZjy80a8KgTjuKjKNK069oNC+wL7p6HqLsuuBC4IsT/JDyd0rn6XE
	 QGskYcAzwpUhCBfV0AwWTMvUK1zbbo1wHuzCDjAppdH8xADx4J7HjosC1518u/Zzb+
	 Qzszna+7UYjuY56H3rgSV4dIoAdZb2Gc/dYIF5OuiiKGSG+OCL9ygc43ZHtcKQPrvJ
	 VIvnTnabc/CvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DB540718;
	Wed, 16 Sep 2026 18:51:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 363B8977
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28E5580D98
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL3J7UQIiSja for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:51:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6991A80CBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584710;
 b=VY098Xw5/mWQh5bCT+eT/7A2zO4Cw2f7d8/OfCvwD/QDpvmCp8TwTnpAbHuVzFsIVxp/
 QOvSP2clgojKBUtZkvcg2p4cbJxmcZ/VeuWREKKlXNP8ZYTv43yLha8fGWYDnsi11fzEU
 2TWW/hYRjYk5C8SNbyd335WFE2Tzqicjgyszf3/ep4iHXPIUmzM0YF0wMIvWbbfBNxMxk
 CESLqQ81eb7nbgkgMWpf35bQ8WbTwgJ2Uex7bZdG+On36XUIt4syiVpM49fDAWzgia8a6
 UP9edRvlG19DqsZim6qDEVT56EHQFHMTalWjIJeMDgiubrPigppFbQUJWL9MpMpfb9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584710;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bo7af200vq0tE5qU4kQ6yBmTCqJQ5Yh/+ygrI01EzN8=;
 b=Igk+gjwSkTQve84x3hQHCdrpwBU+ACtn8gHNUCRn8hYtuPbyml0bq+mGksSR4ezz0+2m
 5cjeA2+KmFNxjSRu7cshTLP04fSDo6FmlJzfrWKg1uFWGZZKnSJGEWRCdYw+X1IGUQ6DT
 QS56BxBcdEUj0tOkaD4AO3ZeLD+COAfF7w0+lbLz52XSxJUpTUCbZvhG0Z0u4zSQBLF/1
 58rKcpIaLUIC33s2tN66JZJJxg4JINPAj1e6nXuGzNfTDfwEHL22fNs7bkGvPRX6beaV0
 eLE01QJqZ27rf26FDfvbsFQ126K5Eu0EuMIJ0GU0vtyeQYzRhsvSWy2rfLT1faVLWeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6991A80CBA
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D40649611F; Wed, 16 Sep 2026 18:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:50:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69283cd161fe5b796e03459d714c9f7b340d5d90
X-Git-Newrev: 6e2e24a7404a1bdbc7e02c1307d268f8425dee7c
X-Patchwork-Hint: ignore
Message-Id: <20260916185043.D40649611F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuci: bump version to 74f6277
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e2e24a7404a1bdbc7e02c1307d268f8425dee7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:

 - 74f6277 cli: in batch mode, print empty line if get fails
 - ccc1719 libuci: fix extra new lines added to errorstr
 - 66127cd formal: fix workflow permissions
 - 5bea135 github: ci: add MIPS64, PowerPC64 and RISCV64
 - ebb3a01 build: install uci
 - 238963f github: ci: add powerpc arch
 - dec51f4 github: ci: add cmake build and source directories
 - 8022b2e uci: add a simple build script
 - e1ab90c github: ci: add tests
 - b65c091 github: ci: disable json-c tests
 - c1e2eee github: fix CI apt dependencies
 - 2e46a74 github: improve CI
 - 57c1e8c github: add CI build
 - 5e69eda CMakeLists: fix CMake warning for INCLUDE macro
 - 272fc13 lua: CMakeLists: drop redundant cmake_minimum_required
 - a072095 lua: CMakeLists: update cmake minimum required version to 3.10
 - 9033e8c blob: use blobmsg_parse_attr in __uci_blob_check_equal

This bump fixes the configure failure with cmake 4.x when the Lua
bindings are enabled: upstream commits a072095 and 272fc13 drop the
"cmake_minimum_required(VERSION 2.6)" statement from lua/CMakeLists.txt,
so the Lua subdirectory now inherits the top-level 3.13 minimum instead
of being rejected with "Compatibility with CMake < 3.5 has been removed
from CMake".

The license file hashes are updated as well, cli.c and libuci.c changed
but their license headers are untouched.

Fixes:
https://autobuild.buildroot.org/results/43ce08497863ff54c8acf3b0bbe7cfbdbc640d14/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuci/libuci.hash | 6 +++---
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 1e429f8160..b0a59da84b 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d3b12df54f9faa69f0ff6d2a239fdcc30d64eda5269ddc882cf97677ea8cb066  libuci-f3fc0b76040685829191debc03edf72f486ae8ae-git4.tar.gz
-sha256  5bb12361838b588bb263ade8537f5ae1a5e62d54b0a8f0640489db8cc29831d8  cli.c
-sha256  bbc34ea5f391abc3b27416dc3c96b0f71f852c44210faf1cde0990218f68b13a  libuci.c
+sha256  e2449f5ff75de32410944c850be6d3903bcfc8ffe55d450076a4216b3f7cd715  libuci-74f6277aabffc943d026f406df57c22595134c42-git4.tar.gz
+sha256  a8bb483fcaf86fc23f32b6f6a13773146250dc09fb3c0b8cd17d2ad79802dc14  cli.c
+sha256  a0a69780aaf898684d1f2eec2132eb0d565acaf870045d975920981ac4c9b48e  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 3c7e12baae..a8ef14ec93 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = f3fc0b76040685829191debc03edf72f486ae8ae
+LIBUCI_VERSION = 74f6277aabffc943d026f406df57c22595134c42
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
