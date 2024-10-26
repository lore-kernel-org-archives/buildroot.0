Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008C9D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3446640293;
	Sat, 26 Oct 2024 19:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHA6M7y5OsI1; Sat, 26 Oct 2024 19:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F664403A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F664403A8;
	Sat, 26 Oct 2024 19:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A26115C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822624026F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOQW7WSPQ5HR for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F174027E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82F174027E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B3A984108; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:14:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04892eca6369dbc20e96a18a560c9bcf68687c23
X-Git-Newrev: a51a55262d53a839fe53f546b1f854f81da49b33
X-Patchwork-Hint: ignore
Message-Id: <20241026191437.6B3A984108@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/andes/ae350/readme.txt: add
 bootloader/DT flashing instructions
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

commit: https://git.buildroot.net/buildroot/commit/?id=a51a55262d53a839fe53f546b1f854f81da49b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a section to document how to update bootloader on AE350 platforms
with SPI_burn tool.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/andes/ae350/readme.txt | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
index 4de4cb3894..36561fc777 100644
--- a/board/andes/ae350/readme.txt
+++ b/board/andes/ae350/readme.txt
@@ -41,6 +41,49 @@ After building, you should obtain the following files:
   |-- u-boot-spl.bin
   `-- u-boot.itb
 
+How to update the bootloader and device-tree
+============================================
+
+To update the bootloader and device tree, make sure you have
+an ICEman (Andes OpenOCD [1]) and AICE [2] connection set up
+as below:
+
+  Local Host                 Local/Remote Host
+ .-----------------.          .--------------.
+ | buildroot images|          |              |
+ |                 |         ICEman host <IP:PORT>
+ | .----------.    |          |  .--------.  |
+ | | SPI_burn |<---+--socket--+->| ICEman |  |
+ | '----------'    |          |  '--.-----'  |
+ '-----------------'          '-----|--------'
+                                    |
+                                    USB
+   .--------------.                 |
+   | target       |           .-----v-----.
+   | board        <----JTAG---| AICE      |
+   |              |           '-----------'
+   '--------------'
+
+[1] https://github.com/andestech/ICEman
+[2] https://www.andestech.com/en/products-solutions/andeshape-platforms/aice-micro/
+
+The Andes SPI_burn tool will be located in output/host/bin. Use
+the following commands to update the bootloader and device tree:
+
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x0     -i u-boot-spl.bin
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x10000 -i u-boot.itb
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0xf0000 -i ae350_ax45mp.dtb
+
+Note that the --addr option specifies the offset starting from
+the flash base address 0x80000000 and set by U-Boot configurations.
+e.g.
+u-boot-spl.bin  : CONFIG_SPL_TEXT_BASE=0x80000000
+u-boot.itb      : CONFIG_SPL_LOAD_FIT_ADDRESS=0x80010000
+ae350_ax45mp.dtb: CONFIG_SYS_FDT_BASE=0x800f0000
+
+How to write the SD card
+========================
+
 Copy the sdcard.img to a SD card with "dd":
 
   $ sudo dd if=sdcard.img of=/dev/sdX bs=4096
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
