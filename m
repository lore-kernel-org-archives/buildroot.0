Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF965C433FE
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 16:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0CD60BF8;
	Tue, 14 Dec 2021 16:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mc5_Sxfx2Ql; Tue, 14 Dec 2021 16:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D44CC60BFC;
	Tue, 14 Dec 2021 16:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E14B1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 16:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D928813E0
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NiEGQ1pVXiU for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 16:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51FDE813D6
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 16:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 99A3381DF5; Tue, 14 Dec 2021 16:20:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 17:24:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 32219136e22d15ed640ff881741012be55381982
X-Git-Newrev: 7f48212a2efffe7654f5e6fcb974aff555c5a03c
X-Patchwork-Hint: ignore
Message-Id: <20211214162000.99A3381DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/busybox: security
 bump to version 1.33.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f48212a2efffe7654f5e6fcb974aff555c5a03c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following vulnerabilities:

- CVE-2021-42374: An out-of-bounds heap read in Busybox's unlzma applet
  leads to information leak and denial of service when crafted
  LZMA-compressed input is decompressed

- CVE-2021-42375: An incorrect handling of a special element in Busybox's
  ash applet leads to denial of service when processing a crafted shell
  command, due to the shell mistaking specific characters for reserved
  characters.  This may be used for DoS under rare conditions of filtered
  command input

- CVE-2021-42376: A NULL pointer dereference in Busybox's hush applet leads
  to denial of service when processing a crafted shell command, due to
  missing validation after a \x03 delimiter character.  This may be used for
  DoS under very rare conditions of filtered command input.

- CVE-2021-42377: An attacker-controlled pointer free in Busybox's hush
  applet leads to denial of service and possible code execution when
  processing a crafted shell command, due to the shell mishandling the &&&
  string.  This may be used for remote code execution under rare conditions
  of filtered command input.

For details, see:
https://jfrog.com/blog/unboxing-busybox-14-new-vulnerabilities-uncovered-by-claroty-and-jfrog/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 2 +-
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 3e9c30cad0..354db4bc5b 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.33.1.tar.bz2.sha256
-sha256  12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28  busybox-1.33.1.tar.bz2
+sha256  6843ba7977081e735fa0fdb05893e3c002c8c5ad7c9c80da206e603cc0ac47e7  busybox-1.33.2.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 413939e28d..101b37c5ec 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.33.1
+BUSYBOX_VERSION = 1.33.2
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
