Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A6CC35FFB
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11EA4129D;
	Wed, 19 Mar 2025 20:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tknJobtqzzba; Wed, 19 Mar 2025 20:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3DEB41251
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3DEB41251;
	Wed, 19 Mar 2025 20:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C7201A7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A463814B7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOUizI5eU8py for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7765A8151E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7765A8151E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6394380408; Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Mar 2025 21:15:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25af5a3b3aa3480ee10158e55c280d675430442a
X-Git-Newrev: 088808ccc74323dc78439c6980e9760b5be1dee2
X-Patchwork-Hint: ignore
Message-Id: <20250319202138.6394380408@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: fix menuconfig
 visualization
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

commit: https://git.buildroot.net/buildroot/commit/?id=088808ccc74323dc78439c6980e9760b5be1dee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to how menuconfig works, a 'comment' entry following a 'config' entry
prevents correct indentation of items depending on the 'config'
entry. xilinx-embeddedsw currently shows as:

  [*] xilinx-embeddedsw
      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
  [ ] versal plm (NEW)
  [ ] versal psmfw (NEW)
  [ ] zynqmp pmufw (NEW)
  [ ] xilinx-prebuilt

So the 'versal *' and 'zynqmp pmufw' items are not indented even though
they should be.

Do like most other Config.in files which have the 'comment' before the
'config' entry, makeing it render as expected:

      *** xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf ***
  [*] xilinx-embeddedsw
  (xilinx_v2024.2) xilinx-embeddedsw version (NEW)
  [ ]   versal plm (NEW)
  [ ]   versal psmfw (NEW)
  [ ]   zynqmp pmufw (NEW)
  [ ] xilinx-prebuilt

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-embeddedsw/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index b0691d7e7b..007b24e668 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,3 +1,6 @@
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
 config BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
@@ -14,9 +17,6 @@ config BR2_TARGET_XILINX_EMBEDDEDSW
 	  Applications can be found on the Xilinx embeddedsw repo:
 	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
 
-comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
-
 if BR2_TARGET_XILINX_EMBEDDEDSW
 
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
