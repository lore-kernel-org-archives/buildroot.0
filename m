Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE92D74940
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F0F60590;
	Tue, 29 Oct 2024 21:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG_yUszxeWLf; Tue, 29 Oct 2024 21:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E39605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E39605DD;
	Tue, 29 Oct 2024 21:33:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A35305E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834D6405F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8n6ArYqz3UpK for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 857E74055E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 857E74055E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:33:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FFA484AC7; Tue, 29 Oct 2024 21:33:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 22:32:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2de79d7065bc27c94b654232b12acd0af582a0ad
X-Git-Newrev: 120218981e6e07b4d73ae3431d2f1b3f317ac5e4
X-Patchwork-Hint: ignore
Message-Id: <20241029213300.6FFA484AC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/acmesystems/acqua-a5: update device
 tree for newer kernels
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

commit: https://git.buildroot.net/buildroot/commit/?id=120218981e6e07b4d73ae3431d2f1b3f317ac5e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Ethernet MAC address of the Acqua board is stored in an onboard
EEPROM. Its location is described in the device tree as:

        eeprom@58 {  // NVMEM node
                // EEPROM parameters...

                eth0_addr: eth-mac-addr@9A {  // NVMEM cells
                        reg = <0x0 0x06>;
                };
        };

Since Linux 6.5, defining NVMEM cells this way, as direct children of
the NVMEM node, is deprecated. It is instead recommended to wrap the
cells inside a "fixed-layout" node.

The older, deprecated syntax is still supported on Linux 6.6. Since
Linux 6.7 (commit 2cc3b37f5b6d: "nvmem: add explicit config option to
read old syntax fixed OF cells") however, it is only supported by
selected NVMEM drivers. It is not supported by the at24 driver used to
access the Acqua's onboard EEPROM.

Update the device tree to the new, recommended, syntax. This makes it
work with newer kernels, while preserving compatibility with the
currently used 6.6.30.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
index a7a4a20352..411d1942f5 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
@@ -149,8 +149,14 @@
 					#address-cells = <1>;
 					#size-cells = <1>;
 
-					eth0_addr: eth-mac-addr@9A {
-						reg = <0x0 0x06>;
+					nvmem-layout {
+						compatible = "fixed-layout";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						eth0_addr: eth-mac-addr@9A {
+							reg = <0x0 0x06>;
+						};
 					};
 				};
 				
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
