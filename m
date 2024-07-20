Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66939C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B67F4053B;
	Sat, 20 Jul 2024 21:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuJv05YmVEBE; Sat, 20 Jul 2024 21:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F1F4055F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07F1F4055F;
	Sat, 20 Jul 2024 21:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCA531BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8BFB81DEB
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odjbbm8MDZVT for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF4C81D3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF4C81D3A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F40B884440; Sat, 20 Jul 2024 21:13:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:12:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f04a95f79f087869a44ea3d63d55ce7b27b8e922
X-Git-Newrev: 58983179e4f8849ca4e9d6bb063c2f5bd232235a
X-Patchwork-Hint: ignore
Message-Id: <20240720211353.F40B884440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=58983179e4f8849ca4e9d6bb063c2f5bd232235a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the following build failure raised since switch
to meson-package in commit 37dded43ae681e8319d7b76f9a612c71991467a9:

../stlinkv3_spi.c: In function 'stlinkv3_spi_init':
../stlinkv3_spi.c:508:12: error: 'stlinkv3_handle' may be used uninitialized [-Werror=maybe-uninitialized]
  508 |         if (!stlinkv3_handle) {
      |            ^
../stlinkv3_spi.c:485:31: note: 'stlinkv3_handle' was declared here
  485 |         libusb_device_handle *stlinkv3_handle;
      |                               ^~~~~~~~~~~~~~~

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/eecabbdd0d21344991379a57e605845e73ef679e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 60774b9621..0b474caab4 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -15,7 +15,8 @@ FLASHROM_CONF_OPTS = \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
-	-Duse_internal_dmi=true
+	-Duse_internal_dmi=true \
+	-Dwerror=false
 
 FLASHROM_PROGRAMMERS = \
 	buspirate_spi \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
